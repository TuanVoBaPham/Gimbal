# Bài tập hệ Gimbal VDT2026

Mô tả yêu cầu bài toán mô hình hóa, điều khiển và mô phỏng hệ Gimbal hai trục mang camera trên UAV, tổng hợp từ tài liệu đề bài và tệp dữ liệu Excel được cung cấp.

## 1. Tài liệu và dữ liệu nguồn

| Tệp | Nội dung |
| --- | --- |
| `Bài tập hệ Gimbal VDT2026.docx` | Bối cảnh bài toán, dữ liệu đầu vào, yêu cầu thực hiện, sản phẩm cần nộp và bảng tham số |
| `dataUAV_200kmh_1km.xlsx` | Bảng dữ liệu hành trình UAV và các cột tọa độ mục tiêu |


## 2. Bối cảnh và hai giai đoạn hoạt động

Theo mục **I. Đặt vấn đề** của đề bài, UAV cảm tử sử dụng đầu tự dẫn quang học đặt ở phía mũi để bám mục tiêu. Thành phần cốt lõi là cơ cấu Gimbal hai trục **Yaw–Pitch** mang camera.

Đề bài chia kịch bản thành hai giai đoạn:

| Giai đoạn | Mô tả và yêu cầu theo đề bài |
| --- | --- |
| **Giai đoạn 1 — Hành trình** | Từ lúc phóng đến khi UAV bay đủ gần để camera nhận diện mục tiêu, giả sử ở khoảng cách **5 km**. Hệ điều khiển phải duy trì góc Gimbal cố định ở vị trí **0 độ so với trục dọc UAV**, bất chấp dao động của thân UAV. |
| **Giai đoạn 2 — Homing** | Khi mục tiêu xuất hiện trong tầm nhìn, hệ thống chuyển sang chế độ tự dẫn. Gimbal liên tục điều chỉnh góc quay để hình ảnh mục tiêu nằm ở tâm khung hình, cung cấp thông tin dẫn đường cho UAV lao tới. |


## 3. Các nhiệm vụ cần thực hiện

### 3.1. Mô hình hóa động học và động lực học

- Xây dựng mô hình toán học cho Gimbal cấu hình hai trục **AZ–EL (Yaw–Pitch)**.
- Lập trình các phương trình vi phân động học và động lực học bên trong khối **MATLAB Function**.

Các nội dung được đề bài ghi là **điểm cộng**:

- Bổ sung thành phần mô men ma sát.
- Bổ sung thành phần mô men lệch trục.
- Mô phỏng sensor.
- Bổ sung giới hạn cơ cấu chấp hành của động cơ và giới hạn góc quay.

### 3.2. Thiết kế hệ thống điều khiển

Thiết kế bộ điều khiển đáp ứng cả hai giai đoạn được mô tả ở phần 2. Đề bài không chỉ định loại bộ điều khiển hoặc giá trị tham số điều khiển.

### 3.3. Tích hợp và mô phỏng

- Ghép mô hình đối tượng và bộ điều khiển thành hệ thống hoàn chỉnh trên **Simulink**.
- Nạp dữ liệu hành trình UAV và tọa độ mục tiêu.
- Chạy mô phỏng trong **toàn thời gian bay**.

## 4. Dữ liệu đầu vào

### 4.1. Mô tả trong đề bài

Mục **II. Dữ liệu đầu vào** nêu các thành phần:

- Tọa độ vị trí GPS của UAV.
- Tư thế thân UAV: Roll, Pitch, Yaw.
- Vận tốc tịnh tiến và vận tốc quay thay đổi theo thời gian.
- Tọa độ GPS của mục tiêu.
- Bảng tham số của hệ trong phụ lục.

Tài liệu ghi tần số trích mẫu dữ liệu là **25 Hz**.

### 4.2. Cấu trúc tệp Excel được cung cấp

Tệp `dataUAV_200kmh_1km.xlsx` có cấu trúc quan sát được như sau:

| Thuộc tính | Nội dung |
| --- | --- |
| Tên sheet | `Sheet1` |
| Vùng bảng | `A1:P6845` |
| Dòng tiêu đề | Dòng 1 |
| Vùng dữ liệu | `A2:P6845` |
| Số bản ghi dữ liệu | 6.844, không tính dòng tiêu đề |
| Số cột | 16 |

Tên các cột được giữ nguyên theo Excel:

| Cột Excel | Tên trường |
| --- | --- |
| A | `lat_bomb` |
| B | `lon_bomb` |
| C | `h_bomb` |
| D | `roll_bomb` |
| E | `pitch_bomb` |
| F | `yaw_bomb` |
| G | `Vx_bomb` |
| H | `Vy_bomb` |
| I | `Vz_bomb` |
| J | `p_bomb` |
| K | `q_bomb` |
| L | `r_bomb` |
| M | `Target_lat` |
| N | `Target_lon` |
| O | `Target_h` |
| P | `Dist` |

## 5. Tham số hệ Gimbal và động cơ

### 5.1. Nhóm động cơ trục AZ

| STT trong đề bài | Tham số | Giá trị |
| --- | --- | --- |
| 1 | Điện cảm cuộn dây | 6.3 mH |
| 2 | Điện trở thuần | 16.5 Ω |
| 3 | Hằng số mô men quay | 0.3 N·m/A |
| 4 | Hằng số suất điện động phản kháng | 0.284 V/(rad/s) |
| 5 | Vận tốc góc tham chiếu ma sát | 0.05 rad/s |
| 6 | Hệ số ma sát nhớt | 0.1; đề bài không ghi đơn vị |
| 7 | Mô men quán tính khung Az đối với trục X | 3.37 × 10⁻³ kg·m² |
| 8 | Mô men quán tính khung Az đối với trục Y | 3.07 × 10⁻³ kg·m² |
| 9 | Mô men quán tính khung Az đối với trục Z | 0.935 × 10⁻³ kg·m² |

### 5.2. Nhóm động cơ trục EL

| STT trong đề bài | Tham số | Giá trị |
| --- | --- | --- |
| 10 | Điện cảm cuộn dây | 6.3 mH |
| 11 | Điện trở thuần | 16.5 Ω |
| 12 | Hằng số mô men quay | 0.3 N·m/A |
| 13 | Hằng số suất điện động phản kháng | 0.284 V/(rad/s) |
| 14 | Vận tốc góc tham chiếu ma sát | 0.05 rad/s |
| 15 | Hệ số ma sát nhớt | 0.1; đề bài không ghi đơn vị |
| 16 | Mô men quán tính khung Az đối với trục X | 0.546 × 10⁻³ kg·m² |
| 17 | Mô men quán tính khung Az đối với trục Y | 0.618 × 10⁻³ kg·m² |
| 18 | Mô men quán tính khung Az đối với trục Z | 0.68 × 10⁻³ kg·m² |

### 5.3. Quang học

| STT trong đề bài | Tham số | Giá trị |
| --- | --- | --- |
| 19 | Độ phân giải | 640 × 480 pixel |
| 20 | Góc FOV | 8 độ |


