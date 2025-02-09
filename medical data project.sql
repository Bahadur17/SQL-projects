SELECT * FROM project_medical_data_history.province_names;
SELECT * FROM project_medical_data_history.patients;

select first_name,last_name,gender 
from `project_medical_data_history`.patients 

where gender='M';

select first_name,last_name 
from `project_medical_data_history`.patients 
where allergies is NULL;


select first_name 
from `project_medical_data_history`.patients 
where first_name like 'C%';

select first_name,last_name 
from `project_medical_data_history`.patients 
where weight between 100 and 120;


update project_medical_data_history .patients 
set allergies='NKA' where allergies is null;

SELECT CONCAT(first_name, last_name) AS full_name
FROM `project_medical_data_history`.patients;


SELECT 
    p.first_name, 
    p.last_name, 
    pn.province_name
FROM 
    project_medical_data_history.patients p
JOIN 
    project_medical_data_history.province_names pn
ON 
    p.province_id = pn.province_id;



SELECT COUNT(*) AS patient_count
FROM project_medical_data_history.patients
WHERE YEAR(birth_date) = 2010;

SELECT 
	first_name, 
	last_name, 
	height
FROM 
	project_medical_data_history.patients
WHERE 
	height = (SELECT MAX(height) FROM project_medical_data_history.patients);

select * from project_medical_data_history.patients 
where patient_id in(1,45,534,879,1000);

SELECT COUNT(*) AS total_admissions
FROM project_medical_data_history.admissions;


select * from project_medical_data_history.admissions
where admission_date=discharge_date='same';


 select count(*) as total_no_admissions
 from project_medical_data_history.admissions
 where patient_id='579';
 
 
 SELECT DISTINCT city
FROM  project_medical_data_history.patients
WHERE province_id = 'NS';

SELECT first_name, last_name, birth_date
FROM project_medical_data_history.patients
WHERE height > 160 AND weight > 70;

SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM project_medical_data_history.patients
ORDER BY birth_year ASC;


SELECT first_name
FROM project_medical_data_history.patients
GROUP BY first_name
HAVING COUNT(*) = 1;

SELECT patient_id, first_name
FROM project_medical_data_history.patients
WHERE first_name LIKE 's%' AND first_name LIKE '%s' AND LENGTH(first_name) >= 6;
 
 
 SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
WHERE a.primary_diagnosis = 'Dementia';

SELECT first_name
FROM project_medical_data_history.patients
ORDER BY LENGTH(first_name), first_name;

SELECT 
    SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS total_male_patients,
    SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS total_female_patients
FROM project_medical_data_history.patients;

SELECT 
    COUNT(CASE WHEN gender = 'Male' THEN 1 END) AS total_male_patients,
    COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS total_female_patients
FROM project_medical_data_history.patients;


SELECT 
    patient_id, 
    diagnosis
FROM 
    project_medical_data_history.admissions
GROUP BY 
    patient_id, diagnosis
HAVING 
    COUNT(*) > 1;


SELECT 
    city, 
    COUNT(*) AS total_patients
FROM 
    project_medical_data_history.patients
GROUP BY 
    city
ORDER BY 
    total_patients DESC, 
    city ASC;


SELECT 
    first_name, 
    last_name, 
    specialty
FROM 
    project_medical_data_history.doctors
WHERE 
    specialty IN ('Patient', 'Doctor');

SELECT 
    allergies, 
    COUNT(*) AS frequency
FROM 
    project_medical_data_history.patients
WHERE 
    allergies IS NOT NULL
GROUP BY 
    allergies
ORDER BY 
    frequency DESC;


SELECT 
    first_name, 
    last_name, 
    birth_date
FROM 
    project_medical_data_history.patients
WHERE 
    birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY 
    birth_date ASC;


SELECT 
    CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name
FROM 
    project_medical_data_history.patients
ORDER BY 
    first_name DESC;
    
    
    SELECT 
    province_id, 
    SUM(height) AS total_height
FROM 
    project_medical_data_history.patients
GROUP BY 
    province_id
HAVING 
    SUM(height) >= 7000;


SELECT 
    MAX(weight) - MIN(weight) AS weight_difference
FROM 
    project_medical_data_history.patients
WHERE 
    last_name = 'Maroni';


SELECT 
    DAY(admission_date) AS day_of_month, 
    COUNT(*) AS admissions_count
FROM 
    project_medical_data_history.admissions
GROUP BY 
    DAY(admission_date)
ORDER BY 
    admissions_count DESC;


SELECT 
    CONCAT(FLOOR(weight / 10) * 10, '-', FLOOR(weight / 10) * 10 + 9) AS weight_group,
    COUNT(*) AS total_patients
FROM 
    project_medical_data_history.patients
GROUP BY 
    weight_group
ORDER BY 
    weight_group DESC;

SELECT 
    patient_id, 
    weight, 
    height,
    CASE 
        WHEN weight / (POWER(height / 100, 2)) >= 30 THEN 1
        ELSE 0
    END AS isObese
FROM 
    project_medical_data_history.patients;


USE project_medical_data_history;

SELECT 
    p.patient_id, 
    p.first_name, 
    p.last_name, 
    d.specialty
FROM 
    project_medical_data_history.patients p
JOIN 
    admissions a ON p.patient_id = a.patient_id
JOIN 
    doctors d ON a.attending_doctor_id = d.doctor_id
WHERE 
    a.diagnosis = 'Epilepsy' 
    AND d.first_name = 'Lisa';
    
    
    SELECT 
    p.patient_id,
    CONCAT(p.patient_id, 
           LENGTH(p.last_name), 
           YEAR(p.birth_date)) AS temp_password
FROM 
    project_medical_data_history.patients p
JOIN 
    admissions a ON p.patient_id = a.patient_id
WHERE 
    a.admission_date = (SELECT MIN(admission_date) 
                        FROM admissions 
                        WHERE patient_id = p.patient_id);

