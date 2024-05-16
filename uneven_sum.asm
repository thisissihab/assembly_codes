.MODEL SMALL
.STACK 100H

.DATA
    TEMP DB ?

.CODE


MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, 4
    MOV BL, 7

    SUB AL, BL
    MOV TEMP, AL
    CMP AL, 0
    JL NEG_RES
    MOV DL, AL
    ADD DL, 48
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H

    NEG_RES:
        MOV DL, '-'
        MOV AH, 2
        INT 21H

        NEG TEMP
        MOV DL, TEMP
        ADD DL, 48
        INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN