DOSSEG
.MODEL SMALL
.STACK 100H

.DATA
    STR1 DB 100 DUP('$')
    STR2 DB 'Your input: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 1
    MOV SI, OFFSET STR1

    INPUT:
        INT 21H
        CMP AL, 13
        JE PEND
        MOV [SI], AL
        INC SI
        JMP INPUT
    
    PEND:
        MOV AH, 9
        MOV DX, OFFSET STR2
        INT 21H

        MOV DX, OFFSET STR1
        INT 21H

        MOV AH, 4CH
        INT 21H
MAIN ENDP
END MAIN