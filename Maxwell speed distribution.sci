// Copyright (C) 2022 - Corporation - Sejal
//
// About your license if you have any
//
// Date of creation: 23 Aug, 2022
// Program Title-

//Plot maxwell speed distribution function
clf;
k=1.38*10**(-23)
N=6.023*10**(23)
pi=3.14

v=0:1:2000; // speed in m/s
T=300:300:900; // Temperature in kelvin
name=input("Enter the name of the gas:","string");
M=input("Enter molar mass (g/mol) of "+string(name)+":");
m=M/(N*1000);//Molecular weight (Kg)

disp('Temp(K) vmp vav vrms ')
for j=1:length(T)
    a=m/(2*k*T(j));
    for i=1:length(v)
        f(j,i)=(4*pi)*(a/pi)^1.5*(v(i)^2)*exp(-a*(v(i)^2));
    end
    [p,q]=max(f(j,:));
    vmp=v(q);vav=sqrt(4/pi)*vmp; vrms=sqrt(3/2)*vmp;
    disp([T(j) vmp vav vrms])
end
plot(v',f','linewidth',5)
xlabel('v(m/s)','fontsize',5);
ylabel('f(v)','fontsize',5);
legend('T='+string(T)+'K');
title('Maxwell boltzmann speed distribution function for '+string(name),'fontsize',5)




