.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    MOV CX, 5
    MOV AH, 02H
    MOV BX, 5
    L1:
        PUSH CX
        MOV CX, BX
        L2:
            MOV DL, '1'
            INT 21H

            MOV DL, ' '
            INT 21H
        LOOP L2
        DEC BX
        MOV DL, 10
        INT 21H
        POP CX
    LOOP L1

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN