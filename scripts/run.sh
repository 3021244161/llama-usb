#!/bin/bash

# 获取U盘根目录
USB_ROOT=$(dirname "$0")/..

# 列出可用模型
echo "Available models:"
MODELS=($(ls "$USB_ROOT/models" | grep '\.gguf$'))
for i in "${!MODELS[@]}"; do
  echo "$((i+1)). ${MODELS[$i]}"
done

# 显示模型描述（如果存在）
if [ -f "$USB_ROOT/models/models.txt" ]; then
  echo -e "\nModel descriptions:"
  cat "$USB_ROOT/models/models.txt"
fi

# 用户选择模型
read -p "Select a model by number: " MODEL_NUM
if [[ ! $MODEL_NUM =~ ^[0-9]+$ ]] || [ $MODEL_NUM -lt 1 ] || [ $MODEL_NUM -gt ${#MODELS[@]} ]; then
  echo "Invalid selection!"
  exit 1
fi

# 启动推理
MODEL_PATH="$USB_ROOT/models/${MODELS[$((MODEL_NUM-1))]}"
echo -e "\nStarting inference with model: $MODEL_PATH"

# 自动检测操作系统和架构
OS=$(uname -s)
ARCH=$(uname -m)

if [ "$OS" = "Linux" ]; then
  if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "armv7l" ]; then
    BIN="$USB_ROOT/bin/linux-arm/llama-simple-chat"
  else
    BIN="$USB_ROOT/bin/linux-x86/llama-simple-chat"
  fi
elif [ "$OS" = "Darwin" ]; then
  BIN="$USB_ROOT/bin/mac/llama-simple-chat"
else
  echo "Unsupported OS: $OS"
  exit 1
fi

# 设置库路径（如果依赖动态库）
export LD_LIBRARY_PATH="$USB_ROOT/bin/linux-x86:$LD_LIBRARY_PATH"

# 运行推理
"$BIN" -m "$MODEL_PATH" -c 2048
