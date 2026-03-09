CREATE TABLE jj_comp_data (
    MatchID TEXT,
    TournamentName TEXT,
    TournamentCity TEXT,
    TournamentState TEXT,
    MatchDateRaw TEXT,
    CompetitorName TEXT,
    OpponentName TEXT,
    TeamName TEXT,
    BeltRank TEXT,
    Division TEXT,
    WeightClass TEXT,
    MatchType TEXT,
    ResultRaw TEXT,
    MethodRaw TEXT,
    PointsScoredRaw TEXT,
    PointsAllowedRaw TEXT,
    AdvantageRaw TEXT,
    PenaltyRaw TEXT,
    MatchDurationRaw TEXT,
    Referee TEXT,
    MatNumberRaw TEXT,
    Notes TEXT
);

SELECT * FROM jj_comp_data
LIMIT 50