

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT *
FROM `students`
WHERE `date_of_birth` LIKE '1990-%';



-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT *
FROM `courses`
WHERE `cfu` > 10
ORDER BY `cfu` ASC;



-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT *
FROM `students`
WHERE `date_of_birth` <= DATE_SUB(CURDATE(), INTERVAL 30 YEAR);


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)

SELECT * 
FROM `courses`
WHERE `period` = 'I semestre' AND `year` = 1;




-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)


SELECT * 
FROM `exams`
WHERE `date` = DATE('2020-06-20') AND `hour` >= TIME('14:00:00');



-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * 
FROM `degrees`
WHERE `level` = 'magistrale';



-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) 
FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*) AS `num_insegnati` 
FROM `teachers`
WHERE `phone` IS NOT NULL;



-- |******************************************************************| --



-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`enrolment_date`) AS `enrolment_number`, `enrolment_date`
FROM `students`
GROUP BY `enrolment_date`;



-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`office_number`)
FROM `teachers`
GROUP BY `office_number`;



-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT ROUND(AVG(`vote`)) AS `average_vote`, `student_id`
FROM `exam_student`
GROUP BY `student_id` , `vote`;



-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`name`) AS `department_id`, `department_id`
FROM `degrees`
GROUP BY `department_id`;
