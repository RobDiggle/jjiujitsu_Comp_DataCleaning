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

-- Case expression
-- Used to apply conditional logic to transform 
-- or categorize data in the query output.
-- Here I am using it to identify inconsistences in team names and clean them accordingly.
SELECT TeamName
    CASE    
        WHEN LOWER(TeamName) LIKE '%arra%' THEN 'Gracie Barra'
        WHEN LOWER(TeamName) LIKE '%gb%' THEN 'Gracie Barra'
        WHEN LOWER(TeamName) LIKE '%fight%' THEN 'Fight Sports'
        WHEN LOWER(TeamName) LIKE '%dream%' THEN 'Dream Art'
        WHEN LOWER(TeamName) LIKE '%passos%' THEN 'Team Passos'
        WHEN LOWER(TeamName) LIKE '%atos%' THEN 'Atos'
        WHEN LOWER(TeamName) LIKE '%unity%' THEN 'Unity'
        WHEN LOWER(TeamName) LIKE '%checkmat%' THEN 'Checkmat'
        WHEN LOWER(TeamName) LIKE '%aoj%' THEN 'Art of Jiu Jitsu (AOJ)'
        WHEN LOWER(TeamName) LIKE '%art of%' THEN 'Art of Jiu Jitsu (AOJ)'
        WHEN LOWER(TeamName) LIKE '%check%' THEN 'Checkmat'
        WHEN LOWER(TeamName) LIKE '%BTEAM%' THEN 'Simple Man Martial Arts'        WHEN LOWER(TeamName) LIKE '%BTEAM%' THEN 'Simple Man Martial Arts'
        WHEN LOWER(TeamName) LIKE '%b team%' THEN 'Simple Man Martial Arts'
        WHEN LOWER(TeamName) LIKE '%check%' THEN 'Checkmat'
        WHEN LOWER(TeamName) LIKE '%nova%' THEN 'Nova Uniao'
        WHEN LOWER(TeamName) LIKE '%10%' THEN '10th Planet'
        WHEN LOWER(TeamName) LIKE '%b-team%' THEN 'Simple Man Martial Arts'
        WHEN LOWER(TeamName) LIKE '%alliance%' THEN 'Alliance Jiu Jitsu'
    ELSE 'Other'
END AS teamname_source_cleaned
FROM jj_comp_data;

UPDATE jj_comp_data
SET teamname =
CASE
    WHEN LOWER(teamname) LIKE '%arra%' THEN 'Gracie Barra'
    WHEN LOWER(teamname) LIKE '%gb%' THEN 'Gracie Barra'
    WHEN LOWER(teamname) LIKE '%fight%' THEN 'Fight Sports'
    WHEN LOWER(teamname) LIKE '%dream%' THEN 'Dream Art'
    WHEN LOWER(teamname) LIKE '%passos%' THEN 'Team Passos'
    WHEN LOWER(teamname) LIKE '%atos%' THEN 'Atos'
    WHEN LOWER(teamname) LIKE '%unity%' THEN 'Unity'
    WHEN LOWER(teamname) LIKE '%check%' THEN 'Checkmat'
    WHEN LOWER(teamname) LIKE '%aoj%' THEN 'Art of Jiu Jitsu (AOJ)'
    WHEN LOWER(teamname) LIKE '%art of%' THEN 'Art of Jiu Jitsu (AOJ)'
    WHEN LOWER(teamname) LIKE '%nova%' THEN 'Nova Uniao'
    WHEN LOWER(teamname) LIKE '%10%' THEN '10th Planet'
    WHEN LOWER(teamname) LIKE '%b-team%' THEN 'Simple Man Martial Arts'
    WHEN LOWER(teamname) LIKE '%b team%' THEN 'Simple Man Martial Arts'
    WHEN LOWER(teamname) LIKE '%bteam%' THEN 'Simple Man Martial Arts'
    WHEN LOWER(teamname) LIKE '%alliance%' THEN 'Alliance Jiu Jitsu'
    ELSE teamname
END;

SELECT teamname FROM jj_comp_data
SELECT COUNT(DISTINCT(teamname_source_cleaned))

SELECT COUNT(DISTINCT(TeamName))
FROM jj_comp_data

SELECT DISTINCT(TeamName)
FROM jj_comp_data
