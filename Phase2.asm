
;macros
;macros
    Adding MACRO a,b,cf
        push ax
        mov ax,a
        add ax,b
        jnc RESNOCARRY5
        ;i have cf 
        mov cf,1
        jmp endingAddCarry5

        RESNOCARRY5:
        mov cf,0

        endingAddCarry5:

        mov a,ax
        pop ax
    ENDM Adding

    Adding8 MACRO a,b,cf
        push ax
        mov al,a
        add al,b
        jnc RESNOCARRY6
        ;i have cf 
        mov cf,1
        jmp endingAddCarry6

        RESNOCARRY6:
        mov cf,0

        endingAddCarry6:


        mov a,al
        pop ax
    ENDM Adding8

    Addcarry MACRO a,b,cf;              1 bit for currrent cf
        push ax
        mov ax,a
        cmp cf,1
        jz YesCarry1
        ;if no carry, make clear carry
        CLC
        jmp NOCARRY1
        YesCarry1:
        STC
        NOCARRY1:
        adc ax,b
        jnc RESNOCARRY1
        ;i have cf 
        mov cf,1
        jmp endingAddCarry1

        RESNOCARRY1:
        mov cf,0

        endingAddCarry1:
        mov a,ax
        pop ax
    ENDM Addcarry

    Addcarry8 MACRO a,b,cf
        push ax
        mov al,a
        cmp cf,1
        jz YesCarry2
        ;if no carry, make clear carry
        CLC
        jmp NOCARRY2
        YesCarry2:
        STC
        NOCARRY2:
        adc al,b
        jnc RESNOCARRY2
        ;i have cf 
        mov cf,1
        jmp endingAddCarry2

        RESNOCARRY2:
        mov cf,0

        endingAddCarry2:
        mov a,al
        pop ax
    ENDM Addcarry8

    Subtracting MACRO a,b,cf
        push ax
        mov ax,a
        sub ax,b
        jnc RESNOCARRY7
        ;i have cf 
        mov cf,1
        jmp endingAddCarry7

        RESNOCARRY7:
        mov cf,0

        endingAddCarry7:

        mov a,ax
        pop ax
    ENDM Subtracting
    Subtracting8 MACRO a,b,cf
        push ax
        mov al,a
        sub al,b
            jnc RESNOCARRY8
        ;i have cf 
        mov cf,1
        jmp endingAddCarry8

        RESNOCARRY8:
        mov cf,0

        endingAddCarry8:

        mov a,al
        pop ax
    ENDM Subtracting8

    SubBorrow MACRO a,b,cf
        push ax
        mov ax,a
        cmp cf,1
        jz YesCarry3
        ;if no carry, make clear carry
        CLC
        jmp NOCARRY3
        YesCarry3:
        STC
        NOCARRY3:
        sbb ax,b
        jnc RESNOCARRY3
        ;i have cf 
        mov cf,1
        jmp endingAddCarry3

        RESNOCARRY3:
        mov cf,0

        endingAddCarry3:
            mov a,ax
        pop ax
    ENDM SubBorrow
    SubBorrow8 MACRO a,b,cf
        push ax
        mov al,a
    cmp cf,1
        jz YesCarry30
        ;if no carry, make clear carry
        CLC
        jmp NOCARRY30
        YesCarry30:
        STC
        NOCARRY30:
        sbb al,b
        jnc RESNOCARRY30
        ;i have cf 
        mov cf,1
        jmp endingAddCarry30

        RESNOCARRY30:
        mov cf,0

        endingAddCarry30:

        mov a,al
        pop ax
    ENDM SubBorrow8

    Moving MACRO a,b
        push ax
        mov ax,b
        mov a,ax
        pop ax
    ENDM Moving

    Moving8 MACRO a,b
        push ax
        mov al,b
        mov a,al
        pop ax
    ENDM Moving8

    XORing MACRO a,b,cf
        push ax
        mov ax,a
        xor ax,b
        jnc RESNOCARRY9
        ;i have cf 
        mov cf,1
        jmp endingAddCarry9

        RESNOCARRY9:
        mov cf,0

        endingAddCarry9:

        mov a,ax
        pop ax
    ENDM XORing

    XORing8 MACRO a,b,cf
        push ax
        mov al,a
        xor al,b
            jnc RESNOCARRY10
        ;i have cf 
        mov cf,1
        jmp endingAddCarry10

        RESNOCARRY10:
        mov cf,0

        endingAddCarry10:

        mov a,al
        pop ax
    ENDM XORing8

    ANDing MACRO a,b,cf
        push ax
        mov ax,a
        AND ax,b
        jnc RESNOCARRY11
        ;i have cf 
        mov cf,1
        jmp endingAddCarry11

        RESNOCARRY11:
        mov cf,0

        endingAddCarry11:
        
        mov a,ax
        pop ax
    ENDM ANDing

    ANDing8 MACRO a,b,cf
        push ax
        mov al,a
        AND al,b
        jnc RESNOCARRY12
        ;i have cf 
        mov cf,1
        jmp endingAddCarry12

        RESNOCARRY12:
        mov cf,0

        endingAddCarry12:
        mov a,al
        pop ax
    ENDM ANDing8

    ORing MACRO a,b,cf
        push ax
        mov ax,a
        OR ax,b
        jnc RESNOCARRY13
        ;i have cf 
        mov cf,1
        jmp endingAddCarry13

        RESNOCARRY13:
        mov cf,0

        endingAddCarry13:    
        mov a,ax
        pop ax
    ENDM ORing

    ORing8 MACRO a,b,cf
        push ax
        mov al,a
        OR al,b
        jnc RESNOCARRY31
        ;i have cf 
        mov cf,1
        jmp endingAddCarry31

        RESNOCARRY31:
        mov cf,0
        endingAddCarry31:
        mov a,al
        pop ax
    ENDM ORing8

    NoOperation MACRO 
        NOP
    ENDM NoOperation



    ShiftRight MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov ax,a
        SHR ax , cl
        jnc RESNOCARRY14
        ;i have cf 
        mov cf,1
        jmp endingAddCarry14

        RESNOCARRY14:
        mov cf,0
        endingAddCarry14:
        mov a,ax
        pop cx
        pop ax
    ENDM ShiftRight

    ShiftRight8 MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov al,a
        SHR al , cl
        jnc RESNOCARRY15
        ;i have cf 
        mov cf,1
        jmp endingAddCarry15

        RESNOCARRY15:
        mov cf,0
        endingAddCarry15:
        mov a,al
        pop cx
        pop ax
    ENDM ShiftRight8

    RotateLeft MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov ax , a
        ROL ax , cl
        jnc RESNOCARRY16
        ;i have cf 
        mov cf,1
        jmp endingAddCarry16

        RESNOCARRY16:
        mov cf,0
        endingAddCarry16:
        mov a,ax
        pop cx
        pop ax
    ENDM RotateLeft
    RotateLeft8 MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov al , a
        ROL al , cl
        jnc RESNOCARRY17
        ;i have cf 
        mov cf,1
        jmp endingAddCarry17

        RESNOCARRY17:
        mov cf,0
        endingAddCarry17:    
        mov a,al
        pop cx
        pop ax
    ENDM RotateLeft8

    RotateRight MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov ax,a
        ROR ax , cl
        jnc RESNOCARRY18
        ;i have cf 
        mov cf,1
        jmp endingAddCarry18

        RESNOCARRY18:
        mov cf,0
        endingAddCarry18:
        mov a,ax
        pop cx
        pop ax
    ENDM RotateRight
    RotateRight8 MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov al,a
        ROR al , cl
            jnc RESNOCARRY19
        ;i have cf 
        mov cf,1
        jmp endingAddCarry19

        RESNOCARRY19:
        mov cf,0
        endingAddCarry19:
        mov a,al
        pop cx
        pop ax
    ENDM RotateRight8

    ShiftLeft MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov ax,a
        SHL ax ,cl
        jnc RESNOCARRY20
        ;i have cf 
        mov cf,1
        jmp endingAddCarry20

        RESNOCARRY20:
        mov cf,0
        endingAddCarry20:
        mov a,ax
        pop cx
        pop ax
    ENDM ShiftLeft
    ShiftLeft8 MACRO a,c,cf
        push ax
        push cx
        mov cl,byte ptr c
        mov al,a
        SHL al ,cl
        jnc RESNOCARRY21
        ;i have cf 
        mov cf,1
        jmp endingAddCarry21

        RESNOCARRY21:
        mov cf,0
        endingAddCarry21:    
        mov a,al
        pop cx
        pop ax
    ENDM ShiftLeft8

    Increment MACRO a
        push ax
        mov ax,a
        INC ax
        mov a,ax
        pop ax
    ENDM Increment
    Increment8 MACRO a
        push ax
        mov al,a
        INC al
        mov a,al
        pop ax
    ENDM Increment

    Decrement MACRO a
        push ax
        mov ax,a
        Dec ax
        mov a,ax
        pop ax
    ENDM Decrement
    Decrement8 MACRO a
        push ax
        mov al,a
        Dec al
        mov a,al
        pop ax
    ENDM Decrement

    ClearCarry MACRO cf
        mov cf,0
    ENDM ClearCarry


Print_Vertical_MSG macro message
        local loop_print_v_msg
        local end_print_v_msg
    mov di,offset message
    
    loop_print_v_msg:
    ;-----  
    mov ah,2
    ;mov dx,0A0Ah
    int 10h 
    ;------

    mov ah,9 ;Display
    mov bh,0 ;Page 0
    mov al,[di] 
    cmp al,24h;$ in ascii code =24h
    jz end_print_v_msg
    mov cx,1h ;5 times
    int 10h  
    ;-- 
    ;inc dx
    inc dh
    inc di
    ;-- 
    jmp loop_print_v_msg
    ;cmp al,24h;$ in ascii code =24h
    ;jnz loop_print_msg
    end_print_v_msg:
EndM  Print_Vertical_MSG


get_user_num Macro;NOTE : the num will be stored in cl                  
              ;ex :num= 12    
             mov ah,1
             int 21h;now al=ascii ex al 31
             sub al,30h; now al=1 
             
             mov bl,al;bl=1
             
             mov ah,1
             int 21h;now al=ascii ex al 32
             sub al,30h; now al=2
             
            ; mov ah,al ;NOTE  
            mov cl,al
             mov al,10d;NOTE:not 10H
             mul bl;ax=al*bl=10*1=0010->al=10 , ah=00
           ;;  Add al,bl;wrong     
            ;; add ah,al;ah=ah+al=
               add cl,al;cl=cl+al=2+10=12
                  
ENDM  get_user_num 
;-------------------------------------------------
display_new_line Macro
      
                  mov ah,9
                 mov dx,offset nw_line
                 int 21h                 
    
ENDM display_new_line



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

get_user_num Macro;NOTE : the num will be stored in cl                  
              ;ex :num= 12    
             mov ah,1
             int 21h;now al=ascii ex al 31
             sub al,30h; now al=1 
             
             mov bl,al;bl=1
             
             mov ah,1
             int 21h;now al=ascii ex al 32
             sub al,30h; now al=2
             
            ; mov ah,al ;NOTE  
            mov cl,al
             mov al,10d;NOTE:not 10H
             mul bl;ax=al*bl=10*1=0010->al=10 , ah=00
           ;;  Add al,bl;wrong     
            ;; add ah,al;ah=ah+al=
               add cl,al;cl=cl+al=2+10=12
                  
ENDM  get_user_num 
;-------------------------------------------------
display_new_line Macro
      
                  mov ah,9
                 mov dx,offset nw_line
                 int 21h                 
    
ENDM display_new_line
                                             
;-------------------------------------------------
display_Message MACRO MyMessage

            mov ah,9h

            mov dx,offset MyMessage

            int 21h

ENDM display_Message
;-------------------------------------------------
UserN_validatin MACRO  Useri_Name
    local check_UN
    local invalid_UN
    local press_enter
    local end_check
                      ;S:invalid: mov ax,offset User_Name+2;as the first two elements are the size and the actuall size 
              check_UN:;S:invalid: mov al,offset User_Name+2;al not ax as i need only the first character 
                        mov invalid_u,0
                         mov al,Useri_Name+2;al not ax as i need only the first character
                       cmp al,41h;h not d
                                 ;if(char<A)
                       jc invalid_UN 
                       ;------------
                       cmp al,7Bh;not 7A as if al=7A the carry will be zero as well and cosider as invalid
                                 ;if(char>z):not >=
                       jnc invalid_UN 
                       ;------------
                       cmp al,5Bh
                                 ;if(char>Z):not >=
                                 ;if no carry check another thing
                                 ;if CF=1=>the char is<Z or =Z :end the check
                       jc end_check 
                       ;------------
                       cmp al,61h;h not d
                       jnc end_check;if(char>=a)->valid
                                    ;else do the invalid_UN code
                       ;------------
            invalid_UN: mov invalid_u,1
                         display_new_line
                        display_Message MSG4
                       ;display_new_line  
                      ;display_Message MSG5 
             press_enter: display_new_line
                       display_Message MSG6
                          ;display_new_line
                       ;------------ 
                       mov ah,07
                        int 21h;Read one char and put in al without echo 
                        
                        cmp al,0Dh;enter key=>esmo cret in ascii code table 
                        jnz press_enter;if the user press a key that is not "enter key" print the MSG^ for him until he press enter
                       
                       ;------------
                      ; ;  mov ax,0600h
                      ; ;  mov bh,07 
                      ; ;  mov cx,0 
                      ; ;  mov dx,184FH
                      ; ;  int 10h
                       ;------------ 
                      ; ; ;  set_cursor_at_middle 
                      ; ; ;  ;------------
                      ; ; ;   display_Message MSG1  
                      ; ; ;   display_new_line
                                  
                      ; ; ;   MOV AH,0AH
                      ; ; ;   MOV DX , OFFSET Useri_Name
                      ; ; ;   INT 21H 
                        
                      ; ; ;   jmp check_UN       
                               
            end_check:
    
ENDM UserN_validatin   
;-------------------------------------------------  
set_cursor_at_middle MACRO      
                    ;S:invalid: mov ax,2;this will make al=2 NOT ah=2 
                    ;S:invalid: mov cx,5 as cx not the Row here , it is in set mouse position(m.s)
                    mov ah,2
                     mov dh,2h
                     mov dl,2h
                     mov bh,0;NOTE:do not forget this line
                     int 10h
    
ENDM set_cursor_at_middle         
;-------------------------------------------------
username_interface MACRO  Useri_Name
                  
                  set_cursor_at_middle 
                   ;------------
                  display_Message MSG1  
                  display_new_line
                                  
                  MOV AH,0AH
                  MOV DX , OFFSET Useri_Name
                  INT 21H  
                  
                  UserN_validatin Useri_Name                                 
                 ;------------
                 display_new_line               
                 display_Message MSG2 
                 ;------------     
                 display_new_line                  
                 get_user_num 
                 
                 mov user1_initial_point,cl
                ;; mov ch,0;NOTE:cl= the num , ch should be 0 (to make the number=00cl)for the cmp between the teo initialed points
                ;; push cx;save the result of the initial points in the stack
                  ;------------
                  display_new_line 
                  display_Message MSG3  
    
ENDM  username_interface
;------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





.model huge                            ;, stdcall                                                           ;doaa modified
.stack 1024
.data






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MSGchatSent DB 'You Sent a chatting request! Waiting for opposite player','$'
MSGgameSent DB 'You Sent a game request! Waiting for opposite player    ','$'
MSGchatRecieved DB 'You Recieved a chatting request! to accept press F1 ','$'
MSGgameRecieved DB 'You Recieved a Game request! to accept press F2     ','$'



sent_chat db 4              ;indicates sending chat request
recieved_chat db 3          ;indicates Recieving chat request
sent_game db 4              ;indicates sending Game request
recieved_game db 3          ;indicates Recieving Game request

SVALUE db ?
RVALUE db ?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;user input variables
nw_line DB 10,13,"$";?samaa:is $ should(or can)be deleted?
MSG1 DB 10,13,"Please Enter Your Name:$" 
MSG2 DB 10,13,"Initial Points:$"
MSG3 DB 10,13,"Press Enter Key to Continue$"  
MSG4 DB 10,13,"Invalid UserName$"
;MSG5 DB 10,13,"UserName should not start with a special character or a digit$" 
MSG6 DB 10,13,"Please Press Enter Key to try again$"
User1_Name DB 16,?,16 DUP('$');?.samaa:should it be 15 only?what about "the string should be ended with a $?"and the max size of the user name is 15 
User2_Name DB 16,?,16 DUP('$');?samaa:should it be 15 only?what about "the string should be ended with a $?"and the max size of the user name is 15 
user1_initial_point db '$$$' ;no need?
user2_initial_point db '$$$';41;no need?
;-------------------
invalid_u db 0
first_char db 0
u1_p_int db ?
u2_p_int db ?
lower_initial_point db ?
print_points db '$$$'
;--------
;VALUE db ?
;8o column
;(25 row-2(user names)-1(notification)=22)/2=11
;0-1:user1 name
rec_cursor_x db  0d ;db or dw?
rec_cursor_y db 13d ;m.s of 13
;--
send_cursor_x db  0d ;db or dw?
send_cursor_y db 1d ;m.s of 1
;--
msg_ending1 db 'To end chatting with $'
msg_ending2 db ' press F3$'
;-------
ret_mai_var db 0;
messageNo1 DB "To start chatting press F1",'$'
messageNo2 DB "To start the game press/hold F2",'$'
messageNo3 DB "To end the program press ESC",'$'


PNUM db '1' ; player number to enter his initial points

MSGlvlEnter db 'Enter game lvl[1 or 2]:','$'
MSGP1lvlEnter db 'P1 enter your Forbidden character:','$'
MSGP2lvlEnter db 'P2 enter your Forbidden character:','$'
MSGEnterF4ToStart db 'Press F4 to start!','$'
msgInitialPoint db 'Player ','$'
msgInitialPoint2 db  ', please enter initial points for following registers ','$'
TXT_AX db 'AX:','$'
TXT_BX db 'BX:','$'
TXT_CX db 'CX:','$'
TXT_DX db 'DX:','$'
TXT_SI db 'SI:','$'
TXT_DI db 'DI:','$'
TXT_SP db 'SP:','$'
TXT_BP db 'BP:','$'




Gamelevel db ?
P1F db ?
P2F db ?


P1AX Dw 0000h
P1BX dw 0000h
P1CX dw 0000h
P1DX dw 0000h
P1SI dw 0000h
P1DI dw 0000h
P1BP dw 0000h
P1SP dw 0000h

P2AX dw 0000h
P2BX dw 0000h
P2CX dw 0000h
P2DX dw 0000h
P2SI dw 0000h
P2DI dw 0000h
P2BP dw 0000h
P2SP dw 0000h



;;;;;;;;;;;;;;;;;;;;;;;;;; doaa & samaa data ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;Regs db 'AX','ax','Ax','aX','','','','','','','',''
_commands   db 'adc', 'add', 'and', 'clc', 'dec', 'inc','mov', 'nop' , 'or ', 'rol', 'ror', 'sbb', 'shl', 'shr', 'sub', 'xor'
_p1_regs    dw 8 dup(?)            ;'AX', 'BX', 'CX', 'DX', 'DI', 'SI', 'SP', 'BP'
_p2_regs    dw 8 dup(?)            ;'AX', 'BX', 'CX', 'DX', 'DI', 'SI', 'SP', 'BP'
_p1_points  db ?
_p2_points  db ?
winner     db ?
value db ?


MyBuffer_A LABEL BYTE
BufferSize_A db 6
ActualSize_A db ?
first label word
operand_A db 6 dup('$')


MyBuffer_B LABEL BYTE
BufferSize_B db 7
ActualSize_B db ?
second label word
operand_B db 7 dup('$')

;org 70h

;operand_A db 6,?,6 dup('$')

size_a db 3 dup('$')

;dummy db 1 dup('$')

;operand_B db 7, ?,7 dup('$')
;org 80h

size_b db 3 dup('$')

;org 100h

comma db ','
space db 2, ? , 2 dup('$')    ;does the size include the $ ?????????????????????????????  yes
exepression db 15,?,15 dup('$')  ;[0-->f] 
first_char_reg_option_1 db 'A','C','a','c'  ;4 elements
first_char_reg_option_2 db 'S','s'  ;2 elements
first_char_reg_option_3 db 'B','b'  ;2 elements
first_char_reg_option_4 db 'D','d'  ;2 elements

second_char_reg_option_1 db 'H','L','X','h','l','x' ;6 elements
second_char_reg_option_2 db 'I','P','i','p'  ;4 elements
second_char_reg_option_3 db 'H','L','X','P','h','l','x','p' ; 8 elements
second_char_reg_option_4 db 'H','I','L','X','h','i','l','x' ; 8 elements


selected_command db 3 dup(?)
valid_values_memo db '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','A','B','C','D','E','F'   ;22 VALUES


;;;;;;;;;;;;;samaa;;;;;;;;;;;;;;;;;;;;;

  ;;INDATA DB 10,?,DUP($)
memory_locations_names db "0123456789ABCDEF$" 
;-----------
reg_AtoD_N db "AXBXCXDX$"
reg_StoB_N db "SIDISPBP$" 
;-----------
reg_AX_N db "AX$"
reg_BX_N db "BX$"
reg_CX_N db "CX$"
reg_DX_N db "DX$" 
reg_SI_N db "SI$"
reg_DI_N db "DI$"
reg_SP_N db "SP$"
reg_BP_N db "BP$"  
;-----------

reg_AX_V_P1 db "0000$"
reg_BX_V_P1 db "0000$"
reg_CX_V_P1 db "0000$"
reg_DX_V_P1 db "0000$" 
reg_SI_V_P1 db "0000$"
reg_DI_V_P1 db "0000$"
reg_SP_V_P1 db "0000$"
reg_BP_V_P1 db "0000$" 
;--
reg_AX_V_P2 db "0000$"
reg_BX_V_P2 db "0000$"
reg_CX_V_P2 db "0000$"
reg_DX_V_P2 db "0000$" 
reg_SI_V_P2 db "0000$"
reg_DI_V_P2 db "0000$"
reg_SP_V_P2 db "0000$"
reg_BP_V_P2 db "0000$"  
;-------------
memory0_P1 db "00$"
memory1_P1 db "00$"
memory2_P1 db "00$"
memory3_P1 db "00$"
memory4_P1 db "00$"
memory5_P1 db "00$"
memory6_P1 db "00$"
memory7_P1 db "00$"
memory8_P1 db "00$"
memory9_P1 db "00$"
memoryA_P1 db "00$"
memoryB_P1 db "00$"
memoryC_P1 db "00$"
memoryD_P1 db "00$"
memoryE_P1 db "00$"
memoryF_P1 db "00$"
;----
memory0_P2 db "00$"
memory1_P2 db "00$"
memory2_P2 db "00$"
memory3_P2 db "00$"
memory4_P2 db "00$"
memory5_P2 db "00$"
memory6_P2 db "00$"
memory7_P2 db "00$"
memory8_P2 db "00$"
memory9_P2 db "00$"
memoryA_P2 db "00$"
memoryB_P2 db "00$"
memoryC_P2 db "00$"
memoryD_P2 db "00$"
memoryE_P2 db "00$"
memoryF_P2 db "00$"
;-------------
circle1_P1 db "0$"
circle2_P1 db "0$"
circle3_P1 db "0$"
circle4_P1 db "0$"
circle5_P1 db "0$"
;----
;----------
circle1_P2 db "0$"
circle2_P2 db "0$"
circle3_P2 db "0$"
circle4_P2 db "0$"
circle5_P2 db "0$"
;-------------

