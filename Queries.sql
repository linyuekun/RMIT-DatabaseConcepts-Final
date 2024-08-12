-- Q1

SELECT c.location AS "Country Name",
v.daily_vacinations AS "Administered Vaccine on OD (VOD)",
v.total_vaccinations AS "Total Administered Vaccines"
FROM Countries c
    INNER JOIN Vaccinations v
    ON c.location = v.location
    AND c.last_observation_date = v.date;
    

-- Q2

SELECT c.location AS "Country", SUM(v.daily_vacinations) AS "Cumulative Doses"
FROM Countries c
    INNER JOIN Vaccinations v
    ON c.location = v.location
GROUP BY c.location;


-- Q3

SELECT DISTINCT c.location AS "Country", v.vaccine AS "Vaccine Types"
FROM Countries c
    INNER JOIN Vaccine_type v
    ON c.location = v.location;


-- Q4

SELECT c.source_website AS "Source Name (URL)", 
SUM(v.daily_vacinations) AS "Total Administered Vaccines"
FROM Countries c
    INNER JOIN Vaccinations v
    ON c.location = v.location
GROUP BY c.source_website;


-- Q5

SELECT a.date AS "Date", A AS "Australia", B AS "United States", C AS "Germany", D AS "Italy"
FROM(
    SELECT date, location, people_fully_vaccinated AS "A"
    FROM Vaccinations
    WHERE date >= "2022-01-01 00:00:00"
    AND LOWER(location) = "australia") a

INNER JOIN (
    SELECT date, location, people_fully_vaccinated AS "B"
    FROM Vaccinations
    WHERE date >= "2022-01-01 00:00:00"
    AND LOWER(location) = "united states") b
ON a.date = b.date

INNER JOIN(
    SELECT date, location, people_fully_vaccinated AS "C"
    FROM Vaccinations
    WHERE date >= "2022-01-01 00:00:00"
    AND LOWER(location) = "germany") c
ON b.date = c.date

INNER JOIN (
    SELECT date, location, people_fully_vaccinated AS "D"
    FROM Vaccinations
    WHERE date >= "2022-01-01 00:00:00"
    AND LOWER(location) = "italy") d
ON c.date = d.date;

