DROP TRIGGER if exists UpdateFinalGrade;
delimiter $
CREATE TRIGGER UpdateFinalGrade AFTER INSERT ON scores FOR EACH ROW
    
 Begin

     Declare score1 INT(1);
     Declare score2 INT(1);
     DECLARE score3 INT(1);
	 Declare sum INT;
         
         
    select score_1 INTO score1 FROM scores WHERE EvId = new.EvId;
    select score_2 INTO score2 FROM scores WHERE EvId = new.EvId;
    select score_3 INTO score3 FROM scores WHERE EvId = new.EvId;
	
	if (score1<=4 AND score1>=0 AND
		score2<=4 AND score2>=0 AND
		score3>=0 AND score3<=2) THEN
	
		set sum=score1+ score2 +score3;
		insert into evaluationresult(grade) Value (sum);
   
   else 
		insert into evaluationresult(grade) Value (NULL);
   
    End If;
End$
delimiter ;