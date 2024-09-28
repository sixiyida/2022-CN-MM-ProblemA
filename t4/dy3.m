function dRvw=func(t,Rvw)
global kz;
global kz1;
%% 函数功能：为ode45提供微分方程
%输入：t:时间序列，就是θ；Rvw:因变量,Rvw(1)代表R,Rvw(2)代表v,Rvw(3)代表w
%输出：dRvw:因变量的一阶微分,dRvw(1)代表dR,dRvw(2)代表dv,dRvw(3)代表dw
%% 初始化因变量的一阶微分，3×1的向量
dRvw=zeros(8,1);
%% 参数初始化
m1=4866;
m2=2433;
l1=2;
l0=0.5;
%kz=10000;
%kz1=1000;
kq=80000;
kq1=250000;
kx=528.5018;
kx1=1655.909;
dm=1091.099;
dj=7142.493;
w=1.9806;
g=9.8;
ro=1025;
f=1760;
l=2140;
j0=1/4*m2*0.5^2+1/12*m2*0.5^2
%j1=pi*1750*3*(1-0.8588^2)*(0.8588^2/4+3^2/12+1.5^2)+pi/3*1750*(1-0.8588^3)*0.8*(3/20+0.8^2/10)
j1=pi*3*1750*(1^2*(1^2/4+3^2/12+0.2^2)-0.8588^2*(0.8588^2/4+3^2/12+0.2^2))+1/3*pi*(1^2*0.8*(3/20*1^2+1/10*0.8^2-1/16*0.8^2+(1.3+0.8*0.25)^2)-0.8588^2*(0.8588*0.8)*(3/20*0.8588^2+1/10*(0.8588*0.8)^2-1/16*(0.8588*0.8)^2+(0.8588*0.8*0.25+1.3)^2))
kf=8890.7
%% 输入微分方程式 定义Rvw(1)为xr,Rvw(2)为xr',Rvw(3)为x1,Rvw(4)为x1',Rvw(5)为th2,Rvw(6)为th2',Rvw(7)为th1,Rvw(8)为th1'
dRvw(1)=Rvw(2)
dRvw(2)=1/m2*(m2*Rvw(6)^2*(l0+Rvw(1))-m2*g*cos(Rvw(5))+(-Rvw(2))*kz+(-Rvw(1))*kq)-1/(dm+m1)*(f*cos(w*t)-m1*g+((Rvw(2))*kz+(Rvw(1))*kq)*cos(Rvw(5))-Rvw(4)*kx+ro*g*1/3*0.8*3.1416+3.1416*ro*g*(l1-Rvw(3)))
dRvw(3)=Rvw(4)
dRvw(4)=1/(dm+m1)*(f*cos(w*t)-m1*g+((Rvw(2))*kz+(Rvw(1))*kq)*cos(Rvw(5))-Rvw(4)*kx+ro*g*1/3*0.8*3.1416+3.1416*ro*g*(l1-Rvw(3)))
%dRvw(4)=1/(dm+m1)*(f*cos(w*t)-m1*g+(-(Rvw(4)-Rvw(2))*kz-(Rvw(3)-Rvw(1))*kq)*cos(Rvw(5))-Rvw(4)*kx+ro*g*1/3*0.8*3.1416+3.1416*ro*g*(1.3)+3.1416*ro*g*(0.7-Rvw(3))/cos(Rvw(7)))
dRvw(5)=Rvw(6)
%dRvw(6)=1/(j0+m2*(l0-(Rvw(3)-Rvw(1)))^2)*((Rvw(8)-Rvw(6))*kz1+(Rvw(7)-Rvw(5))*kq1)
dRvw(6)=1/(j0+m2*(l0+Rvw(1))^2)*(m2*g*sin(Rvw(5))*(Rvw(1)+l0)+(Rvw(8)-Rvw(6))*kz1+(Rvw(7)-Rvw(5))*kq1+2*Rvw(2)*Rvw(8)*m2*(l0+Rvw(1)))
dRvw(7)=Rvw(8)
dRvw(8)=1/(j1+dj)*(m1*g*sin(Rvw(7))*0-(Rvw(8)-Rvw(6))*kz1-(Rvw(7)-Rvw(5))*kq1+l*cos(w*t)-Rvw(8)*kx1-Rvw(7)*kf-3.1416*ro*g*(l1-Rvw(3))*0*sin(Rvw(7)))%
%dRvw(8)=1/(j1+dj)*(m1*g*sin(Rvw(7))*0.8-(Rvw(8)-Rvw(6))*kz1-(Rvw(7)-Rvw(5))*kq1+l*cos(w*t)-Rvw(8)*kx1-Rvw(7)*kf-2*Rvw(2)*Rvw(8)*m2*(l0+Rvw(1)))
%dRvw(8)=1/(j1+dj)*(-(Rvw(8)-Rvw(6))*kz1-(Rvw(7)-Rvw(5))*kq1+l*cos(w*t)-Rvw(8)*kx1-Rvw(7)*kf)