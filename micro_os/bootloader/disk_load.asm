; load DH sectors to ES:BX from drive DL
disk_load:
	push dx

	mov ah, 0x02	; BIOS read sector function
	mov al,dh 		; no.  of sectors
	mov ch, 0x00	; cylinder no.
	mov dh, 0x00	; head no.
	mov cl, 0x02	; start from second sector

	int 0x13 		; BIOS interrupt

	jc disk_error	; Jump if error

	pop dx
	cmp dh, al
	jne disk_error
	ret

disk_error:
	mov bx, DISK_ERROR_MSG
	call print_string
	jmp $

; Variables
DISK_ERROR_MSG db "Disk read error!", 0
