DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
    OUT1 DB 'They are equal$'
    OUT2 DB 'They are not equal$'

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        MOV DL, '8'
        MOV AH, 1
        INT 21H

        CMP DL, AL
        JE DEST1

        MOV DL, 10
        MOV AH, 2
        INT 21H

        MOV DX, OFFSET OUT2
        MOV AH, 9
        INT 21H

        MOV AH, 4CH
        INT 21H

        DEST1:
            MOV DL, 10
            MOV AH, 2
            INT 21H

            MOV DX, OFFSET OUT1
            MOV AH, 9
            INT 21H

            MOV AH, 4CH
            INT 21H
    MAIN ENDP
    END MAIN