CREATE TABLE company (
AFM char(9) NOT NULL, 
DOY varchar(15),
name varchar(35) NOT NULL default 'NO-NAME registered',
phone bigint(16),
street varchar(15),
num tinyint,
city varchar(15),
country varchar(15),
PRIMARY KEY (AFM)
)engine=InnoDB;

INSERT INTO company(AFM,DOY,name,phone,street,num,city,country) VALUES
('132987645', 'A PATRWN', 'CodeWorks', 2610000345,'Riga Feraiou','75','Patra','Greece'),
('129884567', 'C PEIRAIA', 'UniGo', 2103335486, 'Karaiskaki', 1, 'Peiraias', 'Greece'),
('105342298', 'A PATRWN', 'NetWorks', 2610345485, 'Lontou', 9, 'Patras', 'Greece'),
('156783227', 'A ATHINWN', 'DotWeb', 2101156886, 'Ermou', 23, 'Athens', 'Greece'),
('134884213', 'A ATHINWN', 'DataSolutions', 21065748876, 'Stadiou', 77, 'Athens', 'Greece'),
('189021165', 'C PEIRAIA', 'WebMasters', 2103338754, 'Karaiskaki', 100, 'Peiraias', 'Greece');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE antikeim (
title VARCHAR(36) NOT NULL,
descr TINYTEXT,
belongs_to varchar(36),
PRIMARY KEY (title),
CONSTRAINT ANTIKEIMENO FOREIGN KEY (belongs_to) REFERENCES antikeim(title) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;


INSERT INTO antikeim(title,descr,belongs_to) VALUES
('Computer Science', 'Root element, no more general antikeim', NULL),
('Databases', 'Level one element, child of Computer Science', 'Computer Science'),
('AI', 'Level one element, child of Computer Science', 'Computer Science'),
('Algorithms', 'Level one element, child of Computer Science', 'Computer Science'),
('Networking', 'Level one element, child of Computer Science', 'Computer Science'),
('Graphics', 'Level one element, child of Computer Science', 'Computer Science'),
('2D', 'Level two element, child of Graphics', 'Graphics'),
('3D', 'Level two element, child of Graphics', 'Graphics'),
('Animation', 'Level two element, child of Graphics', 'Graphics'),
('Programming', 'Level one element, child of Computer Science', 'Computer Science'),
('Web Programming', 'Level two element, child of Programming', 'Programming'),
('Mobile Apps', 'Level two element, child of Programming', 'Programming'),
('Relational DBs', 'Level two element, child of Databases', 'Databases'),
('Object-Oriented DBs', 'Level two element, child of Databases', 'Databases'),
('NoSQL DBs', 'Level two element, child of Databases', 'Databases'),
('Robotics', 'Level two element, child of AI', 'AI'),
('NLP', 'Level two element, child of AI', 'AI'),
('Information Retieval', 'Level three element, child of NLP', 'NLP'),
('Language analysis', ' Level three element, child of NLP', 'NLP'),
('Data structures', 'Level two element, child of Algorithms', 'Algorithms'),
('Complexity and Efficiency', 'Level two element, child of Algorithms', 'Algorithms'),
('Network setup and maintainance', 'Level two element, child of Networking', 'Networking'),
('Device connectivity', 'Level two element, child of Networking', 'Networking');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE user (
username varchar(12) NOT NULL,
password varchar(10),
name varchar (25) NOT NULL,
surname varchar (35) NOT NULL,
reg_date DATETIME,
email varchar(30),
PRIMARY KEY (username)
)engine=InnoDB;

INSERT INTO user(username,password,name,surname,reg_date,email) VALUES

/*managers*/
('dimhatz2','Pass1234','Dimitris','Hatzis','2016-02-13 12:23:34','dimitrishatzis@hotmail.com'),
('stavros28','uP2828','Stavros','Georgakopoulos','2018-03-18 17:00:02','georgakopStav@gmail.com'),
('zoepap','iL1keD0gs','Zoe','Papadopoulou','2017-08-30 10:19:46','zoepap@yahoo.com'),
('eirinivas3','my22Pass','Eirini','Vasilopoulou','2017-10-08 11:17:15','vasilop@hotmail.com'),
('despathan','@than209','Despoina','Athanasiou','2015-12-03 14:06:09','athandesp@hotmail.com'),
('kostasmar','l0lALow','Konstantinos','Maravegias','2015-11-28 18:10:54','maravegias@gmail.com'),

/*evaluators*/
('mnikol', 'm@n0lis', 'Manolis', 'Nikopoloulos', '2017-11-08 21:07:12', 'nikolp@datasolutions.com'),
('liakoumar', 'Lionpass', 'Maria', 'Liakou', '2018-05-22 17:03:01', 'mliak@dotweb.gr'),
('Giankost', 'jUn38@', 'Giannis', 'Kostoglou', '2018-02-23 11:08:15', 'kostog@webmasters.gr'),
('paraskevi', 'julyOf79', 'Paraskevi', 'Papaparaskeva', '2017-02-25 11:23:45', 'parpapapar@codeworks.gr'),
('panagTak', 'varethika', 'Panagiotis', 'Takidis', '2019-04-28 15:20:25', 'panag20@networks.gr'),
('KatiaNik', 'abC123', 'Katerina', 'Nikou', '2020-01-28 10:13:48', 'katianik@unigo.com'),

/*employees*/
('eleni23', 'zooMzoom', 'Eleni', 'Vlachaki', '2017-05-11 14:08:23', 'elenivlaxaki@yahoo.com'),
('zoumpi', 'erg2378', 'Zoumpoulia', 'Ampatzidou', '2018-10-07 20:09:10', 'zoumpiamp@gmail.com'),
('daliaCh', 'we3wd', 'Ntalia', 'Xatzialexandrou', '2017-06-23 13:12:34', 'ntaliachatz@yahoo.com'),
('spairous', 'gotop@s$', 'Spiridon', 'Deloglou', '2018-12-03 18:12:39', 'deloglou@yahoo.com'),
('fotakos', 'jUn38@', 'Fotios', 'Voulinos', '2017-04-12 12:23:10', 'fotisvoul@hotmail.gr'),
('angieioak', 'pdfr45t', 'Aggeliki', 'Ioakeimidou', '2018-11-17 23:10:08', 'angioak@gmail.gr'),

/*Admin*/
('admin', '12345', 'Theopoula', 'Tzini', '2021-01-25 11:23:45', 'theopoula@parapente.gr');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE manager (
managerUsername VARCHAR(12) NOT NULL,
exp_years TINYINT,
firm CHAR(9),
PRIMARY KEY (managerUsername),
CONSTRAINT MANAGER_USER FOREIGN KEY (managerUsername) REFERENCES `user`(username) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT MANAGER_COMPANY FOREIGN KEY (firm) REFERENCES company(AFM) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

INSERT INTO manager(managerUsername,exp_years,firm) VALUES
('dimhatz2',4,'189021165'),
('stavros28',2,'132987645'),
('zoepap',3,'134884213'),
('eirinivas3',3,'129884567'),
('despathan',5, '156783227'),
('kostasmar',5,'105342298');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE evaluator (
username VARCHAR(12) NOT NULL,
exp_years TINYINT,
firm CHAR(9),
PRIMARY KEY (username),
CONSTRAINT EVAL_USER FOREIGN KEY (username) REFERENCES `user`(username) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT EVAL_COMPANY FOREIGN KEY (firm) REFERENCES company(AFM) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

INSERT INTO evaluator(username,exp_years,firm) VALUES
('mnikol', 4, '134884213'),
('liakoumar',3, '156783227'),
('Giankost',3, '189021165'),
('paraskevi',4, '132987645'),
('panagTak',1, '105342298'),
('KatiaNik',1, '129884567');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE employee(
username VARCHAR(12) NOT NULL,
bio TEXT NOT NULL,
sistatikes VARCHAR(35),
certificates VARCHAR(35),
awards VARCHAR(35),
PRIMARY KEY (username),
CONSTRAINT EMPL_USER FOREIGN KEY (username) REFERENCES `user`(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

INSERT INTO employee(username,bio,sistatikes,certificates,awards) VALUES
('angieioak','Angeliki is a secodary education graduate who has long work experience in web programming technologies (has worked for than 25 years in the field). She has been also certified as a CISCO security expert (CCIE Security) and an IT project manager (PMI Project Management Professional and Project Management Professional).','RecLetters.pdf','certifALL.pdf','angAwards.pdf'),
('eleni23', 'Eleni is a highly skilled web programmer. Moreover she has long experience with design, development and administration of large scale DBs, mostly relational.', 'Vlaxaki_rec.pdf', 'Vlachaki-certif.pdf','awarded.pdf'),
('zoumpi', 'Zoumpoulia is an experienced web programmer but has also worked on mobile apps development the last 5 years. She can work from a distance and can also manage 2d graphics and has long experience with DB scripting (My SQL, MariaDB, MS SQL Server and Oracle.', 'Amp_letters.pdf', 'Zoumpi_cert.pdf','zoumpi_awd.pdf'),
('daliaCh', 'Mrs Chatzialexandrou has a long experience in NLP and more specifically Information Retrieval and has also long research background on both areas. In addition she has worked on large coprus datasets and data visualization algorithms.', 'letterschatz.pdf', 'trainingchatz.pdf','awardsdalia.pdf'),
('spairous', 'Mr Deloglou holds a Computer Science diploma and an MSc and has long work experience in AI applications as well as Robotics. He has also managed large R&D projects in these domains and has teaching and research experience as well. Please refer to his referral letters for more details.','referralLetDeloglou.pdf','degreesAndCertDel.pdf','awards.pdf'),
('fotakos', 'Andrew has a strong theoretical background in Algorithms and Data Stuctures and has worked for more than a decade in a software house that specializes in high performance data management. He is well skilled in high complexity schemes and heavy load memory management.', 'lettersscannedFotis.pdf', 'degrees-cert.pdf','fotis-awards.pdf');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE languages(
employee VARCHAR(12) NOT NULL,
lang SET('EN', 'FR', 'SP', 'GR'),
PRIMARY KEY (employee, lang),
CONSTRAINT EMPL_LANG FOREIGN KEY (employee) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

INSERT INTO languages(employee,lang) VALUES
('eleni23', 'EN,SP,GR'),
('zoumpi', 'GR,EN'),
('daliaCh', 'EN,FR'),
('spairous', 'GR,EN'),
('fotakos', 'GR,FR'),
('angieioak', 'EN,FR,SP');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE project(
empl varchar(12) NOT NULL,
num TINYINT,
descr TEXT,
url varchar(60),
PRIMARY KEY (empl, num),
CONSTRAINT PROJ_EMPL FOREIGN KEY (empl) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

INSERT INTO project(empl,num,descr,url) VALUES
('eleni23', 1, 'Minimal examples of data structures and algorithms in Python', 'https://github.com/e_vlachaki/algorithms'),
('eleni23', 2, 'Interactive Online Platform that Visualizes Algorithms from Code', 'https://github.com/e_vlachaki/algorithm-visualizer'),
('eleni23', 3, 'Repository which contains links and resources on different topics of Computer Science', 'https://github.com/e_vlachaki/AlgoWiki'),
('zoumpi', 1, 'Essential Cheat Sheets for deep learning and machine learning researchers', 'https://github.com/zoump/cheatsheets-ai'),
('zoumpi', 2, 'Python sample codes for robotics algorithms.', 'https://github.com/zoump/PythonRobotics'),
('daliaCh',1,'Go Graphics - 2D rendering in Go with a simple API.','https://github.com/dalia/gg'),
('daliaCh',2,'Draco is a library for compressing and decompressing 3D geometric meshes and point clouds. It is intended to improve the storage and transmission of 3D graphics.','https://github.com/dalia/aco'),
('daliaCh',3,'Data Discovery and Lineage for Big Data Ecosystem.','https://github.com/linkedin/WhereHows'),
('spairous', 1, 'HTML5 Mobile App UI templates created using Intel App Framework.', 'https://github.com/deloglou/appframework-templates'),
('spairous', 2, 'Mobile Version of Travel sample App using Couchbase Lite 2.0.', 'https://github.com/deloglou/mobile-travel-sample'),
('spairous', 3, 'Appium Demo App with clearly defined Page Object Pattern for React Native Mobile App. Test Language - Javascript.','https://github.com/deloglou/Appium-Page-Object-Model-Demo'),
('fotakos', 1, 'WebGL2 powered geospatial visualization layers. offers an extensive catalog of pre-packaged visualization "layers", including ScatterplotLayer, ArcLayer, TextLayer, GeoJsonLayer, etc. The input to a layer is usually an array of JSON objects. Each layer offers highly-flexible API to customize how the data should be rendered.', 'https://github.com/fotisVoul/deck.gl');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE degree (
titlos VARCHAR(50) NOT NULL,
idryma VARCHAR (40) NOT NULL,
bathmida ENUM ('LYKEIO', 'UNIV', 'MASTER', 'PHD'),
PRIMARY KEY (titlos, idryma)
)engine=InnoDB;

INSERT INTO degree(titlos,idryma,bathmida) VALUES
('Lyceum certificate', '2nd Lyceum of Patras', 'LYKEIO'),
('Computer and Infromatics Eng.', 'University of Patras', 'UNIV'),
('Electrical and Computer Eng.','Technical University of Athens', 'UNIV'),
('Computer Science Dipl.', 'Polytechnic University of Paris', 'UNIV'),
('Computer Vision and Modelling', 'Princeton University', 'MASTER'),
('Artificial Intelligence', ' Cambrigde University', 'MASTER'),
('Big Data and Analytics', ' Imperial College London', 'MASTER'),
('Advanced Rendering Techniques', 'Delft University of Technology', 'MASTER'),
('Computer Science and Engineering', 'Delft University of Technology', 'UNIV'),
('Data Science Bachelor','Eindhoven University of Technology', 'UNIV'),
('PDEng Data Science', 'Eindhoven University of Technology', 'PHD'),
('NLP related high efficiency algorithms', 'University of Patras', 'PHD'),
('Big Data Structures and Algorithms', 'Technical University of Crete', 'MASTER')
;

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE has_degree (
degr_title VARCHAR(50) NOT NULL,
degr_idryma VARCHAR (40) NOT NULL,
empl_usrname VARCHAR(12) NOT NULL,
etos YEAR,
grade FLOAT(3,1),
PRIMARY KEY (degr_title, degr_idryma, empl_usrname),
CONSTRAINT HAS_DEGR FOREIGN KEY (degr_title, degr_idryma) REFERENCES degree(titlos, idryma) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT HAS_EMP FOREIGN KEY (empl_usrname) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

insert into has_degree (degr_title, degr_idryma,empl_usrname, etos, grade) values 
('Lyceum certificate', '2nd Lyceum of Patras','eleni23', 1999, 19.2),
('Computer Science and Engineering', 'Delft University of Technology','zoumpi',2000, 8.2),
('PDEng Data Science', 'Eindhoven University of Technology','zoumpi',2006, 9),
('Electrical and Computer Eng.', 'Technical University of Athens','daliaCh', 1998, 7.6),
('Computer Vision and Modelling', 'Princeton University','daliaCh', 2001, 8.5),
('Computer and Infromatics Eng.', 'University of Patras','spairous', 2003, 8.6),
('Artificial Intelligence', ' Cambrigde University','spairous', 2008, 8),
('NLP related high efficiency algorithms', 'University of Patras','spairous', 2013, 9),
('Computer Science Dipl.', 'Polytechnic University of Paris','fotakos', 2001, 8.4),
('Computer Vision and Modelling', 'Princeton University','fotakos' ,2006, 7.4),
('Data Science Bachelor','Eindhoven University of Technology','angieioak',2004, 9.2),
('Big Data and Analytics', ' Imperial College London','angieioak', 2006, 8),
('Big Data Structures and Algorithms', 'Technical University of Crete','angieioak', 2008, 8.2)
;

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE job(
id int(4) NOT NULL AUTO_INCREMENT,
start_date DATE NOT NULL,
salary FLOAT(6,1),
position VARCHAR(40),
edra VARCHAR(45),
evaluator VARCHAR(12) NOT NULL,
announce_date DATETIME DEFAULT NOW(),
submission_date DATE NOT NULL,
PRIMARY KEY (id),
CONSTRAINT JOB_EVAL FOREIGN KEY (evaluator) REFERENCES evaluator(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

insert into job (start_date, salary, position, edra, evaluator, announce_date, submission_date) values 
('2021-01-01', 1800, 'data analyst', 'Patra, Greece', 'panagTak', '2020-07-13', '2020-12-20'),
('2021-02-01', 1450, 'web programmer', 'Patra, Greece', 'panagTak', '2020-07-13', '2021-01-10'),
('2021-02-01', 2100, 'mobile app developer', 'Patra, Greece', 'panagTak', '2020-10-24', '2021-01-12'),
('2021-12-25', 2700, 'NLP expert', 'Peiraias, Greece', 'Giankost', '2020-10-10', '2021-11-10'),
('2021-03-01', 2100, 'Graphics designer', 'Peiraias, Greece', 'KatiaNik', '2020-10-10', '2021-02-01'),
('2021-03-01', 2300, 'Visualization expert', 'Peiraias, Greece','KatiaNik', '2020-10-20', '2021-01-10'),
('2021-05-01', 1850, 'web and mobile app programmer', 'Athina, Greece','mnikol', '2020-11-20', '2021-04-12'),
('2021-05-01', 1600, 'graphics expert', 'Athina, Greece','mnikol', '2020-11-20', '2021-04-12'),
('2021-05-01', 1850, 'DB expert', 'Athina, Greece','paraskevi', '2020-11-20', '2021-04-12'),
('2021-04-01', 2100, 'AI expert', 'Patra, Greece', 'paraskevi', '2020-11-21', '2021-03-10'),
('2021-02-01', 2600, 'Algorithmic efficiency expert', 'Athina, Greece', 'liakoumar', '2020-11-01', '2021-01-16'),
('2021-03-01', 2800, 'web and media programmer', 'Athina, Greece', 'liakoumar', '2020-11-01', '2020-01-03'),
('2021-02-01', 2000, 'data analyst', 'Athina, Greece', 'liakoumar', '2020-07-13', '2020-12-20');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE needs(
job_id int(4) NOT NULL,
antikeim_title VARCHAR(36) NOT NULL,
PRIMARY KEY(job_id, antikeim_title),
CONSTRAINT NEEDS_JOB FOREIGN KEY (job_id) REFERENCES job(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT NEEDS_ANTIK FOREIGN KEY (antikeim_title) REFERENCES antikeim(title) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

insert into needs (job_id, antikeim_title) values 
(1, 'Databases'),
(1,'Algorithms'),
(2,'Programming'),
(2,'Web Programming'),
(3, 'Mobile Apps'),
(3, 'Animation'),
(4, 'AI'),
(4, 'NLP'),
(5, 'Graphics'),
(6, 'Graphics'),
(6, 'Algorithms'),
(6, 'Programming'),
(7, 'Web Programming'),
(7, 'Mobile Apps'),
(8, '2D'),
(8, '3D'),
(9, 'Databases'),
(9, 'NoSQL DBs'),
(10, 'AI'),
(11, 'Complexity and Efficiency'),
(11, 'Algorithms'),
(12, 'Web Programming'),
(12, 'Mobile Apps'),
(12, 'Animation');

/*-------------------------------------------------------------------------------------------------------------*/

CREATE TABLE requestsevaluation (
empl_usrname VARCHAR(12) NOT NULL,
job_id int(4) NOT NULL,
PRIMARY KEY (empl_usrname, job_id),
CONSTRAINT RQUST_JOB FOREIGN KEY (job_id) REFERENCES job(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT RQUST_EMPL FOREIGN KEY (empl_usrname) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;


insert into requestsevaluation (empl_usrname, job_id) values 
('eleni23', 2),
('eleni23',7),
('angieioak', 2),
('angieioak',3),
('angieioak',6),
('angieioak',7),
('angieioak',8),
('angieioak',12),
('zoumpi', 2),
('zoumpi',3),
('zoumpi',5),
('zoumpi',6),
('zoumpi',7),
('zoumpi',9),
('zoumpi',12),
('spairous', 4),
('spairous',6),
('spairous',10),
('spairous', 5),
('daliaCh', 4), 
('daliaCh', 5),
('daliaCh',11),
('fotakos', 1),
('fotakos', 9),
('fotakos', 11);
/*-------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE evaluationresult (
EvId int(4) NOT NULL AUTO_INCREMENT,
job_id int(4) NOT NULL,
eval_username varchar(12) not null,
empl_usrname VARCHAR(12) NOT NULL,

grade int(2) default NULL,
comments VARCHAR(255),
PRIMARY KEY (EvId,empl_usrname, job_id), 
CONSTRAINT EVL_JOB FOREIGN KEY (job_id) REFERENCES job(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT EVL_EMPL FOREIGN KEY (empl_usrname) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT EVL_USR FOREIGN KEY (eval_username) REFERENCES evaluator(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

Insert into evaluationresult(job_id,eval_username,empl_usrname,grade,comments) Values
(2, 'panagTak', 'eleni23',Null,'Very Good'),
(7,'mnikol','eleni23',null,'not completed'),
(11,'paraskevi','fotakos',null, 'Not completed'),
(5,'KatiaNik','spairous',null,'Failed');


/*--------------------------------------- EPIPLEON PINAKAS MEROS A.1 ------------------------------------------------------*/

create table scores(
EvId int(4) not null,
score_1 int (2) default null,
score_2 int (2) default null,
score_3 int (2) default null,
Primary key(EvId),
constraint EVID Foreign Key (EvId) references evaluationresult(EvId) ON DELETE cascade ON UPDATE CASCADE
)engine=InnoDB;

insert into scores(EvId,score_1,score_2,score_3)values
(1,3,3,2),
(2,Null,1,null),
(3,5,2,3),
(4,0,0,0);

DROP TRIGGER if exists UpdateFinalGrade;
delimiter $
CREATE TRIGGER UpdateFinalGrade AFTER INSERT ON scores FOR EACH ROW
    
 Begin

     Declare score1 INT(1);
     Declare score2 INT(1);
     DECLARE score3 INT(1);
	 Declare sum INT;
         
         
    select score_1 INTO score1 FROM scores;
    select score_2 INTO score2 FROM scores;
    select score_3 INTO score3 FROM scores;
	
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
 
/*--------------------------------------- EPIPLEON PINAKAS MEROS A.2 ------------------------------------------------------*/

CREATE TABLE submitapplication (
emp_usrname VARCHAR(12) NOT NULL,
job_id int(4) NOT NULL,
application VARCHAR(35),
PRIMARY KEY (emp_usrname, job_id),
CONSTRAINT APPLY_JOB FOREIGN KEY (job_id) REFERENCES job(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT APPLY_EMPL FOREIGN KEY (emp_usrname) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;


INSERT INTO submitapplication() VALUES
('eleni23', 2, 'app.pdf'),
('eleni23',7,'myaplic.pdf'),
('angieioak', 2, 'ioak.pdf'),
('angieioak',3, 'aggeliki.pdf'),
('zoumpi',9, 'application.pdf'),
('zoumpi',12, 'job_ap.pdf'),
('spairous', 4, 'deloglou.pdf'),
('spairous',6, 'spyros.pdf'),
('daliaCh',11, 'chatzial.docx'),
('fotakos', 1, 'fotis.docx'),
('fotakos', 9, 'myapplication.pdf');

/*-------------------------------------- EPIPLEON PINAKAS MEROS A.3 ------------------------------------------------------*/

CREATE TABLE log (
  log_id int(4) NOT NULL AUTO_INCREMENT,
  username VARCHAR(12) NOT NULL,
  log_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  success INT(1) DEFAULT NULL,
  type ENUM('Insert','Update','Delete') DEFAULT NULL,
  table_name VARCHAR(12) NOT NULL,
  PRIMARY KEY (log_id,username),
  CONSTRAINT USR_LOG FOREIGN KEY (username) REFERENCES `user` (username) ON DELETE NO ACTION ON UPDATE CASCADE
  
) ENGINE=InnoDB;

