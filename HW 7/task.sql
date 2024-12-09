-- 1
CREATE OR REPLACE VIEW samsBills AS SELECT first_name, surname, bill_date, cust_name, bill_total FROM restStaff JOIN restBill ON restStaff.staff_no = restBill.waiter_no WHERE first_name = "Sam" AND surname = "Pitt";
SELECT * from samsBills;
-- 2
SELECT * FROM samsBills WHERE bill_total > 400;
-- 3
CREATE OR REPLACE VIEW roomTotals AS SELECT room_name, SUM(bill_total) AS total_sum FROM restRest_table JOIN restBill ON restRest_table.table_no = restBill.table_no GROUP BY room_name;
-- 4
CREATE OR REPLACE VIEW teamTotals AS SELECT CONCAT(first_name, surname) AS headwaiter_name, SUM(bill_total) AS total_sum FROM restStaff JOIN restBill ON restStaff.staff_no = restBill.waiter_no GROUP BY headwaiter_name;