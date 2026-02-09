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
