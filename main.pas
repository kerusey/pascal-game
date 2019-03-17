Program Tanki;
Uses GraphABC;
Var ww,wh,xg,yg,xt1,rx1,rx2,rx3,ry1,ry2,score,ry3,xline,yline,yt1,v0,xs,ys,ry0,rx0,polz:integer;
     j:byte;
     koef,t:real;
     c:color;
     axs: array of integer;
     ays: array of integer;
     b,p:boolean;
Const grass=5;
      Ammo=6;
      
procedure Point1(x,y : integer);
begin
 Rectangle(x-15,y+10,x+15,y+20);
 Rectangle(x-3,y+10,x+3,y-5);
 

end;


procedure tank(xt,yt:integer);
begin
Rectangle(xt,yt,xt-40,yt+15);
Rectangle(xt-25,yt,xt-40,yt-15);
End;

//********************************************************

procedure Sharik(x,y:integer; c:color);
begin
setpencolor(c);
circle(x,y,Ammo);
floodfill(x,y,c);
end;

//****************************


//********************************************************

Procedure KeyDown(key:integer);
    Begin
   Case key of
VK_Escape:CloseWindow;
 //*****************************************
 VK_D: if koef<=3.1+pi then
 Begin
 SetPenWidth(6);
 SetPenColor(clLightBlue);
 SetBrushColor(clLightBlue);
   line(round(xline-34+cos(koef)*5),round(yline-28+sin(koef)*5),round(xline-34+cos(koef)*35),round(yline-28+sin(koef)*35));
  koef:=koef+0.05;


 SetPenColor(clblue);
 SetBrushColor(clBlue);
  line(round(xline-34+cos(koef)*5),round(yline-28+sin(koef)*5),round(xline-34+cos(koef)*35),round(yline-28+sin(koef)*35));
 
 tank(xt1,yt1-20);

 End;
 //**************************************
 VK_A: if koef>=4.95 then
 Begin
 SetPenWidth(6);
 SetPenColor(clLightBlue);
 SetBrushColor(clLightBlue);
   line(round(xline-34+cos(koef)*5),round(yline-28+sin(koef)*5),round(xline-34+cos(koef)*35),round(yline-28+sin(koef)*35));
  koef:=koef-0.05;
  
 SetPenColor(clblue);
 SetBrushColor(clBlue);
  line(round(xline-34+cos(koef)*5),round(yline-28+sin(koef)*5),round(xline-34+cos(koef)*35),round(yline-28+sin(koef)*35));
 
 
 tank(xt1,yt1-20);
 
 End;
//*************************************************************
VK_Right: if (1220+polz) < 1300-15 then
begin
SetPenWidth(2);
if (polz < 5*1300 div 6-10 -1070) then
c := clgreen
else 
if (polz > 5*1300 div 6-10 -1070) then
c := clRed;

SetPenColor(c);
SetBrushColor(c);
line(1220+polz,6,1220+polz,750 div 15-1);

v0 := v0+1;

polz := polz + 4;
SetBrushColor(clBlack);
SetPenColor(clBlack); //5*1300 div 6-10,5,1300-10,750 div 15
line(1220+polz,6,1220+polz,750 div 15-1);

sleep(20);
end;
//************************************************************

VK_left: if (1220+polz) > 5*1300 div 6-5 then
begin
SetPenWidth(2);
if (polz < 5*1300 div 6-10 -1070) then
c := clgreen
else 
if (polz > 5*1300 div 6-10 -1070) then
c := clRed;

SetPenColor(c);
SetBrushColor(c);
line(1220+polz,6,1220+polz,750 div 15-1);

v0 := v0-1;

polz := polz - 4;
SetBrushColor(clBlack);
SetPenColor(clBlack); //5*1300 div 6-10,5,1300-10,750 div 15
line(1220+polz,6,1220+polz,750 div 15-1);