; User1_Name DB "Samaa Hazem moh$"
; User2_Name DB "salma Ragab$"
; lower_initial_point db "20$" 
;--------
current_gun_x_P1 dw 0
current_gun_y_P1  dw 0 
left_limit_gun_P1 dw 25d
right_limit_gun_P1 dw 150d
upper_limit_gun_P1 dw 141d
lower_limit_gun_P1 dw 170d
x_circle_right_limit_P1 dw 147;300d;can be more , but noy more than 153(160-6-1)
;---
current_gun_x_P2 dw 0
current_gun_y_P2  dw 0 
left_limit_gun_P2 dw 164d
right_limit_gun_P2 dw 288d
upper_limit_gun_P2 dw 141d
lower_limit_gun_P2 dw 170d
x_circle_right_limit_P2 dw 307d ;can be more , but noy more than 312(319-6-1)
;--------
current_player db ?;1->P1 , 2->P2
gun_x dw 0
gun_y dw 0
temp_gun_x dw 0
temp_gun_y dw 0
left_limit_gun dw ?
right_limit_gun dw ?
upper_limit_gun dw ?
lower_limit_gun dw ?
bool_Shouted db 0 
bool_hitted db 0
shout_x dw ?
shout_y dw ?
current_circle_center_x dw ? 
current_circle_center_y dw ?
x_circle_right_limit dw ?
current_cicle_color db ? ;(m.s)db not dw
;---------------------------------------------


;;;;;;;;;;;;;;;;;;;;;;;;;; Rufaydah data ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CF db ?
CF_P1 db 0
CF_P2 db 0



_winner db ?
_value db '$$$$$'
_store db '$$'
_bits db ?
_player_proc db ?

;_bits db ?
_valid_ db ?


valid_addOpt_1_first db 'D', 'd', 'S', 's'
valid_addOpt_2_first db 'B', 'b'
valid_addOpt_1_second db 'I', 'i'
valid_addOpt_2_second db 'x', 'X'


index_selected_command db ?

MSGINLINECHAT db 'Do you want to chat?[Y]','$'

.code


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


send_p proc far
 ;read the buffer
mov ah,1
int 16h
jz End_send


cmp ah,3bh;f1 key sending
jz sndF1
cmp ah,3ch;f2 key sending
jz sndF2


jmp contSend


sndF1:
mov al,0f1h
jmp contSend
sndF2:
mov al,0f2h
contSend:
 mov SVALUE,al
 ;---
;  push ax
;  ; print user input char(char to be sended)
;  mov ah,2 
;  mov dl,al
;  int 21h 
; pop ax
 ;---
;Check that Transmitter Holding Register is Empty
mov dx , 3FDH ; Line Status Register
 In al , dx ;Read Line Status
 AND al , 00100000b
 JZ End_send
;If empty put the VALUE in Transmit data register
 mov dx , 3F8H ; Transmit data register
 mov al,SVALUE
 out dx , al
 End_send:
 ret
 send_p endp

;--------------------------------
receive_p proc far
;Check that Data Ready
mov dx , 3FDH ; Line Status Register
 in al , dx   
 AND al , 1
 JZ end_receiving2

;If Ready read the VALUE in Receive data register
 mov dx , 03F8H
 in al , dx 
 mov RVALUE , al
 ;--
 ;set cursor
;  mov ah,2
; mov dx,0A0Ah
; int 10h
;  ;--
;  ;print the vlaue you received
;  mov ah,2 
;  mov dl,VALUE
;  int 21h 
 ;--
end_receiving2:
ret
receive_p endp





Users_screen             PROC  
                
                  ;username interface:player 1
                   username_interface User1_Name
                  ;------------
                    
        press_enter2: mov ah,07
                     int 21h;Read one char and put in al without echo 
                        
                     cmp al,0Dh;enter key=>esmo cret in ascii code table 
                     jz end_user_screen
                     display_new_line
                     display_Message MSG3  
                     jmp press_enter2
                   ;------------
; ;         user2_inter:   mov ax,0600h
; ;                        mov bh,07 
; ;                        mov cx,0 
; ;                        mov dx,184FH
; ;                        int 10h
; ;                        ;------------ 
; ;                        set_cursor_at_middle 
; ;                   ;username interface:player 2   
; ;                          username_interface User2_Name 
; ;                    ;------------
                   
; ;                    pop ax;now ax=user2 initial point=>NOT of user1<=
; ;                    pop bx;now ax=user1 initial point    
                   
; ;                    cmp ax,bx
; ;                    jnc choose_user1_IP;no carry=bx is lower and ax is greater
   
; ;                    mov dx,ax
; ;                    jmp push_result 
; ;    choose_user1_IP: mov dx,bx   
  
; ;    push_result:   ; mov ax,offset lower_initial_point 
; ;                   ; mov [ax],dx 
; ;                    ;mov [ax],dl  
; ;                    mov lower_initial_point,dl;as we assume the max initial point is 99 in deciaml  
; ;                     ;------------ 
; ;                     
; ;                      ;--
; ;                       mov ch,0
; ;                      mov cl,User2_Name+1
; ;                      mov di,offset User2_Name+2
                     
; ;                      inc_di2:
; ;                      inc di  
; ;                      loop inc_di2 
; ;                      mov [di],'$' 
                     
                   
                    ;---------------
                    
    ; push_result:
    ; push dx;save the result of the chosen initial points in the stack
                          ;NOTE:there will NOT be poped for it here 
 end_user_screen:     
                     mov ch,0
                     mov cl,User1_Name+1
                     mov di,offset User1_Name+2                     
                     inc_di:
                     inc di  
                     loop inc_di 
                     mov al,36d
                     mov [di],al               
ret
Users_screen                ENDP 
;--------------------------------

;--------------------------------
;--------------------------------
 SEND_PP proc
 ;read the buffer
; ;  mov ah,0
; ;  int 16h
; ;  mov VALUE,al 
; ;  ;---
 ;set cursor position to the 0000 position
 mov ah,2
 mov dl,send_cursor_x
 mov dh, send_cursor_y
 mov bh,0
 int 10h
 ;---
 ; print user input char(char to be sended)
 mov ah,2 
 mov dl,VALUE
 int 21h 
 ;---
 ;give to send cursor position x and y the new values
 ;1)first: get cursor position
 mov ah,3h
mov bh,0h
int 10h 
;----
;--------
set_send_cursor:
;a)3) same as b:
;b)put the value in your variables
mov send_cursor_x,dl
mov send_cursor_y ,dh
;----
;Check that Transmitter Holding Register is Empty
mov dx , 3FDH ; Line Status Register
AGAIN: In al , dx ;Read Line Status
 AND al , 00100000b
 ;;;;C:JZ AGAIN
;If empty put the VALUE in Transmit data register
 mov dx , 3F8H ; Transmit data register
 mov al,VALUE
 out dx , al
 ret
 SEND_PP endp

;------------------------------------------------
RECEIVE_pp proc
;If Ready read the VALUE in Receive data register
 mov dx , 03F8H
 in al , dx 
 mov VALUE , al
 ;-------------------
 complete_rec:
 ;set cursor position to the 0000 position
 mov ah,2
 mov dl,rec_cursor_x
 mov dh, rec_cursor_y
 mov bh,0
 int 10h
 ;--
 ;print the vlaue you received
 mov ah,2 
 mov dl,VALUE
 int 21h 
 ;--
 ;give to send cursor position x and y the new values
 ;1)first: get cursor position
 mov ah,3h
mov bh,0h
int 10h 
;-------------
set_rec_cursor:
;a)3) same as b:
;b)put the value in your variables
mov rec_cursor_x,dl
mov rec_cursor_y ,dh
;----
end_receiving:
ret
RECEIVE_pp endp
;--------------------------------
delay_unit proc
;delay:
Push cx
mov cx,0FFFFh
delay_loop130:
dec cx
jnz delay_loop130
pop cx
ret 
delay_unit endp

;--------------------------------
 

 send_p_chat proc
 ;read the buffer
 mov ah,0
 int 16h
 mov VALUE,al 
 ;---
 ;set cursor position to the 0000 position
 mov ah,2
 mov dl,send_cursor_x
 mov dh, send_cursor_y
 mov bh,0
 int 10h
 ;---
 ; print user input char(char to be sended)
 mov ah,2 
 mov dl,VALUE
 int 21h 
 ;---
 ;give to send cursor position x and y the new values
 ;1)first: get cursor position
 mov ah,3h
mov bh,0h
int 10h 
;----
;2)second:check limits
cmp dh,11d
jnz set_send_cursor447
cmp dl,79d;or 80?
jnz set_send_cursor447
;--------
;do a or b:
;a)1)scroll up a part of the screen
mov ax,0600h
mov bh,07 
mov cl,00
mov ch,1
mov dh,11d
mov dl,79d
int 10h 
;--
;a)2)reset send cursor
mov dl,0
mov dh,1
;---
set_send_cursor447:
;a)3) same as b:
;b)put the value in your variables
mov send_cursor_x,dl
mov send_cursor_y ,dh
;----
;Check that Transmitter Holding Register is Empty
mov dx , 3FDH ; Line Status Register
 In al , dx ;Read Line Status
 AND al , 00100000b
 ;;;;C:JZ AGAIN
;If empty put the VALUE in Transmit data register
 mov dx , 3F8H ; Transmit data register
 mov al,VALUE
 out dx , al
 ret
 send_p_chat endp

;--------------------------------
receive_p_chat proc
;Check that Data Ready
mov dx , 3FDH ; Line Status Register
 in al , dx 
 AND al , 1
 ;;;;;C:JZ CHK
 jz end_receiving_chat
;If Ready read the VALUE in Receive data register
 mov dx , 03F8H
 in al , dx 
 mov VALUE , al
 ;--------------------
 ;check if this value is f3 or not
  cmp VALUE,28;m.s;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 jnz complete_rec99
 mov ret_mai_var,1
 jz end_receiving_chat
; ;  ;call mamdouh main screnn proc
; ; ;m2ktan , i will clear the screen
; ; ;clear the screen
; ; mov ax,0600h
; ; mov bh,07 
; ; mov cx,0 
; ; mov dx,184FH
; ; int 10h 
 ;-------------------
 complete_rec99:
 ;set cursor position to the 0000 position
 mov ah,2
 mov dl,rec_cursor_x
 mov dh, rec_cursor_y
 mov bh,0
 int 10h
 ;--
 ;print the vlaue you received
 mov ah,2 
 mov dl,VALUE
 int 21h 
 ;--
 ;give to send cursor position x and y the new values
 ;1)first: get cursor position
 mov ah,3h
mov bh,0h
int 10h 
;2)second:check limits
cmp dh,23d;or 24?
jnz set_rec_cursor_ch
cmp dl,79d;or 80?
jnz set_rec_cursor_ch
;--------
;do a or b:
;a)1)scroll up a part of the screen
mov ax,0600h
mov bh,07 
mov cl,00
mov ch,13;or 11?
mov dh,23d
mov dl,79d
int 10h 
;--
;a)2)reset rec cursor
mov dl,0
mov dh,13d
;---
set_rec_cursor_ch:
;a)3) same as b:
;b)put the value in your variables
mov rec_cursor_x,dl
mov rec_cursor_y ,dh
;----
end_receiving_chat:
ret
receive_p_chat endp
;-----------
initialize_s_ports  proc
;Set Divisor Latch Access Bit
 mov dx,3fbh ; Line Control Register
 mov al,10000000b ;Set Divisor Latch Access Bit
 out dx,al ;Out it
 ;Set LSB byte of the Baud Rate Divisor Latch register.
 mov dx,3f8h
 mov al,0ch
 out dx,al
 ;Set MSB byte of the Baud Rate Divisor Latch register.
 mov dx,3f9h
 mov al,00h
 out dx,al
; Set port configuration
 mov dx,3fbh
 mov al,00011011b
 ;0:Access to Receiver buffer, Transmitter buffer
 ;0:Set Break disabled
 ;011:Even Parity
 ;0:One Stop Bit
; 11:8bits
 out dx,al

ret
initialize_s_ports endp

;--------------------------------
 send_p_us proc
; ;  ;read the buffer
; ;  mov ah,0
; ;  int 16h
 mov VALUE,al 
 ;----
 mov [si],al
 inc si
 ;---
 ;set cursor position to the 0000 position
 mov ah,2
 mov dl,send_cursor_x
 mov dh, send_cursor_y
 mov bh,0
 int 10h
 ;---
 ; print user input char(char to be sended)
 mov ah,2 
 mov dl,VALUE
 int 21h 
 ;---
 ;give to send cursor position x and y the new values
 ;1)first: get cursor position
 mov ah,3h
mov bh,0h
int 10h 
;----
;a)3) same as b:
;b)put the value in your variables
mov send_cursor_x,dl
mov send_cursor_y ,dh
;----
;Check that Transmitter Holding Register is Empty
mov dx , 3FDH ; Line Status Register
;;AGAIN:
 In al , dx ;Read Line Status
 AND al , 00100000b
 ;;;;C:JZ AGAIN
;If empty put the VALUE in Transmit data register
 mov dx , 3F8H ; Transmit data register
 mov al,VALUE
 out dx , al
 ret
 send_p_us endp
;--------------------------------
receive_p_us proc
;Check that Data Ready
mov dx , 3FDH ; Line Status Register
;;CHK:
 in al , dx 
 AND al , 1
 ;;;;;C:JZ CHK
 jz end_receiving_us
;If Ready read the VALUE in Receive data register
 mov dx , 03F8H
 in al , dx 
 mov VALUE , al
 ;----
 mov [di],al
 inc di
 ;-------------------
 ;set cursor position to the 0000 position
 mov ah,2
 mov dl,rec_cursor_x
 mov dh, rec_cursor_y
 mov bh,0
 int 10h
 ;--
 ;print the vlaue you received
 mov ah,2 
 mov dl,VALUE
;;;int 21h 

 ;--
 ;give to send cursor position x and y the new values
 ;1)first: get cursor position
 mov ah,3h
mov bh,0h
int 10h 
;---
;a)3) same as b:
;b)put the value in your variables
mov rec_cursor_x,dl
mov rec_cursor_y ,dh
;----
end_receiving_us:
ret
receive_p_us endp
;----------------------


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;samaa;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;put the value to be mirrored in ax
;if you want to use mirroring in updating regs make cl=2
;if you want to use mirroring in updating memory make cl=2
miror_proc  proc 
mov ax,[si]    
;Rol ax,8
mov [di],ax  
cmp cl,2
jnz end_mirror
add di,2
add si,2 
mov ax,[si]
mov [di],ax 
end_mirror: 
ret
miror_proc endp
;-----------------------------------
;before use it :
;1)set the cursor initial position in dx 
;NOTE: dl=X(column) , dh=Y(row)
;2)set the colors(in bl) of:1-the background of the char, 2-the char itself
;Note that :the lower 4bits of bl is the color of the char itself
;and the upper is the background color  

;-----------------------------------
;before use it :
;1)set the cursor initial position in dx 
;NOTE: dl=X(column) , dh=Y(row)
;2)set the colors (in bl)of:1-the background of the char, 2-the char itself
;Note that :the lower 4bits of bl is the color of the char itself
;and the upper is the background color 
;3)put the offeset of the message you want to print in di 
Print_MSG proc 
    ;local loop_print_msg
    ;local end_print_msg

    
    loop_print_msg:
    ;-----  
    mov ah,2
    ;mov dx,0A0Ah
    int 10h 
    ;------

    mov ah,9 ;Display
    mov bh,0 ;Page 0
    mov al,[di] 
    cmp al,24h;$ in ascii code =24h
    jz end_print_msg
    mov cx,1h ;5 times
    int 10h  
    ;-- 
    inc dl
    inc di
    ;-- 
    jmp loop_print_msg
    ;cmp al,24h;$ in ascii code =24h
    ;jnz loop_print_msg
    end_print_msg:  
    ret
Print_MSG Endp

;-----------------------------------
calc_cx2  proc
       ;;push ax
;;push cx
push bx
mov bx,dx

;;;;;;;;;;;;
sub cx,di;
;;;;;;;;;;;;
mov ax,cx;now ax=(cx-5)
;;;;;;;;;;;;
imul cx;dx:ax=(cx-5)*(cx-5)  
      ;(m.s)i think we will not need dx 
;;;;;;;;;;;;;;
mov cx,ax;now cx=(cx-5)*(cx-5)

;pop dx  
;;;;;;;;;;;;
sub bx,si;
;;;;;;;;;;;;
mov ax,bx;now ax=(dx-5) 
;;;;;;;;;;;;;;;;;;
imul bx;dx:ax=(dx-5)*(dx-5)  
      ;(m.s)i think we will not need dx 
;;;;;;;;;;;;;;;
mov bx,ax;now bx=(dx-5)*(dx-5) 
;;pop ax
add cx,bx;now cx=(cx-5)*(cx-5)+(dx-5)*(dx-5)  
pop bx
    ret
calc_cx2 ENDP  
;------------------------------
draw_circle_proc proc  
;mirror circle of radius=5 pixels, and its center is (di,si) 
;push all reg before call it
;and change the cx,dx with the cordinates
;and change al with the Pixel color
;main idea is to pass over a square of pixels of size r*r
;and for each dx,cx who make the equ:x^2+y^2=r^2, draw it on the screen


loop_circle_height: mov cx,bx
  

loop_circle_width:
;;pop cx
;;pop dx 
;;inc cx  
;--------------------- 
push dx;as dx will be changed in the line:mul cx 
push cx
push ax
call calc_cx2
pop ax
;---------------------
;;cmp cx,25;25=5*5  
;;;;;;;;;;;;;;;;;; 
;;jz print_pixel
;;jnz inc_cx
;else, do the following:
cmp cx,38;38=26 +1 +1:not 25
;r=5:cmp cx,27 
;;;;;;;;;;;;;;;;;; 
;;;cmp cx,26;25=5*5 +1      
;;jnz loop_circle_width 
;;jnz inc_cx 
;if cx=25 or =26->print
jc print_pixel 
;;jz print_pixel
;;;jc  print_pixel
;if they are not equal ,do the following:
inc_cx:
pop cx
pop dx 
inc cx 
jmp loop_circle_width
;jz print_pixel 
print_pixel:
pop cx
pop dx 
mov ah,0ch
int 10h

inc cx 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;jmp cmp_dx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--------------------- 
push dx;as dx will be changed in the line:mul cx 
push cx
push ax
call calc_cx2
pop ax
;---------------------
cmp cx,38;38=26 +1 +1:not 25
;r=5:cmp cx,27  
jc print_pixel;carry=1 if cx (only)"<"r^2+1
;;jnc ;if cx = 
;if cx=26,do the following:
pop cx
pop dx 
push dx
sub dx,si
add dx,6;5 is the radius
;r=5:add dx,5;5 is the radius
sub dx,12;10 is  2*radius  
;r=5:sub dx,10;10 is  2*radius
cmp_dx:
;;cmp dx,55;55=(initial value of dx + 2*radius) 
                ;initial value of dx=(y of the center)- radius==si-radius 
;cmp dx,55 == is dx-55=0 =>dx-(si-radius+ 2*radius) 
;which equal to:is dx-si+radius-+ 2*radius=0
cmp dx,0
;;jnz loop_circle_height;if dx !=25 , complete drawing 
jz end_C_drwa 
inc_dx:
;;pop cx
;;pop dx
pop dx 
inc dx 
jmp loop_circle_height  

end_C_drwa: pop dx
    
    ret
draw_circle_proc ENDP  
;---------------------------------------
;Before call this proc,push the old values of ax,bx,cx,dx 
;and change the cx,dx with the cordinates
;and change al with the Pixel color
;and bx with the width of the line 
draw_width_line proc ;?far or near?for each :why?
    mov ah,0ch ;Draw Pixel Command
    back1: int 10h 
     inc cx
     cmp cx,bx;bx is the width of the line
     ;;jnz back1 
     jc back1
     ret
draw_width_line ENDP 
;-------------------------------   
;Before call this proc,push the old values of ax,bx,cx,dx 
;and change the cx,dx with the cordinates
;and change al with the Pixel color
;and bx with the height of the line 
draw_height_line proc ;?far or near?for each :why?
    mov ah,0ch ;Draw Pixel Command
    back2: int 10h 
     inc dx
     cmp dx,bx;bx is the height of the line
     ;;jnz back2
     jc back2
    ret
draw_height_line ENDP 
;-------------------------------
;Before call this proc,push the old values of ax,bx,cx,dx 
;and change the cx,dx with the cordinates 
;(cx,dx)will be the top left corner  
;and change bx with( the height of the rectungle + dx)

draw_rectangle proc
          push cx
   back3: pop cx
          push cx 
          ;mov bx,10 
          push bx
          mov bx,es;now bx is the width
         call draw_width_line 
         pop bx;now bx is the hight
          inc dx
          cmp dx,bx;bx is the height of the line
          ;;jnz back3
          jc back3
          pop cx
        ret
draw_rectangle ENDP
;-------------------------------
;every reg has: hight=10(8 +1top, +1buttom), width=?35 or 36(=36 +2:left +2:right) 
draw_4_reg proc
    mov ah,4 
    ;mov cx,160 ;Column
    mov dx,65 ;Row==y coordinate+32 
    mov al,7 ;Pixel color
            ;;NOTE:if you change the registers color chang the background of the 0000 before use Print_MSG macro 
    ;mov bx,40 ;width  
    mov bx,34 ;?or make it=36?width
    add bx,cx;now bx is the width+cx
    mov es,bx;(m.s if it is valid?!!)es is the width 
    ;mov bx,10;10 is the rectangle height 
    ;mov bx,8  
    add bx,dx; now bx is the height+dx:50=30+20
    looperand_A:
    ;mov cx,160 ;Column
    push ax  
    add dx,6;6=the vertical distance between regesters 
    ;mov bx,10;20 is the rectangle height 
    mov bx,10 
    add bx,dx 
    push dx;push the row of the rectangle before call draw_rectangle
    call draw_rectangle  
    pop bx;pop the row of the rectangle before call draw_rectangle
    push dx;push the end row of the rectangle before the following line
    mov dx,bx
    mov dh,dl;assume dh will not t3dy the max value that dl(as dx above is the row) will have(which is FFh=255)
    mov dl,cl;assume dl will not t3dy the max value that cl(as cx above is the column) will have(which is FFh=255)
    ;i think no need to push bx before the folloeing line:
    ;mov bl,70h;print 0 with color black over gray background
            ;NOTE:if you change the registers color chang the background of the 0000 before use Print_MSG macro 
    ;pop dx
    push cx 
    inc dh
    ;add dl,2 
    ;convert dx from bits measurments(320*200)to characters measurments(40*25)
    mov ch,dh;save dh
    mov dh,0  
    mov ax,dx
    add ax,2
    mov bl,8
    div bl
    mov dl,al;now dl=dl/8
    mov cl,dl
    mov dl,ch
    ;mov dh,0 
    mov ax,dx 
    ;mov bl,8
    div bl
    mov dh,al  
    mov dl,cl
    ;Print_MSG reg_initial_value 
    ;-------------  
    mov ah,2
    ;mov dx,0504h
    int 10h
    ;mov dx,0A0Ah
    mov ah,9 ;Display
    mov bh,0 ;Page 0
    mov al,30h ;Letter D 
    mov bl,70h
    mov cx,4h ;5 times
    int 10h
    ;------------ 
    pop cx 
    pop dx
    pop ax
    dec ah
    cmp ah,0
    jnz looperand_A
        ret
