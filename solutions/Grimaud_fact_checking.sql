/************/
SELECT country FROM reinhart_rogoff;

/************/
SELECT DISTINCT country FROM reinhart_rogoff;

/************/
SELECT DISTINCT country
FROM reinhart_rogoff
ORDER BY country;

/************/
SELECT COUNT(DISTINCT country)
FROM reinhart_rogoff;

/************/
SELECT country, COUNT(years)
FROM reinhart_rogoff
GROUP BY country;

/************/
SELECT country, COUNT(years) AS nb_years 
FROM reinhart_rogoff 
GROUP BY country 
ORDER BY nb_years DESC;

/************/
SELECT debt_category, AVG(growth_rate) AS average_growth
FROM reinhart_rogoff
GROUP BY debt_category
ORDER BY debt_category;
