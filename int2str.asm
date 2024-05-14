.model small
.stack 100h

.data
    num dw 1234          ; 16-bit integer to convert
    buffer db 6 dup(?)   ; Buffer to hold the resulting string (maximum of 5 digits + null terminator)
    len db ?
.code
main proc
    mov ax, @data        ; Initialize data segment
    mov ds, ax

    mov ax, num
    mov dx, 0
    mov bx, 10

    mov len, 0
    l1:
        div bx
        push dx
        inc len
        cmp ax, 0
        je l2
        mov dx, 0
        jmp l1
    
    l2:
        mov cl, len
        mov si, offset buffer
        loop1:
            pop dx
            add dx, 48
            mov [si], dx
            inc si
            loop loop1
    mov [si], '$'

    mov ah, 09h
    mov dx, offset buffer
    int 21h

    mov ah, 4ch
    int 21h



main endp


end main
