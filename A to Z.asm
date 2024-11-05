MOV BL, 'A'     
MOV CL, 26        

print_loop:
    MOV DL, BL       
    MOV AH, 02h    
    INT 21h          
    
    INC BL           
    LOOP print_loop  

MOV AH, 4Ch      
INT 21h