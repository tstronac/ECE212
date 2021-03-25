/*Author - Wing Hoy. Last edited on Feb 26, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring

.text
Welcomeprompt:
/*-----------------Students write their subroutine here--------------------*/

.equ mem_addr, 0x20001000
ldr r7, =mem_addr
mov r6, lr
push {r14}	//push the link register on the stack//
bl cr
ldr r0, =Welcome
bl printf
bl cr
b get_size
//get the number of elements to be sorted


/*copied from lab lacture*/
get_size:
ldr r0, =Welcome2
bl printf
bl cr
bl getstring
mov r4,r0
bl value
bl cr

cmp r4, #3
Blo Error
cmp r4,#10//move this befor the mov / clock setting instructions//
BHI Error
mov r5, r4
POP {r6}
PUSH {r4}
PUSH {r6}
b get_values



Error:
ldr r0, =ERRORM1
bl printf
bl cr
b get_size


get_values:
ldr r0, =Welcome3
bl printf
bl cr
bl getstring
mov r6, r0
bl value
bl cr

cmp r6, #255
BHI Error2
str r6, [r7]
b store

Error2:
ldr r0, =ERRORM1
bl printf
bl cr
cmp r5,#1
beq last_value
b get_values

store:
add r7, #4
sub r5, #1
cmp r5, #1
beq last_value
b get_values


last_value:
ldr r0, =lastvalue
bl printf
bl cr
bl getstring
mov r6,r0
bl value
bl cr

cmp r6, #255
BHI Error2
str r6, [r7]
ldr r7, =mem_addr

Pop {pc}




.data
Welcome:
.string "Welcome to Tims Bubble Sort Program"
Welcome2:
.string "Please enter the number(3min-10max) of entries followed by ENTER"
Welcome3:
.string "Please a number(positive only - including 0)"
ERRORM1:
.string "Invalid entry, please enter a proper value."
lastvalue:
.string "Please enter the last number(positive only - including 0)"

/*--------------------------------------*/

