#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

#ifdef _WIN32
#include <windows.h>
#define PATH_SEPARATOR '\\'
#else
#define PATH_SEPARATOR '/'
#endif

// Read and display model descriptions
void show_model_descriptions(const char *models_dir) {
    char desc_path[1024];
    snprintf(desc_path, sizeof(desc_path), "%s%cmodels.txt", models_dir, PATH_SEPARATOR);

    FILE *file = fopen(desc_path, "r");
    if (file == NULL) {
        printf("Model description file models.txt not found.\n");
        return;
    }

    printf("\nModel descriptions:\n");
    char line[256];
    while (fgets(line, sizeof(line), file)) {
        printf("%s", line);
    }
    fclose(file);
}

// List all .gguf files in the models directory
void list_models(const char *models_dir) {
    DIR *dir;
    struct dirent *entry;
    int count = 0;

    dir = opendir(models_dir);
    if (dir == NULL) {
        perror("Failed to open models directory");
        exit(1);
    }

    printf("Available models:\n");
    while ((entry = readdir(dir)) != NULL) {
        if (strstr(entry->d_name, ".gguf") != NULL) {
            printf("%d. %s\n", ++count, entry->d_name);
        }
    }
    closedir(dir);

    if (count == 0) {
        printf("No model files found!\n");
        exit(1);
    }

    // Show model descriptions
    show_model_descriptions(models_dir);
}

// Get the path of the selected model
void get_model_path(const char *models_dir, char *model_path, size_t size) {
    int model_num;
    DIR *dir;
    struct dirent *entry;
    int count = 0;

    printf("Select a model by number: ");
    if (scanf("%d", &model_num) != 1 || model_num < 1) {
        printf("Invalid selection!\n");
        exit(1);
    }

    dir = opendir(models_dir);
    if (dir == NULL) {
        perror("Failed to open models directory");
        exit(1);
    }

    while ((entry = readdir(dir)) != NULL) {
        if (strstr(entry->d_name, ".gguf") != NULL) {
            count++;
            if (count == model_num) {
                snprintf(model_path, size, "%s%c%s", models_dir, PATH_SEPARATOR, entry->d_name);
                closedir(dir);
                return;
            }
        }
    }
    closedir(dir);

    printf("Invalid selection!\n");
    exit(1);
}

// Run the inference command
void run_inference(const char *model_path) {
    char command[1024];
    snprintf(command, sizeof(command), "bin\\win\\llama-cli.exe -m \"%s\" -cnv --chat-template gemma", model_path);
    printf("Running command: %s\n", command);

#ifdef _WIN32
    system(command);
#endif
}

int main() {
    const char *models_dir = "models";  // Path to the models directory
    char model_path[1024];

    // List models
    list_models(models_dir);

    // Get the selected model path
    get_model_path(models_dir, model_path, sizeof(model_path));

    // Run inference
    run_inference(model_path);

    return 0;
}