% Khai báo môn học
mon_hoc(lich_su).
mon_hoc(xac_suat).
mon_hoc(triet_hoc).
mon_hoc(co_so_du_lieu).
mon_hoc(cau_truc_du_lieu).
mon_hoc(vat_ly).

% Khai báo môn ưu tiên
mon_uu_tien(xac_suat).
mon_uu_tien(co_so_du_lieu).
mon_uu_tien(cau_truc_du_lieu).

% Số buổi tự học :  số buổi ( môn, số buổi )
so_buoi(lich_su,1).
so_buoi(xac_suat,2).
so_buoi(triet_hoc,1).
so_buoi(co_so_du_lieu,2).
so_buoi(cau_truc_du_lieu,2).
so_buoi(vat_ly,1).

% Buổi trong ngày : Buoi(buổi)
buoi(sang).
buoi(chieu).
buoi(toi).

% Các ngày trong tuần
day(mon).
day(tue).
day(wed).
day(thu).
day(fri).
day(sat).
day(sun).

% Lịch học ở trường : Lịch ( môn, thứ, time_bắt_đầu, time_kết_thúc)
lich_truong(lich_su,tue,420,570).
lich_truong(xac_suat,tue,600,750).
lich_truong(triet_hoc,tue,810,960).
lich_truong(co_so_du_lieu,wed,810,960).
lich_truong(cau_truc_du_lieu,wed,980,1130).
lich_truong(vat_ly,thu,420,570).
lich_truong(vat_ly,thu,600,750).

% Các khung giờ tự học : Khung giờ (thứ, buổi, time_Bắt_đầu, time_Kết_thúc)
% Thứ 2
khung_gio(mon, sang, 420, 600).
khung_gio(mon, chieu, 840, 990).
khung_gio(mon, toi, 1170, 1410).
% Thứ 3
khung_gio(tue, sang, 420, 600).
khung_gio(tue, chieu, 840, 990).
khung_gio(tue, toi, 1170, 1410).
% Thứ 4
khung_gio(wed, sang, 420, 600).
khung_gio(wed, chieu, 840, 990).
khung_gio(wed, toi, 1170, 1410).
% Thứ 
khung_gio(thu, sang, 420, 600).
khung_gio(thu, chieu, 840, 990).
khung_gio(thu, toi, 1170, 1410).
% Thứ 6
khung_gio(fri, sang, 420, 600).
khung_gio(fri, chieu, 840, 990).
khung_gio(fri, toi, 1170, 1410).
% Thứ 7
khung_gio(sat, sang, 420, 600).
khung_gio(sat, chieu, 840, 990).
khung_gio(sat, toi, 1170, 1410).
% Chủ nhật
khung_gio(sun, sang, 420, 600).
khung_gio(sun, chieu, 840, 990).
khung_gio(sun, toi, 1170, 1410).

% Hoạt động ngoài lề: hoạt động (thứ, buổi)
% Tối thứ 6 đá bóng
hoat_dong(fri, toi).
% Thứ 7 nghỉ ngơi cả ngày
hoat_dong(sat, sang).
hoat_dong(sat, chieu).
hoat_dong(sat, toi).
% Chủ nhật sáng ngủ nướng
hoat_dong(sun, sang).


% LUẬT SINH và RÀNG BUỘC:

% Mỗi môn được xếp đúng số buổi yêu cầu
N { tu_hoc(Mon, Ngay, Buoi) : khung_gio(Ngay, Buoi, Dau, Cuoi)} N :- so_buoi(Mon, N).

% Không tự học trùng lịch trường
:- tu_hoc(Mon, Ngay, Buoi),
   khung_gio(Ngay, Buoi, Dau, Cuoi),
   lich_truong(_, Ngay, Dau_truong, Cuoi_truong),
   Dau < Cuoi_truong,
   Dau_truong < Cuoi.

% Mỗi khung giờ không được trùng 2 môn
:- tu_hoc(Mon1, Ngay, Buoi),
   tu_hoc(Mon2, Ngay, Buoi),
   Mon1 != Mon2.

% Không trùng lịch với lịch vui chơi giải trí
:- tu_hoc(Mon, Ngay, Buoi),
   hoat_dong(Ngay, Buoi).

% Giới hạn ko học quá 2 buổi/ngày
:- day(Ngay),
   3 {
       tu_hoc(Mon, Ngay, Buoi) :
       mon_hoc(Mon),
       khung_gio(Ngay, Buoi, Dau, Cuoi)
   }.

% Ưu tiên các môn chuyên ngành vào buổi tối
#maximize {
    1@2, Mon, Ngay :
    tu_hoc(Mon, Ngay, toi),
    mon_uu_tien(Mon)
}.

#show tu_hoc/3.