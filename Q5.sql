-- =============================================
-- Database: MySQL
--
-- Question 5
-- Divided the Employee table with the Meeting table, to get the employees attending a particular meeting
-- to compute the risk factor of transmitting the virus
-- =============================================
    
SELECT t1.Meeting_id, COUNT(e1.Employee_id) as 'Total Attendees',
CASE WHEN COUNT(e1.Employee_id) > 3 THEN 'high risk'
	 WHEN COUNT(e1.Employee_id) = 3 THEN 'medium risk '
	 WHEN COUNT(e1.Employee_id) = 2 THEN 'low risk '
	 WHEN COUNT(e1.Employee_id) < 2 THEN 'no risk ' END AS 'Covid Risk'
FROM Employee e1 JOIN Employee_Meeting_Bridge t1
ON e1.Employee_id = t1.Employee_id
GROUP BY t1.Meeting_id
HAVING NOT EXISTS
	(SELECT * FROM Employee_Meeting_Bridge t2
    WHERE NOT EXISTS
		(SELECT * FROM Employee AS e2
        WHERE (t2.Employee_id = e2.Employee_id)));