		.global main

		.data
A_DIGIT:.word 0x41
.align
H_DIGIT:.word 0x0
.align

		.text
main: 	LDR R0, =A_DIGIT			@Load the address of ascii value into R0
		LDR R2, =H_DIGIT
		LDR R1, [R0]
		SUB R1, R1, #'0'			@Subract the value by the decimal value of ascii charater '0' to obtain the actual hex value
		CMP R1, #0xA				@If the number is less than 10, then exit, else again subract it by the ascii value of 'A' and '9' to get hex 0xA-0xf
		BLT exit
		SUB R1, R1, #'A' - '9' -1
exit:   STR R1, [R2]