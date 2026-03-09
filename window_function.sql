SELECT * FROM jj_comp_data;

-- Window function practice
-- Identifying duplicates in 2 different ways

SELECT 
    CompetitorName,
    OpponentName,
    tournamentname
FROM jj_comp_data

--Method 1
SELECT * FROM 
    (
    SELECT CompetitorName,
        opponentname,
        tournamentname,
        matchid,
        ROW_NUMBER() OVER(
        PARTITION BY CompetitorName,opponentname, tournamentname
        ORDER BY (matchid) DESC
        ) AS tn
    FROM jj_comp_data
    )
WHERE tn = 1

--Method 2

SELECT CompetitorName,
       opponentname,
       tournamentname,
       COUNT(*)
FROM jj_comp_data
GROUP BY CompetitorName, opponentname, tournamentname
HAVING COUNT(*) > 1;
