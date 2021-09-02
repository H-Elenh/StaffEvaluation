DELIMITER $$
CREATE PROCEDURE EMPLOYEEEVALUATION (IN id INT(4), username varchar(12))
BEGIN
     DECLARE employee_evaluated int(4) default 0;
	 DECLARE eval_username varchar(12);
     DECLARE scor_1 int(1);
     DECLARE scor_2 int(1);
     DECLARE scor_3 int(1);
     DECLARE inadequate_employee INT DEFAULT FALSE;
     DECLARE sufficient_employee INT DEFAULT FALSE;
     DECLARE notevaluatedyet INT DEFAULT FALSE;
     DECLARE done INT;
     DECLARE done_2 INT;
	DECLARE text VARCHAR(100) DEFAULT " ";


     DECLARE empl_cursor CURSOR FOR
     SELECT emp_usrname FROM submitapplication WHERE job_id = id;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN empl_cursor;
	set done = 0;


    CREATE TABLE inadequate_employees(
    empl_usr VARCHAR(12) NOT NULL,
    grad int(1) default null,
    tex varchar(100)
    );

   
    create table sufficient_employees(
    employee_usr VARCHAR(12) NOT NULL,
    gradee int(1) default null,
    textt varchar(100)
    );

    create table notevaluatedyet(
    employ_user VARCHAR(12) NOT NULL,
    gra int(1) default null,
    te varchar(100)
    );
  
     FETCH empl_cursor INTO username;
   
     while done = 0 do
     SET inadequate_employee = 0;
	 SET sufficient_employee=0;
	 Set notevaluatedyet=0;
     SET scor_1 = null;
     set scor_2 = null;
     set scor_3 = null;
     set text = " ";

     begin
       declare continue handler for not found set done_2=1;
       SELECT count(evaluationresult.EvId) INTO employee_evaluated
       FROM evaluationresult
       WHERE evaluationresult.empl_usrname = username and evaluationresult.job_id = id
       group by evaluationresult.empl_usrname;
       set done_2 = 0;
    end;
    
     if employee_evaluated = 0 THEN
       set text = CONCAT(text, "Not fully evaluated yet");
	   set inadequate_employee = 1;
     END IF;

if inadequate_employee = 0 then
  SELECT scores.score_1,  scores.score_2, scores.score_3
  INTO scor_1, scor_2, scor_3
  from scores
  WHERE scores.eval_username = username AND evaluationresult.job_id=id;
end if;

  if (scor_1 < 2) THEN
      SET text = CONCAT_WS( ' ',text, "Failed the evaluation");
      set inadequate_employee = 1;

  elseif (scor_1>=2 AND scor_1<=4) THEN
      SET text = CONCAT_WS (' ','text', "Passed the evaluation");
      set sufficient_employee = 1;

  elseif (scor_1>4) then
      set text = CONCAT_WS (' ','text', "Not valid score.");
      set notevaluatedyet = 1;

  elseif (scor_1= null) then
      set text = CONCAT_WS (' ', 'text', "Not evaluated yet.");
      set notevaluatedyet=1;
  end if;
      


	if (scor_2 < 2) THEN
      SET text = CONCAT_WS( ' ','text', "Failed the evaluation");
      set inadequate_employee = 1;

	elseif (scor_2>=2 AND scor_1<=4) THEN
      SET text = CONCAT_WS (' ','text', "Passed the evaluation");
      set sufficient_employee = 1;      

	elseif (scor_2>4) then
      set text = CONCAT_WS (' ','text', "Not valid score.");
      set notevaluatedyet = 1;

	elseif (scor_2= null) then
      set text = CONCAT_WS (' ', 'text', "Not evaluated yet.");
      set notevaluatedyet=1;
	end if;


     
	if (scor_3 < 1) THEN
      SET text = CONCAT_WS( ' ','text', "Failed the evaluation");
      set inadequate_employee = 1;

    elseif (scor_3>=1 AND scor_1<=2) THEN
      SET text = CONCAT_WS (' ','text', "Passed the evaluation");
      set sufficient_employee = 1;
      
	elseif (scor_3>2) then
      set text = CONCAT_WS (' ','text', "Not valid score.");
      set notevaluatedyet = 1;

	elseif (scor_3= null) then
      set text = CONCAT_WS (' ', 'text', "Not evaluated yet.");
      set notevaluatedyet=1;
     end if;


   if inadequate_employee = 1 then
      insert into inadequate_employees (empl_usr, grad, tex)
      SELECT username, grade, 'text';
    end if;
      
	if sufficient_employee = 1 then
      insert into sufficient_employees (employee_usr, gradee, textt)
      select username, grade, 'text';
      insert into scores (eval_username,score_1,score_2, score_3)
      select evaluationresult.empl_usrname, grade
      from evaluationresult
      where evaluationresult.empl_usrname = username and evaluationresult.job_id = id
          group by evaluationresult.empl_usrname;
     end if;

	  
                    
	 fetch empl_cursor into username;
end while;

    close empl_cursor;

    select * from inadequate_employees;
    
    select * from notevaluatedyet;
    
    
     
    drop table inadequate_employees,notevaluatedyet, sufficient_employees;

END$$

DELIMITER ; 
