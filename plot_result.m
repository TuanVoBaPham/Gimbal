etaCmd = out.etaCmd;
eta = out.eta;
epsilonCmd = out.epsilonCmd;
epsilon = out.epsilon;
CELcmd = out.CELcmd;
CEL = out.CEL;
ELcmd = out.ELcmd;
EL = out.EL;
d = out.d;

%% eta
t_etaCmd    = etaCmd.Time;
data_etaCmd = etaCmd.Data;

t_eta    = eta.Time;
data_eta = eta.Data;

%% epsilon
t_epsilonCmd    = epsilonCmd.Time;
data_epsilonCmd = epsilonCmd.Data;

t_epsilon    = epsilon.Time;
data_epsilon = epsilon.Data;

%% CEL
t_CELcmd    = CELcmd.Time;
data_CELcmd = CELcmd.Data;

t_CEL    = CEL.Time;
data_CEL = CEL.Data;

%% EL
t_ELcmd    = ELcmd.Time;
data_ELcmd = ELcmd.Data;

t_EL    = EL.Time;
data_EL = EL.Data;

%% Distance
t_d    = d.Time;
data_d = d.Data;

FS_label  = 16;   % font cho xlabel, ylabel
FS_legend = 12;

figure(1)
hold on;
grid on;
plot(t_etaCmd, data_etaCmd, 'r-','LineWidth', 2);
plot(t_eta, data_eta, 'b--','LineWidth', 2);
title('Azimuth angle','Interpreter','latex','FontSize',FS_label);
xlabel('Time (s)', 'Interpreter','latex','FontSize',FS_label);
ylabel('rad', 'Interpreter','latex','FontSize',FS_label);
legend({'$\eta_{cmd}$', '$\eta$'}, 'Location','best', 'Interpreter','latex','FontSize',FS_legend);
exportgraphics(gcf, 'eta.pdf','ContentType', 'image' ,'Resolution', 600);

figure(2)
hold on;
grid on;
plot(t_epsilonCmd, data_epsilonCmd, 'r-','LineWidth', 2);
plot(t_epsilon, data_epsilon, 'b--','LineWidth', 2);
title('Elevator angle','Interpreter','latex','FontSize',FS_label);
xlabel('Time (s)', 'Interpreter','latex','FontSize',FS_label);
ylabel('rad', 'Interpreter','latex','FontSize',FS_label);
legend({'$\varepsilon_{cmd}$', '$\varepsilon$'}, 'Location','best', 'Interpreter','latex','FontSize',FS_legend);
exportgraphics(gcf, 'epsilon.pdf','ContentType', 'image' ,'Resolution', 600);


figure(3)
hold on;
grid on;
plot(t_CELcmd, data_CELcmd, 'r-','LineWidth', 2);
plot(t_CEL, data_CEL, 'b--','LineWidth', 2);
title('CEL angular velocity','Interpreter','latex','FontSize',FS_label);
xlabel('Time (s)', 'Interpreter','latex','FontSize',FS_label);
ylabel('rad/s', 'Interpreter','latex','FontSize',FS_label);
legend('$\omega_{CELcmd}$', '$\omega_{CEL}$','Interpreter','latex','FontSize',FS_legend);
exportgraphics(gcf, 'CEL.pdf','ContentType', 'image' ,'Resolution', 600);

figure(4)
hold on;
grid on;
plot(t_ELcmd, data_ELcmd, 'r-','LineWidth', 2);
plot(t_EL, data_EL, 'b--','LineWidth', 2);
title('EL angular velocity','Interpreter','latex','FontSize',FS_label);
xlabel('Time (s)', 'Interpreter','latex','FontSize',FS_label);
ylabel('rad/s', 'Interpreter','latex','FontSize',FS_label);
legend('$\omega_{ELcmd}$', '$\omega_{EL}$','Interpreter','latex','FontSize',FS_legend);
exportgraphics(gcf, 'EL.pdf','ContentType', 'image' ,'Resolution', 600);

figure(5)
hold on;
grid on;
plot(t_d, data_d, 'r-','LineWidth', 2);
title('Distance from UAV to target','Interpreter','latex','FontSize',FS_label);
xlabel('Time (s)', 'Interpreter','latex','FontSize',FS_label);
ylabel('m', 'Interpreter','latex','FontSize',FS_label);
exportgraphics(gcf, 'd.pdf','ContentType', 'image' ,'Resolution', 600);
