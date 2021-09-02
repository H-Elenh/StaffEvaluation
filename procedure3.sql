DELIMITER $$
CREATE PROCEDURE FINALIZEDEVALUATION (IN id INT(4))
BEGIN
     DECLARE empl_evaluated int(4) default 0;
     DECLARE sc_1 int(1);
     DECLARE sc_2 int(1);
     DECLARE sc_3 int(1);
     DECLARE insufficient_employee INT DEFAULT FALSE;
     DECLARE sufficientt_employee INT DEFAULT FALSE;
     DECLARE notevaluatedyett INT DEFAULT FALSE;
     DECLARE flag INT;
     DECLARE flag2 INT;
     --   DECLARE script VARCHAR(100) DEFAULT " ";
        declare username varchar(12) default" "; /*added 25/8*/
        declare employee_evaluated int(1) default null ; /*added 25/8*/


     DECLARE employeecursor CURSOR FOR
     SELECT emp_usrname FROM submitapplication WHERE job_id = id;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag =1;

     OPEN employeecursor;
           set flag = 0;

    CREATE TABLE insufficient_employees(
    recruit_usr VARCHAR(12) NOT NULL,
    vathmos int(1) default null,
    scrip varchar(100)
    );

   
    create table sufficientt_employees(
    recrt_usr VARCHAR(12) NOT NULL,
    vathmo int(1) default null,
    scri varchar(100)
    );

    create table notevaluatedyett(
    recr_usr VARCHAR(12) NOT NULL,
    vathm int(1) default null,
    scrpt varchar(100)
    );
  
     FETCH employeecursor INTO username;
     
      while flag = 0 do
     SET insufficient_employee = 0;
	 SET sufficientt_employee=0;
	 Set notevaluatedyett=0;
     SET sc_1 = null;
     set sc_2 = null;
     set sc_3 = null;
     set @'script' = " "; /*added 25/8 apou leei script*/

     begin
      declare continue handler for not found set flag2 = 1;
      select count(evaluationresult.EvId) INTO employee_evaluated
      FROM evaluationresult
      WHERE evaluationresult.empl_usrname = username and evaluationresult.job_id = id
      group by evaluationresult.empl_usrname;
       set flag2 = 0;
    end;
     
     if employee_evaluated = 0 THEN
      
      SET @'text' = CONCAT('text', "Not fully evaluated yet"); /*25/8*/
	  set insufficient_employee = 1;
     END IF;
     
     if insufficient_employee = 0 then
  SELECT scores.score_1,  scores.score_2, scores.score_3
  INTO sc_1, sc_2, sc_3
  from scores
  WHERE evaluationresult.job_id=id;
end if;


    if (sc_1 < 2) THEN
      SET @'script' = CONCAT_WS( ' ',script, "Failed the evaluation");
      set insufficient_employee = 1;

  elseif (sc_1>=2 AND sc_1<=4) THEN
      SET @'script' = CONCAT_WS (' ','script', "Passed the evaluation");
      set sufficientt_employee = 1;

  elseif (sc_1>4) then
      set @'script' = CONCAT_WS (' ','script', "Not valid score.");
      set notevaluatedyett = 1;

  elseif (sc_1= null) then
      set @'script' = CONCAT_WS (' ', 'script', "Not evaluated yet.");
      set notevaluatedyett=1;
  end if;
      



	if (sc_2 < 2) THEN
      SET @'script' = CONCAT_WS( ' ','script', "Failed the evaluation");
      set insufficient_employee = 1;

	elseif (sc_2>=2 AND sc_1<=4) THEN
     SET @'script' = CONCAT_WS (' ','script', "Passed the evaluation");
      set sufficientt_employee = 1;      

	elseif (sc_2>4) then
      SET @'script' = CONCAT_WS (' ','script', "Not valid score.");
      set notevaluatedyett = 1;

	elseif (sc_2= null) then
      SET @'script' = CONCAT_WS (' ', 'script', "Not evaluated yet.");
      set notevaluatedyett=1;
	end if;


     
	if (sc_3 < 1) THEN
     SET @'script' = CONCAT_WS( ' ','script', "Failed the evaluation");
      set insufficient_employee = 1;

    elseif (sc_3>=1 AND sc_1<=2) THEN
      SET @'script' = CONCAT_WS (' ','script', "Passed the evaluation");
      set sufficientt_employee = 1;
      
	elseif (sc_3>2) then
      SET @'script' = CONCAT_WS (' ','script', "Not valid score.");
      set notevaluatedyett = 1;

	elseif (sc_3= null) then
    SET @'script' = CONCAT_WS (' ', 'script', "Not evaluated yet.");
      set notevaluatedyett=1;
     end if;

      if insufficient_employee = 1 then
      insert into insufficient_employees (recruit_usr , vathmos, scrip)
      SELECT username, grade, 'text';
    end if;
      
      if sufficientt_employee = 1 then
      insert into sufficientt_employees (recrt_usr, vathmo, scri)
      select username, grade, 'text';
     end if;
     
      if notevaluatedyett = 1 then
      insert into notevaluatedyett (recr_usr, vathm, scrpt)
      (SELECT COUNT(recr_usr) AS numberofnotevaluatedemployees from notevaluatedyett) UNION
      (SELECT username, grade, 'text' from notevaluatedyett) UNION
      (select concat_ws ('Evaluation in progress.', numberofnotevaluatedemployees, 'on hold'));
       end if;
	  
	  if notevaluatedyett = 0 then
      (select 'Evaluation completed.') UNION
      (SELECT 'Finalized Tables') UNION
      (select * from sufficientt_employees
   order by vathmo DESC);
	 end if;
      

   fetch employeecursor into id;

end while;
   
   close employeecursor;


   drop table insufficient_employees, notevaluatedyett, sufficientt_employees;


END $$