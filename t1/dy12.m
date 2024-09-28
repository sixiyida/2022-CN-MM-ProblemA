function dRvw=func(t,Rvw)
%% 函数功能：为ode45提供微分方程
%输入：t:时间序列，就是θ；Rvw:因变量,Rvw(1)代表R,Rvw(2)代表v,Rvw(3)代表w
%输出：dRvw:因变量的一阶微分,dRvw(1)代表dR,dRvw(2)代表dv,dRvw(3)代表dw
%% 初始化因变量的一阶微分，3×1的向量
dRvw=zeros(4,1);
%% 参数初始化
m1=4866;
m2=2433;
l1=2;
l0=0.5;
kz=10000;
kq=80000;
kx=656.3616;
dm=1335.535;
w=1.4005;
g=9.8;
ro=1025;
f=6250;
z=0.5;
%%输入微分方程式 定义Rvw(1)为x2,Rvw(2)为x2',Rvw(3)为x1,Rvw(4)为x1'
dRvw(1)=Rvw(2)
%dRvw(2)=1/m2*(-m2*g+(Rvw(4)-Rvw(2))*(abs(Rvw(4)-Rvw(2)))^z*kz+(Rvw(3)-Rvw(1))*kq)
dRvw(2)=1/m2*(-m2*g+(Rvw(4)-Rvw(2))*kz+(Rvw(3)-Rvw(1))*kq)
dRvw(3)=Rvw(4)
%dRvw(4)=1/(dm+m1)*(f*cos(w*t)-m1*g-(Rvw(4)-Rvw(2))*(abs(Rvw(4)-Rvw(2)))^z*kz-(Rvw(3)-Rvw(1))*kq-Rvw(4)*kx+ro*g*1/3*0.8*3.1416+3.1416*ro*g*(l1-Rvw(3)))
dRvw(4)=1/(dm+m1)*(f*cos(w*t)-m1*g-(Rvw(4)-Rvw(2))*kz-(Rvw(3)-Rvw(1))*kq-Rvw(4)*kx+ro*g*1/3*0.8*3.1416+3.1416*ro*g*(l1-Rvw(3)))

