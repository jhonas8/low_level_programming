SECTION .data

codes: db '0123456789ABCDEF'
break_line: db ' ', 10

SECTION .text

GLOBAL _start
_start:
	MOV rax, 0xA24E8F

	MOV rdi,1
	MOV rdx,1
	MOV rcx,32 ;;Each hexadecimal char has the size of a nibble (4 x 16 = 64)

	.loop:
		PUSH rax ;;Put the rax at the top of hardware's stack
		SUB rcx,4 ;;Decrease the size in a nibble (hex char size)
		
		SAR rax,cl ;;Get the first nibble (hex char)
		AND rax,0xF ;;Mask to transform the whole number into its hexadecimal digit

		LEA rsi, [codes+rax]

		MOV rax,1
		PUSH rcx
		syscall

		POP rcx
		POP rax

		TEST rcx,rcx ;;Easy test if it's zero
		JNZ .loop

	;;Print a blank space and a line-break after printing each char
	MOV rax,1
	MOV rdi,1
	MOV rsi,break_line
	MOV rdx,2
	syscall

	MOV rax,60
	XOR rdi,rdi
	syscall
