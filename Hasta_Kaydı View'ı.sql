CREATE VIEW HastaKaydı
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
t.terapist_uzmanlık  , 
hk.hasta_kaydı_id , 
hk.hasta_kaydı_no ,
hk.hasta_kaydı_tarih , 
hk.hasta_kaydı_teşhis , 
hk.hasta_kaydı_tedavi_yöntemi
FROM hasta h
INNER JOIN terapist t ON h.hasta_id = t.hasta_id
INNER JOIN hasta_kaydı hk ON h.hasta_id = hk.hasta_id;