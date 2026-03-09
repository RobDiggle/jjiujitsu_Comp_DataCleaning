SELECT tournamentname, COUNT(DISTINCT TournamentName) AS tournament_num
FROM jj_comp_data
GROUP BY tournamentname
ORDER BY COUNT(tournamentname)

-- Standardizing inconsistencies in names in various rows

-- Standardizing tournamentname
SELECT 
    DISTINCT tournamentname,
CASE
    WHEN LOWER(tournamentname) LIKE '%rappling%' THEN 'Grappling Grand Prix'
    WHEN LOWER(tournamentname) LIKE '%tate%' THEN 'State Championship'
    WHEN LOWER(tournamentname) LIKE '%inter%' THEN 'Winter Invitational'
    WHEN LOWER(tournamentname) LIKE '%egional%' THEN 'Regional Classic'
    WHEN LOWER(tournamentname) LIKE '%ummer%' THEN 'Summer Open'
    WHEN LOWER(tournamentname) LIKE '%ity cup%' THEN 'City Cup'
END AS tournamentname_cleaned
FROM
    jj_comp_data;

UPDATE jj_comp_data
SET tournamentname =
CASE
    WHEN LOWER(tournamentname) LIKE '%rappling%' THEN 'Grappling Grand Prix'
    WHEN LOWER(tournamentname) LIKE '%tate%' THEN 'State Championship'
    WHEN LOWER(tournamentname) LIKE '%inter%' THEN 'Winter Invitational'
    WHEN LOWER(tournamentname) LIKE '%egional%' THEN 'Regional Classic'
    WHEN LOWER(tournamentname) LIKE '%ummer%' THEN 'Summer Open'
    WHEN LOWER(tournamentname) LIKE '%ity cup%' THEN 'City Cup'
ELSE tournamentname
END;

SELECT DISTINCT tournamentname, COUNT(tournamentname)
FROM jj_comp_data
GROUP BY tournamentname;

-- Standardizing tournamentcity
SELECT 
    DISTINCT tournamentcity,
CASE
    WHEN LOWER(tournamentcity) LIKE '%lanta%' THEN 'Atlanta, Georgia'
    WHEN LOWER(tournamentcity) LIKE '%iego%' THEN 'San Diego, California'
    WHEN LOWER(tournamentcity) LIKE '%iami%' THEN 'Miami, Florida'
    WHEN LOWER(tournamentcity) LIKE '%ustin%' THEN 'Austin, Texas'
    WHEN LOWER(tournamentcity) LIKE '%eattle%' THEN 'Seattle, Washington'
    WHEN LOWER(tournamentcity) LIKE '%hoenix%' THEN 'Phoenix, Arizona'
    WHEN LOWER(tournamentcity) LIKE '%allas%' THEN 'Dallas, Texas'
    WHEN LOWER(tournamentcity) LIKE '%enver%' THEN 'Denver, Colorado'
    WHEN LOWER(tournamentcity) LIKE '%hicago%' THEN 'Chicago, Illinois'
    WHEN LOWER(tournamentcity) LIKE '%ouston%' THEN 'Houston, Texas'
END AS tournamentcity_cleaned
FROM
    jj_comp_data;

UPDATE jj_comp_data
SET tournamentcity =
CASE
    WHEN LOWER(tournamentcity) LIKE '%lanta%' THEN 'Atlanta, Georgia'
    WHEN LOWER(tournamentcity) LIKE '%iego%' THEN 'San Diego, California'
    WHEN LOWER(tournamentcity) LIKE '%iami%' THEN 'Miami, Florida'
    WHEN LOWER(tournamentcity) LIKE '%ustin%' THEN 'Austin, Texas'
    WHEN LOWER(tournamentcity) LIKE '%eattle%' THEN 'Seattle, Washington'
    WHEN LOWER(tournamentcity) LIKE '%hoenix%' THEN 'Phoenix, Arizona'
    WHEN LOWER(tournamentcity) LIKE '%allas%' THEN 'Dallas, Texas'
    WHEN LOWER(tournamentcity) LIKE '%enver%' THEN 'Denver, Colorado'
    WHEN LOWER(tournamentcity) LIKE '%hicago%' THEN 'Chicago, Illinois'
    WHEN LOWER(tournamentcity) LIKE '%ouston%' THEN 'Houston, Texas'
ELSE tournamentcity
END;

SELECT DISTINCT tournamentcity, COUNT(tournamentcity)
FROM jj_comp_data
GROUP BY tournamentcity;

-- Deleting tournament state column

ALTER TABLE jj_comp_data
DROP COLUMN tournamentstate;





SELECT * FROM jj_comp_data
