Drop trigger if exists userUpdate;
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
   SET trigusername = old.username;
   
   set new.username=old.username;
   Select employee.username Into employeeusr FROM employee Where employee.username=new.username;
   Select managerUsername Into managerusr FROM manager Where manager.managerUsername=new.username;
   Select evaluator.username Into evaluatorusr FROM evaluator Where evaluator.username=new.username; 
   
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