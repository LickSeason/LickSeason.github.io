WITH RankedEmails AS (
    SELECT
        SAC,
        CONTACT_EMAIL,
        DATA_MONTH,
        ROW_NUMBER() OVER (PARTITION BY SAC ORDER BY DATA_MONTH DESC) AS RowNum
    FROM
        LI_LCS_ODS.filing
    WHERE
        CONTACT_EMAIL IS NOT NULL
),
FirstQuery AS (
    SELECT DISTINCT
        b.lexid,
        b.sac,
        b.INSERTDATE
    FROM
        (
            SELECT
                DISTINCT SUBSCRIBER_ID,
                MAX(INSERTDATE) AS LatestDate
            FROM
                LI_NLAD_ODS.AUDIT_TRANSACTION
            WHERE
                TRANSSTATUS = 'VALID'
                AND TRANSTYPE IN ('ENROLL','TRANSFERIN','UPDATE','DEENROLL')
                AND INSERTDATE < '01-AUG-2024'
                AND INSERTDATE > '01-JUN-2024'
            GROUP BY
                SUBSCRIBER_ID
        ) a
    LEFT JOIN (
        SELECT
            DEENROLLMENTCODE,
            TRANSTYPE,
            INSERTDATE,
            SAC,
            SUBSCRIBER_ID,
            LEXID,
            pra_address1 || ', ' || pra_city || ', ' || pra_state || ' ' || pra_zipcode AS full_address
        FROM
            LI_NLAD_ODS.AUDIT_TRANSACTION
        WHERE
            TRANSSTATUS = 'VALID'
            AND TRANSTYPE IN ('ENROLL','TRANSFERIN','UPDATE','DEENROLL')
    ) b ON
        a.LatestDate = b.INSERTDATE
        AND a.SUBSCRIBER_ID = b.SUBSCRIBER_ID
    LEFT JOIN 
    (SELECT SAC,
            CONTACT_EMAIL,
            DATA_MONTH FROM RankedEmails WHERE ROWNUM = 1) E ON B.SAC = E.SAC
    LEFT JOIN (
        SELECT SAC, SACNAME FROM LI_NLAD_ODS.SAC
    ) C ON b.sac = c.sac
    LEFT JOIN (
        SELECT SAC, SPIN FROM LI_NLAD_ODS.SAC_SPIN
    ) D ON c.sac = d.sac
    WHERE TRANSTYPE IN ('ENROLL','TRANSFERIN','UPDATE') 
    AND d.SAC IN (
        319059, 439050, 149010, 259071, 509031, 199043, 529037, 229031, 
        169014, 249034, 519032, 359156, 189034, 159054, 269056, 369060, 
        479036, 549036, 179043, 559025, 299053, 209045, 629019, 429061, 
        469047, 589023
    )
),
LatestTransaction AS (
    SELECT 
        LEXID, 
        SAC, 
        INSERTDATE,
        ROW_NUMBER() OVER (PARTITION BY LEXID ORDER BY INSERTDATE DESC) AS RowNum
    FROM 
        LI_EBBPSM_ODS.AUDIT_TRANSACTION
    WHERE 
        LEXID IN (SELECT lexid FROM FirstQuery)
        AND SUBSCRIBER_ID IS NOT NULL
)
SELECT 
    LEXID, 
    SAC, 
    INSERTDATE AS LatestDate
FROM 
    LatestTransaction
WHERE 
    RowNum = 1;
