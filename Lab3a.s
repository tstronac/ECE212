/*Student Names: IDs: */
/*Omer Al-Amoudi 1646486 */
/*Timothy Stronach 1581380 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring

.text
Welcomeprompt:
/*-----------------Students write their subroutine here--------------------*/


/*Store the memory address, push the link register to exit the subroutine*/
.equ mem_addr, 0x20001000
ldr r7, =mem_addr
push {r14}	

/*print The first welcome prompt*/
bl cr
ldr r0, =Welcome
bl printf
bl cr
b get_size
/*get the number of elements to be sorted*/


/*prompt the user to enter the number of elements*/
/* next move there input from r0 to r4*/
/*print the value on screen*/
get_size:
ldr r0, =Welcome2
bl printf
bl cr
bl getstring
mov r4,r0
bl value
bl cr

/* check that the lenght is between 3 and 10, if not branch to an error message*/
/* if the value is between 3 and 10, then branch to get the next values*/
cmp r4, #3
Blo Error
cmp r4,#10
BHI Error
mov r5, r4
POP {r6}
PUSH {r4}
PUSH {r6}
b get_values


/* the first error prompt*/
Error:
ldr r0, =ERRORM1
bl printf
bl cr
b get_size

/* get the elements to be sorted*/
get_values:
ldr r0, =Welcome3
bl printf
bl cr
bl getstring
mov r6, r0
bl value
bl cr

/* the check for negative values, if number loaded is larger than this, its a 2's comp of a negative number*/
cmp r6, #255
BHI Error2
b store

/*Error 2, the value is not 0 or positive*/
/* if the counter is at 1, then branch to the last value prompt*/
Error2:
ldr r0, =ERRORM1
bl printf
bl cr
cmp r5,#1
beq last_value
b get_values

/*Store the value, incerment the address, and check if the last element is about to be input*/
store:
str r6, [r7]
add r7, #4
sub r5, #1
cmp r5, #1
beq last_value
b get_values

/* prompt the user for the last input*/
last_value:
ldr r0, =lastvalue
bl printf
bl cr
bl getstring
mov r6,r0
bl value
bl cr

/* if the value is less than 0, go back to error 2, else store the value*/
cmp r6, #255
BHI Error2
str r6, [r7]
ldr r7, =mem_addr

/*return to main*/
Pop {pc}




.data
Welcome:
.string "Welcome to Tim and Omer's Bubble Sort Program"
Welcome2:
.string "Please enter the number(3min-10max) of entries followed by ENTER"
Welcome3:
.string "Please a number(positive only - including 0)"
ERRORM1:
.string "Invalid entry, please enter a proper value."
lastvalue:
.string "Please enter the last number(positive only - including 0)"

/*--------------------------------------*/

