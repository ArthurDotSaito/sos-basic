bits 16
org 0x7c00

main:
    ;Starting data segment...
    xor ax, ax
    mov ds, ax
    mov es, ax

    ;Starting stack...
    mov ss, ax
    mov sp, 0x7c00

clear_screen:
    
    ;clear screen 
    ;AH 0x00 => change video mode
    ;AL 0x30 => VGA text mode 80x25, char 9x16
    mov al, 0x03
    int 0x10

print_msg:
    mov ax, 0x1301
    mov bx, 0x02
    mov cx, pad - msg
    xor dx, dx
    mov bp, msg
    int 0x10

halt:
    cli
    hlt
    
msg: db 'Loading SOS!',0

pad:
    times 510-($-$$) db 0
sig:
    dw 0xaa55

