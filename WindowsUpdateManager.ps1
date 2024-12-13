# Windows Update Manager

<##
.DESCRIPTION
    This script provides an intuitive way to enable or disable the Windows Update service on your system.
    It includes a menu-driven interface with confirmation prompts for safety.

.NOTES
    Requires administrative privileges to modify the Windows Update service.
    Author: [Your Name]
    Version: 1.0
##>

Function Show-Menu {
    cls
    Write-Host "==============================================================" -ForegroundColor Green
    Write-Host "Windows Update Manager" -ForegroundColor Cyan
    Write-Host "==============================================================" -ForegroundColor Green
    Write-Host "[1] Enable Automatic Windows Updates" -ForegroundColor White
    Write-Host "[2] Disable Automatic Windows Updates" -ForegroundColor White
    Write-Host "[X] Exit" -ForegroundColor Red
}

Function Enable-WindowsUpdate {
    Param()
    Write-Host "Are you sure you want to enable Automatic Windows Updates? (Press Enter to Continue or C to Cancel)" -ForegroundColor Yellow
    $confirmation = Read-Host
    if ($confirmation -eq 'C') {
        Write-Host "Action Cancelled" -ForegroundColor Red
        return
    }

    Write-Host "Enabling Windows Update Service..." -ForegroundColor Green
    try {
        Set-Service -Name 'wuauserv' -StartupType Automatic
        Start-Service -Name 'wuauserv'
        Write-Host "Windows Update Service has been enabled." -ForegroundColor Cyan
    } catch {
        Write-Host "An error occurred: $_" -ForegroundColor Red
    }
}

Function Disable-WindowsUpdate {
    Param()
    Write-Host "Are you sure you want to disable Automatic Windows Updates? (Press Enter to Continue or C to Cancel)" -ForegroundColor Yellow
    $confirmation = Read-Host
    if ($confirmation -eq 'C') {
        Write-Host "Action Cancelled" -ForegroundColor Red
        return
    }

    Write-Host "Disabling Windows Update Service..." -ForegroundColor Green
    try {
        Stop-Service -Name 'wuauserv' -Force
        Set-Service -Name 'wuauserv' -StartupType Disabled
        Write-Host "Windows Update Service has been disabled." -ForegroundColor Cyan
    } catch {
        Write-Host "An error occurred: $_" -ForegroundColor Red
    }
}

Function Main {
    while ($true) {
        Show-Menu
        $choice = Read-Host "Select an option (1/2/X)"
        switch ($choice) {
            "1" { Enable-WindowsUpdate }
            "2" { Disable-WindowsUpdate }
            "X" { Write-Host "Exiting..." -ForegroundColor Green; break }
            default { Write-Host "Invalid selection. Please try again." -ForegroundColor Red }
        }
        Pause
    }
}

# Ensure script is run as administrator
If (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script as an administrator." -ForegroundColor Red
    Exit 1
}

# Start the main function
Main
