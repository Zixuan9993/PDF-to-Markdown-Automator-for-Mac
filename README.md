# Smart PDF-to-Markdown OCR Suite

A high-efficiency macOS automation tool designed to bridge the gap between complex CLI-based OCR engines (**MinerU/magic-pdf**) and a user-friendly GUI via **AppleScript**.

## Overview

This project targets the "last mile" of office productivity. It enables users to convert scanned, complex-layout PDFs into structured Markdown files through a simple **drag-and-drop** interface, abstracting away the complexities of Conda environments and terminal commands.

## Key Features

- **User-Centric GUI:** Built with AppleScript to provide native macOS notifications, file dialogs, and drag-and-drop support.
- **Robust OCR Engine:** Utilizes the MinerU (magic-pdf) framework for high-precision layout analysis and text extraction.
- **Automated Dependency Management:** Includes a `setup.sh` script to automate system-level and Python-level environment configuration.
- **Operational Efficiency:** Specifically designed to assist non-technical staff in digitalization and information management tasks.

## Tech Stack

- **Automation:** AppleScript (GUI Wrapper)
- **Logic:** Shell Script (Bash)
- **Core Engine:** Python (MinerU / magic-pdf)
- **Package Management:** Conda & Homebrew

## Installation

1. **Clone the repository:**

    ```bash
    git clone [https://github.com/your-username/smart-pdf-ocr.git](https://github.com/your-username/smart-pdf-ocr.git)
    cd smart-pdf-ocr
    ```

2. **Run the setup script**
    This will create the `MinerU` Conda environment and install all necessary dependencies (magic-pdf, libmagic, etc.).

    ```bash
    chmod +x setup.sh
    ./setup.sh
    ```

3. **Configure the AppleScript**
    1. Open OCR_Workflow.scpt using Script Editor (found in Applications/Utilities).

    2. Locate the first line: property shellScriptPath : "..."

    3. Update the path to point to the OCR_pdf.sh file inside this folder on your local machine.

    4. Save the script. (Optional: Export it as an "Application" to pin it to your Dock).

## **Usage**

- Option A: Drag and drop any PDF file onto the script icon.
- Option B: Double-click the script to open a file selection dialog.

The output folder (containing Markdown and images) will be generated in the same directory as the original PDF.

## **License**

This project integrates with **MinerU** as a core engine. Please be aware of the following licensing conditions regarding the upstream project:

1. **MinerU License**: Please refer to the [MinerU GitHub Repository](https://github.com/opendatalab/MinerU) for their latest licensing terms.
2. **AGPL Notice (YOLO Models)**: Some models within MinerU are trained based on YOLO, which follows the **AGPL license**. This may impose restrictions on certain usage scenarios (e.g., commercial redistribution or closed-source modifications).
3. **Disclaimer**: The author of this automation suite provides no warranty regarding the compliance of third-party dependencies. Users are responsible for ensuring their usage aligns with all relevant licenses.


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
