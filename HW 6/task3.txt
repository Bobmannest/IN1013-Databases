-- 1
SELECT first_name FROM restStaff JOIN restbill ON restStaff.staff_no = restBill.waiter_no WHERE cust_name = "Tanya Singh";
-- 2 
SELECT room_date FROM restroom_management JOIN reststaff ON reststaff.staff_no = restroom_management.headwaiter WHERE first_name = "Charles" AND room_date LIKE "1602%" AND room_name = "Green";
-- 3
SELECT first_name, surname FROM restStaff WHERE headwaiter IN (SELECT headwaiter FROM restStaff WHERE first_name = "Zoe" AND surname = "Ball");
-- 4
SELECT cust_name, bill_total, restStaff.first_name FROM restBill JOIN restStaff ON restBill.waiter_no = restStaff.staff_no ORDER BY bill_total DESC;
-- 5 
SELECT first_name, surname FROM restStaff JOIN restBill ON restStaff.staff_no = restBill.waiter_no WHERE bill_no = "00014" OR bill_no="00017";
-- 6 
SELECT first_name, surname FROM restStaff JOIN restRoom_management ON restStaff.staff_no = restRoom_management.headwaiter WHERE room_name = "Blue" AND room_date = "160312";

