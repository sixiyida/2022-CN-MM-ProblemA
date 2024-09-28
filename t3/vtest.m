global kz;
global kz1;
Pavglist=[]
kzlist=[]
for kz=0:10000:100000
   clc
   [t,Rvw]=ode45(@dy3,[0 50],[-0.2980 0 0 0 0 0 0 0])
   tdiff=diff(t)
   len=length(Rvw)
   tdiff(len)=tdiff(len-1)
   st=floor(len/4)
   P=kz1*(Rvw(:,7)-Rvw(:,5)).^2.*tdiff
   %P=kz*(Rvw(:,2)).^2.*tdiff+kz1*(Rvw(:,7)-Rvw(:,5)).^2.*tdiff
   %P=kz*(Rvw(:,2)).^2.*tdiff
   Pavg=sum(P(st:len))/(t(len)-t(st))
   Pavglist=[Pavglist Pavg]
   kzlist=[kzlist kz]
end
