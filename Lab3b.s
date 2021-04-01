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

/* take the lenght of array off the stack return it to the stack and push the lr */
POP {r4}
mov r6, r4
sub r6, #1
mov r3, #0
mov r5, #0
PUSH {r4}
PUSH {lr}

/* compare the two values, the the latter is greater,branch to swap*/
/*increment the address and the counter*/
/*if the address equals the length-1 branch to rounds*/
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

/*store the lesser value at the current lower address, then increment the address to store the larger value*/
/*increment the address and the counter*/
/*if the element number equals the length-1 branch to rounds*/
swap:
str r2, [r0]
add r0, #4
str r1, [r0]
mov r3, #1 		//if a swap has occured, then the array is not orgonized
add r5, #1
cmp r5,r6
beq rounds
b compare

/*if no swaps occured, branch to the end*/
rounds:
cmp r3,#0
beq end

/*reset the memory address, decrement the length (r6) by one, reset the counter*/
/* reset r3 to 0 so we can see if a swap is made or not*/
ldr r0, =0x20001000
sub r3, #1
sub r6, #1
mov r5, #0
b compare

/*return to main*/
end:
POP {PC}

.data
/*--------------------------------------*/
