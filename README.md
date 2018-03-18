C Coding Guidelines
===================

* *snake_case*: easier to type, harder to read
	* Though: some of the best ever written softwares were made in *snake_case*
* *camelCase*: harder to type, easier to read
	* Microsoft uses it...
<!-- separator -->
* Dividing the code in functions increase its comprehension and readability.
* Code must not be generic, but very specific to what exactly you're doing.
* Code for debug purpose must be removed from the final form of the code.

| Local: **{name\_of\_var}**  			| `int i;` |
| Global: **g\_{detailed\_name\_of\_var}**  	| `extern int g_alien_cnt; ` |
## Functions
### Names
**{libLabel}\_{object}[\_]{action\_or\_verb}** or **{libLabel}\_{action\_or\_verb}\_{object}**
```
sfSyl_welcome_txt_print ()
sfSyl_print_welcome_txt ()
```
### Definitions
**[attributes ]{type}   
{function_name}( {args} )   
{  
	/*...*/  
}**
```
noreturn void
usage( int status )
{
	/*...*/
	exit( status );
}
```
* Rationale: easier to `grep` (`"^func_name"`)
## Pointers
**{type} \*{var}**
```
int *var1, *var2; 	/* 2 pointers */
int *var1, var2; 	/* 1 pointer, 1 int ! */
```
## Typedefs
**[libLabel\_]{name}\_t**
```
superint_t i;
sfs_superint_t j;
```
## Structures
**{name\_of\_struct}\_s**, **{name\_of\_struct\_var}**
```
datstruct_s this_is_a_struct;
```
## Enums
**{name\_of\_enum}\_e**, **{ENUM\_CONST}**, **{name\_of\_enum\_var}**
```
enum mood_e { TAKE_IT, GIVE_IT, KEEP_IT } my_mood;
```
## Gotos
**[GT\_]{ThisPart}** or **[GT\_]{this_part}**
```
EmergencyClosure:
GT_EmergencyClosure:
GT_emergency_closure:
```
## Define
**[TYPE\_]{NAME\_OF\_DEF}**
```
#define ALIENS_ON_PLANET_CNT 	1234
```
## Macro (DEFINES)
**[M\_]{OBJECT}\_{VERB}** or **[M\_]{VERB}\_{OBJECT}**
```
#define ALIENS_ON_PLANET_LOCATE ()
#define M_ALIENS_ON_PLANET_LOCATE ()
#define LOCATE_ALIENS_ON_PLANET ()
```
## Macro (header guars)
**{NAME\_OF\_HEADER}\_H**
```
MY_COOL_LIB_H
```
* Rationale: `\_` and `\_\_`-starting header guars are used by standard library headers
## Parenthesis / braces
**{func}( {args} );**
```
printf( "spaces btwn args and parenthesis : %d", true_dat );
```
**{statement} ({condition}) {  
    /*...*/  
}**
```
if (true_dat == 1) {
	/*...*/
} else {
	/*...*/
}
```
## Code example
```
#ifndef THAT_GUARD_THOUGH_H
#define THAT_GUARD_THOUGH_H

#include "myheader.h"

#include <header1.h>
#include <header2.h>

#define STR_SIZE_OF_PLANET 	"BIG"

noreturn void
f_datFunc( void )
{
	unsigned int aliens_cnt = 100;
	int happn = 0;

	printf( "This planet is %s.\n", STR_SIZE_OF_PLANET );
	if (aliens_cnt > 50) {
		puts( "it's happening" );
		happn = 1;
	} else if (aliens_cnt > 0) {
		puts( "we still have time" );
		happn = 0;
	} else { puts( "ERROR" ); goto GT_Habbening; }
	
	switch (happn) {
	case 0:
		return( EXIT_SUCCESS );
	default:
	GT_Habbening:
		return( EXIT_FAILURE );
	}
}


#endif 		/* ndef _THAT_GUARD_THOUGH_ */
```

## General advices

* Always use header guards.
* Put braces even on one-line statements.

### Linux kernel coding style

GNU `indent` now has an option to format your code according to the Linux kernel  
coding style: `indent -linux [file]`.
Doc: <https://www.kernel.org/doc/html/v4.10/process/coding-style.html>

### References/resources

* Notes on Programming in C
                    Rob Pike
-----
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
│   ├── deb.Makefile
│   ├── defs.h
│   ├── func.c
│   ├── func.h
│   ├── libsfsys.c
│   ├── libsfsys.h
│   ├── main.c
│   ├── mod.c
│   └── mod.h
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

  [NAME]	[CONTENT]
--------------------------------------------------------------------------------------------------------------------------------------
  `./        `  Regular README files and possibly other (few) things
  `./bin     `  Binairies ; where the program is built
  `./data    `  Project data (images, sounds, fonts, etc... )
  `./etc     `  Configuration files
  `./lib32   `  32-bit libraries (*.lib, *.so, *.a, *.dll)
  `./lib64   `  64-bit libraries (*.lib, *.so, *.a, *.dll)
  `./man     `  Linux manual pages
  `./readme.d` 	Remaining licensing information and other informative text files
  `./src     `  Source files
  `./src/inc `  Included external headers
  `./wip     `  "Work In Progress" material


Releasing
---------

  When releasing the project to a wider audience, it's necessary to remove
	useless files and directory such as:
    * ./wip
