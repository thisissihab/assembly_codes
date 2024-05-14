DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
   TEMP DB ?
.CODE
   MAIN PROC
      MOV AX, @DATA
      MOV DS, AX
      MOV CL, 26     ; Initialize loop counter for 26 letters
      MOV BL, 97     ; Initialize BL to ASCII value of 'a'
      MOV DL, 65

      PRINT:
         ; Print the letter
         MOV AH, 2
         INT 21H

         MOV TEMP, DL

         ; Print a space
         MOV DL, 32   ; ASCII value for space
         INT 21H      ; DOS interrupt to print character in DL

         MOV DL, TEMP
         INC DL       ; Increment BL to get next letter
         LOOP PRINT   ; Repeat for all 26 letters

      ; Exit program
      MOV AH, 4CH
      INT 21H

   MAIN ENDP
   END MAIN
