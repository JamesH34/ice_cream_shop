-- Number of employee hours worked per store
-- SELECT employee_store.employee_name, timesheets.hours_worked
-- AS store_1_employees
-- FROM employee_store
-- JOIN timesheets ON employee_store.employee_id = timesheets.employee_id
-- WHERE store_id = 1;

-- SELECT flavor AS colors FROM buckets_of_ice_cream;

-- SELECT employee_store.employee_name;

-- SELECT SUM(hours_worked(SELECT employee_store.employee_id, timesheets.hours_worked
-- FROM employee_store
-- JOIN timesheets ON employee_store.employee_id = timesheets.employee_id
-- WHERE employee_store.store_id = 1));

SELECT SUM(hours_worked) AS store_1_total_hours_worked
FROM (
    SELECT timesheets.hours_worked
    FROM employee_store
    JOIN timesheets ON employee_store.employee_id = timesheets.employee_id
    WHERE employee_store.store_id = 1
) AS subquery;

SELECT SUM(hours_worked) AS store_2_total_hours_worked
FROM (
    SELECT timesheets.hours_worked
    FROM employee_store
    JOIN timesheets ON employee_store.employee_id = timesheets.employee_id
    WHERE employee_store.store_id = 2
) AS subquery;

SELECT SUM(hours_worked) AS store_3_total_hours_worked
FROM (
    SELECT timesheets.hours_worked
    FROM employee_store
    JOIN timesheets ON employee_store.employee_id = timesheets.employee_id
    WHERE employee_store.store_id = 3
) AS subquery;

-- SELECT employee_id AS store_2_employees FROM employee_store WHERE store_id = 2;


-- SELECT employee_id AS store_3_employees FROM employee_store WHERE store_id = 3;








-- Number of purchases per store






-- Profit (amount of money made) per store from customer purchases
