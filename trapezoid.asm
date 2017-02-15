
MAIN           PROC
    
               mov      bh,height
               mov      al,i
               mul      bh
               mov      ws,al
               
looph:         call     intitialize1
               call     printSpace
               call      intitialize2
               call     printAstric
               call     newLine                     
               mov      al,i
               mov      bl,02h
               mul      bl     
               add      al,upperSide
               mov      upperSide,al   
               mov      al,ws
               sub      al,i
               mov      ws,al            
               dec      bh
               cmp      bh,00
               ja       looph
               jmp      exit        
                             
intitialize1:  mov     bl,ws
               ret
                
printSpace:    mov     dl,20h  ;space ASCII code is 32 decimal or 20 hex
               mov     ah, 2h
               int     21h
               dec     bl 
               cmp     bl,00
               ja      printSpace
               ret

           
intitialize2:  mov     bl,upperSide
               ret
               
printAstric:   mov     dl,'*'  ;print '*' 
               mov     ah, 2h
               int     21h 
               dec     bl
               cmp     bl,00
               ja      printAstric
               ret

                             
newLine:       mov     ah,0Eh  ;print new line sequence
               mov     al,0Dh
               int     10h
               mov     al,0Ah
               int     10h  
               ret


upperSide      db      10h
height         db      04h
i              db      01h
ws             db      0FFh ;ws=(h-1)*i



exit:          mov     ah,4Ch       ;DOS function: Exit program 
               mov     al,0         ;Return exit code value 
               int     21h
                     