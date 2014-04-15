;; kernel.asm
;; http://arjunsreedharan.org/post/82710718100/kernel-101-lets-write-a-kernel

bits 32			; nasm directive 32 bit
section .text
	; multiboot specifications
	align 4
	dd 0x1BADB002	; magic
	dd 0x00		; flags
	dd - (0x1BADB002 + 0x00)	; checksum m+f+c = 0

global start		; external usage
extern kmain		; kmain is defined in the C file

start:
	cli		; block interrupts
	call kmain
	hlt		; halt the CPU

