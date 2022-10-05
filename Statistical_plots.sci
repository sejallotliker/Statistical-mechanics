// Copyright (C) 2022 - Corporation - Sejal
//
// About your license if you have any
//
// Date of creation: 5 Oct, 2022
// Program Title- Scilab plots

//Plot different distribution functions (MB, BE, FD)
clc; clear; clf;
e=1.6e-19; k=1.38e-23;
u=0; // Chemical potential (ev)
E= -0.5:0.001:0.5; // Energy in ev
T=100:200:1100; // Temperature in kelvin
T0=500; // Temperature for comparison of 3 distribution function

dist = ['Bose Einstine', 'Maxwell Boltzmann','Fermi Dirac'];
a=-1;
for n=1:3
    for j=1:length(T)
        if T0==T(j)
            q=j;
        end
        for i=1:length(E)
            f(j,i)=1/(exp((E(i)-u)*e/(k*T(j)))+a);
        end
        end
a=a+1;
subplot(2,2,n)
plot(E',f','linewidth',6);
ylabel('f(E)','fontsize',6);xlabel('Energy (ev)','fontsize',6);
legend('T= '+string(T)+' K');
title(string(dist(n))+'distribution for u='+string(u),'fontsize',6);
C(n,:)=f(q,:);
end
subplot(2,2,4)
plot(E',C','linewidth',6);
ylabel('f(E)','fontsize',6);xlabel('Energy (ev)','fontsize',6);
legend(string(dist)+'distribution',3);
title('Temperature='+string(T(q))+' K','fontsize',6)
