## **Llama-USB: 即插即用的大模型推理工具**

### **项目简介**
Llama-USB 是一个即插即用的大模型推理工具，支持在 Windows、Linux（包括树莓派等 ARM 设备）和 macOS 上运行。用户只需将 U 盘插入设备，运行 `start` 脚本，即可选择并运行不同的模型进行推理。

---

### **支持的模型**
模型存放于 `models/` 目录，可在 `models.txt` 中查看可用模型

可添加自定义gguf模型


---

### **如何使用**
1. **插入 U 盘** 并进入 `llama-usb` 目录。
2. **运行 `start` 脚本**：
   - **Windows**: 双击 `start` 或在 CMD 中运行 `scripts\run.bat`。
   - **Linux/macOS**: 运行 `./start` 或 `bash scripts/run.sh`。
3. **选择模型**：
   - 脚本会显示可用模型列表，用户输入编号选择模型。
4. **开始推理**：
   - 选定模型后，程序将以默认参数运行推理：
     ```
     ./llama-simple-chat -m models/llama3.2-1b.gguf -c 2048
     ```
   - Windows 运行命令：
     ```
     .\llama-simple-chat.exe -m models\llama3.2-1b.gguf -c 2048
     ```

---

### **运行要求**
- **Windows**:
  - 需在 CMD 或 PowerShell 运行 `scripts\run.bat`
- **Linux/macOS**:
  - 需赋予脚本执行权限：
    ```bash
    chmod +x start scripts/run.sh
    chmod +x bin/linux-arm/llama-simple-chat
    chmod +x bin/linux-x86/llama-simple-chat
    chmod +x bin/mac/llama-simple-chat
    ```
- **硬件要求**:
例如
  - 运行 **deepseekR1-1.5b.gguf** 需要至少 **1.2GB** 可用内存
  - 运行 **tiny.gguf** 需要 **700MB** 内存
  - 运行 **llama3.2-1b.gguf** 需要 **1.3GB** 内存

---

### **常见问题**
1. **如何新增模型？**
   - 将 `.gguf` 模型文件放入 `models/` 目录，并在 `models.txt` 中添加名称和描述。

2. **如何支持更多设备？**
   - 确保 `bin/` 目录下存在适用于该设备架构的可执行文件。
   - 可使用交叉编译工具为其他架构编译 `llama-simple-chat`。

3. **如何查看日志或错误？**
   - 在终端运行时会输出错误信息，或者重定向日志：
     ```bash
     ./scripts/run.sh > log.txt 2>&1
     ```

---

### **项目目标**
Llama-USB 旨在提供一个跨平台的、即插即用的大模型推理解决方案，使用户无需复杂配置即可在不同设备上运行 AI 推理任务。
