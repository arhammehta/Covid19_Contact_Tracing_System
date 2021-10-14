-- =============================================
-- Database: MySQL
--
-- Question 2
-- Returns the most reported symptoms, and in case of a tie returns both the symptoms
-- =============================================

SELECT Symptom_id
FROM Symptom
GROUP BY Symptom_id HAVING COUNT(Symptom_id) = 
	(SELECT COUNT(Symptom_id) 
	FROM Symptom 
    GROUP BY Symptom_id 
    ORDER BY COUNT(Symptom_id) DESC LIMIT 1);