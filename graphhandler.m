yyfx=input('Choose one of the feed conditions: q=1[1]| q defined[2] | q=0[3] = ','s');
clc
yyfxxy=input('xf value = ');
yyfxx=input('xD value = ');
yyfxxx=input('xB value = ');
reflux=input('Reflux ratio = ');
clc
yyfxxxx=(yyfxx/(reflux+1));
switch zxatt
    case('a');
title('McCabe–Thiele diagram of '+ a334 + '(' + aang + ')'+ ' and ' + b334+'(' + aaange + ')');
    case('b');
title(' ')
end
%close(figure(1))
determ=0;
switch yyfx
    case('1')
        x=[yyfxxy yyfxxy];
        y=[0 1];
    case('2')
        x = -15:0.25:25;
        fxy2=input('q value = ');%0.667
        fxy=1-fxy2
        m=-(1-fxy)/fxy%input('Slope');7.66%
        x1=yyfxxy;
        y1=yyfxxy;
        y = m*(x - x1) + y1;
    case('3')
        x=[0 yyfxxy];
        y=[yyfxxy yyfxxy];

end
xlim([0 1])
ylim([0 1])
a=line(x,y,'Color','black','LineStyle','--')
[xyp yyp]=polyxpoly(xadepo,yadepo,x,y);
Rmin=abs((yyfxx-yyp)/(yyp-xyp));
xla=[0 yyfxx]
yla=[yyfxxxx yyfxx]
b=line(xla,yla)
[xla2,yla2] = polyxpoly(x,y,xla,yla);
delete(b)
xa33=[xla(2) xla2]
ya33=[xla(2) yla2]
line(xa33,ya33,'Color','[0.4660 0.6740 0.1880]','LineStyle','-')
lala2=[yyfxxx xla2]
lala3=[yyfxxx yla2]
line(lala2,lala3,'Color','[0.4940 0.1840 0.5560]','LineStyle','-')
x=[yyfxx 0]
y=[yyfxx yyfxx]
zaraaa=0;
if yyp < yla2
    fprintf("The interception line of stripping and enriching section with feed section is over the equilibrium line \n");
    return;
end
while 1
    if x(1)<yyfxxy
        break;
    end
x=[x(1) 0]
y=[y(1) y(1)]
a=line(x,y);
[xi,yi] = polyxpoly(xadepo,yadepo,x,y);
delete(a)
x=[x(1) xi]
y=[y(1) yi]
line(x,y,'Color','red','LineStyle','-')
x=[xi xi]
y=[y(1) 0]
cc=line(x,y,'Color','red','LineStyle','-')
[x2,y2] = polyxpoly(xa33,ya33,x,y)
delete(cc)
TF = isempty(x2)
if TF==1
    determ=1;
    break;
end
x=[x2 x2]
y=[y2 yi]
bb=line(x,y,'Color','red','LineStyle','-')
zaraaa=zaraaa+1
end
switch yyfx
    case('1')
x2=x(2)
while 1
    if x2<yyfxxx
        break;
    end
x=[x2 x2]
y=[y(1) 0]
a=line(x,y);
[xi,yi] = polyxpoly(lala2,lala3,x,y);
delete(a)
x=[x(1) xi]
y=[y(1) yi]
line(x,y,'Color','red','LineStyle','-')
x=[xi 0]
y=[yi yi]
b=line(x,y);
[x2,y2] = polyxpoly(xadepo,yadepo,x,y)
delete(b)
x=[x(1) x2]
y=[yi yi]
line(x,y,'Color','red','LineStyle','-')
zaraaa=zaraaa+1
end
    case('2')
        xi=x(2)
yi=y(1)
    if TF==1
        x2=x(2)
        yi=y(1)
        while 1
    if x2<yyfxxx
        break;
    end
x=[x2 x2]
y=[yi 0]
a=line(x,y);
[xi,yi] = polyxpoly(lala2,lala3,x,y);
delete(a)
x=[x(1) xi]
y=[y(1) yi]
line(x,y,'Color','red','LineStyle','-')
x=[xi 0]
y=[yi yi]
b=line(x,y);
[x2,y2] = polyxpoly(xadepo,yadepo,x,y)
delete(b)
x=[x(1) x2]
y=[yi yi]
line(x,y,'Color','red','LineStyle','-')
zaraaa=zaraaa+1
end
    else

