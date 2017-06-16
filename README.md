# Solarized UI-Colorscheme for IntelliJ IDEA

The purpose of this project is to adapt the IntelliJ UI to the solarized color scheme.

This project is inspired by the original solarized color scheme developed by Ethan Schoonover <es@ethanschoonover.com> and the editor colour scheme maintained in the [IntelliJ-only repository].

For more information about the Solarized scheme, for screenshots, details and colour scheme versions for different editors and other applications visit the [Solarized homepage]. Most of these versions can be found in the main [Solarized repository] on GitHub.

[Solarized homepage]: <http://ethanschoonover.com/solarized>
[Solarized repository]: <https://github.com/altercation/solarized>
[IntelliJ-only repository]: <https://github.com/jkaving/intellij-colors-solarized>

## Contents

- [Status](#status)
- [Installation](#installation)
  - Option 1: Automatically
  - Option 2: Manually with jar command
  - Option 3: Manually with file archiver

## Status

Until now, it is not possible to provide custom themes for the IntelliJ IDEA UI. To get around this limitation it is possible to edit the existing themes directly by manipulating the property files inside the _idea.jar_ container. Unfortunately it is not possible to adapt all properties of the UI and therefore some colours stay as they are defined by the base theme.

These colour theme files are primarily tested with the latest version of IntelliJ IDEA Community Edition.
They might also work with other versions of IntelliJ IDEA as well as other JetBrains tools (e.g. PhpStorm and PyCharm).

## Installation

Because the customization of the IntelliJ UI is not supported by Jetbrains, it is necessary to modify the IntelliJ files directly by changing the content of the _idea.jar_. This file can be found in the application folder of your IntelliJ IDEA installation. It is located inside the _lib_ directory.

To make things easier I provide a script that replaces the files inside the jar. Furthermore, it creates a backup of the original file.
Alternatively you can simply exchange the files manually.

### Option 1: Install (and backup) automatically

1. Stop IntelliJ IDEA
1. // TBD
1. Start IntelliJ IDEA

### Option 2: Install manually (jar console command)

1. Stop IntelliJ IDEA
1. Execute the following commands to replace the files inside the jar package. These commands are updating the specified files inside the jar container. Your local path must match the path inside the jar.
    ``` sh
    jar -ufv idea.jar com/intellij/ide/ui/laf/intellijlaf.properties
    jar -ufv idea.jar com/intellij/ide/ui/laf/darcula/darcula.properties
    ```
1. Start IntelliJ IDEA

### Option 2: Install manually (file archiver)

1. Stop IntelliJ IDEA
1. Locate the _idea.jar_ file on your system.
1. Open the idea.jar using a file archiver utility like 7zip.
1. Navigate to the following path inside the _idea.jar_ file:
    ``` sh
    com/intellij/ide/ui/laf/
    ```
1. Backup and then replace following files with the modified versions from this repository:
    ``` sh
    /intellijlaf.properties
    /darcula/darcula.properties
    ```
1. Start IntelliJ IDEA