draw_4_reg ENDP
;-------------------------------
;before call this proc
;1)push and pop all regs
;2)mov the value of the reg(i) in its memory reg_i_V
;3)mov the the offset of the reg_v you want to update in di
;and put the offset of the operand value in si 
;4)set the cursor initial position in dx 
;NOTE: dl=X(column) , dh=Y(row)
;5)set the colors (in bl)of:1-the background of the char, 2-the char itself
;Note that :the lower 4bits of bl is the color of the char itself
;and the upper is the background color 
;ex: 
; mov di,offset reg_AX_V_P1 
; mov si,offset op_1    
; mov dl,06
; mov dh,09
; call update_reg_v
update_reg_v proc  
    push di
    mov cl,2
    call miror_proc  
     pop di 
     mov bl,70h
call Print_MSG
ret
update_reg_v endp
;------------
;ex: 
; mov di,offset memory0_p2 
; mov si,offset op_1    
; mov dl,01
; mov dh,05
; call update_memory_v
update_memory_v proc
push di
    mov cl,1
    call miror_proc  
     pop di 
     mov bl,70h
call Print_MSG
ret 
update_memory_v endp
;-------------------------------
draw_command_rec proc
mov dx,160 ;175-15(no +1 here as above)
mov al,3 ;Pixel color
mov bx,159 ;width=320- 161 =159 
add bx,cx;now bx is the width+cx
mov es,bx;(m.s if it is valid?!!)es is the width 
mov bx,15;15 is the rectangle height   
add bx,dx; now bx is the height+dx:50=30+20
call draw_rectangle
     ret
