global kz
global kz1
Pavgmat=[]
kzmat=[]

for kz1=0:1000:100000
Pavglist=[]
kzlist=[]
for kz=0:1000:100000
   clc
   [t,Rvw]=ode45(@dy12,[0 50],[-0.2980 0 0 0])
   tdiff=diff(t)
   len=length(Rvw)
   tdiff(len)=tdiff(len-1)
   st=floor(len/4)
   P=kz*(Rvw(:,4)-Rvw(:,2)).^2.*tdiff
   Pavg=sum(P(st:len))/(t(len)-t(st))
   Pavglist=[Pavglist Pavg]
   kzlist=[kzlist kz]
end
Pavgmat=[Pavgmat;Pavglist]
kzmat=[kzmat;kzlist]
end

