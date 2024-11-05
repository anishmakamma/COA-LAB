MOV BL,0
MOV CL,10

print_loop:
    MOV AH,02h
    MOV DL,BL
    ADD DL, 30h
    INT 21h
    
    INC BL
    LOOP print_loop
    
MOV AH,4ch
int 21h