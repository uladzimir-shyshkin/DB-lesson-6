DROP DATABASE IF EXISTS `DB lesson 6`;
CREATE DATABASE IF NOT EXISTS `DB lesson 6`;
USE `DB lesson 6`;

DELIMITER //
CREATE FUNCTION FirstTask(x INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE sec INT DEFAULT 0;
DECLARE min INT DEFAULT 0;
DECLARE hour INT DEFAULT 0;
DECLARE day INT DEFAULT 0;
DECLARE result VARCHAR(100) DEFAULT ' ';

SET sec = x % 60;
SET min = x DIV 60;
SET hour = min DIV 60;
SET min = min % 60;
SET day = hour DIV 24;
SET hour = hour % 24;
SET result = CONCAT('Количество: ', day, ' дней,', hour, ' часов,', min, ' минут', sec, ' секунд');
RETURN result;
END //
DELIMITER ;

SELECT FirstTask(1327000);

DELIMITER //
CREATE PROCEDURE num()
DETERMINISTIC
BEGIN
DECLARE x INT DEFAULT 1;
DECLARE a VARCHAR(50) DEFAULT 'Чётные ';
DECLARE b VARCHAR(50) DEFAULT 'Нечётные ';
		WHILE x <= 10 DO
			IF x%2 = 0 THEN
				SET a = CONCAT(a, ' ,', x);
			ELSE 
				SET b = CONCAT(b, ' ,', x);
			END IF;
		SET x = x + 1;
		END WHILE;
	SELECT a, b;
END//
DELIMITER ;

call num();