while 1
    if x2<yyfxxx
        break;
    end
x=[xi 0]
y=[yi yi]
a=line(x,y,'Color','red','LineStyle','-')
[x2,y2] = polyxpoly(xadepo,yadepo,x,y)
delete(a)
x=[x(1) x2]
y=[y2 y2]
line(x,y,'Color','red','LineStyle','-')
x=[x2 x2]
y=[y2 0]
b=line(x,y,'Color','red','LineStyle','-')
[xi,yi] = polyxpoly(lala2,lala3,x,y);
TF = isempty(xi)
if TF==1
    delete(b)
    break;
end
delete(b)
x=[xi xi]
y=[yi y2]
line(x,y,'Color','red','LineStyle','-')
zaraaa=zaraaa+1
end
    end
case('3')
xi=x(2)
yi=y(1)
    if TF==1
        x2=x(2)
        yi=y(1)
        while 1
    if x2<yyfxxx
        break;
    end
x=[x2 x2]
y=[yi 0]
a=line(x,y);
[xi,yi] = polyxpoly(lala2,lala3,x,y);
delete(a)
x=[x(1) xi]
y=[y(1) yi]
line(x,y,'Color','red','LineStyle','-')
x=[xi 0]
y=[yi yi]
b=line(x,y);
[x2,y2] = polyxpoly(xadepo,yadepo,x,y)
delete(b)
x=[x(1) x2]
y=[yi yi]
line(x,y,'Color','red','LineStyle','-')
zaraaa=zaraaa+1
end
    else

while 1
    if x2<yyfxxx
        break;
    end
x=[xi 0]
y=[yi yi]
a=line(x,y,'Color','red','LineStyle','-')
[x2,y2] = polyxpoly(xadepo,yadepo,x,y)
delete(a)
x=[x(1) x2]
y=[y2 y2]
line(x,y,'Color','red','LineStyle','-')
x=[x2 x2]
y=[y2 0]
b=line(x,y,'Color','red','LineStyle','-')
[xi,yi] = polyxpoly(lala2,lala3,x,y);
TF = isempty(xi)
if TF==1
    delete(b)
    break;
end
delete(b)
x=[xi xi]
y=[yi y2]
line(x,y,'Color','red','LineStyle','-')
zaraaa=zaraaa+1
end
    end
end
x=[x(2) x(2)]
y=[y(1) x(2)]
a=line(x,y,'Color','red','LineStyle','-');
clc
x=[yyfxx 0]
y=[yyfxx yyfxx]
zaraaa2=0;
while 1
    if x(1)<yyfxxx
        break;
    end
x=[x(1) 0]
y=[y(1) y(1)]
a=line(x,y);
[xi,yi] = polyxpoly(xadepo,yadepo,x,y);
delete(a)
x=[x(1) xi]
y=[y(1) yi]
line(x,y,'Color','black','LineStyle','-')
x=[xi xi]
y=[yi 0]
b=line(x,y);
[x2,y2] = polyxpoly(Asas,Bsas,x,y)
delete(b)
x=[x2 x2]
y=[y2 yi]
line(x,y,'Color','black','LineStyle','-')
zaraaa2=zaraaa2+1
end
clc
fprintf('Theoretical stage number is %.f + 1 reboiler \n',zaraaa)
fprintf('Minimum stage number  %.f  \n',zaraaa2)
fprintf('Minimum reflux ratio is  %.3f  \n ',Rmin)
aayy=('Minimum reflux=');
ptt2 = num2str(Rmin);
ptt3 = num2str(zaraaa);
ptt4 = num2str(zaraaa2);
aalol='1';
aalol2='+';
aayy2=('Theoretical stage number=');
aayy3=('Minimum stage number=');
cc3=strcat(aayy,ptt2);
cc4=strcat(aayy2,ptt3,aalol2,aalol);
cc5=strcat(aayy3,ptt4);
%text(0.4,0.15,cc3)
%text(0.4,0.2,cc4)
%text(0.4,0.1,cc5)
saveas(gcf,'McCabe-Thiele.png')
%open antonie.txt