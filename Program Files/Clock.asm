
_set_dnt_string:

;Clock.c,27 :: 		void set_dnt_string(){
;Clock.c,28 :: 		timearr[7] = sec%10+ 48;  // Time Array
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sec+0, 0
	MOVWF      R0+0
	MOVF       _sec+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _timearr+7
;Clock.c,29 :: 		timearr[6] = sec/10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sec+0, 0
	MOVWF      R0+0
	MOVF       _sec+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _timearr+6
;Clock.c,30 :: 		timearr[4] = min%10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _min+0, 0
	MOVWF      R0+0
	MOVF       _min+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _timearr+4
;Clock.c,31 :: 		timearr[3] = min/10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _min+0, 0
	MOVWF      R0+0
	MOVF       _min+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _timearr+3
;Clock.c,32 :: 		timearr[1] = hrs%10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	MOVF       _hrs+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _timearr+1
;Clock.c,33 :: 		timearr[0] = hrs/10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	MOVF       _hrs+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _timearr+0
;Clock.c,35 :: 		datearr[1] = dd%10+ 48;   // Date Array
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _dd+0, 0
	MOVWF      R0+0
	MOVF       _dd+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _datearr+1
;Clock.c,36 :: 		datearr[0] = dd/10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _dd+0, 0
	MOVWF      R0+0
	MOVF       _dd+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _datearr+0
;Clock.c,38 :: 		yrarr[3] = yy%10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _yy+0, 0
	MOVWF      R0+0
	MOVF       _yy+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _yrarr+3
;Clock.c,39 :: 		yrarr[2] = yy%10+ 48;     // Year Array
	MOVF       R0+0, 0
	MOVWF      _yrarr+2
;Clock.c,40 :: 		yrarr[1] = yy/10+ 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _yy+0, 0
	MOVWF      R0+0
	MOVF       _yy+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _yrarr+1
;Clock.c,41 :: 		yrarr[0] = yy/10+ 50;   // Startting from 2000
	MOVLW      50
	ADDWF      R0+0, 0
	MOVWF      _yrarr+0
;Clock.c,42 :: 		}
L_end_set_dnt_string:
	RETURN
; end of _set_dnt_string

_reset:

;Clock.c,44 :: 		void reset(){
;Clock.c,45 :: 		sec = 0, min = 0,hrs= 0 ;     //Reseting  date and time
	CLRF       _sec+0
	CLRF       _sec+1
	CLRF       _min+0
	CLRF       _min+1
	CLRF       _hrs+0
	CLRF       _hrs+1
;Clock.c,46 :: 		dd = 1, mm = 1, yy = 0000;
	MOVLW      1
	MOVWF      _dd+0
	MOVLW      0
	MOVWF      _dd+1
	MOVLW      1
	MOVWF      _mm+0
	MOVLW      0
	MOVWF      _mm+1
	CLRF       _yy+0
	CLRF       _yy+1
;Clock.c,47 :: 		}
L_end_reset:
	RETURN
; end of _reset

_set_dnt:

