#SET SQL_SAFE_UPDATES = 0;
SET @inserttime=0;
SET @Rusrnamr="";

/*triggers gia to job*/
drop trigger if exists job_insert_before ;
DELIMITER //
CREATE TRIGGER job_insert_before BEFORE INSERT ON `job`
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log (log_id, username, log_date, success, type, `table_name`)
values( NULL, new.evaluator, NOW(), 0, "Insert", 'job');
END //
DELIMITER ;

drop trigger if exists job_insert_after ;
DELIMITER //
CREATE TRIGGER job_insert_after AFTER INSERT ON job
FOR EACH ROW
BEGIN
UPDATE log set success =  1 WHERE log_date =@insertTime;
END //
DELIMITER ;

drop trigger if exists job_update_before ;
DELIMITER //
CREATE TRIGGER job_update_before BEFORE UPDATE ON `job`
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log (log_id, username, log_date, success, `type`, `table_name`)
values( NULL, old.evaluator, NOW(), 0, "Update", 'job');
END //
DELIMITER ;

drop trigger if exists job_update_after ;
DELIMITER //
CREATE TRIGGER job_update_after AFTER UPDATE ON job
FOR EACH ROW
BEGIN
UPDATE log set success =  1 WHERE log_date =@insertTime;
END //
DELIMITER ;

drop trigger if exists job_delete_before ;
DELIMITER //
CREATE TRIGGER job_delete_before BEFORE DELETE ON `job`
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log (log_id, username, log_date, success, `type`, `table_name`)
values( NULL, old.evaluator, NOW(), 0, "Delete", 'job');
END //
DELIMITER ;

drop trigger if exists job_delete_after ;
DELIMITER //
CREATE TRIGGER job_delete_after AFTER DELETE ON job
FOR EACH ROW
BEGIN
UPDATE log set success =  1 WHERE log_date =@insertTime;
END //
DELIMITER ;



/*triggers gia to employee*/
drop trigger if exists employee_insert_before ;
DELIMITER //
CREATE TRIGGER employee_insert_before BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log (log_id, username, log_date, success, `type`, `table_name`)
values( NULL, new.username, NOW(), 0, "Insert", 'employee');
END //
DELIMITER ;

drop trigger if exists employee_insert_after ;
DELIMITER //
CREATE TRIGGER employee_insert_after AFTER INSERT ON employee
FOR EACH ROW
BEGIN
UPDATE log set success =  1 WHERE log_date =@insertTime;
END //
DELIMITER ;

drop trigger if exists employee_update_before ;
DELIMITER //
CREATE TRIGGER employee_update_before BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
INSERT INTO log (log_id, username, log_date, success, `type`, `table_name`)
values( NULL, old.username, NOW(), 0, "Update", 'employee');
END //
DELIMITER ;

drop trigger if exists employee_update_after ;
DELIMITER //
CREATE TRIGGER employee_update_after AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
UPDATE log set success =  1 WHERE log_date =@insertTime;
END //
DELIMITER ;

drop trigger if exists employee_delete_before ;
DELIMITER //
CREATE TRIGGER employee_delete_before BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log (log_id, username, log_date, success, `type`, `table_name`)
values( NULL, old.username, NOW(), 0, "Delete", 'employee');
END //
DELIMITER ;

drop trigger if exists employee_delete_after ;
DELIMITER //
CREATE TRIGGER employee_delete_after AFTER DELETE ON employee
FOR EACH ROW
BEGIN
UPDATE log set success =  1 WHERE log_date =@insertTime;
END //
DELIMITER ;





/*triggers gia to requestsevaluation*/
drop trigger if exists requestsevaluation_insert_before;
DELIMITER //
CREATE TRIGGER requestsevaluation_insert_before BEFORE INSERT ON requestsevaluation
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log(log_id, username, log_date, success, type, table_name)
values(NULL, new.empl_usrname, NOW(), 0, "Insert", 'requestsevaluation');
END //
DELIMITER ;


drop trigger if exists requestsevaluation_insert_after;
DELIMITER //
CREATE TRIGGER requestsevaluation_insert_after AFTER INSERT ON requestsevaluation
FOR EACH ROW
BEGIN 
UPDATE log set success = 1 WHERE log_date =@insertTime;
END//
DELIMITER ;


drop trigger if exists requestsevaluation_update_before ;
DELIMITER //
CREATE TRIGGER requestsevaluation_update_before BEFORE UPDATE ON requestsevaluation
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log values( NULL, new.empl_usrname, NOW(), 0, "Update", 'requestsevaluation');
END //
DELIMITER;


drop trigger if exists requestsevaluation_update_after ; 
DELIMITER //
CREATE TRIGGER requestsevaluation_update_after AFTER UPDATE ON requestsevaluation
FOR EACH ROW
BEGIN
UPDATE log set success = 1 WHERE log_date =@insertTime;
END //
DELIMITER ;

drop trigger if exists requestsevaluation_delete_before ;
DELIMITER //
CREATE TRIGGER requestsevaluation_delete_before BEFORE DELETE ON requestsevaluation
FOR EACH ROW
BEGIN
SET @insertTime=NOW();
insert into log values (NULL, old.empl_usrname, NOW(), 0, "Delete", 'requestsevaluation');
END //
DELIMITER ;


drop trigger if exists requestsevaluation_delete_after;
DELIMITER //
CREATE TRIGGER requestevaluation_delete_after AFTER DELETE ON requestsevaluation
FOR EACH ROW
BEGIN
UPDATE log set success = 1 WHERE log_date = @insertTime;
END //
DELIMITER ;



/*trigger gia thn etaireia*/
drop trigger if exists company_update_before ;
 DELIMITER //
 CREATE TRIGGER company_update_before BEFORE UPDATE ON `company`
 FOR EACH ROW
 BEGIN
 set new.AFM = old.AFM;
 set new.DOY = old.DOY;
 set new.name = old.`name`;
 SET @insertTime=NOW();
 select username into @Rusrname from manager where firm = new.AFM Limit 0,1;
 insert into log (log_id, username, log_date, success, `type`, `table_name`)
 values( NULL, @Rusrname, NOW(), 0, "Update", 'company');
 END //
 DELIMITER ;


drop trigger if exists company_update_after ;
DELIMITER //
CREATE TRIGGER company_update_after AFTER UPDATE ON `company`
FOR EACH ROW
BEGIN
UPDATE log set success =  1 WHERE log_date =@insertTime;
END //
DELIMITER ;



