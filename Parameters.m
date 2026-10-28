%% 1. THÔNG SỐ ĐỘNG CƠ TRỤC AZ (Azimuth)
% -- Thông số điện --
AZ.L = 6.3e-3;      % [H] Điện cảm cuộn dây (6.3 mH = 6.3e-3 H)
AZ.R = 16.5;        % [Ohm] Điện trở thuần
AZ.RotaMoment = 0.3;        % [Nm/A] Hằng số momen quay
AZ.BackEMF = 0.284;      % [V/(rad/s)] Hằng số suất điện động phản kháng

% -- Thông số cơ và ma sát --
AZ.omega_s = 0.05;  % [rad/s] Vận tốc góc tham chiếu ma sát
AZ.b = 0.1;         % Hệ số ma sát nhớt

% -- Mô men quán tính khung AZ --
AZ.Jx = 3.37e-3;    % [kg.m^2] Mô men quán tính đối với trục X
AZ.Jy = 3.07e-3;    % [kg.m^2] Mô men quán tính đối với trục Y
AZ.Jz = 0.935e-3;   % [kg.m^2] Mô men quán tính đối với trục Z


%% 2. THÔNG SỐ ĐỘNG CƠ TRỤC EL (Elevation)
% -- Thông số điện --
EL.L = 6.3e-3;      % [H] Điện cảm cuộn dây
EL.R = 16.5;        % [Ohm] Điện trở thuần
EL.RotaMoment = 0.3;        % [Nm/A] Hằng số momen quay
EL.BackEMF = 0.284;      % [V/(rad/s)] Hằng số suất điện động phản kháng

% -- Thông số cơ và ma sát --
EL.omega_s = 0.05;  % [rad/s] Vận tốc góc tham chiếu ma sát
EL.b = 0.1;         % Hệ số ma sát nhớt

% -- Mô men quán tính --
% Có thể đây là mô men quán tính của phần tải/khung nâng hạ (EL)
EL.Jx = 0.546e-3;   % [kg.m^2] Mô men quán tính đối với trục X
EL.Jy = 0.618e-3;   % [kg.m^2] Mô men quán tính đối với trục Y
EL.Jz = 0.68e-3;    % [kg.m^2] Mô men quán tính đối với trục Z


%% 3. THÔNG SỐ QUANG HỌC
Optics.res_width  = 640;  % [pixel] Độ phân giải chiều rộng
Optics.res_height = 480;  % [pixel] Độ phân giải chiều cao
Optics.FOV        = 8;    % [deg] Góc nhìn (Field of View)

% Chuyển đổi FOV sang Radian (nếu cần dùng cho các ma trận chiếu hoặc tính toán sai số)
Optics.FOV_rad    = Optics.FOV * (pi / 180); % [rad]

%% 4. Thông số của bộ điều khiển
% Vòng dòng điện của động cơ trục AZ
AZ.KPcurrent = 10;
AZ.KIcurrent = 1500;
% Vòng vận tốc góc của động cơ trục AZ
AZ.KPvel = 15;
AZ.KIvel = 200;
% Vòng vị trí
AZ.KPpos = 2.5;

% Vòng dòng điện của động cơ trục AZ
EL.KPcurrent = 10;
EL.KIcurrent = 1500;
% Vòng vận tốc góc của động cơ trục AZ
EL.KPvel = 15;
EL.KIvel = 200;
% Vòng vị trí
EL.KPpos = 2.5;



