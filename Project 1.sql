create database fuel_economy;
use fuel_economy;

create table fe2010 
(
id int auto_increment primary key,
 EngDispl double,
 NumCyl int, 
 FE double, 
 NumGears int, 
 TransLockup int, 
 TransCreeperGear int, 
 IntakeValvePerCyl int,
 ExhaustValvesPerCyl int, 
 VarValveTiming int, 
 VarValveLift int);
 
 show tables;
 
  load data local infile 'C:/Users/VARRI/Desktop/sandeep/Acadgild/Dataset  and refernce for mini project/FE2010.csv' into table fe2010
 fields terminated by ','
 enclosed by '"'
 lines terminated by '\r\n'
 ignore 1 lines
 (EngDispl,NumCyl,FE,NumGears,TransLockup,TransCreeperGear,IntakeValvePerCyl,ExhaustValvesPerCyl,VarValveTiming,VarValveLift
 )
  set ID =null;
 
 truncate table fe2010;
 
 load data local infile 'C:/Users/VARRI/Desktop/sandeep/Acadgild/Dataset  and refernce for mini project/FE2010.csv' into table fe2010
 fields terminated by ','
 enclosed by '"'
 lines terminated by '\r\n'
 ignore 1 lines
 (EngDispl,NumCyl,FE,NumGears,TransLockup,TransCreeperGear,IntakeValvePerCyl,ExhaustValvesPerCyl,VarValveTiming,VarValveLift
 )
  set ID =null;
select * from fe2010;


create table fe2011
(
id int auto_increment primary key,
 EngDispl double,
 NumCyl int, 
 FE double, 
 NumGears int, 
 TransLockup int, 
 TransCreeperGear int, 
 IntakeValvePerCyl int,
 ExhaustValvesPerCyl int, 
 VarValveTiming int, 
 VarValveLift int);
 
 show tables;
 
 load data local infile 'C:/Users/VARRI/Desktop/sandeep/Acadgild/Dataset  and refernce for mini project/FE2011.csv' into table fe2011
 fields terminated by '|'
 enclosed by '"'
 lines terminated by '\r\n'
 ignore 1 lines
 (EngDispl,NumCyl,FE,NumGears,TransLockup,TransCreeperGear,IntakeValvePerCyl,ExhaustValvesPerCyl,VarValveTiming,VarValveLift
 )
  set ID =null;
  
  truncate table fe2011;
  
   load data local infile 'C:/Users/VARRI/Desktop/sandeep/Acadgild/Dataset  and refernce for mini project/FE2011.csv' into table fe2011
 fields terminated by ','
 enclosed by '"'
 lines terminated by '\r\n'
 ignore 1 lines
 (EngDispl,NumCyl,FE,NumGears,TransLockup,TransCreeperGear,IntakeValvePerCyl,ExhaustValvesPerCyl,VarValveTiming,VarValveLift
 )
  set ID =null;
  
  select * from fe2011;
  
  select * from fe2010;
 
 alter table fe2010 add beta0 double, add beta1 double;
 select * from fe2010;
 
 set sql_safe_updates=0;
 
 update fe2010 set beta0= 50.56181894, beta1=-4.520315057 
 where fe2010.id is not null;
 
 select * from fe2010;
 
 alter table fe2011 add predicted_values double;
 
 select * from fe2011;
 
 update fe2011,fe2010
 
 set fe2011.predicted_values = fe2010.beta0 + (fe2010.beta1 * fe2011.engdispl) 
 where fe2011.id= fe2010.id;
 
 select * from fe2011;
 
 select engdispl,fe, predicted_values from fe2011;
 