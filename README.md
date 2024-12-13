# Windows Update Manager

This script is a simple batch file that allows you to enable or disable the Windows Update service on your system. It provides a user-friendly menu and confirmation prompts for each action, ensuring that changes to your system are deliberate.

## Features
- **Enable Automatic Updates**: Starts the Windows Update service and sets it to start automatically on system boot.
- **Disable Automatic Updates**: Stops the Windows Update service and prevents it from starting automatically.
- **Confirmation Prompts**: Ensures the user confirms their intention before making changes.
- **Easy Navigation**: Simple menu-driven interface for ease of use.

## How to Use
1. Download or copy the script and save it as `WindowsUpdateManager.bat`.
2. Right-click the file and select **Run as administrator** (administrative privileges are required to modify system services).
3. Follow the menu options:
   - Select `1` to enable automatic updates.
   - Select `2` to disable automatic updates.
   - Select `X` to exit the script.
4. For each action, confirm your choice by pressing **Enter** or cancel by pressing **C**.

## Script Workflow
- **Menu**: Displays three options: Enable, Disable, or Exit.
- **Enable Option**:
  - Prompts the user for confirmation.
  - Configures the `wuauserv` (Windows Update) service to start automatically and starts the service.
- **Disable Option**:
  - Prompts the user for confirmation.
  - Stops the `wuauserv` service and configures it to be disabled.
- **Exit**: Closes the script.

## Requirements
- Windows operating system.
- Administrator privileges to run the script.

## Notes
- Disabling automatic updates may leave your system vulnerable to security risks. Use this script responsibly.
- Ensure you understand the implications of enabling or disabling Windows updates before proceeding.

## Disclaimer
This script is provided "as is" without any warranty. The author is not responsible for any damage or issues caused by the use of this script.


