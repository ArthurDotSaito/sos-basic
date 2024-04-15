bits 16
org 0x7c00

main:
    mov ax, 0
    mov ds, ax
    mov es, ax

    mov ss, ax
    mov sp, 0x7c00

print_str:
    mov ah, 0x0e
    mov cx, pad - msg
    mov si, msg
.next_char:
    lodsb
    int 0x10
    loop .next_char

halt:
    cli
    hlt
    
msg: db 'Loading SOS!',0

pad:
    times 510-($-$$) db 0
sig:
    dw 0xaa55

