DROP TRIGGER IF EXISTS HastaEklendiTrigger;

DELIMITER //

CREATE TRIGGER HastaEklendiTrigger BEFORE INSERT ON hasta
FOR EACH ROW
BEGIN
    -- Yeni eklenen hastanın adını ve soyadını alarak bir mesaj oluştur
    DECLARE hasta_mesaj VARCHAR(255);
    SET hasta_mesaj = CONCAT(NEW.hasta_adı, ' ', NEW.hasta_soyadı, ' adlı hasta eklendi.');
    
    -- Oluşturulan mesajı yazdırmak için bir değişkene atayalım
    SET @mesaj = hasta_mesaj;
END;
//

DELIMITER ;
