/************/
SELECT *
FROM training;

/************/
SELECT training.full_name
FROM training;

/************/
SELECT full_name
FROM training;

/************/
SELECT full_name
FROM training
ORDER BY acronym; 

/************/
SELECT full_name
FROM training
ORDER BY acronym DESC; 

/************/
SELECT full_name
FROM training
ORDER BY acronym DESC
LIMIT 3;

/************/
SELECT full_name
FROM training
ORDER BY acronym DESC
LIMIT 3 OFFSET 2;

/************/
SELECT first_name, last_name
FROM student
WHERE last_name = 'Grimaud';

/************/
SELECT address
FROM student
WHERE last_name = 'Grimaud' AND first_name = 'Luce';

/************/
SELECT DISTINCT last_name
FROM student;

/************/
SELECT student.last_name, training.acronym
FROM student, training;

/************/
SELECT last_name, acronym
FROM student, training;

/************/
SELECT training.full_name
FROM student, training 
WHERE student.enrollment = training.acronym AND student.last_name = 'Grimaud' AND student.first_name = 'Luce';

/************/
SELECT student.last_name, training.full_name
FROM training
JOIN student ON student.enrollment = training.acronym 
WHERE student.last_name = 'Grimaud' AND student.first_name = 'Luce';

/************/
SELECT student.last_name AS nom, training.full_name AS formation
FROM training
JOIN student ON student.enrollment = training.acronym 
WHERE student.last_name = 'Grimaud' AND student.first_name = 'Luce';

/************/
SELECT student.last_name AS nom,
       student.first_name AS prénom,
       training.full_name AS formation
FROM training
JOIN student ON student.enrollment = training.acronym 
WHERE student.last_name IN ('Grimaud', 'Lambert');

/************/
SELECT student.last_name AS nom,
       student.first_name AS prénom,
       report_card.appreciation AS appréciation
FROM student
JOIN report_card ON student.id_card = report_card.id_card;

/************/
SELECT student.last_name AS nom,
       student.first_name AS prénom,
       report_card.appreciation AS appréciation
FROM student
LEFT JOIN report_card ON student.id_card = report_card.id_card;

/************/
SELECT student.last_name AS nom, student.first_name AS prénom
FROM student
JOIN offer ON student.enrollment = offer.training
JOIN course ON offer.course = course.id_course
WHERE course.title = 'Anglais'
ORDER BY student.last_name;

/************/
SELECT course.title AS cours
FROM course
JOIN offer ON course.id_course = offer.course
WHERE offer.training = 'MP2I'
UNION
SELECT course.title AS cours
FROM course
JOIN offer ON course.id_course = offer.course
WHERE offer.training = 'BTS SIO';

/************/
SELECT COUNT(*) AS nombre_etudiants
FROM student;

/************/
SELECT student.enrollment, COUNT(*) AS nombre_etudiants
FROM student
GROUP BY student.enrollment
ORDER BY nombre_etudiants DESC;

/************/
SELECT training.full_name, COUNT(*) AS nombre_etudiants
FROM student
JOIN training ON student.enrollment = training.acronym
GROUP BY training.full_name
ORDER BY nombre_etudiants DESC;

/************/
SELECT student.enrollment, COUNT(*) AS nombre_etudiants
FROM student
GROUP BY student.enrollment
HAVING COUNT(*) > 10
ORDER BY nombre_etudiants DESC;

/************/
SELECT student.enrollment, COUNT(*) AS nombre_etudiants
FROM student
WHERE student.address LIKE '%Lille%'
GROUP BY student.enrollment
HAVING COUNT(*) > 2
ORDER BY nombre_etudiants DESC;

/************/
SELECT training.acronym AS acronym,
       training.full_name AS full_name
FROM training
JOIN offer ON training.acronym = offer.training
WHERE offer.course = 'ENG';

/************/
SELECT student.last_name AS nom,
       student.first_name AS prénom,
       training_english.full_name AS formation
FROM student
JOIN training_english ON student.enrollment = training_english.acronym
ORDER BY formation, nom, prénom

/************/
WITH training_english AS (
    SELECT training.acronym AS acronym,
           training.full_name AS full_name
    FROM training
    JOIN offer ON training.acronym = offer.training
    WHERE offer.course = 'ENG'
)
SELECT student.last_name AS nom,
       student.first_name AS prénom,
       training_english.full_name AS formation
FROM student
JOIN training_english ON student.enrollment = training_english.acronym
ORDER BY formation, nom, prénom;

/************/
SELECT student.last_name AS nom,
       student.first_name AS prénom,
       training_english.full_name AS formation
FROM student
JOIN (
    SELECT training.acronym AS acronym,
           training.full_name AS full_name
    FROM training
    JOIN offer ON training.acronym = offer.training
    WHERE offer.course = 'ENG'
) AS training_english ON student.enrollment = training_english.acronym
ORDER BY formation, nom, prénom;

/************/
SELECT student.last_name AS nom,
       student.first_name AS prénom,
       training.full_name AS formation
FROM student
JOIN training ON student.enrollment = training.acronym
JOIN offer ON training.acronym = offer.training
WHERE offer.course = 'ENG'
ORDER BY formation, nom, prénom;
