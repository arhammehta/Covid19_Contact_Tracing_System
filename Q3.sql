-- =============================================
-- Database: MySQL
--
-- Question 3
-- Counts the employees having health status as sick or hospitalized and returns the floor
-- number of maxmimum such employees in the given time interval
-- =============================================

SELECT e.Employee_floor_no
FROM Employee e JOIN Health_Status h
ON e.Employee_id = h.Employee_id
WHERE h.Current_status = 'sick' or h.Current_status = 'hospitalized' and 'h.Health_status_date' > "2021-8-15" and 'h.Health_status_date' < "2021-8-18"
GROUP BY e.Employee_floor_no
HAVING COUNT(e.Employee_id) = (SELECT MAX(Employee_count) FROM 
									(SELECT COUNT(a.Employee_id) as Employee_count 
									FROM Employee a JOIN Health_Status b
									ON a.Employee_id = b.Employee_id
									WHERE b.Current_status = 'sick' or b.Current_status = 'hospitalized' and 'h.Health_status_date' > "2021-8-15" and 'h.Health_status_date' < "2021-8-18"
									GROUP BY a.Employee_floor_no)temp
                              );