sleep(20);
end;

 //**********************************************************
 VK_Space: if true then
                 begin
         SetPenWidth(5);
         t:=0;
              repeat
          Begin
           
           SetPenColor(clYellow);
           SetBrushColor(clYellow);
          Circle(round(xline-34+cos(koef)*35+AMMO+5+v0*t*cos(koef)),round(yline-28+sin(koef)*35-5+v0*t*sin(koef)+9.8*Sqr(t) / 2),Ammo);
          
          Sleep(10);
          
          SetPenColor(clLightBlue);
          SetBrushColor(clLightBlue);
          Circle(round(xline-34+cos(koef)*35+AMMO+5+v0*t*cos(koef)),round(yline-28+sin(koef)*35-5+v0*t*sin(koef) + 9.8*Sqr(t) / 2),Ammo);
          xs:=round(xline-34+cos(koef)*35+v0*t*cos(koef));
          ys:=round(yline-28+sin(koef)*35+v0*t*sin(koef) + 9.8*Sqr(t) / 2);
            t:= t+0.1;
            
            b:= false;
            p:= false;
            
              For var u := 1 to ww do
               begin
               if (axs[u] = xs) and (ays[u] <= ys) then
               b := true
               end;
            
            if (xs<=rx0+15) and (xs>=rx0-15) and (ys<=ry0) and (ys>=ry0-25) then
            begin
            p:=true;
            score:=score+1;
            
            end;
            
             if (p=true) then
             begin
             setpencolor(clBlack);
             textout(1,1,'score = ');
             TextOut(50,1,score);
             end;
             
             if (b=true)or(p=true) then
             break;
             
             
             
          end;
          until round(yline-28+sin(koef)*35+v0*t*sin(koef) + 9.8*Sqr(t) / 2)>=wh;
          end;
         End;
       //*********************
///************************************************************************************************************************
        End;
//
Begin
ww:=ScreenWidth;
wh:=ScreenHeight;
SetWindowSize(ww,wh);
SetWindowTitle('Tanki');
SetWindowPos(0,0);
FloodFill(1,1,clLightBlue);
koef:=6.25;
v0:=100;
axs := new integer[ww+1];
ays := new integer[ww+1];

//******************************* trava

xg:=1;
yg:=4*(wh div 5);
SetPenColor(clGreen);

Repeat
Begin
line(xg,yg,xg,wh);
yg:=(Random(-grass,+grass)+yg);
xg:=xg+1;
 axs[xg]:= xg; 
 ays[xg]:= yg;
 
 if xg = 200 then
 Begin 
 xt1:= xg;
 yt1:= yg;
 End; 
 
 //************************************************************************************************************
 if xg = 1000 then 
 Begin 
 rx1:= xg;
 ry1:= yg;
 End; 
 
 if xg = 750 then 
 Begin 
 rx2:= xg;
 ry2:= yg;
 End; 
 
 if xg = 500 then 
 Begin 
 rx3:= xg;
 ry3:= yg;
 End; 
 
 //************************************************************************************************************
 
 

If yg >= 3*(wh div 4) then 
begin//****  
repeat
line(xg,yg,xg,wh);
yg:=(Random(-grass,-3)+yg);
xg:=xg+1;

 axs[xg]:= xg; 
 ays[xg]:= yg;
 
 //************************************************************************************************************
 if xg = 1000 then 
 Begin 
 rx1:= xg;
 ry1:= yg;
 End; 
 
 if xg = 750 then 
 Begin 
 rx2:= xg;
 ry2:= yg;
 End; 
 
 if xg = 500 then 
 Begin 
 rx3:= xg;
 ry3:= yg;
 End; 
 
 //************************************************************************************************************

 if xg = 200 then 
 Begin 
 xt1:= xg;
 yt1:= yg;
 End; 
until (yg <= 4*(wh div 5)) or (xg >= ww);

end;//****
End;
Until xg>=ww;
//************************************************** trava
OnKeyDown:=KeyDown;
xline:=xt1;
yline:=yt1; 
SetPenColor(clBlue);
SetBrushColor(clBlue);
SetPenWidth(6);
line(round(xline-34+cos(koef)*5),round(yline-28+sin(koef)*5),round(xline-34+cos(koef)*35),round(yline-28+sin(koef)*35));
tank(xt1,yt1-20);


SetPenColor(clBlack);
SetBrushColor(clWhite);
SetPenWidth(2);
Rectangle(5*1300 div 6-10,5,1300-10,750 div 15);
SetpenColor(clRed);
SetBrushColor(clRed);
line(1220,6,1220,750 div 15-1);
FloodFill(1210,7,clGreen);
FloodFill(1230,7,clRed);


j:=Random(3)+1;
SetBrushColor(clRed);
SetPenColor(clRed);

if j = 1 then

begin
rx0:=rx1;
ry0:=ry1;
Point1(rx0,ry0-20);
end;

if j = 2 then
begin
rx0:=rx2;
ry0:=ry2;
Point1(rx0,ry0-20);
end;

if j = 3 then
begin
rx0:=rx3;
ry0:=ry3;
Point1(rx0,ry0-20);
end;
SetSmoothing(False);


End.
