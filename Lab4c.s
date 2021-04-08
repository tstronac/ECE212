/*Author - Wing Hoy. Last edited on Mar 18, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Display
.global printf
.global cr
.extern value
.extern getstring
.extern offled()
.extern onled()
.extern column()
.extern Column()
.extern row()
.extern Row()

.text
Display:
/*--------------------------------------*/

/*-------Students write their code here ------------*/

/*clear matrix*/
mov r0, #0
bl row
mov r0, #0
bl column

POP {r7}

mov r1, #7 //column
mov r2, #0 //row
mov r3, #0 //delay
mov r5, #0 //address offset




get_address:
ldr r4, [r7, r5]

led_loop:
LSR r4, #1
BCS led_on
b next_col
//need a way too add to the col.

led_on:


push {r0-r7}
bl onled
pop {r0-r7}

mov r0, r1
push {r0-r7}
bl column
pop {r0-r7}

mov r0, r2
push {r0-r7}
bl row
pop {r0-r7}



mov r0, r3
push {r0-r7}
bl HAL_Delay
pop {r0-r7}

push {r0-r7}
bl offled
pop {r0-r7}

b next_col

next_col:
sub r1, #1
cmp r1, #0
blt next_row
b led_loop

next_half:
add r5, #0x04
b get_address

next_row:
mov r1, #7
add r2, #1
cmp r2, #4
beq next_half
cmp r2, #8
beq bigger_loop
b led_loop


bigger_loop:
mov r0, #0
mov r1, #7
mov r2, #0
mov r5, #0
add r6, #1

cmp r6, #100
bne get_address

end:
bx lr

/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/


.data
/*--------------------------------------*/
