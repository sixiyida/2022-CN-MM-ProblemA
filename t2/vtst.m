global kz
kz=10000
[t,Rvw]=ode45(@dy12,[0 20],[-0.2980 0 0 0])
tdiff=diff(t)
tdiff(len)=tdiff(len-1)
len=length(Rvw)
st=floor(len/4)
P=kz*(Rvw(:,4)-Rvw(:,2)).^2.*tdiff
Pavg=sum(P(st:len))/(t(len)-t(st))
plot(t,P)
