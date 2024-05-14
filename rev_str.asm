.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB 'HELLO$'
    STR3 DB 'OUTPUT: $'
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
        MOV CL, BL
        
        MOV SI, OFFSET STR1
        MOV BL, 0
        SVSTK:
            MOV DX, [SI]
            PUSH DX
            INC SI
            INC BL
            LOOP SVSTK

        MOV SI, OFFSET STR2

        MOV CL, BL
        RETSTK:
            POP DX

            MOV [SI], DX
            
            INC SI
            LOOP RETSTK
        PEND:
            MOV [SI], '$'
            MOV DX, OFFSET STR2
            MOV AH, 9
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
        CMP DL, '$'   ; Check if it's the end of the string
        JE PGMEND
        INC BL
        INC SI
        JMP L1

    RET
STRLEN ENDP

END MAIN