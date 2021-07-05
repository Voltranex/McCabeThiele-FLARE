clear %-V-%
clc
close all
Vdeneme2 =open('V1.mat');
ZZZ1y=extractfield(Vdeneme2,'CC');
ZZZ1=string(ZZZ1y);
ZZZlo=extractfield(Vdeneme2,'a334');
ZZZ3=string(ZZZlo);
ZZZ2o=extractfield(Vdeneme2,'b334');
ZZZ4=string(ZZZ2o);
ZZZerro=extractfield(Vdeneme2,'pt1');
ZZZ33=string(ZZZerro);
ZZZ5=str2double(ZZZ33);
ZZZeroo=extractfield(Vdeneme2,'a33');
ZZZeroo2=string(ZZZeroo);
ZZZeroo3=extractfield(Vdeneme2,'b33');
ZZZeroo4=string(ZZZeroo3);
CC = datetime ;
save V1.mat CC -append
clc
syms x
fprintf('Last Calculation time %.50s \n',ZZZ1);
zxatt=input("Equilibrium values calculated by Antonie equation and Raoult's law combination from database(a)\nFrom given xA-yA equilibrium values(b) = ",'s');
switch zxatt
    case('a');
       clc
      fprintf('Last two components was %.50s(%.50s) and %.50s(%.50s) at %.f atm \n',ZZZ3,ZZZeroo2,ZZZ4,ZZZeroo4,ZZZ5);
A=readtable('antonie.xlsx');
A1=A{:,:};
a=readtable('antonie2.xlsx');
a33=input('Number of the component 1 = ');
b33=input('Number of the compenent 2 = ');
a3345=a{a33,2};
a334=string(a3345);
b3345=a{b33,2};
b334=string(b3345);
a3344=a{a33,1};
aang=string(a3344);
b3344=a{b33,1};
aaange=string(b3344);
fid=fopen('antonie.txt','wt');
fprintf(fid,'Last calculation time : %.50s \n',CC);
%if a33 > b33
    %display('a33 must be lower than b33');
    %error('change the component order the opposite');
%end
cont1=A1(a33,1);
contt1 = isnan(cont1);
if contt1==1
    fprintf("Antonie constants is not defined for  %.50s (%.f)\n",a334,a33)
    return;
end
cont2=A1(b33,1);
contt2=isnan(cont2);
if contt2==1
    fprintf("Antonie constants is not defined for %.50s (%.f)\n",b334,b33)
    return;
end
matrixa=[];
matrixb=[];
iii=[];
a=1;
pt1=input('Pressure value of the system (Atm) ? =');
%ptyz=input('McCabe-Thiele method calculation on/off ? =','s');
pt=pt1*760;
z77=0;
syms t
tempa11=log(pt)-A1(a33,1)+(A1(a33,2)/(t+A1(a33,3)+273))
tempa12=vpasolve(tempa11,t)
tempa21=log(pt)-A1(b33,1)+(A1(b33,2)/(t+A1(b33,3)+273))
tempa22=vpasolve(tempa21,t)
tempa1=(double(subs(tempa12)));
tempa2=(double(subs(tempa22)));
clc
if tempa1>tempa2;
    A33yedek1=A1(a33,1)
    A33yedek2=A1(a33,2)
    A33yedek3=A1(a33,3)
    A1(a33,1)=A1(b33,1)
    A1(a33,2)=A1(b33,2)
    A1(a33,3)=A1(b33,3)
    A1(b33,1)=A33yedek1
    A1(b33,2)=A33yedek2
    A1(b33,3)=A33yedek3
    z77=1;
    tempa22=tempa2;
    tempa2=tempa1;
    tempa1=tempa22;
end
    
fprintf(fid,'Boiling point and equilibrium diagram of %.50s(%.50s)(%.f) and %.50s(%.f)(%.50s) at %.4f atm \n',a334,aang,a33,b334,b33,aaange,pt1);
if z77==1
    fprintf(fid,'More volatile component is %.50s, boiling point of %.50s at %.f atm is %.2f(C)  \n',b334,b334,pt1,tempa1);
    fprintf(fid,'Boiling point of %.50s at %.f atm is %.2f(C)  \n',a334,pt1,tempa2);
