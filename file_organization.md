File organization
=================

Header files
------------

* Each source file has a corresponding header file of the same name.
* Main source file (containing `main()`) is of the name of the program. E.g.: `img2b64.c` or `sed.c`.
* The main header file contains global macros, declaration of global variables, enums and structs, etc.
* *Never define in header files*, only just declare. Global variables are defined at the top of the main source file, outside of `main()`.
* Every source file `#include`s both their own header file and the main header file (in that order).
* For all files, never `#include` more than you need.
* Always use header guards in header files.

Project Hierarchy Standard
--------------------------

I hereby propose a standard for organizing project file.

### Tree

```
[PROJECT DIRECTORY]/
|-- bin
|   |-- data -> ../data
|   |-- my_project
|   |-- my_project.exe
|   +-- my_project.log
|-- data
|   |-- images
|   +-- ...
|-- etc
|   +-- my_project.conf
|-- lib32
|   |-- libcsfml-audio.dll
|   +-- ...
|-- lib64
|   |-- libcsfml-audio.so.1.6
|   +-- ...
|-- man
|   +-- my_project.6
|-- docs
|   |-- AUTHORS.txt
|   |-- LICENSE.SFML.txt
|   |-- LICENSE.txt
|   |-- changelog
|   +-- copyright
|-- src
|   |-- font
|   |   +-- usedGPLFont.zip
|   |-- inc
|   |   +-- SFML
|   |       |-- Audio
|   |       |   |-- AudioResource.hpp
|   |       |   |-- Types.h
|   |       |   +-- ...
|   |       |-- Graphics
|   |       |   +-- ...
|   |       +-- ...
|   |-- Makefile
|   |-- my_project.c
|   |-- my_project.h
|   |-- utils.c
|   +-- ...
|-- wip
|   |-- DevLog
|   |   |-- Screenshot - 12142013 - 02:44:22 PM.png
|   |   +-- ...
|   |-- datMusicParts
|   |   +-- ...
|   +-- ...
|-- NOTES
|-- README
+-- TODO
```

### Directories

  [Name] 	|	[Content]
--------------- | ---------------------------------------------------------------
  `./        `  | Regular README files and possibly other (few) things
  `./bin     `  | Binairies ; where the program is built
  `./data    `  | Project data (images, sounds, fonts, etc... )
  `./etc     `  | Configuration files
  `./lib32   `  | 32-bit libraries (`*.lib`, `*.so`, `*.a`, `*.dll`)
  `./lib64   `  | 64-bit libraries (`*.lib`, `*.so`, `*.a`, `*.dll`)
  `./man     `  | Linux manual pages
  `./docs    `  | Remaining licensing information and other informative text files (not mandatory)
  `./src     `  | Source files
  `./src/inc `  | Included external headers
  `./wip     `  | "**W**ork **I**n **P**rogress" development material (to remove once released)
