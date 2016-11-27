print_string:
	pusha
	mov si, bx

	print:
		mov ah, 0x0e ; set scrolling teletype BIOS routine
		mov al, [si] ; set al reg. to character to print
		inc si
		or al, al
		jz end
		int 0x10 ; give interrupt to print on screen
		jmp print
	end:
		mov al, 13 	 	
		int 0x10
		mov al, 10
		int 0x10
		popa
		ret
