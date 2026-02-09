# 智能 PDF 转 Markdown OCR 套件

一个高效的 macOS 自动化工具，通过 **AppleScript** 提供友好的 GUI 界面，弥合复杂的命令行 OCR 引擎（**MinerU**）与普通用户之间的鸿沟。

## 项目概述

本项目通过一个**拖拽式**的简单操作界面，将扫描版、复杂版式的 PDF 转换为结构化的 Markdown 文件，同时对用户隐藏 Conda 环境与终端命令等技术细节。

## 核心特性

- **以用户为中心的 GUI**：基于 AppleScript 构建，提供原生 macOS 通知、文件选择对话框以及拖拽支持。
- **高精度 OCR 引擎**：采用 MinerU框架，实现高质量的版面分析与文本提取。
- **自动化依赖管理**：提供 `setup.sh` 脚本，自动完成系统级与 Python 级环境配置。
- **高效实用**：专为非技术人员的文档数字化与信息管理工作场景设计。

## 技术栈

- **自动化层**：AppleScript（GUI 封装）
- **流程逻辑**：Shell Script（Bash）
- **核心引擎**：Python（MinerU）
- **包管理**：Conda & Homebrew

## 安装步骤

1. **克隆仓库：**

    ```bash
    git clone https://github.com/your-username/smart-pdf-ocr.git
    cd smart-pdf-ocr
    ```

2. **运行环境配置脚本**

    该脚本将创建 `MinerU` Conda 环境，并安装所有必要依赖（libmagic 等）。

    ```bash
    chmod +x setup.sh
    ./setup.sh
    ```

3. **配置 AppleScript**

    1. 使用 Script Editor（位于 Applications/Utilities）打开 `OCR_Workflow.scpt`。

    2. 找到第一行：

       ```sh
       property shellScriptPath : "..."
       ```

    3. 将路径修改为你本地目录中 `OCR_pdf.sh` 文件的实际路径。

    4. 保存脚本。（可选：将其导出为“应用程序”，以固定到 Dock 栏）

## 使用方式

- 方式 A：将任意 PDF 文件直接拖拽到脚本图标上。
- 方式 B：双击脚本，打开文件选择对话框。

输出文件夹（包含 Markdown 文件及图片资源）将生成在原 PDF 文件所在的同一目录下。

## 许可证

本项目集成了 **MinerU** 作为核心引擎。请注意以下关于上游项目的许可条件：

1. **MinerU 许可证**：请参阅 [MinerU GitHub 仓库](https://github.com/opendatalab/MinerU) 获取其最新的许可条款。
2. **AGPL 注意事项 (YOLO 模型)**：MinerU 内部的部分模型基于 YOLO 训练，遵循 **AGPL 协议**。这可能会对某些使用场景（如商业分发或闭源修改）构成限制。
3. **免责声明**：本自动化套件的作者不对第三方依赖项的合规性提供担保。用户有责任确保其使用行为符合所有相关许可证的要求。
