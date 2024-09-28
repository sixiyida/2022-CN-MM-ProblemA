global kz
global z
Pavgmat=[]
kzmat=[]

for z=0:0.1:1
Pavglist=[]
kzlist=[]
for kz=0:100:100000
   clc
   [t,Rvw]=ode45(@dy12,[0 50],[-0.2980 0 0 0])
   tdiff=diff(t)
   len=length(Rvw)
   tdiff(len)=tdiff(len-1)
   st=floor(len/4)
   P=kz*(Rvw(:,4)-Rvw(:,2)).^2.*tdiff.*(abs(Rvw(:,4)-Rvw(:,2))).^z
   Pavg=sum(P(st:len))/(t(len)-t(st))
   Pavglist=[Pavglist Pavg]
   kzlist=[kzlist kz]
end
Pavgmat=[Pavgmat;Pavglist]
kzmat=[kzmat;kzlist]
end

