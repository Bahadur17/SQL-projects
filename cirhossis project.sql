SELECT * FROM bahadur.example;
select status from  bahadur.example
where status='c';

select avg(Age) as avg_age
from  bahadur.example
where Sex='M'; 

select count(*) as numpatients_ascites_hepato
from bahadur.example
where ascites='Y'AND hepatomegaly='Y';

select max(Bilirubin) as max_bilibrim
from bahadur.example;

select avg(Cholesterol) as cholestrol
from bahadur.example
where Drug='D-penicillamine';

select ID,N_Days
from bahadur.example
where Edema='Y';

SELECT Hepatomegaly, Spiders,
       COUNT(CASE WHEN Sex = 'M' THEN 1 END) AS male_count,
       COUNT(CASE WHEN Sex = 'F' THEN 1 END) AS female_count
FROM bahadur.example
GROUP BY Hepatomegaly, Spiders
ORDER BY Hepatomegaly, Spiders;

select avg(Prothrombin) as prothrombin_avg
from bahadur.example
where Status='D';

select Status,ID from bahadur.example
where (Spiders = 'Y') and (Hepatomegaly = 'Y');

select min(Platelets) as palylets_max
from bahadur.example;

select ID,N_Days
from bahadur.example
where Status='D';

SELECT 
    MIN(Platelets) AS min_platelet_count,
    MAX(Platelets) AS max_platelet_count
FROM 
    bahadur.example;
    
SELECT * FROM bahadur.example;
 select 
 min(Tryglicerides) as min_try,
 max(Tryglicerides) as max_try
 from example;
 
 SELECT 
    MIN(Triglycerides) AS min_triglycerides,
    MAX(Triglycerides) AS max_triglycerides
FROM 
    bahadur.example;
    
select 
avg(Albumin) as album
from bahadur.example;

select count(*)
from bahadur.example
where sex='M' and 'F'; 

select count(*) as total_patients
from bahadur.example
where sex in('M','F');

select avg(Platelets) as avg_platelets
from bahadur.example
where Ascites in('Y','N');

 select count(*) as ascitesboth
 from bahadur.example
 where Ascites in('Y','N');
select ID, Age,Status
from bahadur.example 
where age>50 and Hepatomegaly='Y';
 
SELECT 
    ID, Age, Status
FROM 
    bahadur.example
WHERE 
    Age > 50 AND Hepatomegaly = 'Y';

 select ID,Drug
 from bahadur.example
 where Drug like '%penicillamine%';

select ID,Age,Bilirubin
from bahadur.example
order by age asc;

select ID,Age,Bilirubin
from bahadur.example
order by age desc;

select ID,Age,Bilirubin
from bahadur.example
order by age asc;
 
 select ID,Age,N_Days
 from bahadur.example
 order by N_Days desc;

select ID,Age,Cholesterol
from bahadur.example
where age<50  order by Cholesterol asc;
