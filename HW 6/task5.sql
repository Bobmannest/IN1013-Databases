-- 1
SELECT bill_date, COUNT(bill_no) FROM restBill GROUP BY bill_date HAVING COUNT(bill_no)>1;
-- 2
SELECT room_name, count(room_name) AS num_of_tables FROM restRest_table GROUP BY room_name;
-- 3
SELECT room_name, count(bill_no) AS num_of_bills FROM restBill, restRest_table WHERE restRest_table.table_no = restBill.table_no GROUP BY room_name;
-- 4
SELECT first_name, surname FROM restStaff WHERE restStaff.headwaiter = "0%";
-- 5
SELECT cust_name FROM restBill WHERE AVG(bill_total) > 400 GROUP BY bill_total;
-- 6
SELECT first_name, surname, COUNT(bill_no) FROM restStaff, restBill WHERE COUNT(bill_no) >2 AND restStaff.staff_no = restbill.waiter_no GROUP BY first_name;