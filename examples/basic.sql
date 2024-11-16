-- What are the names of all departments?
SElECT name FROM department;

-- Who is the head of each department?
SElECT d.name AS department_name, p.name AS head_name FROM department AS d JOIN physician AS p ON p.employeeid = d.head;

-- How many physicians are there in total?
SELECT COUNT(*) from physician;

-- What are the names of all physicians?
SELECT name from physician;

-- What positions do physicians hold?
SELECT name, position from physician;

-- What is the SSN of each physician?
SELECT name, ssn from physician;

-- Which departments are affiliated with a specific physician?
SELECT p.name AS physician_name, d.name AS department_name FROM physician AS p JOIN department AS d ON p.employeeid = d.head;

-- How many primary affiliations does each physician have?
SELECT COUNT(*) AS number_of_primary_affiliations, p.name AS physician_name FROM affiliated_with AS a JOIN physician AS p ON p.employeeid=physician WHERE a.primaryaffiliation =1 GROUP BY p.name;

-- What treatments are available?
SELECT name FROM treatment;

-- What is the cost of each treatment?
SELECT name, cost FROM treatment;

-- How many patients are registered in the database?
SELECT COUNT(*) FROM patient;

-- What are the names and addresses of all patients?
SELECT name, address FROM patient;

-- Who is the primary care physician for each patient?
SELECT p.name AS patient_name, physician.name AS physician_name FROM patient AS p JOIN physician ON p.pcp = physician.employeeid;

-- What medications are available along with their brands?
SELECT name, brand FROM medication;

-- What is the description of each medication?
SELECT name, description FROM medication;

-- What are the details of all appointments?
SELECT * FROM appointment;

-- Which patients have scheduled appointments?
SELECT p.name AS patient_name FROM appointment AS a JOIN patient AS p ON p.ssn = a.patient;

-- What is the start and end time of each appointment?
SELECT prepurse AS appointment_for,  start_dt_time AS start_at, end_dt_time AS end_at FROM appointment;

-- How many medications has each physician prescribed?
SELECT p.name AS physician_name, COUNT(medication) AS medications FROM prescribes JOIN physician AS p ON physician = p.employeeid GROUP BY physician_name;

-- How many stays has each patient had?
SELECT p.name,  COUNT(s.stayid) AS number_of_stay FROM stay AS s JOIN patient AS p ON p.ssn=s.patient GROUP BY p.ssn;

-- What are the room numbers where patients stayed?
SELECT p.name, s.room FROM stay AS s JOIN patient AS p ON p.ssn=s.patient;

-- What is the start and end time of each stay in rooms?
SELECT s.start_time, s.end_time, r.roomnumber FROM stay AS s JOIN room AS r ON r.roomnumber=s.room;

-- Which treatments have been undergone by each patient?
SELECT p.name as patient_name, t.name as treatment_name FROM undergoes AS u JOIN patient AS p ON p.ssn=u.patient JOIN treatment AS t ON t.code=u.treatment;

-- What medications have been prescribed to each patient?
SELECT m.name, m.brand, p.name AS patient_name FROM prescribes AS ps JOIN patient AS p ON p.ssn=ps.patient JOIN medication AS m ON ps.medication=m.code;

-- How many nurses are there in total?
SELECT COUNT(*) as total_nurses from nurse;