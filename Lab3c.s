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

ldr r0, =display1
bl printf

pop {r4}
mov r0, r4
bl value
bl cr

POP {r5}
push {lr}

ldr r0, =display2
bl printf
bl cr

mov r6, #0
mov r7, #0
print_arr:
ldr r0, [r5, r7]
bl value
bl cr
add r7, #4
add r6, #1
cmp r6, r4
beq end
b print_arr

end:
ldr r0, =display3
bl printf
bl cr

pop {r6}
push {r5}
push {r4}

BX lr
.data
display1:
.string "The Number of Entries was: 	"
display2:
.string "Sorted from smallest to biggest, the numbers are:"
display3:
.string "Program ended"

/*--------------------------------------*/
