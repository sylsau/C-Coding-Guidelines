C Coding Guidelines
===================

## Variables
Local: *{name\_of\_var}*  
Global: *g\_{detailed\_name\_of\_var}*  
```C
int i;
extern int g_alien_cnt;
```
<!-- TODO: make it shorter -->
## Functions
### Names
*{libLabel}\_{object}[\_]{action\_or\_verb}* or *{libLabel}\_{action\_or\_verb}\_{object}*
```C
sfSyl_welcome_txt_print ();
sfSyl_print_welcome_txt ();
```
### Definitions
*[attributes ]{type}   
{function_name}( {args} )   
{  
	/\*...\*/  
}*
```C
noreturn void
usage( int status )
{
	/*...*/
	exit( status );
}
```
* Rationale: easier to `grep` (`"^func_name"`)

## Pointers
*{type} \*{var}*
```C
int *var1, *var2; 	/* 2 pointers */
int *var1, var2; 	/* 1 pointer, 1 int ! */
```
## Typedefs
*[libLabel\_]{name}\_t*
```C
superint_t i;
sfs_superint_t j;
```
## Structures
*{name\_of\_struct}\_s*, *{name\_of\_struct\_var}*
```C
datstruct_s this_is_a_struct;
```
## Enums
*{name\_of\_enum}\_e*, *{ENUM\_CONST}*, *{name\_of\_enum\_var}*
```C
enum mood_e { TAKE_IT, GIVE_IT, KEEP_IT } my_mood;
```
## Gotos
*[GT\_]{ThisPart}* or *[GT\_]{this_part}*
```C
EmergencyClosure:
GT_EmergencyClosure:
GT_emergency_closure:
```
## Define
*[TYPE\_]{NAME\_OF\_DEF}*
```C
#define ALIENS_ON_PLANET_CNT 	1234
```
## Macros
*[M\_]{OBJECT}\_{VERB}* or *[M\_]{VERB}\_{OBJECT}*
```C
#define ALIENS_ON_PLANET_LOCATE ()
#define M_ALIENS_ON_PLANET_LOCATE ()
#define LOCATE_ALIENS_ON_PLANET ()
```
### Header guars
*{NAME\_OF\_HEADER}\_H*
```C
#ifndef MY_COOL_LIB_H
#define MY_COOL_LIB_H
/*...*/
#endif
```
* Rationale: `_`- and `__`-starting header guars are used by standard library headers

## Parenthesis / braces
*{func}( {args} );*
```C
printf( "spaces btwn args and parenthesis : %d", true_dat );
```
*{statement} ({condition}) {  
    /\*...\*/  
}*
```C
if (true_dat == 1) {
	/*...*/
} else {
	/*...*/
}
```

## Code example
```C
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

* *snake_case*: easier to type, harder to read
	* Though: some of the best ever written softwares were made in *snake_case*
* *camelCase*: harder to type, easier to read
	* Microsoft uses it, so...
<!-- separator -->
* Dividing the code in functions increase its comprehension and readability.
* Code must not be generic, but very specific to what exactly you're doing.
* Code for debug purpose must be removed from the final form of the code.
* Always use header guards in header files.
* Put braces even on one-line statements.

### Formatting your code using *sindent*

*sindent*, my own taste of GNU indent, format your code according to the Linux
kernel coding style (`-linux`) plus the one option it's missing (`-psl`), which
allows for easier `grep`-ing of function definitions.

### References/resources

* *Linux Kernel Coding style*: <https://www.kernel.org/doc/html/v4.10/process/coding-style.html>
* *Notes on Programming in C*, Rob Pike: <https://www.lysator.liu.se/c/pikestyle.html>
* *C Header File Guidelines*, David Kieras, University of Michigan: <http://umich.edu/~eecs381/handouts/CHeaderFileGuidelines.pdf>
* *JPL Coding Standard C*, Jet Propulsion Laboratory, NASA: <https://lars-lab.jpl.nasa.gov/JPL_Coding_Standard_C.pdf>
