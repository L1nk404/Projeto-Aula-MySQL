CREATE VIEW v_pacientes_idade AS
SELECT 
    id_paciente,
    nome,
    data_nasc,
    Calc_Idade(data_nasc) AS idade
FROM Pacientes;  

CREATE VIEW v_pacientes_agendados_15 AS
SELECT 
    p.id_paciente,
    p.nome,
    Calc_Idade(data_nasc) AS 'Idade',
    c.data_consulta AS 'Data Consulta',
    c.status_consulta AS 'Status Consulta'
FROM Pacientes AS p
JOIN Consultas AS c
    ON p.id_paciente = c.id_paciente
WHERE
    TIMESTAMPDIFF(DAY, c.data_consulta, CURDATE()) <= 15;