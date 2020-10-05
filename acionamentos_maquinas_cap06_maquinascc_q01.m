%===============================================================================
%ACIONAMENTOS DE MAQUINAS
%AUTORA: SYLVIELLY S. SOUSA                           %MATRICULA: 20162045070410
%SEMESTRE 2020.1          
%PROF.: CELSO SCHMIDLIN
%ATIVIDADE FINAL DE UNIDADE: CAPITULO 06                   %ENTREGA: 23/10/2020
%===============================================================================
%CODIGO QUESTAO 01
%===============================================================================
%                                 CALCULOS  
%===============================================================================
J_load = 0.04;
J_motor = 0.02;
T_nominal = 4;
kT = 0.5;
kE = 0.5;
R_armadura = 0.35;
V_armadura_100V = 100;
V_armadura_60V = 60;
V_armadura_30V = 30;

%para V_armadura = 100V
I_armadura = T_nominal/kT
omega_m_100 = V_armadura_100V/kE
omega_100_m = (V_armadura_100V - (R_armadura*I_armadura))/kE

%para V_armadura = 60V
omega_m_60 = V_armadura_60V/kE
omega_60_m = (V_armadura_60V - (R_armadura*I_armadura))/kE

%para V_armadura = 30V
omega_m_30 = V_armadura_30V/kE
omega_30_m = (V_armadura_30V - (R_armadura*I_armadura))/kE

%vetores para plotagem
omega_vetor_1 = [omega_m_100 omega_100_m];
omega_vetor_2 = [omega_m_60 omega_60_m];
omega_vetor_3 = [omega_m_30 omega_30_m];
tempo_vetor = [0 10];
%===============================================================================
%                           GERACAO DE GRAFICOS  
%===============================================================================
%grafico em tempo continuo
figure(1)
subplot(1,1,1)                    
plot(tempo_vetor,omega_vetor_1,'m','LineWidth',2)         
hold on
grid on
plot(tempo_vetor,omega_vetor_2,'k','LineWidth',2) 
hold on        
grid on
plot(tempo_vetor,omega_vetor_3,'b','LineWidth',2) 
grid on
title('Grafico Velocidade x Torque','FontName','Times','FontSize',22);
xlabel('\omega(rad/s)', 'FontName','Times','FontSize',18);
ylabel('Torque(Nm)', 'FontName','Times','FontSize',18);
%legend("E_a","V_a");
%===============================================================================   
