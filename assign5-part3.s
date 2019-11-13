		.global main

		.data
BCDNUM:.ascii "92529679"
.align
NUMBER:.word 0x0
.align

main:LDR R0,=BCDNUM 					@ load the address of BCDNUM 
		LDR R6,=NUMBER 
		MOV R1, #0x0 				
		MOV R2, #0x0 					
		MOV R3, #0xA					@ initialize with 10 to shift result by one position
loop:	LDRB R4, [R0], #1 			
		AND R4, R4, #0x0F 			     @ Extract 1Nibble each time 
		MOV R5, R2
		MLA R2, R5, R3, R4				 @ shift and add current element
		ADD R1, R1, #1 				     
		CMP R1, #8					 	@ check if we have exhausted the string 
		BNE loop					 
done:	STR R2, [R6] 				
