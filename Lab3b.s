/*Author - Wing Hoy. Last edited on Feb 26, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Sort
.global printf
.global cr
.extern value
.extern getstring

.text
Sort:
/*-----------------Students write their subroutine here--------------------*/


POP {r4}
mov r6, r4
sub r6, #1
mov r3, #0
mov r5, #0
PUSH {r4}
PUSH {lr}

compare:

ldr r1, [r0]
ldr r2, [r0,#4]
cmp r2, r1
blo swap
add r0, #4
add r5, #1
cmp r5,r6
beq rounds
b compare

swap:
str r2, [r0]
add r0, #4
str r1, [r0]
mov r3, #1 		//if a swap has occured, then the array is not orgonized
add r5, #1
cmp r5,r6
beq rounds
b compare

rounds:
cmp r3,#0
beq end

ldr r0, =0x20001000
sub r3, #1
sub r6, #1
mov r5, #0
b compare

end:
POP {PC}
































POP {PC}

.data
/*--------------------------------------*/
