.model small
.stack 100h

.data
    num dw 1234          ; 16-bit integer to convert
    buffer db 6 dup(?)   ; Buffer to hold the resulting string (maximum of 5 digits + null terminator)

.code
main:
    mov ax, @data        ; Initialize data segment
    mov ds, ax

    mov ax, num          ; Load the 16-bit integer into AX
    call int_to_str      ; Convert integer to string

    ; Print the resulting string
    mov dx, offset buffer
    mov ah, 09h          ; DOS function to print a string
    int 21h              ; Call DOS

    mov ah, 4Ch          ; DOS function to terminate the program
    int 21h              ; Call DOS

int_to_str proc
    mov bx, 10           ; Base for conversion (decimal)
    mov di, offset buffer + 5  ; Point DI to the end of the buffer
    mov byte ptr [di], '$'     ; Null-terminate the string
    
convert_loop:
    xor dx, dx           ; Clear DX for division
    div bx               ; Divide AX by 10, quotient in AX, remainder in DX
    add dl, '0'          ; Convert remainder to ASCII
    dec di               ; Move DI to the left
    mov [di], dl         ; Store ASCII digit in buffer
    test ax, ax          ; Check if quotient is zero
    jnz convert_loop     ; If not zero, continue conversion
    ret
int_to_str endp

end main
