 ORG 100h               ; Origin, to specify that the program starts at 100h (COM file format)

; Display the message "Enter a digit: "
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_input  ; Load the offset of the input message into DX
INT 21h                ; Call DOS interrupt to print the message

; Take input digit
MOV AH, 01h            ; Function 01h of INT 21h to read a character from the keyboard
INT 21h                ; Read the digit from the user
SUB AL, '0'            ; Convert ASCII to numeric value

; Check if the number is even or odd
MOV BL, AL             ; Store the input number in BL
AND BL, 1              ; Perform bitwise AND with 1 to check if the last bit is set
JZ even_number         ; If zero, it means the number is even

; If number is odd, display "Odd"
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_odd     ; Load the offset of the "Odd" message into DX
INT 21h                ; Call DOS interrupt to print the message
JMP end_program        ; Jump to the end of the program

even_number:
; If number is even, display "Even"
MOV AH, 09h            ; Function 09h of INT 21h prints a string
MOV DX, OFFSET msg_even    ; Load the offset of the "Even" message into DX
INT 21h                ; Call DOS interrupt to print the message

end_program:
; Terminate the program
MOV AH, 4Ch            ; Function 4Ch of INT 21h terminates the program
INT 21h                ; Call DOS interrupt to exit

; Data section with messages
msg_input     DB 0Dh, 0Ah, 'Enter a digit: $'   ; Prompt for digit
msg_even      DB 0Dh, 0Ah, 'Even$'              ; Message when number is even
msg_odd       DB 0Dh, 0Ah, 'Odd$'               ; Message when number is odd