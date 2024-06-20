DELIMITER //

CREATE PROCEDURE YazdirMesaj(mesaj TEXT)
BEGIN
    -- Gelen mesajı ekrana yazdıralım
    SELECT mesaj AS 'Mesaj';
END;
//

DELIMITER ;
