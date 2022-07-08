 SECTION .data:
	subtract: db 30 
	message_less: db 'Is less', 10
	message_greater: db 'Is greater', 10

SECTION .text
GLOBAL _start
_start: 
	MOV RAX, 40 
	PUSH RAX 
	CMP RAX,subtract
	
	JA print_less
	JB print_greater

	print_less:
		PUSH RAX
		MOV RAX, 1
		MOV RDI, 1
		MOV RSI, message_less
		MOV RDX, 8
		SYSCALL

		POP RAX
	print_greater:
		PUSH RAX
		MOV RAX, 1
		MOV RDI, 1
		MOV RSI, message_greater
		MOV RDX, 11
		SYSCALL

		POP RAX
	
	MOV RAX, 60
	XOR RDI, RDI
	SYSCALL
