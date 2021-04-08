/*Author - Wing Hoy. Last edited on Mar 18, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Convert
.global printf
.global cr
.extern value
.extern getstring
.extern convert1

.text
Convert:
/*--------------------------------------*/

/*-------Students write their code here ------------*/

push {lr}
pop {r7}
bl convert1
push {r7}
pop {pc}//should be pc



/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/

.data
/*--------------------------------------*/
