global kz
global kz1
Pavgmat=[]
kzmat=[]

for kz1=0:1000:100000
Pavglist=[]
kzlist=[]
for kz=55000:5000:60000
   clc
   [t,Rvw]=ode45(@dy3,[0 50],[-0.2980 0 0 0 0 0 0 0]);
   tdiff=diff(t);
   len=length(Rvw);
   tdiff(len)=tdiff(len-1);
   st=floor(len/4);
   P=kz*(Rvw(:,2)).^2.*tdiff+kz1*(Rvw(:,8)-Rvw(:,6)).^2.*tdiff;
   Pavg=sum(P(st:len))/(t(len)-t(st));
   Pavglist=[Pavglist Pavg];
   kzlist=[kzlist kz];
end
Pavgmat=[Pavgmat;Pavglist];
kzmat=[kzmat;kzlist];
end

