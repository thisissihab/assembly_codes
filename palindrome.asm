.MODEL SMALL
.STACK 100H

.DATA
    STR1 DB 5 DUP('$')
    STR2 DB 'INP: $'
    LEN DW ?

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    MOV BX, 0

    MOV SI, OFFSET STR1
    INPUT:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE OUTP
        MOV [SI], AL
        PUSH [SI]
        INC SI 
        INC BX
        
        JMP INPUT
        
    OUTP:
        INC SI
        MOV [SI], '$'
           
        MOV DX, OFFSET STR2
        MOV AH, 09H
        INT 21H
        
        MOV DX, OFFSET STR1
        MOV AH, 09H
        INT 21H
        
    MOV CX, BX
    MOV LEN, 0
    MOV SI, OFFSET STR2
    L2:
        CMP CX, 0
        JE L4    
        CPL:
           POP DX
           CMP DX, [SI]
           JE L3
           INC SI
           LOOP CPL
       
    L3:
       INC LEN
       JMP L2
       
    L4:
          
    CMP BX, LEN
    JE PRES
    
    MOV DX, 'N'
    MOV AH, 02H
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    PRES:
       MOV DX, 'Y'
       MOV AH, 02H
       INT 21H
       
       MOV AH, 4CH
       INT 21H
       

MAIN ENDP

CNT PROC
    INC LEN
    RET
CNT ENDP

END MAIN