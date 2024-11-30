-- 1
SELECT cust_name FROM restBill WHERE bill_total > 450 AND table_no IN (SELECT table_no FROM restRest_table WHERE room_name IN (SELECT room_name FROM restRoom_management WHERE headwaiter IN (SELECT staff_no FROM restStaff WHERE first_name = "Charles")));
-- 2
SELECT first_name, surname FROM restStaff WHERE staff_no IN (SELECT headwaiter FROM restRoom_management WHERE room_name IN (SELECT room_name FROM restRest_table WHERE table_no IN (SELECT table_no FROM restBill WHERE bill_date = "160111" AND cust_name LIKE "Nerida%")));
-- 3
SELECT cust_name FROM restBILL ORDER BY bill_total ASC LIMIT 3;
-- 4
SELECT first_name FROM restStaff WHERE staff_no NOT IN (SELECT waiter_no FROM restBill);
-- 5
SELECT first_name, surname, cust_name FROM restStaff, restBill WHERE staff_no IN (SELECT waiter_no FROM restBILL WHERE bill_total IN (SELECT bill_total FROM restBill ORDER BY bill_total DESC)) LIMIT 3;