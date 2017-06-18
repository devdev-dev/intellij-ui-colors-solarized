# Solarized UI-Colorscheme for IntelliJ IDEA

The purpose of this project is to adapt the IntelliJ UI to the solarized color scheme.

This project is inspired by the original solarized colour scheme developed by [Ethan Schoonover] and the IntelliJ IDEA colour scheme maintained in the [IntelliJ-only repository]. For more information about the Solarized scheme, for screenshots, details and colour scheme versions for different editors and other applications visit the [Solarized homepage]. Most of these versions can be found in the main [Solarized repository] on GitHub.

[Nathan Schwermann] had the same approach to adapt the IntelliJ UI to the solarized scheme. He shared it in his personal [Gist]. In Contrast to his script this project tries to address the light and the dark scheme and is fitted to the newest IntelliJ version.

[Ethan Schoonover]: <es@ethanschoonover.com>
[Nathan Schwermann]: <schwiz@gmail.com>
[Solarized homepage]: <http://ethanschoonover.com/solarized>
[Solarized repository]: <https://github.com/altercation/solarized>
[IntelliJ-only repository]: <https://github.com/jkaving/intellij-colors-solarized>
[Gist]: <https://gist.github.com/schwiz/5593723>

## Contents

- [Status](#status)
- [Known Issues](#known-issues)
- [Installation](#installation)
- [Contributing](#contributing)

## Status

Until now, it is not possible to provide custom themes for the IntelliJ IDEA UI. To get around this limitation it is possible to edit the existing themes directly by manipulating the property files inside the _idea.jar_ container. Unfortunately it is not possible to adapt all properties of the UI and therefore some colours stay as they are defined by the base theme.

These colour theme files are primarily tested with the latest version of IntelliJ IDEA Community and Ultimate Edition.

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

## Known Issues

Until now I found no way to modify the following colours:

- _(Windows)_ The border colour of a focused button.
- _(Windows)_ The background colour of the left pane in the settings window.
- _(Windows)_ The background colour of the window title bar for the main windows as well as for any subwindow.
- _(Windows)_ Some drop-down elements in the setting are still grey (e.g. Settings > File Encodings).
- _(Windows)_ The "Search Everywhere" popup header is still blue.
- _(Windows)_ The radio buttons appearing in their default colour.
- _(Windows)_ The tab colours from the editor and some setting windows.

## Contributing

There are still many colours unchanged because I either found no changes as result of a modification or the behaviour of the setting was unstable or unpredicatable. As I can imagine the ffect of some properties are only visible in specific enviroments.
To make this IntelliJ theme more applicable to the solarized color scheme I need help to test it under more operating systems. Open an issue and tell me what was wrong or even better: Create a pull request with the appropriate changes.

Changing colours are more 'trial and error' then knowing what to do.
I tried to comment the changed elements as best as I can. Furthermore the source code of the community edition can show us some usages and hints for the unknown properties.