USE PFA;
SELECT SCHEME_NAME, ISNULL(A.AGENT_NAME,'ANNABEL')AS AGENT_NAME,ED.NAME,E.EMPLOYER_NAME,ISNULL(E.TITLE, '')+' '+ISNULL(E.SURNAME, '')+' '+
ISNULL(E.FIRSTNAME,'')+' '+ISNULL(E.OTHERNAMES, '') AS EMPLOYEE_NAME,CASE GENDER
WHEN 'M' THEN 'MALE'
WHEN 'F' THEN 'FEMALE'
ELSE 'INVALID'
END AS GENDER,DATE_OF_BIRTH,
CASE MARITAL_STATUS_CODE 
WHEN 'S' THEN 'SINGLE'
WHEN 'M' THEN 'MARRIED'
WHEN 'MD'THEN 'MARRIED'
WHEN 'SG' THEN 'SINGLE'
ELSE 'WIDOW'
END AS MARITAL_STATUS,
C.BATCH_ID,C.PIN,REGISTRATION_CODE,C.EMPLOYEE_CONTRIBUTION,
C.EMPLOYER_CONTRIBUTION,C.OTHER_CONTRIBUTION,TOTAL_CONTRIBUTION,CONTRIBUTION_DATE,S.EMPLOYER_CODE,ED.RCNO,
PRICE,TRANS_UNITS_R,TRANS_UNITS_V,PS.TOTAL_UNITS,C.TRANS_DATE,C.VALUE_DATE,VAT_FEE,S.FUND_ID,TRANS_ID,
CB.NARRATION,SCHEDULE_ID,S.REFNO,S.FILE_NAME,ACCRUED_DIVIDEND,
TRSF_FROM,TRSF_TO,S.POSTED_DATE,AMOUNT,AMOUNT_PROCESSED,S.DESCRIPTION,S.PFC_CODE,DATE_EMPLOYED,DESIGNATION,DATE_CONFIRMED,CITY
 FROM CONTRIBUTION C
LEFT JOIN CONTRIBUTION_BATCH CB ON C.BATCH_ID=CB.BATCH_ID
INNER JOIN SCHEMES PS ON C.FUND_ID=PS.SCHEME_ID
INNER JOIN SCHEDULES S ON CB.REFNO=S.REFNO
LEFT JOIN EMPLOYER_DETAILS ED ON S.EMPLOYER_CODE = ED.RCNO
INNER join EMPLOYEES E ON C.PIN=E.PIN
LEFT JOIN AGENT A ON E.AGENT_CODE=A.AGENT_CODE
WHERE C.PIN LIKE '%PEN%'  -- AND C.CONTRIBUTION_TYPE = '1'

--inner join c
--select * from CONTRIBUTION_BATCH
--select * from SCHEDULES
--SELECT * FROM SCHEMES
--SELECT * FROM CONTRIBUTION
--SELECT * FROM AGENT
--SELECT * FROM EMPLOYEES
--SELECT DISTINCT PIN FROM CONTRIBUTION



SELECT DISTINCT MARITAL_STATUS_CODE FROM EMPLOYEES