;Clock.c,49 :: 		void set_dnt(){
;Clock.c,50 :: 		if(halfsec==2){
	MOVLW      0
	XORWF      _halfsec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_dnt36
	MOVLW      2
	XORWF      _halfsec+0, 0
L__set_dnt36:
	BTFSS      STATUS+0, 2
	GOTO       L_set_dnt0
;Clock.c,51 :: 		sec++;
	INCF       _sec+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sec+1, 1
;Clock.c,52 :: 		halfsec=0;
	CLRF       _halfsec+0
	CLRF       _halfsec+1
;Clock.c,53 :: 		}
L_set_dnt0:
;Clock.c,54 :: 		if(sec==60){
	MOVLW      0
	XORWF      _sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_dnt37
	MOVLW      60
	XORWF      _sec+0, 0
L__set_dnt37:
	BTFSS      STATUS+0, 2
	GOTO       L_set_dnt1
;Clock.c,55 :: 		min++;
	INCF       _min+0, 1
	BTFSC      STATUS+0, 2
	INCF       _min+1, 1
;Clock.c,56 :: 		sec = 0 ;
	CLRF       _sec+0
	CLRF       _sec+1
;Clock.c,57 :: 		}
L_set_dnt1:
;Clock.c,58 :: 		if(min==60){
	MOVLW      0
	XORWF      _min+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_dnt38
	MOVLW      60
	XORWF      _min+0, 0
L__set_dnt38:
	BTFSS      STATUS+0, 2
	GOTO       L_set_dnt2
;Clock.c,59 :: 		hrs++;
	INCF       _hrs+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hrs+1, 1
;Clock.c,60 :: 		min=0;
	CLRF       _min+0
	CLRF       _min+1
;Clock.c,61 :: 		}
L_set_dnt2:
;Clock.c,62 :: 		if(hrs==24){
	MOVLW      0
	XORWF      _hrs+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_dnt39
	MOVLW      24
	XORWF      _hrs+0, 0
L__set_dnt39:
	BTFSS      STATUS+0, 2
	GOTO       L_set_dnt3
;Clock.c,63 :: 		dd++;
	INCF       _dd+0, 1
	BTFSC      STATUS+0, 2
	INCF       _dd+1, 1
;Clock.c,64 :: 		hrs=0;
	CLRF       _hrs+0
	CLRF       _hrs+1
;Clock.c,65 :: 		}
L_set_dnt3:
;Clock.c,66 :: 		if(dd==30){
	MOVLW      0
	XORWF      _dd+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_dnt40
	MOVLW      30
	XORWF      _dd+0, 0
L__set_dnt40:
	BTFSS      STATUS+0, 2
	GOTO       L_set_dnt4
;Clock.c,67 :: 		mm++;
	INCF       _mm+0, 1
	BTFSC      STATUS+0, 2
	INCF       _mm+1, 1
;Clock.c,68 :: 		dd=0;
	CLRF       _dd+0
	CLRF       _dd+1
;Clock.c,69 :: 		}
L_set_dnt4:
;Clock.c,70 :: 		if(mm==12){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_dnt41
	MOVLW      12
	XORWF      _mm+0, 0
L__set_dnt41:
	BTFSS      STATUS+0, 2
	GOTO       L_set_dnt5
;Clock.c,71 :: 		yy++;
	INCF       _yy+0, 1
	BTFSC      STATUS+0, 2
	INCF       _yy+1, 1
;Clock.c,72 :: 		mm=0;
	CLRF       _mm+0
	CLRF       _mm+1
;Clock.c,73 :: 		}
L_set_dnt5:
;Clock.c,74 :: 		}
L_end_set_dnt:
	RETURN
; end of _set_dnt

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Clock.c,76 :: 		void interrupt (){
;Clock.c,77 :: 		if(TMR0IF_bit== 1){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt6
;Clock.c,78 :: 		overflows++;
	INCF       _overflows+0, 1
	BTFSC      STATUS+0, 2
	INCF       _overflows+1, 1
;Clock.c,79 :: 		if(overflows==245){
	MOVLW      0
	XORWF      _overflows+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt44
	MOVLW      245
	XORWF      _overflows+0, 0
L__interrupt44:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
;Clock.c,80 :: 		halfsec++;       //Calculating accurate values using TMR0 and interrrupts
	INCF       _halfsec+0, 1
	BTFSC      STATUS+0, 2
	INCF       _halfsec+1, 1
;Clock.c,81 :: 		overflows = 0;
	CLRF       _overflows+0
	CLRF       _overflows+1
;Clock.c,82 :: 		TMR0= 220;
	MOVLW      220
	MOVWF      TMR0+0
;Clock.c,83 :: 		}
L_interrupt7:
;Clock.c,84 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Clock.c,85 :: 		}
L_interrupt6:
;Clock.c,87 :: 		if(INTF_bit==1){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt8
;Clock.c,88 :: 		reset();
	CALL       _reset+0
;Clock.c,89 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;Clock.c,90 :: 		}
L_interrupt8:
;Clock.c,91 :: 		}
L_end_interrupt:
L__interrupt43:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_initialize:

