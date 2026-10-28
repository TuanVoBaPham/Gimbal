
%% 1. Đọc dữ liệu từ file
filename = 'dataUAV_200kmh_1km.xlsx'; % Hoặc đuôi .csv tùy định dạng thực tế của bạn
disp(['Đang đọc dữ liệu từ file: ', filename, '...']);

% Đọc dữ liệu vào một bảng (table)
uavData = readtable(filename, 'PreserveVariableNames', true);

% Hiển thị vài dòng đầu để kiểm tra tên cột
disp('Các cột dữ liệu hiện có:');
disp(uavData.Properties.VariableNames);

%% 2. Tạo vector thời gian (Tần số lấy mẫu 25Hz)
Fs = 25;            % [Hz] Tần số lấy mẫu
Ts = 1 / Fs;        % [s] Chu kỳ lấy mẫu (0.04s)
numSamples = height(uavData); % Tổng số hàng dữ liệu

% Tạo mảng thời gian t từ 0 đến kết thúc
t = (0:numSamples-1)' * Ts; 

%% 3. Bóc tách dữ liệu và tạo Timeseries cho Simulink
% LƯU Ý: Thay đổi tên cột (ví dụ: uavData.Roll) cho khớp với 
% tên cột thực tế mà lệnh disp ở trên in ra.

try
    % Tư thế thân UAV (Góc Euler) - Giả sử đơn vị trong file là độ hoặc radian
    % Nếu là độ, cân nhắc nhân với (pi/180) để đổi sang radian cho Simulink
    UAV_Roll  = timeseries(uavData.roll_bomb, t, 'Name', 'Roll');
    UAV_Pitch = timeseries(uavData.pitch_bomb, t, 'Name', 'Pitch');
    UAV_Yaw   = timeseries(uavData.yaw_bomb, t, 'Name', 'Yaw');

    % Vận tốc theo -các trục
    UAV_Vx  = timeseries(uavData.Vx_bomb, t, 'Name', 'Vx');
    UAV_Vy = timeseries(uavData.Vy_bomb, t, 'Name', 'Vy');
    UAV_Vz   = timeseries(uavData.Vz_bomb, t, 'Name', 'Vz');
    
    % Vận tốc góc thân UAV (p, q, r)
    UAV_p = timeseries(uavData.p_bomb, t, 'Name', 'p');
    UAV_q = timeseries(uavData.q_bomb, t, 'Name', 'q');
    UAV_r = timeseries(uavData.r_bomb, t, 'Name', 'r');
    
    % Tọa độ GPS của UAV (Vĩ độ, Kinh độ, Độ cao)
    UAV_Lat = timeseries(uavData.lat_bomb, t, 'Name', 'UAV_Lat');
    UAV_Lon = timeseries(uavData.lon_bomb, t, 'Name', 'UAV_Lon');
    UAV_Alt = timeseries(uavData.h_bomb, t, 'Name', 'UAV_Alt');
    
    % Tọa độ Mục tiêu (Target)
    Target_Lat = timeseries(uavData.Target_lat, t, 'Name', 'Target_Lat');
    Target_Lon = timeseries(uavData.Target_lon, t, 'Name', 'Target_Lon');
    Target_Alt = timeseries(uavData.Target_h, t, 'Name', 'Target_Alt');
    
    % Khoảng cách từ UAV đến mục tiêu
    Distance = timeseries(uavData.Dist, t, 'Name', 'Distance');
    disp('>> Đã tạo thành công các biến timeseries!');
catch ME
    warning('Có lỗi xảy ra khi bóc tách cột. Vui lòng kiểm tra lại tên cột (VariableNames) trong bảng uavData.');
    disp(ME.message);
end

%% HOÀN TẤT
disp('>> Workspace đã sẵn sàng cho Simulink.');