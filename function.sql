DELIMITER $$

CREATE FUNCTION Calc_Idade (
    f_data_nascimento DATE
)

RETURNS INT
DETERMINISTIC

BEGIN 
    DECLARE idade INT;
    SET idade = TIMESTAMPDIFF(YEAR, f_data_nascimento, CURDATE());
    RETURN idade;
END; $$

DELIMITER ;
