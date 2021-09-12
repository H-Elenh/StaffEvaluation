DROP PROCEDURE IF EXISTS EmployeeApplications;
Delimiter $
CREATE procedure EmployeeApplications(IN empname varchar(25), IN empsurname varchar(35))
Begin

 DECLARE usrapplication VARCHAR(35);
 declare finishedFlag INT DEFAULT 0;
 DECLARE tempgrade INT;
 
  DECLARE empCursor CURSOR FOR 
  
	select EvId from submitapplication
	Inner Join employee ON submitapplication.emp_usrname=employee.username
    INNER JOIN evaluationresult ON evaluationresult.job_id = submitapplication.job_id
	Inner Join user ON employee.username=user.username
	Where name=empname AND surname=empsurname;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
    
    open empCursor;
    
    WHILE (finishedFlag=0) DO
		FETCH empCursor INTO usrapplication;
        
        select distinct grade INTO tempgrade from submitapplication
        INNER JOIN evaluationresult ON evaluationresult.job_id = submitapplication.job_id
        WHERE evaluationresult.EvId = usrapplication;
        select tempgrade;
        IF tempgrade IS NULL THEN
        select application,'Αξιολόγηση σε εξέλιξη' as status,eval_user.name,eval_user.surname,score_1,score_2,score_3 from submitapplication
		Inner Join employee ON submitapplication.emp_usrname=employee.username
		Inner Join user ON employee.username=user.username
		INNER JOIN evaluationresult ON evaluationresult.job_id = submitapplication.job_id
		INNER JOIN user eval_user ON evaluationresult.eval_username = eval_user.username
		INNER JOIN scores ON scores.EvId = evaluationresult.EvId
        WHERE evaluationresult.EvId = usrapplication;
        ELSE 
        select application,grade,eval_user.name,eval_user.surname from submitapplication
		Inner Join employee ON submitapplication.emp_usrname=employee.username
		Inner Join user ON employee.username=user.username
		INNER JOIN evaluationresult ON evaluationresult.job_id = submitapplication.job_id
		INNER JOIN user eval_user ON evaluationresult.eval_username = eval_user.username
        WHERE evaluationresult.EvId = usrapplication;
        END IF;
        
	END WHILE;
CLOSE empCursor;
END$
DELIMITER ;