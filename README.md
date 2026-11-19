Câu lệnh 1:  python -m clingo Lap_lich.lp 1 

-> Tìm và ra một Stable Model cùng các thông tin cần thiết, đã xét tối ưu hóa min,max nhưng kết quả chưa chắc tối ưu nhất.

---
Câu lệnh 2:   python -m clingo Lap_lich.lp --opt-mode=optN 0

-> Tìm và liệt kê tất cả Stable Models cùng các thông tin cần thiết.

---
Câu lệnh 3:   python -m clingo Lap_lich.lp --opt-mode=opt -n 0 --quiet=1,1

-> Tìm và in Stable Model tối ưu cùng các thông tin cần thiết.