		.global main

		.data
STRING:.word 0x31,0x31,0x30,0x31,0x30,0x30,0x31,0x30
.align
NUMBER:.word 0x0
.align
ERROR:.word
.align

main:	LDR R0, =STRING		
		LDR R1, =NUMBER
		LDR R2, =ERROR
		MOV R4, #8			@The number of iterations is 8
loop:	LDR R3, [R0], #4
		SUB R4, R4, #1
		SUB R3, R3, #'0'	@Convert to Hex value 
		CMP R3, #0x2		@Compare if the number is not a 0 or a 1
		BGE error			@If it it not then jump to error
		LSL R5, R3, R4		@Construct the Binary Number by Left shift and or the value with the original value
		ORR R6, R5
		CMP R4, #0
		BEQ exit
		B loop
error:	MOV R6, #0x0
		MOV R4, #0xff
exit:	STR R6, [R1]
		STR R4, [R2]
		.end