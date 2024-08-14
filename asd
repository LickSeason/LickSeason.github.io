SELECT
    LEXID,
    SAC,
    LatestDate
FROM
    (
        SELECT
            LEXID,
            SAC,
            LatestDate,
            ROW_NUMBER() OVER (PARTITION BY LEXID ORDER BY LatestDate DESC) AS RowNum
        FROM
            LatestTransactions
    ) 
WHERE
    RowNum = 1;
