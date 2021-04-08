/*Author - Wing Hoy. Last edited on Mar 18, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring
.extern getchar
.extern putchar

.text
Welcomeprompt:
/*--------------------------------------*/

/*-------Students write their code here ------------*/



/*push the link register to exit the subroutine*/
push {r14}

/*print The first welcome prompt*/
bl cr
ldr r0, =Welcome
bl printf
bl cr
b get_val
/*get the number or character to be displayed*/


/*prompt the user to enter the number or character*/
/* next move there input from r0 to r4*/
/*print the value on screen*/
get_val:
ldr r0, =Welcome2
bl printf
bl cr
bl getchar
mov r4,r0
bl cr


/*Check if its a number. if yes then store on the stack and exit*/
/*If not,branch to letter*/
cmp r4, #0x30
Blo Error
cmp r4,#0x39
BHI Letter

str r4,[sp,#4]
b end


/* the error prompt*/
Error:
ldr r0, =ERRORM1
bl printf
bl cr
b get_val


/*Check if its a letter*/
Letter:
cmp r4, #0x41
BLO Error
cmp r4, #0x5A
BHI Error
str r4,[sp,#4]
b end


/*return to main*/
end:
Pop {pc}


/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/

.data
Welcome:
.string "Welcome to Tim and Omer's Display program"
Welcome2:
.string "Please enter a character (A-Z , 0-9)"
ERRORM1:
.string "Invalid entry please enter a character (A-Z, 0-9)"

/*--------------------------------------*/