else
    fprintf(fid,'More volatile component is %.50s, boiling point of %.50s at %.f atm is %.2f(C) \n',a334,a334,pt1,tempa1);
    fprintf(fid,'Boiling point of %.50s at %.f atm is %.2f(C)  \n\n',b334,pt1,tempa2);
end
fprintf(fid,'Temp(C)       xA       yA     \n');
fprintf(fid,'--------------------------\n');
if tempa1<tempa2
    for i=tempa1:tempa2
logc1=A1(a33,1)-(A1(a33,2)/(A1(a33,3)+273+i));
iii(a)=i;
logc2=exp(logc1);
matrixa(a)=logc2;
logc3=A1(b33,1)-(A1(b33,2)/(A1(b33,3)+273+i));
logc4=exp(logc3);
matrixb(a)=logc4;
a=a+1;
    end
else
    for i=tempa2:tempa1
logc1=A1(a33,1)-(A1(a33,2)/(A1(a33,2)+273+i));
iii(a)=i;
logc2=exp(logc1);
matrixa(a)=logc2;
logc3=A1(b33,1)-(A1(b33,2)/(A1(b33,2)+273+i));
logc4=exp(logc3);
matrixb(a)=logc4;
a=a+1;
end
end
xadepo=[];
yadepo=[];
b=1;
ii=[];
for i=1:1:a-1;
    ii(b)=i;
    xa=(pt-matrixb(i))/(matrixa(i)-matrixb(i));
    xb=(matrixa(i)*xa/pt);
    xadepo(b)=xa;
    yadepo(b)=xb;
    b=b+1;
end
if tempa2>tempa1
    lul=tempa2;
lul1=0;
lol=length(xadepo);
xadepo(lol+1)=lul1;
iii(lol+1)=lul;
yadepo(lol+1)=lul1;
else
    lul=tempa1;
lul1=1;
lol=length(xadepo);
xadepo(lol+1)=lul1;
iii(lol+1)=lul;
yadepo(lol+1)=lul1;
end
for b=1:a
    fprintf(fid,'%4.1f   %9.4f   %7.4f  \n\n',iii(b),xadepo(b),yadepo(b));
end
plot(xadepo,iii);
xlim([0 1]);
hold on
grid on
grid minor
plot(yadepo,iii);
akesen1=('--');
akesen2=('--');
akesen3=('--at--');
akesen4=('ATM');
akesen5=('(');
akesen6=(')');
pt2 = num2str(pt1);
xlabel('xA,yA');
ylabel('Temperature(K)');
title('Boiling Point curve of '+ a334 + '(' + aang + ')'+ ' and ' + b334+'(' + aaange + ')'+ ' at ' +pt2+ 'ATM');
saveas(gcf,'antonie.png')
figure(2)
%xadepo=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]
%yadepo=[0 0.313 0.478 0.584 0.661 0.725 0.781 0.835 0.888 0.942 1]
plot(xadepo,yadepo)
hold on
Asas=[0 0.5 1];
Bsas=[0 0.5 1];
plot(Asas,Bsas)
xlabel('xA');
ylabel('yA');;
title('Equilibrium diagram of '+ a334 + '(' + aang + ')'+ ' and ' + b334+'(' + aaange + ')'+ ' at ' +pt2+ 'ATM');
xlim([0 1]);
ylim([0 1]);
grid on
grid minor
saveas(gcf,'Antoniexaya.png')
save V1.mat a334 -append
save V1.mat b334 -append
save V1.mat a33 -append
save V1.mat b33 -append
save V1.mat pt1 -append
fclose(fid);
open antonie.txt
ptyz=input("McCabe–Thiele method on on/off? = ",'s');
clc
switch ptyz
    case('on')
    close(figure(1))
    graphhandler
end
    case('b')
clc
xadepo=input('xA equilibrium values as an array [] =');     %[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]
yadepo=input('yA equilibrium values as an  array [] = ');      %[0 0.313 0.478 0.584 0.661 0.725 0.781 0.835 0.888 0.942 1]
Asas=[0 0.5 1];
Bsas=[0 0.5 1];
hold on
plot(Asas,Bsas)
plot(xadepo,yadepo)
grid on
grid minor
xlabel('xA');
ylabel('yA');;
ptyz=input("McCabe–Thiele method on on/off? = ",'s');
switch ptyz
    case('on')
    graphhandler
end
end





