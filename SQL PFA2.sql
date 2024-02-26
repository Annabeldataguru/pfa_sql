 USE PFA;
 declare  @DateFrom date = '20220101', @DateTo date = '20221231';
  SELECT EMPLOYEES.PIN,   
         EMPLOYEES.EMPLOYER_NAME,   
         EMPLOYEES.EMPLOYER_RCNO,   
         EMPLOYEES.SURNAME,   
         EMPLOYEES.FIRSTNAME,   
         EMPLOYEES.OTHERNAMES,   
         sum(isnull (contribution.total_contribution, 0.00) + isnull(contribution.other_contribution,0.00) - isnull(contribution.total_fee,0.00) - isnull(contribution.other_fee, 0.00) - isnull(contribution.vat_fee, 0.00)),   
  		 CONTRIBUTION.VALUE_DATE,
		 CONTRIBUTION. CONTRIBUTION_DATE  
    FROM CONTRIBUTION,
         EMPLOYEES
   WHERE --( EMPLOYEES.EMPLOYER_RCNO = @employerCode )and
   ( CONTRIBUTION.PIN = EMPLOYEES.PIN ) and  
          ( CONTRIBUTION.VALUE_DATE >= @DateFrom ) and
         (  CONTRIBUTION.VALUE_DATE <= @DateTo)   
GROUP BY EMPLOYEES.PIN,   
         EMPLOYEES.EMPLOYER_NAME,   
         EMPLOYEES.EMPLOYER_RCNO,   
         EMPLOYEES.SURNAME,   
         EMPLOYEES.FIRSTNAME,   
         EMPLOYEES.OTHERNAMES, 
		CONTRIBUTION.VALUE_DATE,  
         CONTRIBUTION. CONTRIBUTION_DATE