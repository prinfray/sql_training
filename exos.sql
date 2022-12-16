-- Active: 1665664723648@@127.0.0.1@3306@cours_SQL

-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
SELECT COUNT() FROM lpecom_examens WHERE id_etudiant ;
    
    
SELECT DISTINCT id_etudiant, COUNT( id_examen ) as nb_examens FROM lpecom_examens GROUP BY id_etudiant ; 


SELECT AVG(exa.note), exa.id_etudiant, etu.nom,etu.prenom FROM lpecom_examens exa INNER JOIN lpecom_etudiants etu ON exa.id_etudiant = etu.id_etudiant GROUP BY id_etudiant ;

SELECT  AVG(note)as 'Moyenne des notes par matiere', matiere FROM lpecom_examens GROUP BY matiere ORDER BY AVG(note) DESC;

SELECT AVG(exa.note) as 'moyenne etudiant', exa.id_etudiant, etu.nom,etu.prenom FROM lpecom_examens exa INNER JOIN lpecom_etudiants etu ON exa.id_etudiant = etu.id_etudiant  GROUP BY id_etudiant ;

SELECT id_etudiant, AVG(note) as 'moyenne' FROM lpecom_examens GROUP BY id_etudiant; 


SELECT * FROM
 (SELECT id_etudiant, AVG(note) as moyenne FROM lpecom_examens GROUP BY id_etudiant) as subreq
  WHERE  subreq.moyenne > 10;

SELECT * FROM (SELECT MAX(note) as 'note_max', matiere FROM lpecom_examens GROUP BY matiere) as subreq JOIN lpecom_examens exa ON exa.note = subreq.note_max AND exa.matiere = subreq.matiere;

SELECT MAX(note) as 'note_max', matiere FROM lpecom_examens GROUP BY matiere;

SELECT id_etudiant WHERE note = subreq.note_max AND matiere = subreq.matiere;


 SELECT subreq1.nb_exams, subreq2.nb_etudiants FROM( SELECT * FROM
 (
    SELECT COUNT(DISTINCT id_examen) as nb_exams FROM lpecom_examens) as subreq1,
    (SELECT COUNT(DISTINCT id_etudiant) as nb_etudiants FROM lpecom_etudiants) as subreq2) as subreq3;

SELECT COUNT(*) FROM lpecom_examens as nb_exams, lpecom_etudiants as nb_etudiants;

SELECT  (
        SELECT COUNT(*)
        FROM   lpecom_etudiants
        ) AS nb_etudiants,
        (
        SELECT COUNT(*)
        FROM   lpecom_examens
        ) AS nb_exams
FROM    DUAL