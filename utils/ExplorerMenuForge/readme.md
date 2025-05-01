# Explorer Menu Forge

## Overview
Is a C# utility that creates Windows registry entries to add custom context menu options for directories. This tool allows you to quickly set up a customized "Open with" menu for your favorite applications when right-clicking on folders in Windows Explorer.

## Features
- Creates a custom context menu that appears when right-clicking on directories or in the directory background
- Adds multiple applications to the context menu in a single operation
- Supports specifying applications via command-line arguments or from a text file
- Automatically uses application icons in the context menu
- Positions all entries at the top of the context menu for easy access

## Usage

```
ExplorerMenuForge.exe <executable_path> [<executable_path> ...]
```
Add one or more applications to the context menu by specifying their paths directly.

```
ExplorerMenuForge.exe -f <file_with_paths>
```
Add multiple applications by providing a text file containing one executable path per line.

## Example

To add Visual Studio Code, Notepad++, and Sublime Text to your context menu:

```
ExplorerMenuForge.exe "C:\Program Files\Microsoft VS Code\Code.exe" "C:\Program Files\Notepad++\notepad++.exe" "C:\Program Files\Sublime Text\sublime_text.exe"
```

Or create a text file (e.g., `apps.txt`) with the paths:
```
C:\Program Files\Microsoft VS Code\Code.exe
C:\Program Files\Notepad++\notepad++.exe
C:\Program Files\Sublime Text\sublime_text.exe
```

Then run:
```
ExplorerMenuForge.exe -f apps.txt
```

## Output
The program generates a `context-menu.reg` file in the current directory. You can double-click this file to add the entries to your Windows registry.

## Registry Structure
The generated registry file creates:
1. A main menu entry labeled "MyNewMenu" that appears when right-clicking on directories
2. The same menu entry when right-clicking on the directory background
3. Individual entries for each application under this menu

## Requirements
- Windows operating system
- .NET Framework

## Notes
- If an executable path doesn't exist, the program will display a warning but still add it to the registry file
- The registry file uses the application's own executable as its icon in the context menu
- All entries are positioned at the top of the context menu for easy access

## Links

- [Creating custom context menu for Windows file explorer](https://mrlixm.github.io/blog/windows-explorer-context-menu/)
- [Create a menu with two submenus](https://superuser.com/a/1296812)