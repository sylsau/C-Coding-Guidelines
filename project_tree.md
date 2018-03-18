Project tree
============

Tree
----

```
[PROJECT DIRECTORY]/
├── bin
│   ├── data -> ../data
│   ├── Configuration.txt
│   ├── Project
│   ├── Project.exe
│   └── log.Project
├── data
│   ├── images
│   └── ...
├── etc
│   └── conf.project
├── lib32
│   ├── libcsfml-audio.dll
│   └── ...
├── lib64
│   ├── libcsfml-audio.so.1.6
│   └── ...
├── man
│   └── project.6
├── readme.d
│   ├── AUTHORS.txt
│   ├── LICENSE.SFML.txt
│   ├── LICENSE.txt
│   ├── changelog
│   └── copyright
├── src
│   ├── font
│   │   └── usedGPLFont.zip
│   ├── inc
│   │   └── SFML
│   │       ├── Audio
│   │       │   ├── AudioResource.hpp
│   │       │   ├── Types.h
│   │       │   └── ...
│   │       ├── Graphics
│   │       │   └── ...
│   │       └── ...
│   ├── Makefile
│   ├── libsfsys.c
│   ├── libsfsys.h
│   ├── project.c
│   ├── project.h
│   ├── mod.c
│   ├── mod.h
│   ├── utils.c
│   └── utils.h
├── wip
│   ├── DevLog
│   │   ├── Screenshot - 12142013 - 02:44:22 PM.png
│   │   └── ...
│   ├── datMusicParts
│   │   └── ...
│   └── ...
├── NOTES
├── README
└── TODO
```


Directories
-----------

  [NAME] 	|	[CONTENT]
--------------- | ---------------------------------------------------------------
  `./        `  | Regular README files and possibly other (few) things
  `./bin     `  | Binairies ; where the program is built
  `./data    `  | Project data (images, sounds, fonts, etc... )
  `./etc     `  | Configuration files
  `./lib32   `  | 32-bit libraries (`*.lib`, `\*.so`, `\*.a`, `\*.dll`)
  `./lib64   `  | 64-bit libraries (`*.lib`, `\*.so`, `\*.a`, `\*.dll`)
  `./man     `  | Linux manual pages
  `./readme.d`  | Remaining licensing information and other informative text files
  `./src     `  | Source files
  `./src/inc `  | Included external headers
  `./wip     `  | "**W**ork **I**n **P**rogress" material


Releasing
---------

  When releasing the project to a wider audience, it's necessary to remove
	useless files and directory such as:  
    * `./wip`
