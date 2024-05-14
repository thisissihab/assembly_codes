DOSSEG
.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DW 21
    NUM2 DW 23

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, NUM1
    MOV BL, 10
    DIV BL
    MOV BH, AL  ;MSB
    MOV BL, AH  ;LSB
    
    MOV AX, NUM2
    MOV CL, 10
    DIV CL
    MOV CH, AL  ;MSB
    MOV CL, AH  ;LSB

    ADD BL, CL
    MOV AL, BL
    MOV AH, 0
    AAA

    MOV CL, AL
    ADD BH, AH
    ADD BH, CH

    MOV AL, BH
    MOV AH, 0
    AAA

    MOV BX, AX

    CMP AH, 0
    JE L1

    MOV AH, 2
    ADD BH, 48
    MOV DL, BH
    INT 21H

    L1:
        MOV AH, 2
        ADD BL, 48
        MOV DL, BL
        INT 21H

        MOV AH, 2
        ADD CL, 48
        MOV DL, CL
        INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN