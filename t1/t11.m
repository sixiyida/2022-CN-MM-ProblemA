[t,Rvw]=ode45(@dy12,[0 100],[-0.2980 0 0 0 ])
t1=0:0.2:100
y1=interp1(t,Rvw(:,1),t1,'spline');
y2=interp1(t,Rvw(:,3),t1,'spline');
y3=interp1(t,Rvw(:,2),t1,'spline');
y4=interp1(t,Rvw(:,4),t1,'spline');
y11=y1'
y22=y2'
y33=y3'
y44=y4'
t111=t1'
plot(t1,y1,t1,y2)
legend('振子位移x2','浮子位移x1');
xlswrite('x12.xlsx',y22)
xlswrite('x22.xlsx',y11)
xlswrite('v12.xlsx',y44)
xlswrite('v22.xlsx',y33)
