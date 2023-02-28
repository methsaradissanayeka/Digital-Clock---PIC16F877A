/*
  By Methsara Dissanayeka
*/

// Lcd pinout settings
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D7 at RC5_bit;
sbit LCD_D6 at RC4_bit;
sbit LCD_D5 at RC3_bit;
sbit LCD_D4 at RC2_bit;

// Pin direction
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D7_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC2_bit;

char timearr[9] = "hh mm ss";
char datearr[3] = "dd";
char yrarr[5]  = "yyyy";
int halfsec = 0, sec = 0, min = 0, hrs = 0, dd = 1, mm = 1, yy = 0000;
int overflows = 0;

void set_dnt_string(){
timearr[7] = sec%10+ 48;  // Time Array
timearr[6] = sec/10+ 48;
timearr[4] = min%10+ 48;
timearr[3] = min/10+ 48;
timearr[1] = hrs%10+ 48;
timearr[0] = hrs/10+ 48;

datearr[1] = dd%10+ 48;   // Date Array
datearr[0] = dd/10+ 48;

yrarr[3] = yy%10+ 48;
yrarr[2] = yy%10+ 48;     // Year Array
yrarr[1] = yy/10+ 48;
yrarr[0] = yy/10+ 50;   // Startting from 2000
}

void reset(){
     sec = 0, min = 0,hrs= 0 ;     //Reseting  date and time
     dd = 1, mm = 1, yy = 0000;
}

void set_dnt(){
    if(halfsec==2){
     sec++;
     halfsec=0;
    }
    if(sec==60){
      min++;
      sec = 0 ;
    }
    if(min==60){
      hrs++;
      min=0;
    }
    if(hrs==24){
      dd++;
      hrs=0;
    }
    if(dd==30){
      mm++;
      dd=0;
    }
    if(mm==12){
      yy++;
      mm=0;
    }
}

void interrupt (){
 if(TMR0IF_bit== 1){
  overflows++;
    if(overflows==245){
       halfsec++;       //Calculating accurate values using TMR0 and interrrupts
       overflows = 0;
       TMR0= 220;
    }
    TMR0IF_bit = 0;
 }
 
 if(INTF_bit==1){
      reset();
      INTF_bit=0;
}
}
void initialize(){
   Lcd_Init();
   Lcd_Cmd(_LCD_CURSOR_OFF);
   Lcd_Cmd(_LCD_CLEAR);
   PORTD = 0;
   PORTB = 0;
   TRISD = 0b00001111; //Port D initializing for geting inputs
   INTCON = 0b10110000; //Timer0 flag biy initialize for 0, Timer0 Enabaling, Global Interruption enabaling, RB0 nterrrupt enabaling and Flag to 0
   OPTION_REG = 0b10010010; // Selecting internal clock, Pre scaler enabaling, and set to 1:8 Interrupt set on falling edge
   TMR0 = 247;      //Timer0 initial Value holding 247 to maintance accuracy of clock
   Lcd_Out(2,3, "Time:");
   Lcd_Out(3,3, "Date:");
}
void time_adj(){
       if(PORTD.B0==1){
        hrs++;
        Delay_ms(300);     // Treating for debouncing
       }
       if(PORTD.B1==1){
        hrs--;
        Delay_ms(300);   // Treating for debouncing
       }
        if(PORTD.B2==1){
        min++;
        Delay_ms(300);     // Treating for debouncing
       }
       if(PORTD.B3==1){
        min--;
        Delay_ms(300);     // Treating for debouncing
       }
}
void theam(){
  Lcd_Out(1,1,"--------CLOCK-------");  //This part is not necessary.This is using to give more look for our clock
  Lcd_Out(4,1,"-----ByMethsara-----");
  Lcd_Out(3,16,"-"); // Date formatings
  Lcd_Out(3,12,"-"); // Date formatings
}

void blink(){
   if(halfsec==1){
     Lcd_Out(2,20,".");     //In Simulation we cant see suddern changers in array. To representing the blink of colons I have used "." in end of second line.
     Lcd_Out(2,13,":");
     Lcd_Out(2,10,":");
    }
   if(halfsec==0){
     Lcd_Out(2,20," ");
     Lcd_Out(2,13," ");
     Lcd_Out(2,10," ");
   }
}
void month(){
      if(mm==1){
        Lcd_Out(3,13,"Jan");
      }
      if(mm==2){
        Lcd_Out(3,13,"Feb");
      }
      if(mm==3){
        Lcd_Out(3,13,"Mar");
      }
      if(mm==4){
        Lcd_Out(3,13,"Apr");
      }
      if(mm==5){
        Lcd_Out(3,13,"May");
      }
      if(mm==6){
        Lcd_Out(3,13,"Jun");
      }
      if(mm==7){
        Lcd_Out(3,13,"Jul");
      }
      if(mm==8){
        Lcd_Out(3,13,"Aug");
      }
      if(mm==9){
        Lcd_Out(3,13,"Sep");
      }
      if(mm==10){
        Lcd_Out(3,13,"Oct");
      }
      if(mm==11){
        Lcd_Out(3,13,"Nov");
      }
      if(mm==12){
        Lcd_Out(3,13,"Dev");
      }
   month();
}
void main(){
 initialize();
       while(1){
          set_dnt();
          set_dnt_string();
          theam();
          Lcd_Out(2,8,timearr);
          blink();
          Lcd_Out(3,8,yrarr);
          Lcd_Out(3,17,datearr);
          time_adj();
       }
}