.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB 'HELLO$'
    STR3 DB 'STR LENGTH: $'
    STR2 DB 10 DUP('$')

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, OFFSET STR3
    MOV AH, 9
    INT 21H
    
    CALL STRLEN
    
    PGMEND:
        ;ADD BL, 48
        MOV AH, 0   ; Clear AH
        MOV AL, BL  ; Move high byte of CX to AL
        ADD AL, 48  ; Convert to ASCII

        MOV DL, AL
        MOV AH, 2
        INT 21H

        MOV DL, 10
        MOV AH, 2
        INT 21H

        MOV AH, 4CH
        INT 21H
MAIN ENDP

STRLEN PROC
    MOV SI, OFFSET STR1
    MOV BL, 0
    MOV DX, '$'
    MOV AH, 2
    L1:
        MOV DL, [SI]  ; Load character into AL
        ;INT 21H
        CMP DL , '$'   ; Check if it's the end of the string
        JE PGMEND
        INC BL
        INC SI
        JMP L1

    RET
STRLEN ENDP

END MAIN