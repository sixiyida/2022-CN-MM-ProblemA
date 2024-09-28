[t,Rvw]=ode45(@dy3,[0 150],[-0.2980 0 0 0 0 0 0 0])
t1=0:0.2:150
y1=interp1(t,Rvw(:,1),t1,'spline');%x2
y2=interp1(t,Rvw(:,2),t1,'spline');%v2
y3=interp1(t,Rvw(:,3),t1,'spline');%x1
y4=interp1(t,Rvw(:,4),t1,'spline');%v1
y5=interp1(t,Rvw(:,5),t1,'spline');%th2
y6=interp1(t,Rvw(:,6),t1,'spline');%w2
y7=interp1(t,Rvw(:,7),t1,'spline');%th1
y8=interp1(t,Rvw(:,8),t1,'spline');%w1
y11=y1'
y22=y2'
y33=y3'
y44=y4'
y55=y5'
y66=y6'
y77=y7'
y88=y8'
t111=t1'
plot(t1,y3,t1,y1)
legend('浮子位移theta1','相对位移theta2');
hold on 
grid on
xlswrite('t.xlsx',t111)
xlswrite('x2.xlsx',y11)
xlswrite('v2.xlsx',y22)
xlswrite('x1.xlsx',y33)
xlswrite('v1.xlsx',y44)
xlswrite('th2.xlsx',y55)
xlswrite('w2.xlsx',y66)
xlswrite('th1.xlsx',y77)
xlswrite('w1.xlsx',y88)
