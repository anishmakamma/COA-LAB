ORG 100h               ; Origin, to specify that the program starts at 100h (COM file format)

; Display the message "Enter the first digit: "
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_input1  ; Load the offset of the input message into DX
INT 21h                ; Call DOS interrupt to print the message

; Take first input digit
MOV AH, 01h            ; Function 01h of INT 21h to read a character from the keyboard
INT 21h                ; Read first digit from the user
SUB AL, '0'            ; Convert ASCII to numeric value
MOV BL, AL             ; Store the first number in BL

; Display the message "Enter the second digit: "
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_input2  ; Load the offset of the input message into DX
INT 21h                ; Call DOS interrupt to print the message

; Take second input digit
MOV AH, 01h            ; Function 01h of INT 21h to read a character from the keyboard
INT 21h                ; Read second digit from the user
SUB AL, '0'            ; Convert ASCII to numeric value
MOV BH, AL             ; Store the second number in BH

; Compare the two numbers
CMP BL, BH             ; Compare the first and second digits
JE numbers_equal       ; Jump if equal to the 'numbers_equal' label

; If numbers are not equal, display "Not Equal"
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_not_equal ; Load the offset of the "Not Equal" message into DX
INT 21h                ; Call DOS interrupt to print the message
JMP end_program        ; Jump to the end of the program

numbers_equal:
; If numbers are equal, display "Equal"
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_equal    ; Load the offset of the "Equal" message into DX
INT 21h                ; Call DOS interrupt to print the message

end_program:
; Terminate the program
MOV AH, 4Ch            ; Function 4Ch of INT 21h terminates the program
INT 21h                ; Call DOS interrupt to exit

; Data section with messages
msg_input1     DB 0Dh, 0Ah, 'Enter the first digit: $'  ; Prompt for first digit
msg_input2     DB 0Dh, 0Ah, 'Enter the second digit: $' ; Prompt for second digit
msg_equal      DB 0Dh, 0Ah, 'Equal$'                    ; Message when numbers are equal
msg_not_equal  DB 0Dh, 0Ah, 'Not Equal$'                ; Message when numbers are not equal