
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/
//X adress
.equ Xadr, 0x20001004
.equ Yadr, 0x20001008
.equ Tadr, 0x2000100C
.equ sizeof, 0x20001000

ldr r4,=sizeof
ldr r3,[r4]
sub r3,#1

ldr r4,=Yadr
ldr r5,=Xadr
ldr r6,=Tadr

ldr r0,[r4]
ldr r1,[r5]
ldr r2,[r6]

Sum:
ldr r4, [r0]
ldr r5, [r0, #4]
add r0,#0x04
//incriment r0,r1 for the next value

add r6,r4,r5

ldr r4, [r1]
ldr r5, [r1, #4]
add r1,#0x04

//ΔX x (Yk+Yk+1)
sub r5,r4
MUL r6,r5

//a running sum of the area
ldr r7,[r2]
add r7,r6
str r7,[r2]

sub r3,#1
cmp r3,#0
BEQ End
BNE Sum

End:
ldr r0, =0x20001010
lsr r7,#1
ldr r1,[r0]
STR r7,[r1]



/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
