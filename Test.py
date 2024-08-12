SELECT
	DISTINCT
	d.spin AS SPIN,
	c.mktgname AS Company_Name,
	FIRSTNAME,
	LASTNAME,
	APPLICATION_ID
FROM
	(
	SELECT
		application_id,elig_app_seq_id,eligible_ind,id
	FROM
		nlad.eligibility_response
	WHERE
		TPIV_OVERRIDE_IND = 'Y'
        ) a
INNER JOIN (
	SELECT
		firstname,lastname,eligibility_id,subid,subscriber_id,sac,insertdate
	FROM
		nlad.audit_transaction
	WHERE
		transtype IN ('ENROLL', 'TRANSFERIN')
			AND transstatus IN ('VALID')
        ) b ON a.id = b.eligibility_id
INNER JOIN (
	SELECT 
		sac,sacname,mktgname
	FROM 
		nlad.sac
		) c ON b.sac = c.sac
INNER JOIN (
	SELECT 
		sac,spin
	FROM 
		nlad.sac_spin
		) d ON c.sac = d.sac
