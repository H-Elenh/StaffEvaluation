Drop trigger if exists userUpdates;
Delimiter $
CREATE TRIGGER userUpdate before update ON user For each row
BEGIN
   DECLARE employeeusr Varchar(12);
   DECLARE managerusr Varchar(12);
   DECLARE evaluatorusr Varchar(12);
   Declare trigusername varchar(12);
   Set employeeusr='';
   Set managerusr='';
   Set evaluatorusr='';
   set trigusername='';
   
   select username into trigusername From user;
   Select username Into employeeusr FROM employee INNER JOIN user ON employee.username=user.username
   Where employee.username=user.username;
   Select managerUsername Into managerusr FROM manager INNER JOIN user ON manager.managerUsername=user.username
   Where manager.managerUsername=user.username;
   Select username Into evaluatorusr FROM evaluator INNER JOIN user ON evaluator.username=user.username
   Where evaluator.username=user.username; 
   
   set new.username=old.username;
   
   if (trigusername=employeeusr OR trigusername=managerusr) then
   set new.name=old.name;
   set new.surname=old.surname;
   set new.reg_date= old.reg_date;
   end if;
   
   if (trigusername=employeeusr) then
		set new.email=old.email;
	end if;
END$
DELIMITER ;



Drop trigger if exists managerUpdate;
Delimiter $
CREATE TRIGGER managerUpdate before update ON manager For each row
BEGIN
	set new.firm=old.firm;
	set new.exp_years=old.exp_years;
	
END$
DELIMITER ;