;Clock.c,92 :: 		void initialize(){
;Clock.c,93 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Clock.c,94 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock.c,95 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock.c,96 :: 		PORTD = 0;
	CLRF       PORTD+0
;Clock.c,97 :: 		PORTB = 0;
	CLRF       PORTB+0
;Clock.c,98 :: 		TRISD = 0b00001111; //Port D initializing for geting inputs
	MOVLW      15
	MOVWF      TRISD+0
;Clock.c,99 :: 		INTCON = 0b10110000; //Timer0 flag biy initialize for 0, Timer0 Enabaling, Global Interruption enabaling, RB0 nterrrupt enabaling and Flag to 0
	MOVLW      176
	MOVWF      INTCON+0
;Clock.c,100 :: 		OPTION_REG = 0b10010010; // Selecting internal clock, Pre scaler enabaling, and set to 1:8 Interrupt set on falling edge
	MOVLW      146
	MOVWF      OPTION_REG+0
;Clock.c,101 :: 		TMR0 = 247;      //Timer0 initial Value holding 247 to maintance accuracy of clock
	MOVLW      247
	MOVWF      TMR0+0
;Clock.c,102 :: 		Lcd_Out(2,3, "Time:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,103 :: 		Lcd_Out(3,3, "Date:");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,104 :: 		}
L_end_initialize:
	RETURN
; end of _initialize

_time_adj:

;Clock.c,105 :: 		void time_adj(){
;Clock.c,106 :: 		if(PORTD.B0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_time_adj9
;Clock.c,107 :: 		hrs++;
	INCF       _hrs+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hrs+1, 1
;Clock.c,108 :: 		Delay_ms(300);     // Treating for debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_time_adj10:
	DECFSZ     R13+0, 1
	GOTO       L_time_adj10
	DECFSZ     R12+0, 1
	GOTO       L_time_adj10
	DECFSZ     R11+0, 1
	GOTO       L_time_adj10
;Clock.c,109 :: 		}
L_time_adj9:
;Clock.c,110 :: 		if(PORTD.B1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_time_adj11
;Clock.c,111 :: 		hrs--;
	MOVLW      1
	SUBWF      _hrs+0, 1
	BTFSS      STATUS+0, 0
	DECF       _hrs+1, 1
;Clock.c,112 :: 		Delay_ms(300);   // Treating for debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_time_adj12:
	DECFSZ     R13+0, 1
	GOTO       L_time_adj12
	DECFSZ     R12+0, 1
	GOTO       L_time_adj12
	DECFSZ     R11+0, 1
	GOTO       L_time_adj12
;Clock.c,113 :: 		}
L_time_adj11:
;Clock.c,114 :: 		if(PORTD.B2==1){
	BTFSS      PORTD+0, 2
	GOTO       L_time_adj13
;Clock.c,115 :: 		min++;
	INCF       _min+0, 1
	BTFSC      STATUS+0, 2
	INCF       _min+1, 1
;Clock.c,116 :: 		Delay_ms(300);     // Treating for debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_time_adj14:
	DECFSZ     R13+0, 1
	GOTO       L_time_adj14
	DECFSZ     R12+0, 1
	GOTO       L_time_adj14
	DECFSZ     R11+0, 1
	GOTO       L_time_adj14
;Clock.c,117 :: 		}
L_time_adj13:
;Clock.c,118 :: 		if(PORTD.B3==1){
	BTFSS      PORTD+0, 3
	GOTO       L_time_adj15
;Clock.c,119 :: 		min--;
	MOVLW      1
	SUBWF      _min+0, 1
	BTFSS      STATUS+0, 0
	DECF       _min+1, 1
;Clock.c,120 :: 		Delay_ms(300);     // Treating for debouncing
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_time_adj16:
	DECFSZ     R13+0, 1
	GOTO       L_time_adj16
	DECFSZ     R12+0, 1
	GOTO       L_time_adj16
	DECFSZ     R11+0, 1
	GOTO       L_time_adj16
;Clock.c,121 :: 		}
L_time_adj15:
;Clock.c,122 :: 		}
L_end_time_adj:
	RETURN
; end of _time_adj

_theam:

;Clock.c,123 :: 		void theam(){
;Clock.c,124 :: 		Lcd_Out(1,1,"--------CLOCK-------");  //This part is not necessary.This is using to give more look for our clock
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,125 :: 		Lcd_Out(4,1,"-----ByMethsara-----");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,126 :: 		Lcd_Out(3,16,"-"); // Date formatings
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,127 :: 		Lcd_Out(3,12,"-"); // Date formatings
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,128 :: 		}
L_end_theam:
	RETURN
; end of _theam

_blink:

;Clock.c,130 :: 		void blink(){
;Clock.c,131 :: 		if(halfsec==1){
	MOVLW      0
	XORWF      _halfsec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__blink49
	MOVLW      1
	XORWF      _halfsec+0, 0
L__blink49:
	BTFSS      STATUS+0, 2
	GOTO       L_blink17
;Clock.c,132 :: 		Lcd_Out(2,20,".");     //In Simulation we cant see suddern changers in array. To representing the blink of colons I have used "." in end of second line.
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      20
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,133 :: 		Lcd_Out(2,13,":");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,134 :: 		Lcd_Out(2,10,":");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,135 :: 		}
L_blink17:
;Clock.c,136 :: 		if(halfsec==0){
	MOVLW      0
	XORWF      _halfsec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__blink50
	MOVLW      0
	XORWF      _halfsec+0, 0
L__blink50:
	BTFSS      STATUS+0, 2
	GOTO       L_blink18
;Clock.c,137 :: 		Lcd_Out(2,20," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      20
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,138 :: 		Lcd_Out(2,13," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,139 :: 		Lcd_Out(2,10," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,140 :: 		}
L_blink18:
;Clock.c,141 :: 		}
L_end_blink:
	RETURN
; end of _blink

_month:

;Clock.c,142 :: 		void month(){
;Clock.c,143 :: 		if(mm==1){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month52
	MOVLW      1
	XORWF      _mm+0, 0
L__month52:
	BTFSS      STATUS+0, 2
	GOTO       L_month19
;Clock.c,144 :: 		Lcd_Out(3,13,"Jan");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,145 :: 		}
L_month19:
;Clock.c,146 :: 		if(mm==2){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month53
	MOVLW      2
	XORWF      _mm+0, 0
L__month53:
	BTFSS      STATUS+0, 2
	GOTO       L_month20
;Clock.c,147 :: 		Lcd_Out(3,13,"Feb");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,148 :: 		}
L_month20:
;Clock.c,149 :: 		if(mm==3){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month54
	MOVLW      3
	XORWF      _mm+0, 0
L__month54:
	BTFSS      STATUS+0, 2
	GOTO       L_month21
;Clock.c,150 :: 		Lcd_Out(3,13,"Mar");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,151 :: 		}
L_month21:
;Clock.c,152 :: 		if(mm==4){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month55
	MOVLW      4
	XORWF      _mm+0, 0
L__month55:
	BTFSS      STATUS+0, 2
	GOTO       L_month22
;Clock.c,153 :: 		Lcd_Out(3,13,"Apr");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,154 :: 		}
L_month22:
;Clock.c,155 :: 		if(mm==5){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month56
	MOVLW      5
	XORWF      _mm+0, 0
L__month56:
	BTFSS      STATUS+0, 2
	GOTO       L_month23
;Clock.c,156 :: 		Lcd_Out(3,13,"May");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,157 :: 		}
L_month23:
;Clock.c,158 :: 		if(mm==6){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month57
	MOVLW      6
	XORWF      _mm+0, 0
L__month57:
	BTFSS      STATUS+0, 2
	GOTO       L_month24
;Clock.c,159 :: 		Lcd_Out(3,13,"Jun");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,160 :: 		}
L_month24:
;Clock.c,161 :: 		if(mm==7){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month58
	MOVLW      7
	XORWF      _mm+0, 0
L__month58:
	BTFSS      STATUS+0, 2
	GOTO       L_month25
;Clock.c,162 :: 		Lcd_Out(3,13,"Jul");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,163 :: 		}
L_month25:
;Clock.c,164 :: 		if(mm==8){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month59
	MOVLW      8
	XORWF      _mm+0, 0
L__month59:
	BTFSS      STATUS+0, 2
	GOTO       L_month26
;Clock.c,165 :: 		Lcd_Out(3,13,"Aug");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,166 :: 		}
L_month26:
;Clock.c,167 :: 		if(mm==9){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month60
	MOVLW      9
	XORWF      _mm+0, 0
L__month60:
	BTFSS      STATUS+0, 2
	GOTO       L_month27
;Clock.c,168 :: 		Lcd_Out(3,13,"Sep");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,169 :: 		}
L_month27:
;Clock.c,170 :: 		if(mm==10){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month61
	MOVLW      10
	XORWF      _mm+0, 0
L__month61:
	BTFSS      STATUS+0, 2
	GOTO       L_month28
;Clock.c,171 :: 		Lcd_Out(3,13,"Oct");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr22_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,172 :: 		}
L_month28:
;Clock.c,173 :: 		if(mm==11){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month62
	MOVLW      11
	XORWF      _mm+0, 0
L__month62:
	BTFSS      STATUS+0, 2
	GOTO       L_month29
;Clock.c,174 :: 		Lcd_Out(3,13,"Nov");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,175 :: 		}
L_month29:
;Clock.c,176 :: 		if(mm==12){
	MOVLW      0
	XORWF      _mm+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__month63
	MOVLW      12
	XORWF      _mm+0, 0
L__month63:
	BTFSS      STATUS+0, 2
	GOTO       L_month30
;Clock.c,177 :: 		Lcd_Out(3,13,"Dev");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr24_Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,178 :: 		}
L_month30:
;Clock.c,179 :: 		month();
	CALL       _month+0
;Clock.c,180 :: 		}
L_end_month:
	RETURN
; end of _month

_main:

;Clock.c,181 :: 		void main(){
;Clock.c,182 :: 		initialize();
	CALL       _initialize+0
;Clock.c,183 :: 		while(1){
L_main31:
;Clock.c,184 :: 		set_dnt();
	CALL       _set_dnt+0
;Clock.c,185 :: 		set_dnt_string();
	CALL       _set_dnt_string+0
;Clock.c,186 :: 		theam();
	CALL       _theam+0
;Clock.c,187 :: 		Lcd_Out(2,8,timearr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _timearr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,188 :: 		blink();
	CALL       _blink+0
;Clock.c,189 :: 		Lcd_Out(3,8,yrarr);
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _yrarr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,190 :: 		Lcd_Out(3,17,datearr);
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      17
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _datearr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock.c,191 :: 		time_adj();
	CALL       _time_adj+0
;Clock.c,192 :: 		}
	GOTO       L_main31
;Clock.c,193 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
