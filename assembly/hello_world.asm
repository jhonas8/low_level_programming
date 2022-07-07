global _start

section .data
message: db 'hello, world!', 10

section .text
_start: 
  MOV rax,1 ; 0-read, 1-write, 2- open...
  MOV rdi,1
  MOV rsi,message
  MOV rdx,14
  syscall

  MOV rax,60
  XOR rdi,rdi
  syscall
