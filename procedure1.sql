Delimiter $
CREATE procedure EmployeeApplications(IN empname varchar(25), IN empsurname varchar(35))
Begin

 DECLARE usrapplication VARCHAR(35);
 
 DECLARE usreval int(4);

 
 DECLARE empCursor CURSOR FOR 
	select application from submitapplication
	Inner Join employee ON submitapplication.emp_usrname=employee.username
	Inner Join user ON employee.username=user.username
	Where name=empname AND surname=empsurname;
 
 
  
 declare ecursor Cursor for 
	 select EvId,eval_username from evaluationresult 
	 Inner Join employee ON evaluationresult.emp_usrname=employee.username
	 Inner Join user ON employee.username=user.username
	 Where name=empname AND surname=empsurname;
 
 /*Erwthma a*/

 open empCursor;
 Begin
	declare finishedFlag INT;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
	SET finishedFlag=0;
 
	FETCH empCursor INTO usrapplication;
 
	WHILE (finishedFlag=0) DO
		SELECT application AS ‘Applications’ from submitapplication
		Inner Join employee ON submitapplication.emp_usrname=employee.username
		Inner Join user ON employee.username=user.username
		Where name=empname AND surname=empsurname;

	END WHILE;
 END;
CLOSE empCursor;

 
 /*Erwthma B- evaluations*/
declare finalgrade int(2);
 select grade into finalgrade from evaluationresult Inner Join employee ON evaluationresult.emp_usrname=employee.username
 Inner Join user ON employee.username=user.username
 Where name=empname AND surname=empsurname;
 
open ecursor; 
 
Begin
	declare finishedFlag1 INT;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag1=1;
	set finishedFlag1=0;
 
 
	FETCH ecursor into usreval;
   
	WHILE (finishedFlag1=0) DO
 
		if (finalgrade Is not Null) then
 
		select EvId AS 'Completed evaluation Id',from evaluationresult 
		Inner Join employee ON evaluationresult.emp_usrname=employee.username
		Inner Join user ON employee.username=user.username
		Where name=empname AND surname=empsurname;
				
		else 
		
		(select 'Evaluation in progress') UNION
		(select EvId from evaluationresult Inner Join employee ON evaluationresult.emp_usrname=employee.username
		Inner Join user ON employee.username=user.username
		Where name=empname AND surname=empsurname);

		end if;	
	END WHILE;
 End;
 CLOSE empCursor;
END$
DELIMITER ;