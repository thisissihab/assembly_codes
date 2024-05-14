.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB 'FLY$'
    STR_LENGTH DB 'STRING LENGTH: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Find string length
    MOV SI, OFFSET STR1  ; Point SI to beginning of string
    MOV CX, 0  ; Initialize CX to zero to count the length

    ; Loop to find the string length
COUNT_LOOP:
    MOV AL, [SI]  ; Load character into AL
    CMP AL, '$'   ; Check if it's the end of the string
    JE COUNT_DONE  ; If end of string, exit loop

    INC CX  ; Increment count
    INC SI  ; Move to next character
    JMP COUNT_LOOP  ; Repeat loop

COUNT_DONE:
    ; Convert CX (length) to ASCII and print
    MOV AH, 0  ; Clear AH
    MOV AL, CH  ; Move high byte of CX to AL
    ADD AL, 48  ; Convert to ASCII

    MOV DI, OFFSET STR_LENGTH + 15  ; Address of 'STRING LENGTH: ' + length field
    MOV [DI], AL  ; Store ASCII value of length

    ; Print 'STRING LENGTH: '
    MOV DX, OFFSET STR_LENGTH
    MOV AH, 9
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP

END MAIN
