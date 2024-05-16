.MODEL SMALL
.STACK 100H

.DATA
    TEMP DW ?
    STR1 DB 'abcdef$'

.CODE


MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
    L1: 
        MOV AH, 2CH
        INT 21H
        
        MOV AL, CH
        MOV AH, 0
        AAM
        
        
        MOV BX, AX
        MOV AH, 02H
        MOV DL, BH
        ADD DL, 48
        INT 21H
        
        MOV DL, BL
        ADD DL, 48
        INT 21H
        
        MOV DL, ':'
        INT 21H
        
        
        
        MOV AL, CL
        ADD AH, 0
        AAM
        
        MOV BX, AX
        MOV DL, BH
        ADD DL, 48
        
        MOV AH, 02H
        INT 21H
        
        MOV DL, BL
        ADD DL, 48
        INT 21H
        
        MOV DL, ':'
        INT 21H
        
          
        
        MOV AH, 2CH
        INT 21H
        
        MOV AL, DH
        MOV AH, 0
        AAM
        
        
        MOV BX, AX
        MOV DL, BH
        ADD DL, 48
        
        MOV AH, 02H
        INT 21H
        
        
        MOV DL, BL
        ADD DL, 48
        
        INT 21H
        
        MOV DL, 13
        INT 21H
        
        CALL DELAY
    
    JMP L1
    

    MOV AH, 4CH
    INT 21H
    

MAIN ENDP

DELAY PROC
       MOV TEMP, 0
       LP1:
        INC TEMP
        CMP TEMP, 100
        JNE LP1
       
       RET
    
DELAY ENDP

END MAIN