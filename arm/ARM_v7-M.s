; Reset Handler

MAXPOSITIVE equ 0x7FFFFFFF

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
	


    ;Exercise_1
    ; Operation for producing C = 1
    ;r0(0xFFFFFFFF) + r2(1) should produce a carry when we substract them
	mov	r0, #-1 	;  1111 
	mov r3, #1  	;  0001
	adds r2, r0, r3 ;1|0000

    ; Operation for producing C = 1
    ;r4(0xFFFFFFFF) - r2(0xFFFFFFFF) should produce a carry when we substract them
    mov r4, #-1		; 1111
    mov r2, #-1		; 1111 inverti e sommi 1
	subs r5, r4, r2 ; 0000
				
    ; Operation for overflow V = 1, using the maximun possible positive number
	ldr	r0,=MAXPOSITIVE
	mov r3, #1
	adds r2, r0, r3 

    ; Operation for producing V = 1
    ;r4(0x80000000) - r2(1) should produce an overflow when we substract them
    mov r4, #MAXPOSITIVE
	mvn r4, r4
    mov r2, #1
	subs r5, r4, r2
				
    ; Operation for  N = 1
    mov r0, #0		; 0000
	mov r3, #-1 	; 1111
    adds r2, r0, r3 ;

    ; Operation for N = 1
    mov r4, #0
    mov r2, #1
	subs r5, r4, r2

    ; Operation for  Z = 1
    mov r0, #0
	mov r3, #0 
    adds r2, r0, r3 

    ; Operation for  Z = 1
    mov r4, #0
    mov r2, #0
	subs r5, r4, r2




    ;Exercise 2a, use of branches
    mov r2, #-2
    mov r3, #-1
    cmp r2, r3 ; tmp = r2 - r3 -> tmp = 0 -> Z = 1 (true)
    bne storeR5 ; jumps to label if Z = 0
    lsr r3, #1
    add r4, r3, r2
endStore
    b exercise2b

storeR5 ; if they DIFFER -> if cmp != 0 -> if Z = 0
    mov r5, r3 ; save r3 into r5
    b endStore

    ;Exercise 2b, use of conditional execution
exercise2b
    mov r2, #-2
    mov r3, #-2
    cmp r2, r3
    movne r5, r3
    lsreq r3, #1
    addeq r4, r3, r2
    



    ;Exercise 3, count leading zeros
    mov r0, #-1  ;count of number of zeros
    mov r1, #5 ; current value to check the number of leading zeros 
countZeros
    adds r0, #1 ; increment the counter
    cmp r0, #32 ; register is 32 bit -> if r0 == 32
    beq  endOfCountZeros
    lsls r1, #1 ; logic shift left, lsl{s} -> and update the flags 
    bcc countZeros

; if the number of leading zeros is even after the shift 
; the carry should be clear if the carry is set that     
; means that the value is odd and perform the addition, otherwise perfom the substraction                        
endOfCountZeros
    lsrs r0, #1 
    addcs r4, r2, r3
    subcc r4, r2, r3


    ENDP