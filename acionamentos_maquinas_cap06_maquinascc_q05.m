%===============================================================================
%ACIONAMENTOS DE MAQUINAS
%AUTORA: SYLVIELLY S. SOUSA                           %MATRICULA: 20162045070410
%SEMESTRE 2020.1          
%PROF.: CELSO SCHMIDLIN
%ATIVIDADE FINAL DE UNIDADE: CAPITULO 06                   %ENTREGA: 23/10/2020
%===============================================================================
%CODIGO QUESTAO 05
%===============================================================================
%                                 CALCULOS  
%===============================================================================
J_load = 0.04;
J_motor = 0.02;
omega_m = 300;
omega_decrescente = 100;
delta_t = 4;
T_nominal = 4;
kT = 0.5;
kE = 0.5;
R_armadura = 0.35;

%para omega_m = 300 rad/s
J_eq = J_motor + J_load
I_armadura = T_nominal/kT
E_armadura = omega_m*kE
V_armadura = (E_armadura + (R_armadura*I_armadura))

%para omega_decrescente = 100 rad/s
T_em_decrescente = (J_eq*omega_decrescente)/delta_t
I_decrescente =  T_em_decrescente/kT
E_decrescente = omega_decrescente*kE
V_decrescente = (E_decrescente + (R_armadura*I_decrescente))

%para condicao intermediario (interpolacao linear)
omega_230 = 230
T_em_230 = (J_eq*omega_230)/delta_t
I_230 =  T_em_230/kT
E_230 = omega_230*kE
V_230 = (E_230 + (R_armadura*I_230))

%vetores para plotagem
V_vetor = [V_armadura V_decrescente];
E_vetor = [E_armadura E_decrescente];
I_vetor = [I_armadura I_decrescente];
tempo_vetor = [0 4];

%vetores para plotagem
V_vetor_230 = [V_armadura V_230 V_decrescente];
E_vetor_230 = [E_armadura E_230 E_decrescente];
I_vetor_230 = [I_armadura I_230 I_decrescente];
T_vetor_230 = [T_nominal T_em_230 T_em_decrescente];
tempo_vetor_230 = [0 1.4 4];
%===============================================================================
%                           GERACAO DE GRAFICOS  
%===============================================================================
figure(1)
subplot(2,2,1)                    
plot(tempo_vetor,E_vetor,'m','LineWidth',2)         
hold on
grid on
plot(tempo_vetor,V_vetor,'k','LineWidth',2)         
grid on
title('Grafico tempo x tensao para \omega_m=100 rad/s','FontName','Times','FontSize',22);
xlabel('Tempo(s)', 'FontName','Times','FontSize',18);
ylabel('Tensao(V)', 'FontName','Times','FontSize',18);
legend("E_a","V_a");

subplot(2,2,2)                    
plot(tempo_vetor,I_vetor,'b','LineWidth',2)         
grid on
title('Grafico tempo x corrente para \omega_m=100 rad/s','FontName','Times','FontSize',22);
xlabel('Tempo(s)', 'FontName','Times','FontSize',18);
ylabel('Corrente(A)', 'FontName','Times','FontSize',18);
legend("I_a");

subplot(2,2,3)                    
plot(tempo_vetor_230,E_vetor_230,'r','LineWidth',2)         
hold on
grid on
plot(tempo_vetor_230,V_vetor_230,'g','LineWidth',2)         
grid on
title('Grafico tempo x tensao para \omega_m=230 rad/s (Interpolacao)','FontName','Times','FontSize',22);
xlabel('Tempo(s)', 'FontName','Times','FontSize',18);
ylabel('Tensao(V)', 'FontName','Times','FontSize',18);
legend("E_a","V_a");

subplot(2,2,4)                    
plot(tempo_vetor_230,I_vetor_230,'k','LineWidth',2)         
grid on
title('Grafico tempo x corrente para \omega_m=230 rad/s (Interpolacao)','FontName','Times','FontSize',22);
xlabel('Tempo(s)', 'FontName','Times','FontSize',18);
ylabel('Corrente(A)', 'FontName','Times','FontSize',18);
legend("I_a");

figure(3)
subplot(2,2,1)                    
plot(tempo_vetor_230,T_vetor_230,'m','LineWidth',2)         
grid on
title('Grafico tempo x torque para \omega_m=230 rad/s (Interpolacao)','FontName','Times','FontSize',22);
xlabel('Tempo(s)', 'FontName','Times','FontSize',18);
ylabel('Torque(Nm)', 'FontName','Times','FontSize',18);
legend("T_em");
%===============================================================================   
