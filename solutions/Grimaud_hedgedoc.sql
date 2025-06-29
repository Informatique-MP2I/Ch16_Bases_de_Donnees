/************/
SELECT title, shortid
FROM "Notes"
WHERE content LIKE '';

/************/
SELECT title, shortid
FROM "Notes"
WHERE content LIKE '%<style>%';

/************/
SELECT title, shortid, email
FROM "Notes"
JOIN "Users" ON "Notes"."ownerId" = "Users".id
WHERE content LIKE '%informatique%';

/************/
SELECT DISTINCT "Users".email, COUNT("Notes".shortid) AS nb_emptypage
FROM "Notes"
JOIN "Users" ON "Users".id = "Notes"."ownerId"
WHERE content LIKE ''
GROUP BY "Users".email
ORDER BY nb_emptypage DESC;  

/************/
SELECT "noteId", COUNT(DISTINCT "userId") AS nb_authors
FROM "Authors" 
GROUP BY "noteId"
ORDER BY nb_authors DESC
LIMIT 1;

/************/
SELECT shortid, title, COUNT("Revisions"."noteId") AS nb_revision
FROM "Notes"
JOIN "Revisions" ON "Notes".id = "Revisions"."noteId"
GROUP BY "Notes".id
ORDER BY nb_revision DESC
LIMIT 5;

/************/
SELECT "noteId", COUNT(DISTINCT "userId") AS nb_authors
FROM "Authors"
GROUP BY "noteId"
ORDER BY nb_authors DESC; 

/************/
WITH "AuthorCount" AS (
	SELECT "noteId", COUNT(DISTINCT "userId") AS nb_authors
	FROM "Authors"
	GROUP BY "noteId"
	)
SELECT "Notes".title, "Notes".shortid, "Users".email, "AuthorCount".nb_authors
FROM "Notes"
JOIN "Users" ON "Notes"."ownerId" = "Users".id
JOIN "AuthorCount" ON "AuthorCount"."noteId" = "Notes"."id"
ORDER BY nb_authors DESC
LIMIT 5;

SELECT "Notes".title, "Notes".shortid, "Users".email, "AuthorCount".nb_authors
FROM "Notes"
JOIN "Users" ON "Notes"."ownerId" = "Users".id
JOIN  (
	SELECT "noteId", COUNT(DISTINCT "userId") AS nb_authors
	FROM "Authors"
	GROUP BY "noteId"
) "AuthorCount" ON "AuthorCount"."noteId" = "Notes"."id"
ORDER BY nb_authors DESC
LIMIT 5;