draw_command_rec ENDP
;-------------------------------
draw_memory_recs_16 proc
mov ah,15
;mov cx,0 ;Column
mov dx,0 ;Row 
mov al,7 ;Pixel color
mov bx,24;(24=memory line limit width   
add bx,cx

loop3:
push ax
add dx,8 
push cx
call draw_width_line
pop cx
pop dx
pop ax
dec ah
cmp ah,0
jnz loop3
    
     ret
draw_memory_recs_16 ENDP 
;-------------------------------
;before calling it , but your coordinates in dx
;NOTE:dl=X, dh=Y 
;assume dh will be 00 
;and dl hya ely btt8yar
initilaize_M_L proc
    
;mov dx,0001h
 
again___1:
mov ah,2
int 10h 

mov ah,9 ;Display
mov bh,0 ;Page 0
mov al,30h ;Letter 0
mov cx,2h ;5 times
mov bl,70h ;Green (0) on white(7) background
int 10h
inc dh 
cmp dh,21
jnz again___1
 ret
initilaize_M_L ENDP  
;--------------
;-------------------------------
;Assume dx is my height and cx is my width
;Gun_width=7
Draw_gun proc   
    Push cx
    Push dx 
    mov bx,7 
    mov al,5 
    add bx,cx
    Call draw_width_line  
    dec cx
    mov bx,5 
    add bx,dx
    mov al,5
    Call draw_height_line
    Pop DX
    Pop cx
    Push cx
    Push dx  
    mov bx,5 
    mov al,5  
    add bx,dx
    Call draw_height_line  
    dec dx
    mov bx,7
    mov al,5 
    add bx,cx
    Call draw_width_line
    Pop DX
    Pop cx
    ;------------------------------  
    add cx,2;may be 1 or more than 2
    dec dx
    ;draw gun shot location
    ;its height is 2
    ;;pusha
    mov al,3 ;Pixel color
    mov bx,3 ;width=320 
    add bx,cx;now bx is the width+cx
    mov es,bx;(m.s if it is valid?!!)es is the width 
    mov bx,2;15 is the rectangle height   
    add bx,dx; now bx is the height+dx:50=30+20
    call draw_rectangle
    ;;popa 
    ;-------------------------------
    ;------
    ;------
    ret 
Draw_gun endP  
;--------------------------------------




;------------------
;before calling this proc
;set cx with the column
;set dx with the row
;ex:
; mov cx,80;Column
; mov dx,150 ;184-8(no +1 here as above)
; call draw_button
draw_button proc
mov al,1 ;Pixel color
mov bx,6;width=320 
add bx,cx;now bx is the width+cx
mov es,bx;(m.s if it is valid?!!)es is the width 
mov bx,6;15 is the rectangle height   
add bx,dx; now bx is the height+dx:50=30+20
;---
push dx
push cx
call draw_rectangle
pop cx
pop dx 
;---
add cx,1 ;Column
add dx,1;184-8(no +1 here as above)
mov al,5 ;Pixel color
;---
mov bx,4;width=320 
add bx,cx;now bx is the width+cx
mov es,bx;(m.s if it is valid?!!)es is the width 
mov bx,4;15 is the rectangle height   
add bx,dx; now bx is the height+dx:50=30+20
;--
call draw_rectangle
ret
draw_button endp
;---------------------------------------








priny_regs_N proc
mov al,2
mov di, offset reg_AX_N  
Pr_Reg_names:
mov ah,4
;mov si, offset reg_AX_N  
;mov dx,0703h//wrong
mov dh,09
mov bl, 80h 
print_reg_name:
;Print_MSG [si]
push ax
call Print_MSG
pop ax  
;add si,3
add di,1
add dh,2
sub dl,2
dec ah
cmp ah,0
jnz print_reg_name  
dec al
add dl,11
cmp al,0
jnz Pr_Reg_names
ret  
priny_regs_N endp
;-----------------------------------------
;mov dl,6
;mov di, offset reg_AX_V_P1  
retreive_regs_v proc
mov al,2
Pr_Reg_old_V:
mov ah,4
;mov si, offset reg_AX_N  
;mov dx,0703h//wrong
mov dh,09
mov bl, 80h 
print_reg_V:
;Print_MSG [si]
push ax
mov bl,70h
call Print_MSG
pop ax  
;add si,3
add di,1
add dh,2
sub dl,4
dec ah
cmp ah,0
jnz print_reg_V  
dec al
add dl,5
cmp al,0
jnz Pr_Reg_old_V
ret  
retreive_regs_v endp
;----------------------
;mov dl,1
;mov di, offset memory0_P1 
retreive_memorys_v proc
mov ah,16
;mov si, offset reg_AX_N  
;mov dx,0703h//wrong
mov dh,05
mov bl, 80h 
print_memory_V:
;Print_MSG [si]
push ax
mov bl,70h
call Print_MSG
pop ax  
;add si,3
add di,1
add dh,1
sub dl,2
dec ah
cmp ah,0
jnz print_memory_V  
ret  
retreive_memorys_v endp
;----------------------
;mov dl,1
;mov di, offset memory0_P1 
retreive_circles_v proc
mov ah,5
;mov si, offset reg_AX_N  
;mov dx,0703h//wrong
mov dh,08
mov al,2
print_circles_V:
;Print_MSG [si]
push ax
mov bl,al
push cx
mov ch,4
;ROL bl,4                                                                                   ;doaa modified
call Print_MSG
pop cx
pop ax  
;add si,3
add di,1
add dh,2
sub dl,1
dec ah
inc al
cmp ah,0
jnz print_circles_V  
ret  
retreive_circles_v endp
;----------------------------------------------------------------------------------------------------------------------------
draw_G_S proc      
;get input from the user
 ;; MOV AH,0AH
        ;; MOV DX , OFFSET INDATA
        ;; INT 21H 
;------------------------------- 
;draw the main background  
;;pusha
mov cx,0 ;Column
mov dx,00 ;Row 
mov al,7 ;Pixel color
mov bx,320 ;width
mov es,bx;(m.s if it is valid?!!)es is the width    
mov bx,200; now bx is the hight
;CCC:call draw_rectangle 
;;popa 
;------------------------------  
;draw the command input location
;its height is 8 
;;pusha
mov cx,0 ;Column
mov dx,176 ;184-8(no +1 here as above)
mov al,3 ;Pixel color
mov bx,320 ;width=320 
add bx,cx;now bx is the width+cx
mov es,bx;(m.s if it is valid?!!)es is the width 
mov bx,8;15 is the rectangle height   
add bx,dx; now bx is the height+dx:50=30+20
call draw_rectangle
;;popa 
;------------------------------- 
;draw users name in inline chatting 
mov dx,1700h 
mov bl,70h  
mov bh,00h
mov di,offset User1_Name+2
call Print_MSG  
mov dx,1800h 
mov di,offset User2_Name+2 
call Print_MSG 
;------------------------------- 
;draw the inline chating upper limit 
;its hight is 16 pixel, its width is 320 pixel 
;200-16=184:NOTE yhis number is the lowew limit to many vertical lines below
;so if you change it ; change them
;;pusha
mov cx,0 ;Column
mov dx,184 ;Row=>184-1 
mov al,5 ;Pixel color
mov bx,320
call draw_width_line
;;popa   
;------------------------------
;draw midlle limit 
;its hight is 184 pixel
;;pusha
mov cx,160 ;Column:the midlle of the screen
mov dx,0 ;Row 
mov al,5 ;Pixel color
mov bx,184
call draw_height_line
;;popa      
;------------------------------- 
;draw score left limit 
;its hight is 20 pixel
;;pusha
mov cx,120 ;Column:160(middle)-40
mov dx,0 ;Row 
mov al,7 ;Pixel color
mov bx,20;line height
;CC:call draw_height_line
;;popa
;------------------------------- 
;draw score right limit 
;its hight is 20 pixel
;;pusha
mov cx,201 ;Column:160(middle)+1 +40
mov dx,0 ;Row 
mov al,7 ;Pixel color
mov bx,20;line height
;CC:call draw_height_line
;;popa   
;------------------------------- 
;draw the score lower limit 
;its hight is 20 pixel, its width is 80 pixel(+2 for the keft limit and right limit) 
;;pusha
;mov cx,120 ;Column: 
mov cx,0
mov dx,16 ;Row=16+1 
mov al,5 ;Pixel color
;mov bx,82  
;add bx,cx
mov bx,320
call draw_width_line
;;popa  
;-----------------------------------   
mov dx,0000h 
mov bl,70h
mov bh,00h 
mov di,offset User1_Name+2
call Print_MSG  
mov dx,0100h 
mov di,offset print_points
call Print_MSG  
mov dx,0014h 
mov di,offset User2_Name+2
call Print_MSG   
mov dx,0114h 
mov di,offset print_points
call Print_MSG  
;------------------------------- 
;print regs names
mov dl,04 
call priny_regs_N
mov dl,23
call priny_regs_N
;Print_MSG [cx] 
;------------------------------- 
;draw registers
;;pusha
;looperand_B: 
mov cx,47 ;0+30+8new+8new+1new
call draw_4_reg 
mov cx,87 ;0+30+40+10-2+8new+1new 
call draw_4_reg
mov cx,199 ;Column:160(midlle)+15-1+32+1new-8new
call draw_4_reg 
mov cx,239;175(midlle)+40+10(the distance between the two 4_groups)-3+32-8new+1new-8new
call draw_4_reg   
;;popa  
;------------------------------- 
;draw the command input location
;its height is 15  
;;pusha  
;;mov cx,0
;;call draw_command_rec
;;mov cx,161;160(midlle)+1(width of the vertical line)
;;call draw_command_rec
;;popa  
;------------------------------- 
;draw left memory line limit 
;its hight is 175 pixel,its width is 24
;;pusha
mov cx,25 ;Column
mov dx,0 ;Row 
mov al,5 ;Pixel color
mov bx,128;128=16memry location*8
;CC:call draw_height_line
;;popa  
;------------------------------- 
;draw left memory line "char(0->F)" limit 
;its hight is 175 pixel,its width is 8
;;pusha
mov cx,8 ;Column
mov dx,0 ;Row 
mov al,7 ;Pixel color
mov bx,128;128=16memry location*8
;CC:call draw_height_line
;;popa  
;------------------------------- 
;draw right memory line limit 
;its hight is 175 pixel,its width is 24
;;pusha
mov cx,295 ;Column
           ;296=320-24
mov dx,0 ;Row 
mov al,5 ;Pixel color
mov bx,128;128=16memry location*8
;CC:call draw_height_line
;;popa   
;------------------------------- 
;draw right memory line "char(0->F)" limit 
;its hight is 175 pixel,its width is 8
;;pusha
mov cx,312 ;Column
           ;312=320-8
mov dx,0 ;Row 
mov al,7 ;Pixel color
mov bx,128;128=16memry location*8
;CC:call draw_height_line
;;popa
;------------------------------- 
;draw memory rectangles 16 limits 
;each rectangle with hight is 10 pixel, its width is 20 pixel(20=memory line limit width) 
;;pusha  
mov cx,0 ;Column
;CC:call draw_memory_recs_16
mov cx,296
;CC:call draw_memory_recs_16
;;popa 
;-------------------------- 
mov dx,0500h  
mov bl,80h
Print_Vertical_MSG memory_locations_names 
mov dx,0501h
call initilaize_M_L 
mov dx,0527h  
mov bl,80h
Print_Vertical_MSG memory_locations_names  
mov dx,0525h
call initilaize_M_L
;-------------------------- 
; ;draw flying object source rectangle
; ;;pusha 
; ;mov ah,2
; mov dh,2
; mov cx,0 ;Column
; Draw_F_O_S: 
; mov ah,2
; push dx
; mov dx,17 ;Row=16+1 
; mov al,7 ;Pixel color
; mov bx,19 ;width=2*6(radius of circle)+1
; mov es,bx;(m.s if it is valid?!!)es is the width    
; mov bx,23; now bx is the hight:=2*6(radius of circle)+1
; push ax
; call draw_rectangle 
; pop ax
; dec ah
; add cx,141
; cmp ah,0
; jnz Draw_F_O_S
; pop dx
; dec dh  
; mov cx,161 
; cmp dh,00h
; jnz Draw_F_O_S
; ;;popa 
; ;-------------------------- 
; ;draw flying object Destination rectangle
; ;;pusha
; mov cx,141 ;Column:=160(middle)-13(old width)-6
; mov dx,18 ;Row=17+1 
; mov al,7 ;Pixel color
; mov bx,19 ;width=2*6(radius of circle)+1
; mov es,bx;(m.s if it is valid?!!)es is the width    
; mov bx,13; now bx is the hight:=2*6(radius of circle)+1
; call draw_rectangle 
; ;;popa 
; ;-------------------------- 

;draw circle of radius=5 pixels, and its center is (di,si)
;                                                  (x,y) 
;for 5 circles, i need width=5*16(not sure)
mov bx,2
;push bx

mov ax,147;x of the center: =35+32+32+64-8-8
mov di,ax
;;mov es,5 
two_P_circles:
push bx

mov ax,68;y of the center: 36=12+32+16+8
mov si,ax
mov al,2
mov ah,5 
loop_draw_c:
push ax

;;mov cx,0  
mov dx,si
sub dx,6;dx=dx-radius
;;mov dx,45;dx=(y of the center)- radius=si-readius 
mov bx,di
sub bx,6;bx=bx-radius
;;mov bx,5;bx=(x of the center)- radius=di-readius(m.s of di)
;bx will be cx inside the draw_circle_proc 
 call draw_circle_proc 
 ;------
 ;initialize each crcle with 0
 ;--  
 pop ax
 mov ch,al;now ch have the color of the current circle
 push ax
 ;--- 
 push dx
 push bx 
 mov dh,0
 mov dx,di
 sub dl,3
 mov ax,dx
 mov bl,8
 div bl
 mov dl,al;now dl=dl/8
 mov cl,dl 
 mov bx,si
 ;mov dh,byte ptr si
 mov al,bl  
 mov ah,0 
  mov bl,8
 div bl
 mov dh,al;now dl=dl/8 
 ;--  
 mov ah,2
;mov dx,0A0Ah
int 10h 
;--
 mov ah,9 ;Display
 mov bh,0 ;Page 0
 mov al,30h ;Letter D
 ;mov cx,1h ;1 times 
 mov cl,01h 
; mov bl,70h 
mov bl,ch
mov ch,4
;ROL bl,4                                                                           ;doaa modified
mov ch,0
 int 10h
;-- 
pop bx 
pop dx
 ;------  
 pop ax 
 inc al;to change the circles color
 dec ah
 ;add di,16;not 12
 add si,16
 cmp ah,0
 jnz loop_draw_c  
 
 ;mov di,283;:219+32+32 
 mov di,171
 pop bx
 dec bx
 cmp bx,0
 jnz two_P_circles
 ;;loop inc si with 6 for ah=5
;---------------------------
;draw gun_P1
; mov cx,gun_x
; mov dx,gun_y 
; call Draw_gun
;----------    
;draw two buttons
    mov cx,152;Column
    mov dx,177 ;184-8(no +1 here as above)
   call  draw_button
    mov cx,162;Column
    mov dx,177 ;184-8(no +1 here as above)
   call  draw_button

ret        
draw_G_S endp  
;-------------------------------------------------------------




Design_all proc
;-------------------------------   
    call  draw_G_S  
    ;-----------------------------
    ;initialize gun position
    ;for P1:
    Mov cx,150
    Mov dx,170   
    mov current_gun_x_P1,cx
    mov current_gun_y_P1,dx
    call Draw_gun
    ;for P2:
    Mov cx,165
    Mov dx,170   
    mov current_gun_x_P2,cx
    mov current_gun_y_P2,dx
    call Draw_gun
   
ret
Design_all endp



retreive_all proc
call  draw_G_S  
mov cx,gun_x
mov dx,gun_y 
call Draw_gun
;---
;give to each regs its old value (the value before clearing)
;for regs of P1:
mov dl,6
mov di, offset reg_AX_V_P1  
call retreive_regs_v 
;for regs of P2:
mov dl,25
mov di, offset reg_AX_V_P2  
call retreive_regs_v 
;---
;give to each memory location its old value (the value before clearing)
;for regs of P1:
mov dl,1
mov di, offset memory0_P1 
call retreive_memorys_v 
;for regs of P2:
mov dl,37
mov di, offset memory0_P2 
call retreive_memorys_v 
;---
;give to each circle its old value (the value before clearing)
;for regs of P1:
mov dl,18
mov di, offset circle1_P1 
call retreive_circles_v 
;for regs of P2:
mov dl,21
mov di, offset circle1_P2 
call retreive_circles_v 
ret
retreive_all endp






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Rufaydah;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;description

;;needs the second char -> al
GetSize PROC

    cmp al, 'l'
    je bits_8
    cmp al, 'L'
    je bits_8
    cmp al, 'h'
    je bits_8
    cmp al, 'H'
    je bits_8
    mov _bits, 16
    jmp done
    bits_8:
    mov _bits, 8
    done:
    ret
GetSize ENDP
;description
;;;need al -> sec operand first bit
Special_commands PROC
    mov ah, index_selected_command
    mov _valid_, 1

    check_rtL:
        cmp ah, 27
        je verify
    check_rtR:
        cmp ah, 30
        je verify
    check_stL:
        cmp ah, 36
        je verify
    check_stR:
        cmp ah, 39
        je verify
    other: ;;;to be overwritten by other conditions
        mov _bits, 16
        jmp sp_cmd_end
    verify:
        mov _bits, 8
        cmp al, 31h
        je sp_cmd_end
        cmp al, 'c'
        je l
    C:
        cmp al, 'C'
        jne invalid
    l: 
        inc di
        mov al, [di]
        cmp al, 'l'
        je sp_cmd_end
    L_:
        cmp al, 'L'
        je sp_cmd_end
    invalid:
        mov _bits, 0
        mov _valid_, 0
    sp_cmd_end:
    ret
Special_commands ENDP

;description

;description
; needs the char to be in first -> al, second -> ah
IncorrectAddMode PROC
    mov di, offset valid_addOpt_1_first
    mov cx,4   
    REPNE SCASB 
    cmp cx, 0
    JnZ search_sec_index
    search_based:
        mov cx, 2
        REPNE SCASB 
        cmp cx, 0
        jnz search_sec_based
        jmp _invalid 
    search_sec_index:
        mov al, ah
        mov cx, 2
        REPNE SCASB 
        cmp cx, 0
        jnz _InAdd
        jmp _invalid
    search_sec_based:
        mov al, ah
        mov cx, 2
        REPNE SCASB 
        cmp cx, 0
        jz _invalid

    _InAdd:
        mov _valid_, 1
        jmp _InAdd_end
    _invalid:
        mov _valid_, 0
    _InAdd_end:
    ret
IncorrectAddMode ENDP

;needs h is not calculated in size
;needs size_a
;regarding operand_A, operand_B---> same as execute command
;if valid --> puts 1 in _valid_ otherwise--> 0
Check_some_errors PROC

    mov di, offset operand_A
    mov al, [di]
    cmp al, 5Bh
    jne First_reg
    First_mem:
        mov di, offset operand_B
        mov al, [di]
        cmp al, 5Bh
        je Go_go_go_not_validated
        ;;;;check for addressing mode
        mov al, byte ptr operand_A + 1
        mov ah, byte ptr operand_A + 2
        call IncorrectAddMode
        cmp _valid_, 0
        jz Go_go_go_not_validated
        ;;;;;check for special commands
        call Special_commands
        cmp _valid_, 0
        jz Go_go_go_not_validated

        cmp _bits, 8
        je Go_go_go_not_validated
        
        ;;;;;other command ---> check second to get bit size 
        cmp al, 39h
        ja second_reg
        cmp size_b, 2
        jbe _bits_8
        cmp size_b, 4
        jae bits_16
        cmp al, 30h
        je _bits_8
        jmp bits_16
        Go_go_go_not_validated:
            jmp Go_go_not_validated
        second_reg:
            inc di
            mov al, [di]
            cmp al, 'l'
            je _bits_8
            cmp al, 'L'
            je _bits_8
            cmp al, 'h'
            je _bits_8
            cmp al, 'H'
            je _bits_8
            jmp bits_16
            _bits_8: 
                mov _bits, 8
            bits_16: 
                mov _bits, 16
            jmp GoValid
    First_reg:
        mov di, offset operand_B
        mov al, [di]
        cmp al, 5bh
        jne not_memory

        ;;;;check for addressing mode
        mov al, byte ptr operand_B + 1
        mov ah, byte ptr operand_B + 2
        call IncorrectAddMode
        cmp _valid_, 0
        jz Go_not_validated
        ;;;;;;;check for special commands
        call Special_commands
        cmp _valid_, 0
        jz Go_not_validated
        mov al, byte ptr operand_A + 1
        call GetSize
        jmp GoValid
        Go_go_not_validated:
            jmp Go_not_validated
        not_memory:
            mov al, byte ptr operand_A + 1
            call GetSize
            cmp _bits, 8
            je first_8
            jmp first_16

        first_8:

            ;;;check for special commands
            call Special_commands
            cmp _valid_, 0
            jz Go_not_validated
            cmp _bits, 16
            je proceed8
            jmp GoValid

            proceed8:
                mov _bits, 8
                mov al, operand_B
                cmp al, 39h
                ja two_reg_8
                second_num_8:
                    cmp al, '0'
                    jnz two_digits
                    three_digits:
                    cmp size_b, 3
                    ja Go_not_validated
                    jmp GoValid

                    two_digits:
                    cmp size_b, 2
                    ja Go_not_validated
                    jmp GoValid
                two_reg_8:
                    mov al, byte ptr operand_B + 1
                    cmp al, 'l'
                    je GoValid
                    cmp al, 'L'
                    je GoValid
                    cmp al, 'h'
                    je GoValid
                    cmp al, 'H'
                    je GoValid
                    Go_not_validated:
                    jmp not_validated
        first_16:
            mov di, offset operand_B
            mov al, [di]
            ;;;check for special commands
            call Special_commands
            cmp _valid_, 0
            jz not_validated
            cmp _bits, 16
            je proceed16
            mov _bits, 16
            jmp GoValid
            proceed16:
                mov _bits, 16
                cmp al, 39h
                ja two_reg_16
            second_num_16:
                cmp al, '0'
                jne four_digits
                five_digits:
                cmp size_b, 5
                ja sizeMismatch
                jmp GoValid

                four_digits:
                cmp size_b, 4
                ja sizeMismatch
                GoValid:
                    jmp valid
            two_reg_16:
                mov al, byte ptr operand_B + 1
                cmp al, 'l'
                je sizeMismatch
                cmp al, 'L'
                je sizeMismatch
                cmp al, 'h'
                je sizeMismatch
                cmp al, 'H'
                je sizeMismatch
                jmp valid
    memTomem:
        jmp not_validated
    sizeMismatch:
        jmp not_validated
    valid:
        mov _valid_, 1
        jmp finish_valid
    not_validated:
        mov _valid_, 0
    finish_valid:    
    ret
Check_some_errors ENDP







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;sanaa;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;description
mainmenuScreen PROC far
    ;clear screen
mov ah,0
int 10H

mov ax,0700h
mov bh,07
mov cx,0
mov dx,184FH
int 10h
;move cursor
mov ah,2
mov bh,0
mov dx,091Eh
int 10h
;show message
mov ah,9
mov dx,offset messageNo2
int 21h
;------------------------------------;
mov ah,2
mov bh,0
mov dx,0B1Eh
int 10h
;show message
mov ah,9
mov dx,offset messageNo3
int 21h

mov ah,2
mov bh,0
mov dh,22d
mov dl,0h
int 10h

lineprint:
mov ah,9 ;Display
mov bh,0 ;Page 0
mov al,5Fh ;'-'
mov cx,80d ;5 times
mov bl,02h ;Green (A) on white(F) background
int 10h



ret
mainmenuScreen ENDP

get_char_and_validate PROC
    ;we have level as a character
    getForbLoop:
        ;get forbidden charachter
        mov ah,07
        int 21h

    ;now char is in al 
    ;we validate the range _ first validate numbers
     cmp al,30h
     jB getForbLoop
     cmp al,3Ah
     jB AllowedChar;is a number

    cmp al,41h
    jB getForbLoop
    cmp al,5Bh
    jB AllowedCharCap ; is a cap letter

    cmp al,61h
    jB getForbLoop
    cmp al,7Bh
    jB AllowedChar; is a small letter

    jmp getForbLoop

    AllowedCharCap:
    ADD al,20h; we make it small as we treat all chars in game as small


    AllowedChar:;validated

    cmp Gamelevel,'2'
    je ending ;if lvl 2 , no echoing
    ;if lvl 1 , echo
    ;mov Gamelevel,al
    mov ah,2
    mov dl,3Ah
    int 10h

    mov ah,2
    mov dl,al
    int 21h 



    ending:
    ret
get_char_and_validate ENDP

get_Value_and_validate PROC
    ;we have level as a character
    getForbLooperand_B:
        ;get forbidden charachter
        mov ah,07
        int 21h

    ;now char is in al 
    ;we validate the range _ first validate numbers
     cmp al,30h
     jB getForbLooperand_B
     cmp al,3Ah
     jB AllowedChar2;is a number

    cmp al,41h
    jB getForbLooperand_B
    cmp al,47h
    jB AllowedCharHEX ; is a cap letter

    cmp al,61h
    jB getForbLooperand_B
    cmp al,67h
    jB AllowedCharsmall2; is a small letter

    jmp getForbLooperand_B


    AllowedCharsmall2:   
    
     mov ah,2
    add dl,2
    ; mov dl,14h
    ; mov dh,05
     int 10h
    
    
    mov ah,2       
    ;inc dl
    ;mov dh,05
    int 10h
 
    push dx
    mov ah,2
    mov dl,al
    int 21h 
    sub al,30h
    pop dx
    
    
    sub al,20h
    sub al,7h;
    
    jmp allValidVals
    
    AllowedCharHEX:
    
     mov ah,2
    add dl,2
    ; mov dl,14h
    ; mov dh,05
     int 10h
    
    
    mov ah,2
    ;inc dl
    ;mov dh,05
    int 10h
 
    push dx
    mov ah,2
    mov dl,al
    int 21h 
    sub al,30h
    pop dx
    
    
    sub al,7h; 

    jmp allValidVals

    AllowedChar2:;validated
;mov cursor
     mov ah,2
    add dl,1
    ; mov dl,14h
    ; mov dh,05
     int 10h
    
    
    mov ah,2
    ;inc dl
    ;mov dh,05
    int 10h
 
    push dx
    mov ah,2
    mov dl,al
    int 21h 
    sub al,30h
    pop dx
    

   
    allValidVals:


    ending2:
    ret
get_Value_and_validate ENDP
;descriptio:screen for regs initializing
LVL2_initializing_regs PROC
    
       push dx
    mov ah,9
    mov dx, DI
    int 21h
    pop dx       
           
    mov cx,4

    GetAX: call get_Value_and_validate
    ;mov DX,[SI]
    ;push Bx
    mov ah,0
    add BX,ax
    cmp CX,1
    je contloplop
    ;shl BX,4                                                                       ;doaa modified
    ;pop dx
    contloplop:
    ;echo
    ;mov [SI],DX
    
    add al,30h

    ; push dx
    ; mov ah,2
    ; mov dl,al
    ; int 21h
    ; pop dx
    
    loop GetAX
    mov [SI],BX


nop


    ret
LVL2_initializing_regs ENDP 

LVLSCRNSTEP PROC far
;clear screen
    mov ah,0  
    mov al,3
    int 10H
;scroll to page 0 beginning
mov ax,0700h
mov bh,07
mov cx,0
mov dx,184FH
int 10h
;move cursor
mov ah,2
mov bh,0
mov dx,0615h
int 10h
;show message
mov ah,9
mov dx,offset MSGlvlEnter
int 21h

;we check for pressed key either 1 or 2
;get char no echo
GetLvl:
    mov ah,07
    int 21h

    cmp al,31h;ascii of 1
    je echo
    cmp al,32h;ascii of 2
    je echo
jmp GetLvl

echo:
mov Gamelevel,al
mov ah,2
mov dx,063Ah
int 10h

    mov ah,2
    mov dl,al
    int 21h 
; mov ah,2
; mov bh,0
; mov dx,0A15h
; int 10h

; mov ah,2
; mov dl,al
; int 21h   

; MOV     CX, 0FH
; MOV     DX, 4240H
; MOV     AH, 86H
; mov al,0

; INT     15H

enterForbCharsStage:    
mov ah,2
mov bh,0
mov dx,0815h
int 10h
;show message
push dx
mov ah,9
mov dx,offset MSGP1lvlEnter
int 21h
pop dx
;now we deal with p1
call get_char_and_validate
; now we gor character -> store in memory
mov P1F,al


; MOV     CX, 0FH
; MOV     DX, 4240H
; MOV     AH, 86H
; mov     al,0
; INT     15H


mov ah,2
mov bh,0
mov dx,0A15h
int 10h
;show message
push dx
mov ah,9
mov dx,offset MSGP2lvlEnter
int 21h
pop dx
call get_char_and_validate
; now we gor character -> store in memory
mov P2F,al


; MOV     CX, 0FH
; MOV     DX, 4240H
; MOV     AH, 86H
; mov al,0
; INT     15H


mov ah,2
mov bh,0
mov dx,0C15h
int 10h
;show message
push dx
mov ah,9
mov dx,offset MSGEnterF4ToStart
int 21h
pop dx

waitTillF4:
mov ah,0ch
int 21h

mov ah,0
int 16h



cmp     ah, 3eh;check F4 key
jz      REGSCREEN    

jmp waitTillF4

REGSCREEN:
cmp Gamelevel,'2'
JE notStartGame
jmp far ptr StartGame


notStartGame:
;call LVL2_initializing_regs
; mov ah,0
    ; mov al,13h
    ; int 10H
;scroll to page 0 beginning
    mov ax,0700h
    mov bh,7
    mov cx,0
    mov dx,184FH
    int 10h

    ; set cursor
    mov ah,2
    mov bh,0
    mov dx,030Fh ; dl = x , dy = y
    int 10h

    mov ah,9
    mov dx,offset msgInitialPoint
    int 21h
    
    mov ah,2
    mov dl,'1'
    int 21h

    mov ah,9
    mov dx,offset msgInitialPoint2
    int 21h

    mov ah,2
    mov bh,0
    mov dx,0511h ; dl = x , dy = y(11,5)
    int 10h
;cursor

    ; push dx
    ; mov ah,9
    ; mov dx,offset TXT_AX
    ; int 21h
    ; pop dx       
           
    ; mov cx,4
    ; mov SI,offset P1AX
    ; GetAX: call get_Value_and_validate
    ; ;mov DX,[SI]
    ; ;push Bx
    ; mov ah,0
    ; add BX,ax
    ; cmp CX,1
    ; je contloplop
    ; shl BX,4  
    ; ;pop dx
    ; contloplop:
    ; ;echo
    ; ;mov [SI],DX
    
    ; add al,30h

    ; ; push dx
    ; ; mov ah,2
    ; ; mov dl,al
    ; ; int 21h
    ; ; pop dx
    
    ; loop GetAX
    ; mov [SI],BX
    






nop
push dx
    add dl,2
    mov SI,offset P1AX
    mov DI,offset TXT_AX
    call LVL2_initializing_regs
pop dx
    mov bl,0
    mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P1BX
    mov DI,offset TXT_BX
    call LVL2_initializing_regs
pop dx
 
    mov bl,0 
    mov ah,2         
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P1CX
    mov DI,offset TXT_CX
    call LVL2_initializing_regs
pop dx
      
          mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P1DX
    mov DI,offset TXT_DX
    call LVL2_initializing_regs
pop dx
;     mov bl,0 
; mov ah,2
;     mov bh,0
;     add dh,2 ; dl = x , dy = y(11,5)
;     int 10h

; push dx

;     add dl,2
;     ;mov dl,11h
;     mov SI,offset P1BX
;     mov DI,offset TXT_BX
;     call LVL2_initializing_regs
; pop dx 

    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P1SI
    mov DI,offset TXT_SI
    call LVL2_initializing_regs
pop dx

    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P1DI
    mov DI,offset TXT_DI
    call LVL2_initializing_regs
pop dx


    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P1BP
    mov DI,offset TXT_BP
    call LVL2_initializing_regs
pop dx


    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P1sp
    mov DI,offset TXT_sp
    call LVL2_initializing_regs
pop dx


notStartGame2:
;call LVL2_initializing_regs
; mov ah,0
    ; mov al,13h
    ; int 10H
;scroll to page 0 beginning
    mov ax,0700h
    mov bh,7
    mov cx,0
    mov dx,184FH
    int 10h

    ; set cursor
    mov ah,2
    mov bh,0
    mov dx,030Fh ; dl = x , dy = y
    int 10h

    mov ah,9
    mov dx,offset msgInitialPoint
    int 21h
    
    mov ah,2
    mov dl,'2'
    int 21h

    mov ah,9
    mov dx,offset msgInitialPoint2
    int 21h

    mov ah,2
    mov bh,0
    mov dx,0511h ; dl = x , dy = y(11,5)
    int 10h
;cursor

    ; push dx
    ; mov ah,9
    ; mov dx,offset TXT_AX
    ; int 21h
    ; pop dx       
           
    ; mov cx,4
    ; mov SI,offset P1AX
    ; GetAX: call get_Value_and_validate
    ; ;mov DX,[SI]
    ; ;push Bx
    ; mov ah,0
    ; add BX,ax
    ; cmp CX,1
    ; je contloplop
    ; shl BX,4  
    ; ;pop dx
    ; contloplop:
    ; ;echo
    ; ;mov [SI],DX
    
    ; add al,30h

    ; ; push dx
    ; ; mov ah,2
    ; ; mov dl,al
    ; ; int 21h
    ; ; pop dx
    
    ; loop GetAX
    ; mov [SI],BX
    






nop
push dx
    add dl,2  
    mov bl,0
    mov SI,offset P2AX
    mov DI,offset TXT_AX
    call LVL2_initializing_regs
pop dx
    mov bl,0
    mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P2BX
    mov DI,offset TXT_BX
    call LVL2_initializing_regs
pop dx
 
    mov bl,0 
    mov ah,2         
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P2CX
    mov DI,offset TXT_CX
    call LVL2_initializing_regs
pop dx
      
          mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P2DX
    mov DI,offset TXT_DX
    call LVL2_initializing_regs
pop dx
;     mov bl,0 
; mov ah,2
;     mov bh,0
;     add dh,2 ; dl = x , dy = y(11,5)
;     int 10h

; push dx

;     add dl,2
;     ;mov dl,11h
;     mov SI,offset P1BX
;     mov DI,offset TXT_BX
;     call LVL2_initializing_regs
; pop dx 

    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P2SI
    mov DI,offset TXT_SI
    call LVL2_initializing_regs
pop dx

    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P2DI
    mov DI,offset TXT_DI
    call LVL2_initializing_regs
pop dx


    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P2BP
    mov DI,offset TXT_BP
    call LVL2_initializing_regs
pop dx


    mov bl,0 
mov ah,2
    mov bh,0
    add dh,2 ; dl = x , dy = y(11,5)
    int 10h

push dx

    add dl,2
    ;mov dl,11h
    mov SI,offset P2sp
    mov DI,offset TXT_sp
    call LVL2_initializing_regs
pop dx
















StartGame:

; MOV AH, 4CH
; MOV AL, 00 ;your return code.
; INT 21H
ret

LVLSCRNSTEP endp

;;;;;;;;;;;;;;;;;;;refaydah 2


_lower_letter PROC
    cmp cl, 5ah
    ja ll_end
    add cl, 20h
    ll_end:
    ret
_lower_letter ENDP

ToHexa PROC
    
    mov si, offset _value
    mov di, offset _value
    mov dl, [si]
    mov ch, 5
    mov cl, 4
    mov ax, 0
    _load:
    cmp dl, 39h
    ja _letter
    sub dl, 30h
    jmp _sto
    _letter:
        mov cl, dl
        call _lower_letter
        sub cl, 57h
        mov dl, cl
    _sto:
    mov cl, 4
    shl ax, cl
    add al, dl
    dec ch
    inc si
    cmp ch, 0
    jz toH_end
    mov dl, [si]
    cmp dl, '$'
    jne _load
    toH_end:
    STOSW
    ret
ToHexa ENDP

;description
;;need al -> first char, ah -> second char
;;puts lower_case of chars in their place
lower_RegOperand PROC
    
    ;;ax, al, ah
    check_a:
        cmp al, 'a'
        je check_sec
    checkA:
        cmp al, 'A'
        jne check_b
        mov al, 'a'
        jmp check_sec
    ;;bx, bp, bl, bh
    check_b:
        cmp al, 'b'
        je check_sec
    checkB:
        cmp al, 'B'
        jne check_c
        mov al, 'b'
        jmp check_sec
    ;;cx, cl, ch
    check_c:
        cmp al, 'c'
        je check_sec
    checkC:
        cmp al, 'C'
        jne check_d
        mov al, 'c'
        jmp check_sec

    ;;dx, dl, dh, di
    check_d:
        cmp al, 'd'
        je check_sec
    checkD:
        cmp al, 'D'
        jne check_s
        mov al, 'd'
        jmp check_sec
    ;;si, sp
    check_s:
        cmp al, 's'
        je check_sec
    checkS:
        mov al, 's'

    check_sec:
        check_x:
            cmp ah, 'x'
            je reg_got
        checkX:
            cmp ah, 'X'
            jne check_l
            mov ah, 'x'
            jmp reg_got
        check_l:
            cmp ah, 'l'
            je reg_got
        checkL:
            cmp ah, 'L'
            jne check_h
            mov ah, 'l'
            jmp reg_got
        check_h:
            cmp ah, 'h'
            je reg_got
        checkH:
            cmp ah, 'H'
            jne check_p
            mov ah, 'h'
            jmp reg_got
        check_p:
            cmp ah, 'p'
            je reg_got
        checkP:
            cmp ah, 'P'
            jne check_i
            mov ah, 'p'
            jmp reg_got
        check_i:
            cmp ah, 'i'
            je reg_got
        checkI:
            mov ah, 'i'
            jmp reg_got
    reg_got:
    ret
lower_RegOperand ENDP

;description
;;need al -> first char, ah -> second char
;; bl 1->first operand, 2->second operand
RegOperand PROC far
    
    call lower_RegOperand
    xchg al, ah
    mov dl, _player_proc
    cmp bl, 1
    jne getReg
    _store_result_reg:
    mov si, offset _store
    mov [si], al
    inc si
    mov [si], ah
    getReg: ;;;;;;put reg value in _value
        mov di, offset _value
        check_al:
            mov si, offset reg_AX_V_P1
            cmp ax, 'al'
            jne check_ah
            cmp dl, 1
            jne al_sec_proc
            al_first_proc:
                jmp _lower_8
            al_sec_proc:
                add si, 40
                jmp _lower_8
        check_ah:
            cmp ax, 'ah'
            jne check_ax
            cmp dl, 1
            jne ah_sec_proc
            ah_first_proc:
                jmp _higher_8
            ah_sec_proc:
                add si, 40
                jmp _higher_8
        check_ax:
            cmp ax, 'ax'
            jne check_bl
            cmp dl, 1
            jne ax_sec_proc
            ax_first_proc:
                jmp _full_16
            ax_sec_proc:
                add si, 40
                jmp _full_16
        check_bl:
            add si, 5
            cmp ax, 'bl'
            jne check_bh
            cmp dl, 1
            jne bl_sec_proc
            bl_first_proc:
                jmp _lower_8
            bl_sec_proc:
                add si, 40
                jmp _lower_8
        check_bh:
            cmp ax, 'bh'
            jne check_bx
            cmp dl, 1
            jne bh_sec_proc
            bh_first_proc:
                jmp _higher_8
            bh_sec_proc:
                add si, 40
                jmp _higher_8
        check_bx:
            cmp ax, 'bx'
            jne check_cl
            cmp dl, 1
            jne bx_sec_proc
            bx_first_proc:
                jmp _full_16
            bx_sec_proc:
                add si, 40
                jmp _full_16
        check_cl:
            add si, 5
            cmp ax, 'cl'
            jne check_ch
            cmp dl, 1
            jne cl_sec_proc
            cl_first_proc:
                jmp _lower_8
            cl_sec_proc:
                add si, 40
                jmp _lower_8
        check_ch:
            cmp ax, 'ch'
            jne check_cx
            cmp dl, 1
            jne ch_sec_proc
            ch_first_proc:
                jmp _higher_8
            ch_sec_proc:
                add si, 40
                jmp _higher_8
        check_cx:
            cmp ax, 'cx'
            jne check_dl
            cmp dl, 1
            jne cx_sec_proc
            cx_first_proc:
                jmp _full_16
            cx_sec_proc:
                add si, 40
                jmp _full_16
        check_dl:
            add si, 5
            cmp ax, 'dl'
            jne check_dh
            cmp dl, 1
            jne dl_sec_proc
            dl_first_proc:
                jmp _lower_8
            dl_sec_proc:
                add si, 40
                jmp _lower_8
        check_dh:
            cmp ax, 'dh'
            jne check_dx
            cmp dl, 1
            jne dh_sec_proc
            dh_first_proc:
                jmp _higher_8
            dh_sec_proc:
                add si, 40
                jmp _higher_8
        check_dx:
            cmp ax, 'dx'
            jne check_si
            cmp dl, 1
            jne dx_sec_proc
            dx_first_proc:
                jmp _full_16
            dx_sec_proc:
                add si, 40
                jmp _full_16
        check_si:
            add si, 5
            cmp ax, 'si'
            jne check_di
            cmp dl, 1
            jne si_sec_proc
            si_first_proc:
                jmp _full_16
            si_sec_proc:
                add si, 40
                jmp _full_16
        check_di:
            add si, 5
            cmp ax, 'di'
            jne check_sp
            cmp dl, 1
            jne di_sec_proc
            di_first_proc:
                jmp _full_16
            di_sec_proc:
                add si, 40
                jmp _full_16
        check_sp:
            add si, 5
            cmp ax, 'sp'
            jne check_bp
            cmp dl, 1
            jne sp_sec_proc
            sp_first_proc:
                jmp _full_16
            sp_sec_proc:
                add si, 40
                jmp _full_16
        check_bp:
            add si, 5
            cmp dl, 1
            jne bp_sec_proc
            bp_first_proc:
                jmp _full_16
            bp_sec_proc:
                add si, 40
                jmp _full_16
        _lower_8:
            mov cl, '$'
            add si, 2
            MOVSb
            Movsb
            mov [di], cl
            sub si, 4
            jmp regO_end
        _higher_8:
            mov cl, '$'
            MOVSW
            mov [di], cl
            sub si, 2
            jmp regO_end
        _full_16:
            mov cx, 2
            REP MOVSW
            sub si, 4
    regO_end:
    ; mov cl, 16
    ; shl eax, cl
    mov bx, si
    ret
RegOperand ENDP

;description
ValueOperand PROC
    mov di, offset _value
    mov si, offset operand_B
    mov cl, size_b
    mov ch, 0
    REP MOVSB
    mov cl, '$'
    mov [di], cl
    call ToHexa
    ValueO_end:
    ret
ValueOperand ENDP


;description
;;takes ascii char in bh
;;takes bl -> first or second operand
;;takes dl -> first or second processor
;;returns offset to be changed in bx
get_mem_value PROC
    mov si, offset memory0_P1
    cmp bh, '0'
    jne Rcheck_1
    cmp dl, 1
    jne mem_0_sec_proc
    mem_0_first_proc:
        jmp _get
    mem_0_sec_proc:
        add si, 48
        jmp _get

    Rcheck_1:
        add si, 3
        cmp bh, '1'
        jne Rcheck_2
        cmp dl, 1
        jne mem_1_sec_proc
        mem_1_first_proc:
            jmp _get
        mem_1_sec_proc:
            add si, 48
            jmp _get
    
    Rcheck_2:
        add si, 3
        cmp bh, '2'
        jne Rcheck_3
        cmp dl, 1
        jne mem_2_sec_proc
        mem_2_first_proc:
            jmp _get
        mem_2_sec_proc:
            add si, 48
            jmp _get

    Rcheck_3:
        add si, 3
        cmp bh, '3'
        jne check_4
        cmp dl, 1
        jne mem_3_sec_proc
        mem_3_first_proc:
            jmp _get
        mem_3_sec_proc:
            add si, 48
            jmp _get
    
    check_4:
        add si, 3
        cmp bh, '4'
        jne check_5
        cmp dl, 1
        jne mem_4_sec_proc
        mem_4_first_proc:
            jmp _get
        mem_4_sec_proc:
            add si, 48
            jmp _get

    check_5:
        add si, 3
        cmp bh, '5'
        jne check_6
        cmp dl, 1
        jne mem_5_sec_proc
        mem_5_first_proc:
            jmp _get
        mem_5_sec_proc:
            add si, 48
            jmp _get
    
    check_6:
        add si, 3
        cmp bh, '6'
        jne check_7
        cmp dl, 1
        jne mem_6_sec_proc
        mem_6_first_proc:
            jmp _get
        mem_6_sec_proc:
            add si, 48
            jmp _get

    check_7:
        add si, 3
        cmp bh, '7'
        jne check_8
        cmp dl, 1
        jne mem_7_sec_proc
        mem_7_first_proc:
            jmp _get
        mem_7_sec_proc:
            add si, 48
            jmp _get
    
    check_8:
        add si, 3
        cmp bh, '8'
        jne check_9
        cmp dl, 1
        jne mem_8_sec_proc
        mem_8_first_proc:
            jmp _get
        mem_8_sec_proc:
            add si, 48
            jmp _get

    check_9:
        add si, 3
        cmp bh, '9'
        jne check_a_m
        cmp dl, 1
        jne mem_9_sec_proc
        mem_9_first_proc:
            jmp _get
        mem_9_sec_proc:
            add si, 48
            jmp _get
    
    check_a_m:
        mov cl, bh
        call _lower_letter
        mov bh, cl

        add si, 3
        cmp bh, 'a'
        jne check_b_m
        cmp dl, 1
        jne mem_a_sec_proc
        mem_a_first_proc:
            jmp _get
        mem_a_sec_proc:
            add si, 48
            jmp _get

    check_b_m:
        add si, 3
        cmp bh, 'b'
        jne check_c_m
        cmp dl, 1
        jne mem_b_sec_proc
        mem_b_first_proc:
            jmp _get
        mem_b_sec_proc:
            add si, 48
            jmp _get
    
    check_c_m:
        add si, 3
        cmp bh, 'c'
        jne check_d_m
        cmp dl, 1
        jne mem_c_sec_proc
        mem_c_first_proc:
            jmp _get
        mem_c_sec_proc:
            add si, 48
            jmp _get

    check_d_m:
        add si, 3
        cmp bh, 'd'
        jne check_e_m
        cmp dl, 1
        jne mem_d_sec_proc
        mem_d_first_proc:
            jmp _get
        mem_d_sec_proc:
            add si, 48
            jmp _get
    
    check_e_m:
        add si, 3
        cmp bh, 'e'
        jne check_f_m
        cmp dl, 1
        jne mem_e_sec_proc
        mem_e_first_proc:
            jmp _get
        mem_e_sec_proc:
            add si, 48
            jmp _get

    check_f_m:
        add si, 3
        cmp dl, 1
        jne mem_f_sec_proc
        mem_f_first_proc:
            jmp _get
        mem_f_sec_proc:
            add si, 48
            jmp _get

    _get:
    mov di, offset _value
    mov bx, si
    get_mem_value_end:
    cmp _bits, 8
    je _lower_mem
    movsw
    _lower_mem:
    movsw
    EE:
    mov al, '$'
    mov [di], al
    ret
get_mem_value ENDP



;description
;;need bl ->> operand 1 or 2
MemOperand PROC
    inc di
    mov dl, _player_proc
    mov al, [di]

    inc di
    mov ah, [di]

    cmp al, 39h
    jbe mem_off

    mem_reg:
    ;;do not forget to update _store
    call lower_RegOperand
    xchg al, ah
    check_bx_char:
            mov si, offset reg_BX_V_P1
            cmp ax, 'bx'
            jne check_si_char
            cmp dl, 1
            jne bx_sec_char
            bx_first_char:
                jmp _get_char_value
            bx_sec_char:
                add si, 40
                jmp _get_char_value

        check_si_char:
            add si, 15
            cmp ax, 'si'
            jne check_di_char
            cmp dl, 1
            jne si_sec_char
            si_first_char:
                jmp _get_char_value
            si_sec_char:
                add si, 40
                jmp _get_char_value
        check_di_char:
            add si, 5
            
            cmp dl, 1
            jne di_sec_char
            di_first_char:
                jmp _get_char_value
            di_sec_char:
                add si, 40
                jmp _get_char_value
    _get_char_value:
        mov bh, byte ptr [si] + 4
        jmp Get_op_value
    mem_off:
        cmp al, '0'
        jne one_digit
        cmp ah, ']'
        je one_digit

        put_ah_in_bh:
            mov bh, ah
            jmp Get_op_value
        
        one_digit:
            mov bh, al

    Get_op_value:
        push bx
        call get_mem_value
        pop cx
        cmp cl, 1
        jne MemO_end
        mov _store, ch
    MemO_end:
    ret
MemOperand ENDP



;description
;;returns bx-> offset reg, ax-> reg name
prepareFOP PROC

    mov di, offset operand_A
    mov al, [di]
    cmp al, '['
    jne reg
    ;;first operand
    mov bl, 1
    call MemOperand
    jmp getFValue
    reg: 
        ;;first operand
        mov bl, 1
        inc di
        mov ah, [di]
        call RegOperand
    getFValue:
        push ax
        call ToHexa
        pop ax
    ret
prepareFOP ENDP

;description
prepareSOP PROC
    
    mov di, offset operand_B
    mov al, [di]
    cmp al, '['
    jne not_mem
    ;;second operand
    mov bl, 2
    call MemOperand
    not_mem: 
        cmp al, 39h
        ja reg_off
        call ValueOperand
        jmp psoend
        reg_off:
        ;;second operand
        mov bl, 2
        inc di
        mov ah, [di]
        call RegOperand
    getSValue:
    call ToHexa
    psoend:
    ret
prepareSOP ENDP

;description
ToAscii PROC

    push ax
    push cx
    mov si, offset operand_A
    mov di, offset operand_A

    mov al, _bits
    mov ah, 0
    mov cl, 8
    div cl

    mov ch, 2
    cmp al, 1
    jne _begin
    mov ch, 1
    _begin:
        mov ax, 0
        mov al, [si]
        _two_digits:
            mov cl, 4
            inc si
            ror ax, cl
            cmp al, 9h
            ja f_to_letter
            add al, 30h
            stosb
            jmp sec_dig
            f_to_letter:
                add al, 37h
                stosb
            sec_dig:
                shr ah, cl
                cmp ah, 9h
                ja s_to_letter
                add ah, 30h
                ; mov al, ah
                ; stosb
                jmp chk_n
            s_to_letter:
                add ah, 37h
                
            chk_n:
                LODSB
                xchg ah, al
                stosb
                xchg ah, al
                mov ah, 0
                dec ch
                jnz _two_digits
        pop cx
        pop ax
    ret
ToAscii ENDP

;description
;;implements command and returns result in cf and operand_A
;;; takes no of index_selected_command in al
ImplementCmd PROC
    
    mov bl, _player_proc
    cmp bl, 1
    jne sf
    mov ah, CF_P1
    jmp press
    sf:
    mov ah, CF_P2
    press:
    mov CF, ah
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov al, _bits
    cmp al, 8
    je _offset_b
    mov bx, offset first
    mov di, offset second
    jmp _adc
    _offset_b:
    mov bx, offset operand_A
    mov di, offset operand_B
    
    _adc:
        mov al, index_selected_command

        cmp al, 0
        jne _add
        mov al, _bits
        cmp al, 8
        je _adc8
        Addcarry [bx], [di], CF
        jmp Implemented
        _adc8:
            Addcarry8 [bx], [di], CF
            jmp Implemented
    _add:
        cmp al, 3
        jne _and
        mov al, _bits
        cmp al, 8
        je _add8
        Adding [bx], [di], CF
        jmp Implemented
        _add8:
            Adding8 [bx], [di], CF
            jmp Implemented
    _and:
        cmp al, 6
        jne _clc
        mov al, _bits
        cmp al, 8
        je _and8
        ANDing [bx], [di], CF
        jmp Implemented
        _and8:
            ANDing8 [bx], [di], CF
            jmp Implemented
    _clc:
        cmp al, 9
        jne _dec
        mov CF, 0
        jmp Implemented
    _dec:
        cmp al, 12
        jne _inc
        mov al, _bits
        cmp al, 8
        je _dec8
        Decrement [bx]
        jmp Implemented
        _dec8:
            Decrement8 [bx]
            jmp Implemented
    _inc:
        cmp al, 15
        jne _mov
        mov al, _bits
        cmp al, 8
        je _inc8
        Increment [bx]
        jmp Implemented
        _inc8:
            Increment8 [bx]
            jmp Implemented
    _mov:
        cmp al, 18
        jne _nop
        mov al, _bits
        cmp al, 8
        je _mov8
        Moving [bx], [di]
        jmp Implemented
        _mov8:
            Moving8 [bx], [di]
            jmp Implemented
    _nop:
        cmp al, 21
        jne _or
        jmp Implemented
    _or:
        cmp al, 24
        jne _rol
        mov al, _bits
        cmp al, 8
        je _or8
        ORing [bx], [di], CF
        jmp Implemented
        _or8:
            ORing8 [bx], [di], CF
            jmp Implemented
    _rol:
        cmp al, 27
        jne _ror
        mov al, _bits
        cmp al, 8
        je _rol8
        RotateLeft [bx], [di], CF
        jmp Implemented
        _rol8:
            RotateLeft8 [bx], [di], CF
            jmp Implemented
    _ror:
        cmp al, 30
        jne _sbb
        mov al, _bits
        cmp al, 8
        je _ror8
        RotateRight [bx], [di], CF
        jmp Implemented
        _ror8:
            RotateRight8 [bx], [di], CF
            jmp Implemented
    _sbb:
        cmp al, 33
        jne _shl
        mov al, _bits
        cmp al, 8
        je _sbb8
        SubBorrow [bx], [di], CF
        jmp Implemented
        _sbb8:
            SubBorrow8 [bx], [di], CF
            jmp Implemented
    _shl:
        cmp al, 36
        jne _shr
        mov al, _bits
        cmp al, 8
        je _shl8
        ShiftLeft [bx], [di], CF
        jmp Implemented
        _shl8:
            ShiftLeft8 [bx], [di], CF
            jmp Implemented
    _shr:
        cmp al, 39
        jne _sub
        mov al, _bits
        cmp al, 8
        je _shr8
        ShiftRight [bx], [di], CF
        jmp Implemented
        _shr8:
            ShiftRight8 [bx], [di], CF
            jmp Implemented
    _sub:
        cmp al, 42
        jne _xor
        mov al, _bits
        cmp al, 8
        je _sub8
        Subtracting [bx], [di], CF
        jmp Implemented
        _sub8:
            Subtracting8 [bx], [di], CF
            jmp Implemented
    _xor:
        mov al, _bits
        cmp al, 8
        je _xor8
        XORing [bx], [di], CF
        jmp Implemented
        _xor8:
            XORing8 [bx], [di], CF
            jmp Implemented
    Implemented:
        mov bl, _player_proc
        mov ah, CF
        cmp bl, 1
        jne sf_end
        mov CF_P1, ah
        jmp imp_end
        sf_end:
        mov CF_P2, ah
    imp_end:
    call ToAscii
    ret
ImplementCmd ENDP

; index_selected_command is the index of the first char of the command in array of commands
; operand_A is the first operand not its size, same for operand_B
; needs _player_proc, size_b to be determined previously
; _bits is calculated in the procedure Check_some_errors
ExecuteCommand PROC
   
    mov al, index_selected_command
    mov _store, '$'
    check_nop:
        cmp al, 21
        je Implement
    check_clc:
        cmp al, 9
        jne preoperand_A
        jmp Implement
    preoperand_A:
    ;;;first operand
        call prepareFOP
        push bx ;;;;;;;;;;;operand offset to be updated on screen
        push ax ;;;;;;;;;;;;operand name
        mov si, offset _value
        mov di, offset operand_A
        MOVSW
    check_inc:
        mov al, index_selected_command
        cmp al, 15
        jne check_dec
        jmp Implement
    check_dec:
        cmp al, 12
        jne preoperand_B
        jmp Implement
    preoperand_B:
    ;;;second operand
        call prepareSOP
        mov si, offset _value
        mov di, offset operand_B
        MOVSW
        mov al, index_selected_command
    Implement:
    call ImplementCmd
    cmp _store, '$'
    je doneR
    ;;update value
    Update:
        ; pop ax
        ; pop di
        ; mov si, offset operand_A
        ; cmp al, 'l'
        ; jne chk_h
        ; _store_lower:
        ;     add di, 2
        ;     MOVSW
        ;     jmp done
        ; chk_h:
        ;     cmp al, 'h'
        ;     jne _store_full
        ; _store_higher:
        ;     MOVSW
        ;     jmp done
        ; _store_full:
        ;     MOVSW
        ;     MOVSW
        pop ax
        pop di
        mov si, offset operand_A
        cmp al, 'l'
        jne chk_h_or_memByte
        _store_lower:
            add di, 2
            MOVSW
            jmp doneR
        chk_h_or_memByte:
            cmp _bits, 8
            jne _store_full
        _store_higher:
            MOVSW
            jmp doneR
        _store_full:
            add di, 2
            MOVSW
            sub di, 4
            MOVSW
    doneR:
        mov al, '$'
        mov di, offset _value
        mov cx, 5
        rep stosb


;for regs of P1:
mov dl,6
mov di, offset reg_AX_V_P1  
call retreive_regs_v 
;for regs of P2:
mov dl,25
mov di, offset reg_AX_V_P2  
call retreive_regs_v 
;---
;give to each memory location its old value (the value before clearing)
;for memory of P1:
mov dl,1
mov di, offset memory0_P1 
call retreive_memorys_v 
;for memory of P2:
mov dl,37
mov di, offset memory0_P2 
call retreive_memorys_v 
;---

    ret
ExecuteCommand ENDP

CHAT PROC;description

   
      mov cl, 5
      mov ch, 5
   SEND: 


      mov dx , 3FDH
      In al , dx 			;Read Line Status
      AND al , 00100000b
      JZ RECIEVE
      mov ah,1
      int 16h
      jz RECIEVE
      mov ah,0
      int 16h

      mov dx , 3F8H		; Transmit data register
      out dx , al

      cmp al, 2ah
      jne donot_end
      jmp far ptr finishInlineChat
      donot_end:
      cmp cl, 40
      jne _stcursend
      
      _clear_cl:
      mov bl, al
      push cx
      mov ax,0600h ;Scroll Screen AH=06 (Scroll),AL=0 Entire Page
      mov bh,07 ;Normal attributes
      mov cl, 5
      mov ch, 23
      ;mov cx,0 ;from 0,0
      mov dl, 39
      mov dh, 23
      ; mov dx,184FH ;To 02h,4fh
      int 10h
      pop cx
      mov cl, 5
      mov al, bl
       _stcursend:
      mov ah, 2
      mov bh, 0
      mov dh, 23
      mov dl, cl
      int 10h

      push cx
      mov ah,9 ;Display
      mov bh,0 ;Page 0
      ;mov al,44h ;Letter D
      mov cx,1h ;5 times
      mov bl,0F4h ;Green (A) on white(F) background
      int 10h
      pop cx

      inc cl
      
   RECIEVE:
      mov dx , 3FDH
      In al , dx 			;Read Line Status

      AND al , 1
      JZ SEND


      mov dx , 03F8H
      in al , dx 

      cmp al, 2ah
      je finishInlineChat

      cmp ch, 40
      jne _stcurrec

      _clear_ch:
      mov bl, al
      push cx
      mov ax,0600h ;Scroll Screen AH=06 (Scroll),AL=0 Entire Page
      mov bh,07 ;Normal attributes
      mov cl, 5
      mov ch, 24
      ;mov cx,0 ;from 0,0
      mov dl, 39
      mov dh, 24
      ; mov dx,184FH ;To 02h,4fh
      int 10h
      pop cx
      mov ch, 5
      mov al, bl
      _stcurrec:
      mov dl, ch
      mov dh, 24
      mov ah, 2
      mov bh, 0
      int 10h

      push cx
      mov ah,9 ;Display
      mov bh,0 ;Page 0
      ;mov al,44h ;Letter D
      mov cx,1h ;5 times
      mov bl,0F4h ;Green (A) on white(F) background
      int 10h
      pop cx

      
      inc ch
      jmp SEND
      
      jmp SEND
   finishInlineChat:
      mov ax,0600h ;Scroll Screen AH=06 (Scroll),AL=0 Entire Page
      mov bh,07 ;Normal attributes
      mov cl, 5
      mov ch, 23
      ;mov cx,0 ;from 0,0
      mov dl, 39
      mov dh, 23
      ; mov dx,184FH ;To 02h,4fh
      int 10h

      mov ax,0600h ;Scroll Screen AH=06 (Scroll),AL=0 Entire Page
      mov bh,07 ;Normal attributes
      mov cl, 5
      mov ch, 24
      ;mov cx,0 ;from 0,0
      mov dl, 39
      mov dh, 24
      ; mov dx,184FH ;To 02h,4fh
      int 10h
      
   ret
CHAT ENDP


































;description
Main PROC Far
MOV AX,@DATA
MOV DS,AX
;MOV ES,AX


;;;;;;;;;;;;;;;;;;;;;;;;;;;

;----------------------
;;;;;;;;;;;;;;;user screen;;;;;;;;;;;;;;;
enter_user_info11:
;reset/set send cursor
mov send_cursor_x ,0d ;db or dw?
mov send_cursor_y, 1d ;m.s of 1
;clear the screen
mov ax,0600h
mov bh,07 
mov cx,0 
mov dx,184FH
int 10h 
;---------
;design the template
;set cursor position to the 0000 position
mov ah,2
mov dx,0000
mov bh,0
int 10h
;--
mov ah, 9
mov dx, offset msg1
int 21h
;---
call initialize_s_ports 
mov si,offset User1_Name+2
mov di,offset User2_Name+2
;--------
like_chatting :
 mov ah,1
 int 16h
 cmp ah,1
 jz receving89;jmp if there is nothing in the buffer
 ;-------- 
 ;check pressing enter
 cmp al,0Dh
 jz cmplete_points27 
 cmp first_char,1
 jz cmplet_send11
 ;-------------------------------
                ; ; mov ah,0
                ; ; int 16h
                ;---
                 mov ah,2
                 mov dl,send_cursor_x
                 mov dh, send_cursor_y
                  mov bh,0
                    int 10h
                    ;---
                      mov ah,2 
                      mov dl,al
                      int 21h 
                      ;--
                      mov first_char,1
                      mov invalid_u,0                      
                       cmp al,41h;h not d
                                 ;if(char<A)
                       jc invalid_UN11 
                       ;------------
                       cmp al,7Bh;not 7A as if al=7A the carry will be zero as well and cosider as invalid
                                 ;if(char>z):not >=
                       jnc invalid_UN11 
                       ;------------
                       cmp al,5Bh
                                 ;if(char>Z):not >=
                                 ;if no carry check another thing
                                 ;if CF=1=>the char is<Z or =Z :end the check
                       jc end_check12 
                       ;------------
                       cmp al,61h;h not d
                       jnc end_check12;if(char>=a)->valid
                                    ;else do the invalid_UN code
                       ;------------
            invalid_UN11: 
                       ;---
                        mov ah,0
                        int 16h
                        ;---
                       mov first_char,0
                         mov invalid_u,1
                         display_new_line
                        display_Message MSG4
                       ;display_new_line  
                      ;display_Message MSG5 
             press_enter123: display_new_line
                       display_Message MSG6
                          ;display_new_line
                       ;------------ 
                       mov ah,07
                        int 21h;Read one char and put in al without echo 
                        
                        cmp al,0Dh;enter key=>esmo cret in ascii code table 
                        jnz press_enter123;if the user press a key that is not "enter key" print the MSG^ for him until he press enter
                        ;--                     
                      jmp far ptr enter_user_info11
               end_check12:        
 ;---------------------------------
 cmplet_send11:
 push ax
 ;read the buffer
 mov ah,0
 int 16h
 ;--
 call send_p_us 
 pop ax
;;jmp _print
jmp like_chatting
;--------
receving89:
call receive_p_us 
;-------
jmp like_chatting
;-------
cmplete_points27:
;read the buffer
mov ah,0
 int 16h
 ;--
 ;;UserN_validatin User1_Name  
;  cmp invalid_u,1
;  ;jz enter_user_info11
;  jnz escape_far11
;  jmp far ptr enter_user_info11
 ;---
 escape_far11:
; ;  mov ah, 9
; ; mov dx, offset User1_Name+2
; ; int 21h
; ;  ;------
; ;   mov ah, 9
; ; mov dx, offset User2_Name+2
; ; int 21h
 ;------
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
 ;------------
  ;set cursor position to the 03,00
mov ah,2
mov dl,00
mov dh,3d
mov bh,0
int 10h
;---
inc dh
mov send_cursor_x,dl
mov send_cursor_y ,dh
;--
push dx
 mov ah, 9
mov dx, offset msg2
int 21h
pop dx
;--
call initialize_s_ports 
mov si,offset user1_initial_point
mov di,offset user2_initial_point
;--
chatting23:
mov ah,1
 int 16h
 cmp ah,1
 jz receving23;jmp if there is nothing in the buffer
 ;-------- 
 ;check pressing F3
 cmp al,0Dh
 jz ret_to_main_screen 
 push ax
 ;read the buffer
 mov ah,0
 int 16h
 ;--
 call send_p_us 
 pop ax
;;jmp _print
jmp chatting23
;--------
receving23:
call receive_p_us 
;-------
jmp chatting23
;---
 ret_to_main_screen:
 ;read the buffer
mov ah,0
 int 16h
 ;--
; ; mov ah, 9
; ; mov dx, offset user1_initial_point
; ; int 21h
; ;  ;------
; ;   mov ah, 9
; ; mov dx, offset user2_initial_point
; ; int 21h
 ;--
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
; ;  call delay_unit
 ;--
 ;t7wel el string of the points to int to cmp for u1
 ;ex:12
 mov al,user1_initial_point
              sub al,30h; now al=1 
             
             mov bl,al;bl=1
  mov al,user1_initial_point+1           
             sub al,30h; now al=2
             
            ; mov ah,al ;NOTE  
            mov cl,al
             mov al,10d;NOTE:not 10H
             mul bl;ax=al*bl=10*1=0010->al=10 , ah=00
           ;;  Add al,bl;wrong     
            ;; add ah,al;ah=ah+al=
               add cl,al;cl=cl+al=2+10=12
               mov u1_p_int,cl 
 ;--
 ;t7wel el string of the points to int to cmp for u2
 ;ex:12
 mov al,user2_initial_point
              sub al,30h; now al=1 
             
             mov bl,al;bl=1
  mov al,user2_initial_point+1           
             sub al,30h; now al=2
             
            ; mov ah,al ;NOTE  
            mov cl,al
             mov al,10d;NOTE:not 10H
             mul bl;ax=al*bl=10*1=0010->al=10 , ah=00
           ;;  Add al,bl;wrong     
            ;; add ah,al;ah=ah+al=
               add cl,al;cl=cl+al=2+10=12
               mov u2_p_int,cl 
 ;----
mov al,u1_p_int
mov cl,u2_p_int
cmp cl,al
;jnc point_u1
jc point_u1;jump if cf=1=>cl lower than al
mov bl,al
jmp assign_lower_i_p
point_u1:
mov bl,cl
assign_lower_i_p:
mov lower_initial_point,bl
;--
mov ah,0
mov al,lower_initial_point
mov bl,10
div bl;al=ax/bl=23/10=2 ; ah=
mov di,offset print_points
add al,30h
add ah,30h
mov [di],al
inc di
mov [di],ah
;---
jmp far ptr main_sc_sama
;---
; ; mov ah, 9
; ; mov dx, offset print_points
; ; int 21h
 ;--
;  call delay_unit
;  call delay_unit
;  call delay_unit
;  call delay_unit
;  call delay_unit
;  call delay_unit
 ;---
;------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;
main_sc_sama:
;Samaa:jmp far ptr toChatLoop
;clear screen
mov ah,0
int 10H

mov ax,0700h
mov bh,07
mov cx,0
mov dx,184FH
int 10h
;move cursor
mov ah,2
mov bh,0
mov dx,071Eh
int 10h
;show message
mov ah,9
mov dx,offset messageNo1
int 21h
;move cursor
mov ah,2
mov bh,0
mov dx,091Eh
int 10h
;show message
mov ah,9
mov dx,offset messageNo2
int 21h
;------------------------------------;
mov ah,2
mov bh,0
mov dx,0B1Eh
int 10h
;show message
mov ah,9
mov dx,offset messageNo3
int 21h

mov ah,2
mov bh,0
mov dh,22d
mov dl,0h
int 10h

lineprint1:
mov ah,9 ;Display
mov bh,0 ;Page 0
mov al,5Fh ;'-'
mov cx,80d ;5 times
mov bl,02h ;Green (A) on white(F) background
int 10h

call initialize_s_ports

mainmenuloop:
mov RVALUE,11h
call receive_p



cmp     RVALUE, 0f1h;check F1 key
jz      Recieved_chat_invitation 

cmp     RVALUE, 0f2h;check F2 key
jz      Recieved_game_invitation 



; recieving:
; 	if recieved F1 ; chat 
; 		show msg"you Recieved a chatting request! to accept press F1"
; 		mov recieved_chat ,1
; 		mov recieved_game ,0

; 	if recieved F2 ; chat   
; 		show msg"you Recieved a Game request! to accept press F2"
; 		mov recieved_game ,1
; 		mov recieved_Chat ,0
mov SVALUE,0EEh
call send_p
; mov ah,0
; int 16h

cmp     SVALUE, 27d;check esc key
jNz NOTEXITINGG          
JMP FAR PTR    exit
NOTEXITINGG:
cmp     SVALUE, 0f1h;check F1 key
jz      Sent_chat_invitation    


cmp     SVALUE, 0f2h;check F2 key
jz      Sent_game_invitation  

jmp $CONTmainLoop

Recieved_chat_invitation:
    ;move cursor
    mov ah,2
    mov bh,0
    ;mov dx,091Eh
    mov dh,23d             ;dl=X, dh=Y
    mov dl,0
    int 10h
    ;show message
    mov ah,9
    mov dx,offset MSGchatRecieved
    int 21h
    MOV recieved_game,1
    MOV recieved_chat,2
    jmp $CONTmainLoop

Recieved_game_invitation:

    mov ah,2
    mov bh,0
    ;mov dx,091Eh
    mov dh,23d             ;dl=X, dh=Y
    mov dl,0
    int 10h
    ;show message
    mov ah,9
    mov dx,offset MSGgameRecieved
    int 21h

    MOV recieved_game,2
    MOV recieved_chat,1
    jmp $CONTmainLoop


Sent_chat_invitation:
    ;move cursor
    mov ah,2
    mov bh,0
    ;mov dx,091Eh
    mov dh,24d             ;dl=X, dh=Y
    mov dl,0
    int 10h
    ;show message
    mov ah,9
    mov dx,offset MSGchatSent
    int 21h

    MOV sent_game,1
    MOV sent_chat,2

    jmp $CONTmainLoop


Sent_game_invitation:
    ;move cursor
    mov ah,2
    mov bh,0
    ;mov dx,091Eh
    mov dh,24d             ;dl=X, dh=Y
    mov dl,0
    int 10h
    ;show message
    mov ah,9
    mov dx,offset MSGgameSent
    int 21h
    MOV sent_game,2
    MOV sent_chat,1



    jmp $CONTmainLoop




    $CONTmainLoop:
    ;flush buffer
    ; mov ah,0ch
    ; mov al,0
    ; int 21h
    ;push dx
    mov dl,sent_chat
    cmp dl,recieved_chat
    jz toChatLoop 
    
    mov dl,sent_game
    cmp dl,recieved_game
    jNz NOTTTOGAMELOP  
JMP FAR PTR             toGameLoop
    ;pop dx
NOTTTOGAMELOP:

   
jmp mainmenuloop


    toChatLoop:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;chatting;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;clear the screen
mov ax,0600h
mov bh,07 
mov cx,0 
mov dx,184FH
int 10h 
;---------
;design the template
;set cursor position to the 0000 position
mov ah,2
mov dx,0000
mov bh,0
int 10h
;--
mov ah,2 
mov dl,16d
int 21h
;--
mov ah, 9
mov dx, offset User1_Name+2
int 21h
;---
;set cursor position to the 12,00
mov ah,2
mov dl,00
mov dh,12d
mov bh,0
int 10h
;--
mov ah,2 
mov dl,16d
int 21h
;-
mov ah, 9
mov dx, offset User2_Name+2
int 21h
;----
;set cursor position to the 24,00
mov ah,2
mov dl,00
mov dh,24d
mov bh,0
int 10h
;-
mov ah, 9
mov dx, offset msg_ending1
int 21h
;--
mov ah, 9
mov dx, offset User2_Name+2
int 21h
;--
mov ah, 9
mov dx, offset msg_ending2
int 21h
;---------
call initialize_s_ports 
;--------
chatting789 :
 mov ah,1
 int 16h
 cmp ah,1
 jz receving_c;jmp if there is nothing in the buffer
 ;-------- 
 ;check pressing F3
 cmp ah,3Dh
 jz ret_to_main_screen898 
 ;-------------
 push ax
 call send_p_chat 
 pop ax
; ;check pressing F3
;  cmp ah,3Dh
;  jz ret_to_main_screen898 
;;jmp _print
jmp chatting789
;--------
receving_c:
call receive_p_chat 
;-------
cmp ret_mai_var,1
jz ret_to_main_screen89878
jmp chatting789
;-------
ret_to_main_screen898:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;main screen;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;call mamdouh main screnn proc
;m2ktan , i will clear the screen
MOV AL,28
push ax
 call send_p_chat 
 pop ax
;clear the screen
mov ax,0600h
mov bh,07 
mov cx,0 
mov dx,184FH
int 10h 
ret_to_main_screen89878:
mov ret_mai_var,0
jmp far ptr main_sc_sama
;need complete........................................
;------


    toGameLoop:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






; INITIAL_SCREEN:
;     ;clear screen
;     ; mov ax,0600h
;     ; mov bh,07
;     ; mov cx,0
;     ; mov dx,184FH
;     ; int 10h
; mov ah,0
; int 10H

; mov ax,0700h
; mov bh,07
; mov cx,0
; mov dx,184FH
; int 10h

;     ;user screen
;     call Users_screen
;     call mainmenuScreen
    

    

; mainmenuloop:
; mov ah,0ch
; int 21h

; mov ah,0
; int 16h
; ;mov al,27h
; cmp     al, 27d;check esc key
; jnz      skipping_sth
; jmp far ptr exit   
; skipping_sth: 
; cmp     ah,60d ; check f2
; jz ToLVLscreen

; jmp mainmenuloop


; ToLVLscreen:


; call LVLSCRNSTEP



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;game part;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; the design part
Design:  
;-------------------------------    
;Change to video mode:
mov ah,00h
mov al,13h
int 10h       

call Design_all

;show mouse
mov ax,1
int 33h



Port_Initialization:
    ;Set Divisor Latch Access Bit
    mov dx,3fbh 			; Line Control Register
    mov al,10000000b		;Set Divisor Latch Access Bit
    out dx,al				;Out it

    ;Set LSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f8h			
    mov al,0ch			
    out dx,al

    ;Set MSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f9h
    mov al,00h
    out dx,al

    ;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    ; 0:Access to Receiver buffer, Transmitter buffer
    ; 0:Set Break disabled
    ; 011:Even Parity
    ; 0:One Stop Bit
    ; 11:8bits
    out dx,al



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; doaa && rufaidah part ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Official_Game_loop:
;show mouse
; mov ax,1
; int 33h

loop_of_sending_and_recieving:

    ; check_if_sending:
    ;     ;Check that Transmitter Holding Register is Empty
    ;     mov dx , 3FDH		;Line Status Register
  	;     In al , dx 			;Read Line Status
  	; 	AND al , 00100000b
  	; 	Jnz send_data    ;jump to send this value                          TODO

    check_if_recieving:
        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
		in al , dx 
  		AND al , 1
        jz _____next
  		Jmp far ptr recieve_data    ;jump to recieve this value                        TODO





    _____next:
    jmp next____
    send_data:
        ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
        AGAIN1_:  	In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN1_

        ;send size_a
        mov dx , 3F8H		; Transmit data register
  		mov  al,size_a
  		out dx , al

        ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
        AGAIN2:  	In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN2
        
        ;send size_b
        mov dx , 3F8H		; Transmit data register
  		mov  al,size_b
  		out dx , al
        
        ;Check that Transmitter Holding Register is Empty     ---> keda keda alan el buffer fady fe awl el send bs 3malt loop ehtyaty  ???
		mov dx , 3FDH		; Line Status Register
        AGAIN3__:  	In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN3__
        
        ;send operand_A
        mov dx , 3F8H		; Transmit data register
        mov bx, offset operand_A
        mov al, byte ptr [bx]  
        mov cl, size_a
        ;inc cl
        send_operand_A:
            out dx , al
            push dx
            ;Check that Transmitter Holding Register is Empty
            mov dx , 3FDH		; Line Status Register
            AGAIN3_:  	In al , dx 			;Read Line Status
                AND al , 00100000b
                JZ AGAIN3_
            pop dx
            ;inc dx  
            inc bx 
            mov al, byte ptr [bx]    
            dec cl        
            jnz send_operand_A

        ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
        AGAIN4___:  	In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN4___
        
        ;send operand_B
        mov dx , 3F8H		; Transmit data register
        mov bx, offset operand_B
        mov al, byte ptr [bx]  
        mov cl, size_b
        ;inc cl
        send_operand_B:
            out dx , al
            push dx
            ;Check that Transmitter Holding Register is Empty
            mov dx , 3FDH		; Line Status Register
            AGAIN4____:  	In al , dx 			;Read Line Status
                AND al , 00100000b
                JZ AGAIN4____
            pop dx
            ;inc dx  
            inc bx 
            mov al, byte ptr [bx]    
            dec cl        
            jnz send_operand_B

        

        ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
        AGAIN3:  	In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN3

        ;send index_selected_command
        mov dx , 3F8H		; Transmit data register
  		mov  al,index_selected_command
  		out dx , al



        ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
        AGAIN5:  	In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN5
        
        ;send _bits
        mov dx , 3F8H		; Transmit data register
  		mov  al,_bits
  		out dx , al

        ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
        AGAIN4:  	In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN4

        ;send _player_proc
        mov dx , 3F8H		; Transmit data register
  		mov  al,_player_proc
  		out dx , al
        



        jmp EXEC_COMMAND
    




    jmp next____
    recieve_data: 

        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
	    CHK1:	in al , dx 
            AND al , 1
            JZ CHK1

        ;recieve size_a
  		mov dx , 03F8H
  		in al , dx 

            cmp al,21d 
            jnz notRecYforChat 
            jmp far ptr                RecYforChat
  		notRecYforChat:
          mov size_a , al

        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
	    CHK2:	in al , dx 
            AND al , 1
            JZ CHK2

        ;recieve size_b
  		mov dx , 03F8H
  		in al , dx 
  		mov size_b , al 

        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
	    CHK3:	in al , dx 
            AND al , 1
            JZ CHK3


        ;recieve operand_A
  		mov dx , 03F8H
        mov bx, offset operand_A
        ;mov al, byte ptr [bx]  
        mov cl, size_a
        ;inc cl
        recieve_operand_A:
            in al , dx 
  		    mov [bx] , al
            ;Check that Data Ready
            push dx
		    mov dx , 3FDH		; Line Status Register
	        CHK_A:	in al , dx 
            AND al , 1
            JZ CHK_A
            pop dx
            inc bx
            ;mov al, byte ptr [bx]
            dec cl
            jnz recieve_operand_A




        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
	    CHK4:	in al , dx 
            AND al , 1
            JZ CHK4

        ;recieve operand_B
  		mov dx , 03F8H
        mov bx, offset operand_B
        ;mov al, byte ptr [bx]  
        mov cl, size_b
        ;inc cl
        recieve_operand_B:
            in al , dx 
  		    mov [bx] , al
            ;Check that Data Ready
            push dx
		    mov dx , 3FDH		; Line Status Register
	        CHK_B:	in al , dx 
            AND al , 1
            JZ CHK_B
            pop dx
            inc bx
            ;mov al, byte ptr [bx]
            dec cl
            jnz recieve_operand_B
        

        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
	    CHK5:	in al , dx 
            AND al , 1
            JZ CHK5

        ;recieve index_selected_command
  		mov dx , 03F8H
  		in al , dx 
  		mov index_selected_command, al  

        
        
        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
	    CHK7:	in al , dx 
            AND al , 1
            JZ CHK7

        ;recieve _bits
  		mov dx , 03F8H
  		in al , dx 
  		mov _bits, al  


        ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
	    CHK6:	in al , dx 
            AND al , 1
            JZ CHK6

        ;recieve _player_proc
  		mov dx , 03F8H
  		in al , dx 
  		mov _player_proc, al  


        ;once recieving all data --> go to the excecution of rufaidah part  
        ;put first reverse the value of the processor to be updated  ----->   I think so
        cmp _player_proc,1
        je reverse_to_2
        mov _player_proc, 1
        jmp ready_to_exec
        reverse_to_2:
            mov _player_proc, 2
        ready_to_exec:

                ;test by printing;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        mov ah,2
        mov dx,0
        mov bh,0
        int 10h  

        mov ah,9 ;Display
        mov bh,0 ;Page 0
        mov al,44h ;Letter D
        mov cx,5h ;5 times
        mov bl,0F4h ;Green (A) on white(F) background
        int 10h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        call  ExecuteCommand

        jmp main_loop
            ;JMP GO_EXEC_COMMAND_AFTER_RECIEVING





    next____:


mov ax, ds 
mov es, ax
;show mouse
mov ax,1
int 33h




Player1:
        
            ;check if user want to cick:
            mov al, 0
            mov ah,1
            int 16h
            cmp al, 0
            jne check_if_user_tab
            jmp far ptr Official_Game_loop
            check_if_user_tab:
            mov ah,0
            int 16h
            cmp al, 9
            je main_loop
            jmp far ptr Official_Game_loop
            
            ; read_it:
            ; mov ah,0
            ; int 16h

        main_loop:




        ;check if user pressed f4
        mov ah, 1
        int 16h
        cmp ah, 3eh
        jne not_to_go_finish
        jmp far ptr finish ;;;;To ask;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        not_to_go_finish:

        ;get user input----------start-----------------------
        ;;;get mouse click--> int 33h/3 => ax , cx-X, dx-y, bx-> bit 0 for left click, bit 1 for right click ====>zero no click.
        mov cl, 0

        mov al,0
        _select_command:

            mov bl, al
            push ax

            get_click_again:

            ;check if press ENTER --> finish selection  -------------- to tell rufaidah that it was fixed when i check here not down in the loop --> for the user to press enter
            mov al,0
            mov ah,1
            int 16h
            CMP al,0 
            JE go
            mov bh, ah
            ;remove the char from the buffer
            mov ah,0
            int 16h
            cmp bh, 1ch
            ; mov ah,07
            ; int 21h
            jne go
            jmp far ptr _finish_selection

            go:
            ; CMP bh,1 
            ; JE GO_

            ; mov ah,0
            ; int 16H
            ;jmp get_click_again

            mov value, cl  ;value is the number of the click
            ;get mouse click

            mov ax, 5
            int 33h


            ;check on the clicked position
            mov ax, bx
            and ax, 0000000000000001b
            jnz continue
            mov cl,value
            jmp get_click_again
            continue:
            ;TODO --> check on the clicked position to make sure it is the location of the arrow 
            cmp cx, 38
            jA compare_dx
            mov cl, value
            jmp get_click_again
            compare_dx:
            cmp dx, 170
            jA selection_done
            mov cl, value
            jmp get_click_again

            selection_done:
            pop ax
            ;;;;;check cl and print command on the screen;;;;;;;;;;;
            mov cl,value
            ;;;;mov al, cl
            
            
            ;set the curser
            mov ah,2
            mov dl,00
            mov dh,22
            mov bh,0
            ;mov dx,2200  ;2f0fH(right uer dimension)  ;2F00h   ;dl = x   dh = y
            int 10h
            ;then print the selected command
            mov ch, 3  ;3 --> as each command consists of 3 characteres so loop on all characters
            ;;;;mov al,value
            
            mov di, offset selected_command    
            print_command:
                ;inc al
                mov bx, offset _commands

                push ax
                xlat
                ;;;print al content
                
                
                ;print each char
                push cx
                mov [di], al
                mov ah,9 ;Display
                mov bh,0 ;Page 0
                ;mov al,value ;Letter D
                mov cx,1h ;1 time
                mov bl,3AH ;Green (A) on white(F) background
                ; mov bl,3   ;background
                ; rol bl,4    ; 0 0 0 0    0 0 0 0
                ; add bl,3
                int 10h
                pop cx

                
                ;set the curser again
            
                mov ah,2
                mov bh,0
                inc dl
                int 10h

                pop ax
                
                
                ;move to the next character
                inc al
                inc di
                ; mov bx, offset _commands
                ; xlat
                mov cl, value
                dec ch
                jnz print_command

            ;once finish printing the command, update the value of cl by 3 to point at the next command   
            mov cl,value 
            add cl, 3


            cmp cl, 48
            jne _keep_cl
            mov cl, 0
            mov al,0
            mov value,0
            _keep_cl:
            jmp _select_command


        _finish_selection:

        sub value,3
        Moving8 index_selected_command,value

        

        

        



        mov bx, offset selected_command 

        mov ax, ds
        mov es, ax

        ;special cases
        ;if nop  --> no operand
        first_special_case:
            mov al, [bx]
            cmp al, 'n'
            jne second_special_case
            mov operand_A, ' '
            mov operand_B, ' '
            jmp end_of_validation


        ;if clc  --> no operand
        second_special_case:
            mov al, [bx]
            cmp al, 'c'
            jne third_special_case
            mov operand_A, ' '
            mov operand_B, ' '
            jmp end_of_validation

        ;if inc  --> 1st operand --> musn't be value --> no second operand
        third_special_case:
            mov al, [bx]
            cmp al, 'i'
            jne fourth_special_case
            mov operand_B, ' '
            ;read the first operand and validate it

            ;set the curser
            mov ah,2
            mov bh,0
            MOV dl,5
            mov dh,22
            int 10h

            ;read
            mov ah,0Ah
            mov dx, offset MyBuffer_A
            int 21h
            
            mov bx, offset operand_A
            ;validate
            
            ;first --> check that the size does not exceed 5 && not less than 2

            ;calculate the size of A
            mov size_a, 0
            count__:
                cmp byte ptr [bx], '$'
                jne end__
                jmp finish_count_

                end__: 
                    inc bx 
                    inc size_a
                    jmp count


            finish_count_:
            mov bx, offset operand_A

            mov cl, size_a
            cmp cl,1
            ja _1_next
            jmp far ptr not_valid
            _1_next:
            cmp cl, 5
            jbe _2_next
            jmp far ptr not_valid
            _2_next:
            ;mov size_a, cl
            mov size_b,0

            ;validate
            dec size_a  ; i don't have justification but size_a is always greater by 1 from the value it must be 
            jmp validate_first_operand




        ;if dec  --> 1st operand --> musn't be value
        fourth_special_case:
            mov al, [bx]
            cmp al, 'd'
            jne read_exepression
            mov operand_B, ' '
            ;read the first operand and validate it

            ;set the curser
            mov ah,2 
            mov bh,0
            mov dl,4
            mov dh,22
            int 10h

            ;read
            mov ah,0Ah
            mov dx, offset MyBuffer_A
            int 21h

            ;check if the size of A exceeds 4 --> then invalid
            mov bx, offset operand_A

            ;calculate the size of A
            mov size_a, 0
            count:
                cmp byte ptr [bx], '$'
                jne end_
                jmp finish_count

                end_: 
                    inc bx 
                    inc size_a
                    jmp count


            finish_count:
            mov bx, offset operand_A

            mov cl, size_a
            cmp cl,1
            ja _1_next_
            jmp far ptr not_valid
            _1_next_:
            cmp cl, 5
            jbe _2_next_
            jmp far ptr not_valid
            _2_next_:
            ;mov size_a, cl
            mov size_b,0
            ; mov bx, offset size_b 
            ; mov byte ptr [bx], 0

            ;validate
            dec size_a ; i don't have justification but size_a is always greater by 1 from the value it must be 
            jmp validate_first_operand




            ;set the curser
            mov ah,2
            mov dx,0
            mov bh,0
            int 10h


        ;-------------------------------read the exepression--------------------------------------



        ;read the whole exepression
        read_exepression:
        ;set the curser  -->                               wrong as it can come here from bottom   no need to change the position of the dx
        mov ah,2 
        mov bh,0
        mov dl,4
        mov dh,22
        int 10h


        ;read
        mov ah,0Ah
        mov dx, offset exepression
        int 21h

        ;separate the exepression

        ;first_operand
        ;check for the end of it
        ;;;;;;;;;;;;;
        MOV AX, DS ;;   it is a must as we will
        MOV ES, AX ;;   make string operation
        ;;;;;;;;;;;;;
        mov di, offset exepression+2  ;+2 --> to skip the max and actual size
        MOV AL,','
        MOV CX,7 ;where 5 is the max for the first opernad --> e.g., [ax],1    [0FH]
        mov size_a, cl
        mov bl, cl   ;  --> to be used later  ---> when moving from the exepression to the frist operand
        REPNE scasb
        cmp cx,0
        jne first_operand
        ;delete the exepression and prompt again in the beginning

        clear:
        push es
        mov cx,24 ;Column
        mov dx,176 ;184-8(no +1 here as above)
        mov al,3 ;Pixel color
        mov bx,320 ;width=320 
        ;add bx,cx;now bx is the width+cx
        mov es,bx;(m.s if it is valid?!!)es is the width 
        mov bx,8;15 is the rectangle height   
        add bx,dx; now bx is the height+dx:50=30+20
        call draw_rectangle
        pop es

        ;;;;;;;;;;;;;
        MOV AX, DS ;;   it is a must as we will
        MOV ES, AX ;;   make string operation
        ;;;;;;;;;;;;;

        jmp read_exepression




        first_operand:
            ;modify the ---> size_a = cl)old - cl)new - 1)of comma
            ;sub size_a, cl
            ;dec size_a


            ;calc size_a
            mov bx, offset exepression+2

            ;calculate the size of A
            mov size_a, 0
            _count:
                cmp byte ptr [bx], ','
                jne _end
                jmp _finish_count

                _end: 
                    inc bx 
                    inc size_a
                    jmp _count


            _finish_count:
            ;mov bx, offset operand_A


            ;move from source to destination
            MOV AX, DS
            MOV ES, AX
            MOV DI, offset operand_A  
            MOV SI, offset exepression+2  ; +2 ---> to skip the max and actual size
            sub bl, cl  ; ---> number of char of the first operand
            ;DEC BL ;--> remove the comma
            mov ch,0
            mov cl, size_a
            REP MOVSB


        ; hint ---> bl --> contains the number of char in the first operand and the comma 
        ; mov cl, size_a
        ; dec cl ; to add the comma
        ; mov_si:
        ;     inc si 
        ;     dec cl
        ;     jnz mov_si
        inc si

        mov bl, size_a 
        ;inc bl ; to add the comma
        ;for the second operand
        ;inc si
        second_operand: 
            ;dec SI  ; --> to skip the comma
            ;inc SI  ; --> to skip the space
            ;inc bl  ; --> assume space exists
            mov bh, [si]
            ;inc si
            cmp bh,20h  ;space
            je cont
            ;if not equal --> then decrement to move back to the previous char
            dec bl  ; to reset the adding of one more size for the space ---> i.e., UNDO
            dec SI
            cont:
            inc si
            ;DEC SI
            ;DEC SI
            ;here we are sure that si is pointing at the beginning of the second operand
            mov DI, offset operand_B
            ;to know the size of the next operand --> we have to sub the actual size minus the size of the first operand minus the comoma
            push bx   ; i make this pushing as i have modified it later so i don't remember if i have used its value or not ---> 3shan aryah dema8y
            mov bx, offset exepression + 1
            mov al, byte ptr [bx]
            pop bx
            sub al, bl  ; subtract the size of ---> first opernad - comma - size if exists
            mov size_b,al
            mov cl, al  ;as rep depends on the cx
            MOV ch, 0
            REP MOVSB


                ;calc size_b
            mov bx, offset operand_B

            ;calculate the size of A
            mov size_b, 0
            __count:
                cmp byte ptr [bx], '$'
                jne __end
                jmp __finish_count

                __end: 
                    inc bx 
                    inc size_b
                    jmp __count


            __finish_count:
            dec size_b
            mov bx, offset operand_B







            ;validation for both first and second operand

            ;check if the first operand is a reg

                

                
            validate_first_operand:    ;first operand can't be value


            ; mov ax, ds
            ; mov es, ax
            
            
            check_reg_or_offset:
                mov al, size_a
                ;if size = 5 --> [0  0-F/f  h]   --> just memo, can't be reg  [0fh] 
                check_0:
                    cmp al,5
                    jne check_1
                    mov bx, offset operand_A
                    cmp byte ptr [bx], '['
                    je _3_next
                    jmp far ptr not_valid
                    _3_next:
                    mov bx, offset operand_A + 1
                    cmp byte ptr [bx], '0'
                    je _4_next
                    jmp far ptr not_valid
                    _4_next:
                    mov bx, offset operand_A + 3
                    cmp byte ptr [bx], 'h'
                    je next_0
                    cmp byte ptr [bx],'H'
                    je next_0
                    jmp far ptr not_valid
                    next_0:
                        mov bx, offset operand_A + 4
                        cmp byte ptr [bx], ']'
                        je _5_next
                        jmp far ptr not_valid
                        _5_next:
                        ;remove H/h
                        dec bx 
                        mov byte ptr [bx], ']'
                        inc bx 
                        mov byte ptr [bx],'$'
                        dec size_a
                        mov bx, offset operand_A + 2  ;to skip [0 as we will jmp to the label of check value
                        jmp check_0_to_2
                


                ;first if the size = 4 ---> [reg_name / memo begin with 0->9]  --> e.g., [ax]  , [0A] , [9h]
                ;then check if the first char is [
                check_1:
                    cmp al,4
                    jne check_2
                    mov bx, offset operand_A
                    cmp byte ptr [bx], '['
                    je _6_next
                    jmp far ptr not_valid
                    _6_next:
                    mov bx, offset operand_A + 3
                    cmp byte ptr [bx], ']'
                    je _7_next
                    jmp far ptr not_valid
                    _7_next:
                    ;determine wheather it is reg or memo
                    mov bx, offset operand_A + 1
                    ;if memo

                    lable_2:
                    ;if memo --> add 1 to offset if begin with 0
                    cmp byte ptr [bx],'0'
                    jne next_1
                    inc bx 
                    jmp check_0_to_2
                    next_1:
                        ;if memo --> remove h if end with h
                        ;inc bx
                        inc bx 
                        cmp byte ptr [bx], 'h'
                        jne next_1_1
                        ;remove h
                        mov byte ptr [bx], ']'
                        inc bx 
                        mov byte ptr [bx], '$'
                        dec size_a
                        sub bx,2
                        jmp check_0_to_2
                    next_1_1:
                        cmp byte ptr [bx], 'H'
                        je _8_next 
                        mov bx, offset operand_A + 1
                        jmp far ptr check1_char_1_frist_option
                        _8_next:
                        ;remove H
                        mov byte ptr [bx], ']'
                        inc bx 
                        mov byte ptr [bx], '$'
                        dec size_a 
                        sub bx,2
                        jmp check_0_to_2
                                        
                
                                        
                                        
                                        
                                        
                                        
                                        
                                        



                ;second if the size = 3 ---> [value 0->9]   [0->9]
                check_2:
                    cmp al,3
                    jne check_3
                    ;if equal --> then make sure it is a value between 0 --> F
                    mov bx, offset operand_A  ; +1 to skip the [
                    ;TODO
                    mov al, [bx]
                    cmp al,'['
                    je _11_next
                    jmp far ptr not_valid
                    _11_next:
                        mov bx, offset operand_A + 2 
                        mov al, [bx]
                        cmp al,']'
                        je _12_next
                        jmp far ptr not_valid
                    _12_next:
                    mov bx, offset operand_A + 1 ; +1 to skip the [
                    check_0_to_2:    ;[value 0->f/F]   [0->9]
                        mov al, [bx]
                        mov cx,22   ;22 --> the size of array of valid_values_memo 
                        mov di, offset valid_values_memo
                        REPNE SCASB
                        cmp cx, 0
                        jg go_to_validate_second_opernad
                        cmp al,'F'
                        je _9_next
                        jmp far ptr not_valid
                        _9_next:
                        jmp validate_second_operand




        jmp go_next_next
        go_to_validate_second_opernad:
        jmp far ptr validate_second_operand
        go_next_next:

                ;third if the size = 2  --> reg_name only
                check_3:
                    mov al, size_a
                    cmp al,2
                    je _10_next
                    jmp far ptr not_valid
                    _10_next:
                    mov bx, offset operand_A

                    check1_char_1_frist_option:
                        ;frist char  --> 61h:64h  or  41h:44h  or  53h  or  73h      -->    a:d  or A:D  or  S  or s
                        mov di, offset first_char_reg_option_1
                        mov al, [bx]
                        mov cx,4  ; 8 --> size of the array above
                        REPNE scasb 
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        
                        jne check1_char_2_first_option
                        cmp al, 'c'
                        je check1_char_2_first_option
                        dec bx
                        jmp check1_char_1_second_option  ; i know that no need to write this jmp as it is the next line --> but it is for me to notice temp. !!!!!!!!!!!!!!!!!!!!





                    check1_char_1_second_option:   
                        mov di, offset first_char_reg_option_2
                        mov al, [bx]
                        mov cx,2  ; 2 --> size of the array above
                        REPNE scasb 
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        
                        jne check1_char_2_second_option
                        cmp al, 's'
                        je check1_char_2_second_option
                        dec bx
                        jmp check1_char_1_third_option
                



                    check1_char_1_third_option:
                        mov di, offset first_char_reg_option_3
                        mov al, [bx]
                        mov cx,2  ; 2 --> size of the array above
                        REPNE scasb
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        
                        jne check1_char_2_third_option
                        cmp al, 'b'
                        je check1_char_2_third_option 
                        dec bx
                        jmp check1_char_1_fourth_option






                    check1_char_1_fourth_option: 
                        mov di, offset first_char_reg_option_4
                        mov al, [bx]
                        mov cx,2  ; 2 --> size of the array above
                        REPNE scasb 
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        
                        jne check1_char_2_fourth_option
                        cmp al, 'd'
                        je check1_char_2_fourth_option 
                        dec bx
                        jmp not_valid




        ;;;;;;;;;;;;;;;;;;;;;;;;;;





                    check1_char_2_first_option: 
                        ;mov bx, offset operand_A + 1  ; +1  --> second byte (char)
                        mov di, offset second_char_reg_option_1
                        mov al, [bx]
                        mov cx,6
                        REPNE scasb
                        cmp cx,0
                        jne validate_second_operand
                        cmp al,'x'
                        je validate_second_operand 
                        jmp not_valid
                        




                    check1_char_2_second_option: 
                        ;mov bx, offset operand_A + 1  ; +1  --> second byte (char)
                        mov di, offset second_char_reg_option_2
                        mov al, [bx]  
                        mov cx,4
                        REPNE scasb
                        cmp cx,0
                        jne validate_second_operand
                        cmp al,'p'
                        je validate_second_operand 
                        jmp not_valid





                    check1_char_2_third_option:
                        ;mov bx, offset operand_A + 1  ; +1  --> second byte (char)
                        mov di, offset second_char_reg_option_3
                        mov al, [bx]
                        mov cx,8
                        REPNE scasb
                        cmp cx,0
                        jne validate_second_operand
                        cmp al,'p'
                        je validate_second_operand 
                        jmp not_valid





                    check1_char_2_fourth_option: 
                        ;mov bx, offset operand_A + 1  ; +1  --> second byte (char)
                        mov di, offset second_char_reg_option_4
                        mov al, [bx]
                        mov cx,8
                        REPNE scasb
                        cmp cx,0
                        jne validate_second_operand
                        cmp al,'x'
                        je validate_second_operand 
                        jmp not_valid


                            
                            
            

                            
        validate_second_operand:


      


            ;before start check if it is empty   --> meaning the command is either INC or DEC
            mov al, size_b
            cmp al, 0
            jne go_here_
            jmp far ptr end_of_validation
            go_here_:
            check_if_value:     ; 0 --> FFFF  --->  0FFFFH    FFFFH,FFFH,    0FFFF
                mov bx, offset operand_B 
                mov cl, size_b
                cmp cl, 6
                jg go_to_not_valid_2_
                cmp cl,6
                jl loop_validate_each_char  
                ;here the size is equal to 6
                mov bx, offset operand_B + 5
                cmp byte ptr [bx], 'h'
                je  prepare_to_loop
                cmp byte ptr [bx], 'H'
                jne go_to_not_valid_2_
                prepare_to_loop:
                    ;remove h
                    mov byte ptr [bx], '$'
                    ;dec the size
                    dec size_b
                    ;go to the loop of cx,5 to check that the first char is 0
                    dec cl  ; to be 5 ---> for the next line

                
                loop_validate_each_char:
                    mov bx, offset operand_B 
                    cmp cl,5    ;if so --> so it must either begin with 0 or end with h
                    jl next_loop
                    ;here it is equals to 5
                    ;check that the first char is 0 or last char is h otherwise --> it is not value --> offset
                    cmp byte ptr [bx], '0' 
                    jne check_if_last_is_h
                    inc bx   ; to go to the next char 
                    dec cl   ; for the loop
                    mov bx,offset operand_B + 1
                    jmp next_loop  
                    
                    
                    
                    
                    check_if_last_is_h: 
                        mov bx, offset operand_B + 4
                        cmp byte ptr [bx], 'h'
                        je  _prepare_to_loop
                        cmp byte ptr [bx], 'H'
                        je _prepare_to_loop
                        jmp far ptr check_if_reg_or_offset  ;if neither not ---> can be offset
                        _prepare_to_loop:
                        ;remove h
                        mov byte ptr [bx], '$'
                        ;dec the size
                        dec size_b
                        ;go to the loop of cx,5 to check that the first char is 0
                        dec cl  ; to be 5 ---> for the next line
                        mov bx,offset operand_B
                        jmp next_loop
                    
                                    
                                
                                    
        jmp next_here_2__
        go_to_not_valid_2_:
        jmp far ptr not_valid
        next_here_2__:  
                
                
                                

                next_loop: 
                dec cl
                cmp cl,0
                ja next_iteration
                inc cl
                    next_iteration:
                    cmp byte ptr [bx],'0'
                    jl check_if_reg_or_offset
                    cmp byte ptr [bx],3Ah  ;':'  --> the ascii of the char after 9 
                    jl end_iteration;is a number

                    cmp byte ptr [bx],'A'
                    jl check_if_reg_or_offset
                    cmp byte ptr [bx],'G'
                    jl end_iteration ; is a cap letter

                    cmp byte ptr [bx],'a'
                    jl check_if_reg_or_offset
                    cmp byte ptr [bx],'g'
                    jl end_iteration; is a small letter
                    
                    jmp check_if_reg_or_offset

                    end_iteration:
                    inc bx 
                    dec cl 
                    jnz next_iteration
                
                
                
                                
                ;now check if all numbers are valid ---> or end with h to be removed
                ;or it is a register or offset 
                
                add byte ptr [bx],30h
                cmp byte ptr [bx],'='
                jne here_1
                mov byte ptr [bx], '$'
                jmp far ptr end_of_validation
                        
                here_1:
                sub byte ptr [bx],30h
                cmp byte ptr [bx],'0'
                jl if_not_number
                cmp byte ptr [bx],3Ah  ;':'  --> the ascii of the char after 9 
                jnl here_2
                jmp far ptr end_of_validation;is a number


                here_2:
                cmp byte ptr [bx],'A'
                jl if_not_number
                cmp byte ptr [bx],'G'
                jnl here_3
                jmp far ptr end_of_validation ; is a cap letter

                here_3:
                cmp byte ptr [bx],'a'
                jl if_not_number
                cmp byte ptr [bx],'g'
                jnl if_not_number
                jmp far ptr end_of_validation; is a small letter
        
                
                
                
                if_not_number:   ; if the last char is not a number so it must be h
                cmp byte ptr [bx], 'h'
                je  here_come
                cmp byte ptr [bx], 'H'
                jne check_if_reg_or_offset               ;modified
                here_come:
                ;remove h
                mov byte ptr [bx], '$'
                ;dec the size
                dec size_b
                jmp far ptr end_of_validation
                
                
                
                                
            ;jmp far ptr end_of_validation

        jmp next_here_2
        go_to_not_valid_2:
        jmp far ptr not_valid
        next_here_2:     


            check_if_reg_or_offset:
                mov al, size_b

                ;if size = 5 --> [0  0-F/f  h]   --> just memo, can't be reg  [0fh] 
                _check_0:
                    cmp al,5
                    jne _check_1
                    mov bx, offset operand_B
                    cmp byte ptr [bx], '['
                    jne go_to_not_valid_1
                    mov bx, offset operand_B + 1
                    cmp byte ptr [bx], '0'
                    jne go_to_not_valid_1
                    mov bx, offset operand_B + 3
                    cmp byte ptr [bx], 'h'
                    je _next_0
                    cmp byte ptr [bx],'H'
                    jne go_to_not_valid_1
                    _next_0:
                        mov bx, offset operand_B + 4
                        cmp byte ptr [bx], ']'
                        jne go_to_not_valid_1
                        ;remove H/h
                        dec bx 
                        mov byte ptr [bx], ']'
                        inc bx 
                        mov byte ptr [bx],'$'
                        dec size_b
                        mov bx, offset operand_B + 2  ;to skip [0 as we will jmp to the label of check value
                        jmp _check_0_to_2


        jmp next_here_1
        go_to_not_valid_1:
        jmp far ptr not_valid
        next_here_1:


                ;first if the size = 4 ---> [reg_name / memo begin with 0->9]  --> e.g., [ax]  , [0A] , [9h]
                ;then check if the first char is [
                _check_1:
                    cmp al,4
                    jne _check_2
                    mov bx, offset operand_B
                    cmp byte ptr [bx], '['
                    jne go_to_not_valid_0
                    mov bx, offset operand_B + 3
                    cmp byte ptr [bx], ']'
                    jne go_to_not_valid_0

                    ;determine wheather it is reg or memo
                    mov bx, offset operand_B + 1
                    ;if memo

                    lable:
                    ;if memo --> add 1 to offset if begin with 0
                    cmp byte ptr [bx],'0'
                    jne _next_1
                    inc bx 
                    jmp _check_0_to_2
                    _next_1:
                        ;if memo --> remove h if end with h
                        ;inc bx
                        inc bx 
                        cmp byte ptr [bx], 'h'
                        jne _next_1_1
                        ;remove h
                        mov byte ptr [bx], ']'
                        inc bx 
                        mov byte ptr [bx], '$'
                        dec size_b
                        sub bx,2
                        jmp _check_0_to_2
                    _next_1_1:
                        cmp byte ptr [bx], 'H'
                        je _8_next_ 
                        mov bx, offset operand_B + 1
                        jmp far ptr _check1_char_1_frist_option
                        _8_next_:
                        ;remove H
                        mov byte ptr [bx], ']'
                        inc bx 
                        mov byte ptr [bx], '$'
                        dec size_b 
                        sub bx,2
                        jmp _check_0_to_2  
                        
                        
                        
                        

        jmp next_here_0
        go_to_not_valid_0:
        jmp not_valid
        next_here_0:         

                ;second if the size = 3 ---> [value 0->9]   [0->9]
                _check_2:
                    cmp al,3
                    jne _check_3
                    ;if equal --> then make sure it is a value between 0 --> F
                    mov bx, offset operand_B
                    mov al, [bx]
                    cmp al,'['
                    je _13_next
                    jmp far ptr not_valid
                    _13_next:
                        mov bx, offset operand_B + 2 
                        mov al, [bx]
                        cmp al,']'
                        je _14_next
                        jmp far ptr not_valid
                    _14_next:
                    mov bx, offset operand_B + 1 ; +1 to skip the [
                    _check_0_to_2:    ;[value 0->f/F]   [0->9]
                        mov al, [bx]
                        mov cx,22   ;22 --> the size of array of valid_values_memo 
                        mov di, offset valid_values_memo
                        REPNE SCASB
                        cmp cx, 0
                        jg go_to_end_of_validation
                        cmp al,'F'
                        jne go_to_not_valid
                        jmp end_of_validation

        jmp next_go
        go_to_end_of_validation:
        jmp far ptr end_of_validation
        next_go:


                ;third if the size = 2  --> reg_name only
                _check_3:
                    mov al, size_b
                    cmp al,2
                    jne go_to_not_valid
                    mov bx, offset operand_B

                    _check1_char_1_frist_option:
                        ;frist char  --> 61h:64h  or  41h:44h  or  53h  or  73h      -->    a:d  or A:D  or  S  or s
                        mov di, offset first_char_reg_option_1
                        mov al, [bx]
                        mov cx,4  ; 8 --> size of the array above
                        REPNE scasb
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        jne _check1_char_2_first_option
                        cmp al, 'c'
                        je _check1_char_2_first_option 
                        dec bx
                        jmp _check1_char_1_second_option  ; i know that no need to write this jmp as it is the next line --> but it is for me to notice temp. !!!!!!!!!!!!!!!!!!!!





                    _check1_char_1_second_option:   
                        mov di, offset first_char_reg_option_2
                        mov al, [bx]
                        mov cx,2  ; 2 --> size of the array above
                        REPNE scasb
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        jne _check1_char_2_second_option
                        cmp al, 's'
                        je _check1_char_2_second_option 
                        dec bx
                        jmp _check1_char_1_third_option
                



                    _check1_char_1_third_option:
                        mov di, offset first_char_reg_option_3
                        mov al, [bx]
                        mov cx,2  ; 2 --> size of the array above
                        REPNE scasb
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        jne _check1_char_2_third_option
                        cmp al, 'b'
                        je _check1_char_2_third_option  
                        dec bx
                        jmp _check1_char_1_fourth_option

        jmp next_here
        go_to_not_valid:
        jmp not_valid
        next_here:



                    _check1_char_1_fourth_option:
                        mov di, offset first_char_reg_option_4
                        mov al, [bx]
                        mov cx,2  ; 2 --> size of the array above
                        REPNE scasb
                        inc bx
                        CMP CX,0   ;if reach 0 ---> 2 options --> either = last element    /or   doesn't exist 
                        jne _check1_char_2_fourth_option
                        cmp al, 'd'
                        je _check1_char_2_fourth_option
                        dec bx
                        jmp not_valid



        ;;;;;;;;;;;;;;;;;;;;;;;;;;




                    _check1_char_2_first_option:
                        mov di, offset second_char_reg_option_1
                        mov al,[BX]  ; +1  --> second byte (char)
                        mov cx,6
                        REPNE scasb
                        cmp cx,0
                        je next_line
                        jmp far ptr end_of_validation
                        next_line:
                        cmp al,'x'
                        jne next_line_1 
                        jmp far ptr end_of_validation
                        next_line_1:
                        jmp not_valid
                        




                    _check1_char_2_second_option:
                        mov di, offset second_char_reg_option_2
                        mov al, [BX]  
                        mov cx,4
                        REPNE scasb
                        cmp cx,0
                        je next_line_2
                        jmp far ptr end_of_validation
                        next_line_2:
                        cmp al,'p'
                        jne not_valid 
                        jmp far ptr end_of_validation
                        jmp not_valid





                    _check1_char_2_third_option:
                        mov di, offset second_char_reg_option_3
                        mov al, [BX]  
                        mov cx,8
                        REPNE scasb
                        cmp cx,0
                        je next_line_3
                        jmp far ptr end_of_validation
                        next_line_3:
                        cmp al,'p'
                        jne not_valid
                        jmp far ptr end_of_validation 
                        ;jmp not_valid





                    _check1_char_2_fourth_option:
                        mov di, offset second_char_reg_option_4
                        mov al, [BX]  
                        mov cx,8
                        REPNE scasb
                        cmp cx,0
                        jne end_of_validation
                        cmp al,'x'
                        je end_of_validation 
                        jmp not_valid
                            
                            
                            
                        
                            
        

        jmp end_of_validation
        not_valid:
            ;if not valid ---> then  --->  1- update the points --> dec by 1  ///   2- don't execute the command
            dec_points_by_1:
                dec _p1_points

            JMP DO_NOT_ExecuteCommand
            



        end_of_validation:

        
        call Check_some_errors
        ;execute command operand_A,operand_B
        CMP _valid_,1
        JZ jmp_send_data
        JMP clear_what_player1_typed
        ;FORBIDDEN
jmp_send_data:
jmp send_data
        EXEC_COMMAND:


        mov _player_proc,2

        GO_EXEC_COMMAND_AFTER_RECIEVING: 
        call  ExecuteCommand
        jmp clear_what_player1_typed



 DO_NOT_ExecuteCommand:
        jmp Official_Game_loop

clear_what_player1_typed:
     push es
            mov cx,24 ;Column
            mov dx,176 ;184-8(no +1 here as above)
            mov al,3 ;Pixel color
            mov bx,320 ;width=320 
            ;add bx,cx;now bx is the width+cx
            mov es,bx;(m.s if it is valid?!!)es is the width 
            mov bx,8;15 is the rectangle height   
            add bx,dx; now bx is the height+dx:50=30+20
            call draw_rectangle
    pop es

;now it is time to send all variables to other player





    ; push ax
    ; push bx
    ; push cx
    ; push dx
    ; push si
    ; push di
    ; push Bp
    ; pushf

    ; ; Flying_Object_full_proc
    ; ;initialize gun position
    ; ;for P1:
    ; Mov cx,150
    ; Mov dx,170   
    ; mov current_gun_x_P1,cx
    ; mov current_gun_y_P1,dx
    ; call Draw_gun
    ; ;for P2:
    ; Mov cx,165
    ; Mov dx,170   
    ; mov current_gun_x_P2,cx
    ; mov current_gun_y_P2,dx
    ; call Draw_gun
    ; ;-------------------------------   

    ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;flying_object:;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; ;put the color of the certain circle in current_cicle_color(i will choose 4 (circle#5)here)
    ; Mov al, 5;4 here is the circle color
    ; mov current_cicle_color,al
    ; ;--------
    ; ;;chose the player that you want to show 3ndo the flying obj to 
    ; ;1)set the required gun x, y locations
    ; ;2)the required circle center x, y locations
    ; ;3)set the required x_circle_right_limit
    ; ;4)set current_player : 1->P1 , 2->P2
    ; ;5)set gun limits
    ; ;as following:(i will choose p1 here)
    ; ;1-set the required gun x, y locations
    ; mov ax,current_gun_x_P1
    ; mov gun_x,ax
    ; mov ax,current_gun_y_P1
    ; mov gun_y,ax
    ; ;---
    ; ;2-the required circle center x, y locations
    ; ;for P1:current_circle_center_x=15 and current_circle_center_y=24
    ; ;for P2:current_circle_center_x=175(160+15) (NOT same as P1) and current_circle_center_y=24(same as P1)
    ; mov ax,7;x of the center: 
    ; mov current_circle_center_x,ax
    ; mov ax,24;y of the center: 
    ; mov current_circle_center_y,ax
    ; ;------
    ; ;3-set the required x_circle_right_limit
    ; mov ax,x_circle_right_limit_P1
    ; mov x_circle_right_limit,ax
    ; ;-----
    ; ;4-set current_player : 1->P1 , 2->P2
    ; mov al,1
    ; mov current_player,al
    ; ;-----
    ; ;5-set gun limits
    ; mov ax,left_limit_gun_P1
    ; mov left_limit_gun,ax
    ; ;-
    ; mov ax,right_limit_gun_P1
    ; mov right_limit_gun,ax
    ; ;-
    ; mov ax,upper_limit_gun_P1
    ; mov upper_limit_gun,ax
    ; ;-
    ; mov ax,lower_limit_gun_P1
    ; mov lower_limit_gun,ax
    ; ;------------
    ; Looperand_A1:
    ; ;-------
    ; ;Pop cx
    ; ;Pop dx 
    ; ;check if shouted 
    ; cmp bool_Shouted,1
    ; jnz Looperand_B;jmp to dynamic circle immeditaly if there is NO shout
    ; mov dx,shout_y
    ; mov cx,shout_x 
    ; mov al,0 ;Pixel color
    ; mov ah,0ch ;Draw Pixel Command
    ; int 10h
    ; ;-------------------------------   
    ; push cx
    ; push dx
    ; call retreive_all
    ; pop dx
    ; pop cx

    ; ;---
    ; ;dec dx
    ; sub dx,3
    ; mov shout_y,dx

    ; ; Check if shout hit the circle
    ; Cmp dx,30;24(y of the center of the circle)+6(circle radius)
    ; ;Jnz Looperand_B;;???jnz or jc or jnc ?as is dx may be less than or = ?not only = y3ny?
    ; jnc still_shouting;jmp if dx>30(==the shout still lower than the circle level)
    ; ;---
    ; mov al,0
    ; mov bool_Shouted,al
    ; cmp dx,17
    ; jc  Looperand_B
    ; ;--
    ; ;if dx<=30 , then check
    ; ;mov ax,current_circle_center_x
    ; ;sub ax,6
    ; ;Cmp Cx,az
    ; ;---
    ; mov al,1
    ; mov bool_Shouted,al
    ; mov di,current_circle_center_x
    ; mov si,current_circle_center_y
    ; call calc_cx2
    ; cmp cx,38;38=26 +1 +1:not 25
    ; ;jc print_pixel 
    ; jnc scip_jmp_hitted
    ; mov al,1
    ; mov bool_hitted,al
    ; jmp looperand_B
    ; ;jmp far ptr hitted_circle
    ; ;--
    ; ;cmp cx,current_circle_center_x
    ; ;jnz scip_jmp_hitted
    ; ;jmp far ptr hitted_circle
    ; ;Jnz Looperand_B;;???jnz or jc or jnc ?as is cx may be less than or = ?not only = y3ny?
    ; ;draw pixel in its new location
    ; scip_jmp_hitted:
    ; still_shouting:
    ; mov dx,shout_y
    ; mov cx,shout_x 
    ; mov al,5 ;Pixel color
    ; mov ah,0ch ;Draw Pixel Command
    ; int 10h
    ; ;------
    ; Looperand_B: 
    ; mov di,current_circle_center_x 
    ; mov si,current_circle_center_y
    ; ;Draw Black rectangular with cx1,dx1, height=12, width=12
    ; mov cx,di ;Column 
    ; sub cx,6
    ; mov dx,si ;184-8(no +1 here as above)   
    ; sub dx,6
    ; mov al,0 ;Pixel color
    ; mov bx,13 ;width=320 
    ; add bx,cx;now bx is the width+cx
    ; mov es,bx;(m.s if it is valid?!!)es is the width 
    ; mov bx,13;15 is the rectangle height   
    ; add bx,dx; now bx is the height+dx:50=30+20
    ; call draw_rectangle       
    ; ;---
    ; Push ax
    ; mov al,bool_hitted
    ; cmp al,1
    ; jnz draw_flying_obj
    ; jmp far ptr hitted_circle
    ; ;---
    ; ;;??:Pop ax
    ; draw_flying_obj:
    ; ;Draw circle with cx1,dx1,center(x,y)=(cx1+6,dx1+6) 
    ; mov di,current_circle_center_x 
    ; mov si,current_circle_center_y 
    ; inc di 
    ; cmp di,x_circle_right_limit;assume i want the circel to desappear at the position x=140 
    ; jnz not_far 
    ; ;clear the shout
    ; mov cx,shout_x;Column
    ; mov dx,shout_y ;Row 
    ; mov al,0;Pixel color
    ; mov ah,0ch ;Draw Pixel Command
    ; int 10h
    ; push cx
    ; push dx
    ; call retreive_all
    ; pop dx
    ; pop cx
    ; jmp far ptr end1
    ; not_far:


    ; mov current_circle_center_x,di
    ; ;;mov cx,0  
    ; mov dx,si
    ; sub dx,6;dx=dx-radius
    ; ;;mov dx,45;dx=(y of the center)- radius=si-readius 
    ; mov bx,di
    ; sub bx,6;bx=bx-radius
    ; ;;mov bx,5;bx=(x of the center)- radius=di-readius(m.s of di)
    ; ;bx will be cx inside the draw_circle_proc 
    ; mov al,current_cicle_color
    ; call draw_circle_proc 
    
    ; Pop ax
    ; ;delay:
    ; call delay_unit
    ; Mov ah,1
    ; Int 16h
    ; Cmp ah,1 
    ; ;;;Jz Looperand_A
    ; jnz not_far2
    ; ;Cmp al,left arrow scan code 
    ; jmp far ptr Looperand_A1

    ; not_far2:
    ; ;jnz end1

    ; mov ah,0
    ; int 16h

    ; Cmp al,20h
    ; jnz check_gun_movment
    ; ;Jz here_g
    ; here_g:
    ; jmp far ptr gun_shot

    ; ;if no any movw in any direction:

    ; check_gun_movment:
    ; cmp ah,75d;(m.s) 4B=left arrow sacn code
    ; Jz mv_gun_left
    ; ;Cmp al, right arrow scan code 
    ; cmp ah,77d;(m.s) 77=rightt arrow sacn code
    ; Jz mv_gun_right
    ; cmp ah,72d;(m.s) 77=rightt arrow sacn code
    ; Jz mv_gun_up
    ; cmp ah,80d;(m.s) 77=rightt arrow sacn code
    ; Jz mv_gun_down
    ; ; Cmp al,20h
    ; ; ;Jz gun_shot
    ; ; ;Jz here_g
    ; ; jnz escape_shout
    ; ; here_g:
    ; ; jmp far ptr gun_shot

    ; ; ;if no any movw in any direction:
    ; ; escape_shout:
    ; ; Jmp again1

    ; ;---------------
    ; ;--------------------------
    ; mv_gun_left:
    ; mov cx,gun_x
    ; ;--
    ; cmp cx,left_limit_gun
    ; ;jz again1
    ; ;jz jum_again_far
    ; jc jum_again_far
    ; ;--
    ; mov temp_gun_x,cx
    ; sub cx,3
    ; mov gun_x,cx 
    ; ;--
    ; mov dx,gun_y
    ; mov temp_gun_y,dx
    ; ;--
    ; jmp move_gun
    ; ;--------------------------
    ; mv_gun_right:
    ; mov cx,gun_x
    ; ;--
    ; cmp cx,right_limit_gun
    ; ;jz again1
    ; ;jz jum_again_far
    ; jnc jum_again_far
    ; ;--
    ; mov temp_gun_x,cx
    ; add cx,3
    ; mov gun_x,cx 
    ; ;--
    ; mov dx,gun_y
    ; mov temp_gun_y,dx
    ; ;--
    ; jmp move_gun
    ; ;--------------------------
    ; mv_gun_up:
    ; mov dx,gun_y
    ; ;--
    ; cmp dx,upper_limit_gun
    ; ;jz again1
    ; ;jz jum_again_far
    ; jc jum_again_far
    ; ;--
    ; mov temp_gun_y,dx
    ; sub dx,3
    ; mov gun_y,dx  
    ; ;--
    ; mov cx,gun_x
    ; mov temp_gun_x,cx
    ; ;--
    ; jmp move_gun
    ; ;--------------------------
    ; mv_gun_down:
    ; mov dx,gun_y
    ; ;--
    ; cmp dx,lower_limit_gun
    ; ;jz again1
    ; ;jz jum_again_far
    ; jnc jum_again_far
    ; ;--
    ; mov temp_gun_y,dx
    ; add dx,3
    ; mov gun_y,dx 
    ; ;--
    ; mov cx,gun_x
    ; mov temp_gun_x,cx
    ; ;--
    ; jmp move_gun
    ; ;----
    ; jum_again_far:
    ; jmp far ptr again1
    ; ;--------------------------
    ; move_gun:
    ; mov cx,temp_gun_x 
    ; mov dx,temp_gun_y
    ; dec dx 
    ; ;mov gun_y,dx
    ; ;----
    ; mov al,0 ;Pixel color
    ; mov bx,7 ;width=320 
    ; add bx,cx;now bx is the width+cx
    ; mov es,bx;(m.s if it is valid?!!)es is the width 
    ; mov bx,6;15 is the rectangle height   
    ; add bx,dx; now bx is the height+dx:50=30+20
    ; call draw_rectangle  
    ; ;-------------------------------   
    ; ;call  draw_G_S  
    ; ;--
    ; ; ; ;give to each regs its old value (the value before clearing)
    ; ; ; ;for regs of P1:
    ; ; ; mov dl,6
    ; ; ; mov di, offset reg_AX_V_P1  
    ; ; ; call retreive_regs_v 
    ; ; ; ;for regs of P2:
    ; ; ; mov dl,25
    ; ; ; mov di, offset reg_AX_V_P2  
    ; ; ; call retreive_regs_v 
    ; ;-------------------------------   
    ; mov cx,gun_x 
    ; mov dx,gun_y
    ; call Draw_gun
    ; Jmp again1

    ; gun_shot:;first time (shouting time)
    ; Push ax
    ; Mov al,bool_Shouted
    ; Cmp al,1
    ; Jz end_shot
    ; Mov al,1
    ; Mov bool_Shouted,al
    ; Pop ax
    ; ;Draw shout pixel
    ; mov cx,gun_x 
    ; mov dx,gun_y
    ; add cx,3
    ; Sub dx,2 
    ; ;Draw pixel:-?? 
    ; mov shout_y,dx
    ; mov shout_x,cx
    ; mov al,5
    ; mov ah,0ch ;Draw Pixel Command
    ; int 10h
    ; ;Mov di,dx
    ; ;Mov si,cx
    ; ;Push dx;dx,cx here is the shout pixel location
    ; ;Push cx
    ; ; mov dx,shout_y
    ; ; mov cx,shout_x
    ; end_shot: ;as i will allow one shout 

    ; again1:
    ; Jmp far ptr Looperand_A1
    ; ;Jmp Looperand_B
    ; hitted_circle:
    ; ;Inc the circle (with a certain color ) score 
    ; ;NOTE:crcle colors are 2,3,4,5,6 
    ; ;dl=18 for P1
    ; ;dl=21 for P2
    ; ;--
    ; ;for both:
    ; mov ah,current_player
    ; ;--
    ; mov al,current_cicle_color
    ; cmp al,2
    ; ;jz update_circle1_score
    ; jnz circe2_check
    ; jmp far ptr update_circle1_score
    ; ;---
    ; circe2_check:
    ; cmp al,3
    ; ;jz update_circle2_score
    ; jnz circe3_check
    ; jmp far ptr update_circle2_score
    ; ;---
    ; circe3_check:
    ; cmp al,4
    ; ;jz update_circle3_score
    ; jnz circe4_check
    ; jmp far ptr update_circle3_score
    ; circe4_check:
    ; cmp al,5
    ; ;jz update_circle4_score
    ; jnz circe5_check
    ; jmp far ptr update_circle4_score
    ; circe5_check:
    ; cmp al,6
    ; ;jz update_circle5_score
    ; ;jnz error_on_update_circle_score
    ; jmp far ptr update_circle5_score
    ; ;----------
    ; ;----------
    ; update_circle1_score:
    ; cmp ah,1
    ; jnz p2_circle1
    ; mov dl,18
    ; ;mov ax,circle1_P1
    ; mov ah,circle1_P1 
    ; add ah,1
    ; mov circle1_P1,ah  
    ; mov di,offset circle1_P1
    ; mov dh,08
    ; jmp both_ps1
    ; ;--
    ; p2_circle1:
    ; mov dl,21
    ; mov ah,circle1_P2 
    ; add ah,1
    ; mov circle1_P2,ah  
    ; mov di,offset circle1_P2
    ; mov dh,08
    ; ;--
    ; both_ps1:
    ; mov bl,al
    ; push cx
    ; mov ch,4
    ; ;ROL bl,4                                                               ;doaa modified
    ; call Print_MSG
    ; pop cx
    ; ;--
    ; jmp end_flying_object
    ; ;----------
    ; update_circle2_score:
    ; cmp ah,1
    ; jnz p2_circle2
    ; mov dl,18
    ; ;mov ax,circle1_P1
    ; mov ah,circle2_P1 
    ; add ah,2
    ; mov circle2_P1,ah  
    ; mov di,offset circle2_P1
    ; mov dh,10d
    ; jmp both_ps2
    ; ;--
    ; p2_circle2:
    ; mov dl,21
    ; mov ah,circle2_P2 
    ; add ah,2
    ; mov circle2_P2,ah  
    ; mov di,offset circle2_P2
    ; mov dh,10d
    ; ;--
    ; both_ps2:
    ; mov bl,al
    ; push cx
    ; mov ch,4
    ; ;ROL bl,4                                                                           ;doaa modified
    ; call Print_MSG
    ; pop cx
    ; ;--
    ; jmp end_flying_object
    ; ;----------
    ; update_circle3_score:
    ; cmp ah,1
    ; jnz p2_circle3
    ; mov dl,18
    ; ;mov ax,circle1_P1
    ; mov ah,circle3_P1 
    ; add ah,3
    ; mov circle3_P1,ah  
    ; mov di,offset circle3_P1
    ; mov dh,12d
    ; jmp both_ps3
    ; ;--
    ; p2_circle3:
    ; mov dl,21
    ; mov ah,circle3_P2 
    ; add ah,3
    ; mov circle3_P2,ah  
    ; mov di,offset circle3_P2
    ; mov dh,12d
    ; ;--
    ; both_ps3:
    ; mov bl,al
    ; push cx
    ; mov ch,4
    ; ;ROL bl,4                                                                               ;doaa modified
    ; call Print_MSG
    ; pop cx
    ; ;--
    ; jmp end_flying_object
    ; ;----------
    ; update_circle4_score:
    ; cmp ah,1
    ; jnz p2_circle4
    ; mov dl,18
    ; ;mov ax,circle1_P1
    ; mov ah,circle4_P1 
    ; add ah,4
    ; mov circle4_P1,ah  
    ; mov di,offset circle4_P1
    ; mov dh,14
    ; jmp both_ps4
    ; ;--
    ; p2_circle4:
    ; mov dl,21
    ; mov ah,circle4_P2 
    ; add ah,4
    ; mov circle4_P2,ah  
    ; mov di,offset circle4_P2
    ; mov dh,14
    ; ;--
    ; both_ps4:
    ; mov bl,al
    ; push cx
    ; mov ch,4
    ; ;ROL bl,4                                                                               ;doaa modified                                                                
    ; call Print_MSG
    ; pop cx
    ; ;--
    ; jmp end_flying_object
    ; ;----------
    ; update_circle5_score:
    ; cmp ah,1
    ; jnz p2_circle5
    ; mov dl,18
    ; ;mov ax,circle1_P1
    ; mov ah,circle5_P1 
    ; add ah,5
    ; mov circle5_P1,ah  
    ; mov di,offset circle5_P1
    ; mov dh,16
    ; jmp both_ps5
    ; ;--
    ; p2_circle5:
    ; mov dl,21
    ; mov ah,circle5_P2 
    ; add ah,5
    ; mov circle5_P2,ah  
    ; mov di,offset circle5_P2
    ; mov dh,16
    ; ;--
    ; both_ps5:
    ; mov bl,al
    ; push cx
    ; mov ch,4
    ; ;ROL bl,4                                                                               ;doaa modified
    ; call Print_MSG
    ; pop cx
    ; ;--
    ; jmp end_flying_object
    ; ;----------

    ; end1: 
    ; error_on_update_circle_score:
    ; ;later ana bmot
    ; mov al,current_player
    ; cmp al,1
    ; jnz end_flying_object
    ; ;repeat for player2:
    ; mov ax,current_gun_x_P2
    ; mov gun_x,ax
    ; mov ax,current_gun_y_P2
    ; mov gun_y,ax
    ; ;---
    ; ;2-the required circle center x, y locations
    ; ;for P1:current_circle_center_x=15 and current_circle_center_y=24
    ; ;for P2:current_circle_center_x=175(160+15) (NOT same as P1) and current_circle_center_y=24(same as P1)
    ; mov ax,173;x of the center: 
    ; mov current_circle_center_x,ax
    ; mov ax,24;y of the center: 
    ; mov current_circle_center_y,ax
    ; ;------
    ; ;3-set the required x_circle_right_limit
    ; mov ax,x_circle_right_limit_P2
    ; mov x_circle_right_limit,ax
    ; ;-----
    ; ;4-set current_player : 1->P1 , 2->P2
    ; mov al,2
    ; mov current_player,al
    ; ;-----
    ; ;5-set gun limits
    ; mov ax,left_limit_gun_P2
    ; mov left_limit_gun,ax
    ; ;-
    ; mov ax,right_limit_gun_P2
    ; mov right_limit_gun,ax
    ; ;-
    ; mov ax,upper_limit_gun_P2
    ; mov upper_limit_gun,ax
    ; ;-
    ; mov ax,lower_limit_gun_P2
    ; mov lower_limit_gun,ax
    ; ;-------
    ; ;6-reset bool_shout
    ; mov al,0
    ; mov bool_Shouted,al
    ; ;---
    ; ;7-reset bool hitted
    ; mov al,0
    ; mov bool_hitted,al
    ; ;------------
    ; Jmp far ptr Looperand_A1


    ; end_flying_object:
   



    ; popf
    ; pop Bp
    ; pop di
    ; pop si
    ; pop dx
    ; pop cx
    ; pop bx
    ; pop ax


    ;flushing buffer
    mov ah,0ch
    mov al,0
    int 21h

    ;set cursor

    ;show msg
    mov ah, 9
    mov dx, offset MSGINLINECHAT
    int 21h
    ;get char
    mov ah,0
    int 16h
    ;validate if Y,y
    cmp ah,21d;for y check
    jz INCHATTING
    jmp far ptr Official_Game_loop 

    INCHATTING:
    
    ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
        AGAINCHAT:  	In al , dx 			;Read Line Status
        AND al , 00100000b
        JZ AGAINCHAT

        ;send size_a
        mov dx , 3F8H		; Transmit data register
  		mov  al,21d
  		out dx , al

    RecYforChat:
    call CHAT

    



jmp Official_Game_loop

;jmp finish





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;game part;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


finish:





exit:

    quittingTheProg:
    MOV AH, 4CH
    MOV AL, 00 ;your return code.
    INT 21H

Main ENDP 
end Main



