.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 0AH, 0DH, "FIRST NUM: $"
    NUM2 DB 0AH, 0DH, "SECOND NUM: $"
    RSLT DB 0AH, 0DH, "RESULT IS: $"

.CODE
    MAIN PROC
        MOV AX, @DATA   ; Load the data segment address into AX
        MOV DS, AX      ; Initialize DS register
        
        LEA DX, NUM1
        MOV AH, 09H
        INT 21H

        MOV AH, 01H
        INT 21H

        SUB AL, 30H
        MOV BH, AL

        MOV AH, 01H
        INT 21H

        SUB AL, 30H
        MOV BL, AL

        LEA DX, NUM2
        MOV AH, 09H
        INT 21H

        MOV AH, 01H
        INT 21H

        SUB AL, 30H
        MOV CH, AL

        MOV AH, 01H
        INT 21H

        SUB AL, 30H
        MOV CL, AL

        ADD BL, CL

        MOV AL, BL
        MOV AH, 00H
        AAA

        MOV CL, AL
        MOV BL, AH

        ADD BL, BH
        ADD BL, CH

        MOV AL, BL
        MOV AH, 00H
        AAA

        MOV BX, AX

        LEA DX, RSLT
        MOV AH, 09H
        INT 21H

        MOV DL, BH
        ADD DL, 30H
        MOV AH, 02H
        INT 21H

        MOV DL, BL
        ADD DL, 30H
        MOV AH, 02H
        INT 21H

        MOV DL, CL
        ADD DL, 30H
        MOV AH, 02H
        INT 21H

        MOV AH, 4CH
        INT 21H


    MAIN ENDP
END MAIN