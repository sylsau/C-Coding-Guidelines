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

## Variables
Local: *{name_of_var}*  
Global: *g_{detailed_name_of_var}*  
```
	int i;
	extern int g_alien_cnt;
```
## Functions
*{libLabel}_{objectName}[_]{actionVerb}*
```
	sfSyl_welcomeTxt_print ()
```
## Declarations
*[attributes ]{type}  
{function_name}( {args} )*
```
	noreturn void
	usage( int status )
	{
		...
	}
```
* Easier to `grep` (`"^func_name"`)
## Pointers
{type} \*{var}
```
	int *var1, *var2; 	/* 2 pointers */
	int *var1, var2; 	/* 1 pointer, 1 int ! */
```
## Typedefs
*{name}_t*
*{libLabel_}{name}_t*
```
	superint_t
	sfs_superint_t
```
## Structures
*{name_of_struct}_s*, *{name_of_struct_var}*
```
	datstruct_s this_is_a_struct
```
## Enums
*{name_of_enum}_e*, *{ENUM_CONST}*, *{name_of_enum_var}*
```
	enum mood_e { TAKE_IT, GIVE_IT, KEEP_IT } mood;
```
## Gotos
*[GT\_]{GoToThisPart}*
```
	EmergencyClosure:
	GT_EmergencyClosure:
```
## Define
[TYPE_]{NAME_OF_DEF}
```
	#define ALIENS_ON_PLANET_CNT 	1234
```
## Macro (DEFINES)
*[M\_]{OBJECT}\_{VERB}* or *[M\_]{VERB}\_{OBJECT}*
```
	#define ALIENS_ON_PLANET_LOCATE ()
	#define M_ALIENS_ON_PLANET_LOCATE ()
	#define LOCATE_ALIENS_ON_PLANET ()
```
## Macro (header guars)
{NAME\_OF\_HEADER}\_H
```
	MY_COOL_LIB_H
```
* `\_` and `\_\_`-starting header guars are used by standard library headers
## Parenthesis / braces
{func}( {args} );
```
	printf( "spaces btwn args and parenthesis : %d", true_dat );
```
{statement} ({condition}) {
    /*...*/
}
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
				goto GT_Habbening;
			} else
				puts( "we still have time" );
			
			switch (happn) {
			case 0: return( EXIT_SUCCESS );
			default:
			GT_Habbening:
				return( EXIT_FAILURE );
			}
		}
		
		
		#endif 		/* ndef _THAT_GUARD_THOUGH_ */
```

OLDER VERSION
	Variables:
		Hungarian notation is clearly used.
		Should always start with a minimized letter
	/* {type}{sub-type}_{nameOfTheVar} */
					int i_hotSauce;
					char * cp_yourAnusLel;
					double * * dpp_maNigga;
					int ia2x35_andEverybodyWalksTheDinosaurs [2] [35];
					/* Or just: */
					int ia_andEverybodyWalksTheDinosaurs [2] [35];
	Local variables should have shorter names:
			_Bool bl_open; 		/* switch if it's opened or not (obvious) */
			int i, j, k, l;

	Statements:
			No space between them and parenthesis, to differentiate from function calls.
					do {
							if( that_condition )
									puts ("fuck off");
					} while( it_s_happening );
					
	Functions:
			/* Should always start with a capital letter */
			{LibraryLabel}_{Subject[Sub-subject[...]]}[_]{Verb}[_Xargs][_returnedType]
					sfSprite * Sy_sfSpriteCreate		 		(void);
					int Sy_ComplextypeTextureLoad 		(myComplextype, "lel.jpg");
					int Sy_ComplextypeTextureUnload 		(myComplextype);
					/* Not advised */
					void Sy_PrintCenter_1cp (char * cp);
					float Sy_IRetarnAFlatLel_1f2cp2i_f (float f, char * cp1, char * cp2, int i, int b);
					/* Static functions take a "_S" at the end */
					static sfSprite * Sy_sfSpriteCreate_S 		(void);
					static int Sy_ComplextypeTextureLoad_S 		(myComplextype, "lel.jpg");
					static int Sy_ComplextypeTextureUnload_S 		(myComplextype);

	Typedefs:
			{name}_t												 /* C standard */
			/* OR */
			{libraryLabel}_{name}_t				 /* Best one I guess */
			/* OR */
			t_{name}				 				/* To not get mistaken with C standard */
			/* Last two are more practical for auto-completion */
					typedef uint8_t t_bit8;
					typedef unsigned long t_superbyte;

	Structures:
					str{NameOfTheStruct}
									struct strRenderVertex;
					/* OR */
					{NameOfTheStruct}[_s]

	Enumerators:
			en{NameOfTheEnum}
					enum enExceptions;
					/* OR */
					{NameOfTheStruct}[_e]

	#define:
			[TYPE]_NAME_OF_THE_DEF;
					I_RETARDS_ON_PLANET_NB_OF
					BT8_HEADER_SWITCH

	Macros:		
			M_[RELATEDTYPE]{WHAT_IT_DOES}[_args]
			args: [nb][type][nb][type][nb][type][...]
				#define M_TODO(arg)
				#define M_WELCOME_MSG_PRINT(cp_msg)

	{type}:
			char										= c
			int										 = i
			short								   = s
			float								   = f
			double								  = d
			_Bool								   = bl
			struct								  = st
			enum 						= e
			function								= fn[...][_{args}]

			/* Attributes */
			{type} *								= [...]p
			{type} {n} {m}				  = [...]aNxM
			const {type}						= c[...]
			unsigned {type}				 = u[...]
			signed {type}				   = s[...]
			extern {type} 				= g_[...]
			/* Examples */
			extern 		const struct		g_cst_varName;
			unsigned char *		 		ucp_varName;
			float *						 		fp_varName;
			int [2] [3]				 		ia2x3_varName;
			int ( * fnp_1c1i )( char, int );
			/* SFML types */
			sfBool								  = sfbl
			sfColor								 = sfcl
			sfImage								 = sfim
			sfSprite								= sfsp
			sfFont								  = sfft
			sfString								= sfst
			sfText								  = sftxt
			sf{Float|Int}Rect		   = sf{f|i}r

	Blocks and parenthesis:
			e.g.:
					for (;;) {
						if (this_condition || that_condition && this_other_one) {
							puts("lel");
						}
						puts("\tThis is how you use brackets.");
						{
							int i = 1;
							/* Single tab before new lines */
							F_MyFunc (i, "this is",
								'a', "function", "with a lot",
								"of arguments", 0);
							/* OR */
							/* Core of parenthesis always on the right of first parenthesis */
							F_MyFunc (i, "same with",
								  'a', "different", "alignement",
								  "of arguments", 0);
						}
						int orly
							= F_DatIsOneLongFuncNameBraLel
								("wow", "such prototypes");
						puts("\tIn this case, containing several instructions.");
					}
					puts("This is the rest of the code.");

			Unaligned brackets = simplier line-by-line editing of block content.
			Blocks and patrenthesis must be less important than actual readability, conciseness and good use of space (horizontally as vertically).
			In the previous example, we can clearly spot the loop thanks to indentation mostly, not thanks to brackets.

	Spacing:
			A newline may be inserted when it is improving readability.
			#inlcude guards and other #include statements must be separated by two newlines from the rest:
					#ifndef THAT_GUARD_THOUGH
					#define THAT_GUARD_THOUGH
					
					
					#include <header1.h>
					#include <header2.h>
					
					#include <myheader.h>
					
					/*...*/
					
					void
					f_datFunc(void)
					{
						/*...*/
						return;
					}
					
					

## General advices

* Always use header guards.
* Put braces even on one-line statements.
### Linux kernel coding style

GNU `indent` now has an option to format your code according to the Linux kernel  
coding style: `indent -linux [file]`.
Doc: <https://www.kernel.org/doc/html/v4.10/process/coding-style.html>

