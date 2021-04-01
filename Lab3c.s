/*Author - Wing Hoy. Last edited on Feb 26, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Display
.global printf
.global cr
.extern value
.extern getstring

.text
Display:
/*-----------------Students write their subroutine here--------------------*/
/* load the display message*/
ldr r0, =display1
bl printf

/* pop the array length */
pop {r4}
mov r0, r4
bl value
bl cr

/*Push the return address to the stack*/
push {lr}

/*display the second error message*/
ldr r0, =display2
bl printf
bl cr

/*clear r6,r7 to zero*/
mov r6, #0
mov r7, #0

/*a loop that continues for the length of the array, incrementing the address by r7*/
/*if the coutner reaches the end,branch to the end message*/
print_arr:
ldr r0, [r5, r7]
bl value
bl cr
add r7, #4
add r6, #1
cmp r6, r4
beq end
b print_arr

/*print last message*/
end:
ldr r0, =display3
bl printf
bl cr

pop {PC}

.data
display1:
.string "The Number of Entries was: 	"
display2:
.string "Sorted from smallest to biggest, the numbers are:"
display3:
.string "Program ended"

/*--------------------------------------*/
