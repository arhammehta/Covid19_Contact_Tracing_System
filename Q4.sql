                              
-- =============================================
-- Database: MySQL
--
-- Question 4
-- Assumed dates: 8th August to 16th September 2021 (both inclusive) 
-- =============================================

SELECT (
	-- subquery to check for total number of scans
	SELECT COUNT(*)
	FROM Scan
    WHERE Scan_date > "2021-8-8" AND Scan_date < "2021-9-16"
) AS total_scan_COUNT, (
	-- subquery to check for total number of self_reports
	SELECT COUNT( DISTINCT employee_id)
	FROM Symptom
    WHERE Date_reported > "2021-8-8" AND Date_reported < "2021-9-16"
) AS total_self_report, (
	-- subquery to check for total number of tests
	SELECT COUNT(*)
	FROM Test
    WHERE Test_date > "2021-8-8" AND Test_date < "2021-9-16"
) AS total_test, (
	-- subquery to check for total number of covid_cases
	SELECT COUNT(*)
	FROM Patient
    WHERE Case_date > "2021-8-8" AND Case_date < "2021-9-16"
) AS total_covid_cases;
