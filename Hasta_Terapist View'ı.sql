CREATE VIEW  Hasta_Terapist
AS
SELECT  
h.hasta_id , 
h.hasta_tc , 
hasta_adı ,
h.hasta_soyadı ,
h.hasta_yaş , 
h.hasta_erkek_mi , 
t.terapist_id , 
t.terapist_tc , 
t.terapist_adı , 
t.terapist_soyadı , 
t.terapist_uzmanlık  
FROM hasta h  
INNER JOIN  terapist t ON h.hasta_id = t.hasta_id;
