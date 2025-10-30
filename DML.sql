-- DML =============================================================

-- Inserindo especialidades médicas
INSERT INTO Especialidades 
    (nome, descricao) 
VALUES
    ('Cardiologia', 'Especialidade médica que trata doenças do coração e sistema circulatório'),
    ('Dermatologia', 'Especialidade médica que trata doenças da pele, cabelos e unhas'),
    ('Pediatria', 'Especialidade médica dedicada ao cuidado de crianças e adolescentes'),
    ('Ortopedia', 'Especialidade médica que trata doenças e deformidades do sistema musculoesquelético'),
    ('Ginecologia', 'Especialidade médica que trata da saúde do sistema reprodutor feminino'),
    ('Clinico Geral', 'Médico generalista que trata de problemas de saúde diversos');

-- Inserindo pacientes
INSERT INTO Pacientes 
    (nome, data_nasc, telefone, email) 
VALUES
    ('Maria Silva Santos', '1985-03-15', '(19) 9 8765-4321', 'maria.silva@email.com'),
    ('João Oliveira Costa', '1990-07-22', '(19) 9 1234-5678', 'joao.costa@email.com'),
    ('Ana Paula Rodrigues', '1978-11-03', '(19) 9 5555-8888', 'ana.rodrigues@email.com'),
    ('Carlos Eduardo Lima', '2000-01-30', '(19) 9 9999-1111', 'carlos.lima@email.com'),
    ('Fernanda Souza Alves', '1995-09-14', '(19) 9 7777-3333', 'fernanda.alves@email.com'),
    ('Roberto Pereira Gomes', '1982-12-25', '(19) 9 4444-6666', 'roberto.gomes@email.com'),
    ('Juliana Santos Moraes', '1998-06-18', '(19) 9 2222-9999', 'juliana.moraes@email.com'),
    ('Pedro Henrique Castro', '1975-04-08', '(19) 9 8888-2222', 'pedro.castro@email.com');

-- Inserindo médicos
INSERT INTO Medicos 
    (nome, CRM, id_especialidade, data_nasc, telefone) 
VALUES
    ('Dr. Ricardo Mendonça', 'CRM/SP 123456', 1, '1970-08-12', '(19) 9 3333-7777'),
    ('Dra. Beatriz Ramos', 'CRM/SP 234567', 2, '1980-02-28', '(19) 9 6666-4444'),
    ('Dr. Marcelo Costa', 'CRM/SP 345678', 3, '1978-05-15', '(19) 9 1111-5555'),
    ('Dra. Patricia Oliveira', 'CRM/SP 456789', 4, '1985-10-20', '(19) 9 7777-9999'),
    ('Dra. Camila Santos', 'CRM/SP 567890', 5, '1976-03-03', '(19) 9 5555-2222'),
    ('Dr. Antonio Ferreira', 'CRM/SP 678901', 6, '1982-11-11', '(19) 9 8888-3333');

-- Inserindo consultas
INSERT INTO Consultas 
    (id_paciente, id_medico, data_consulta, hora_inicio, hora_fim, status_consulta) 
VALUES
    (1, 1, '2025-08-15', '09:00:00', '09:45:00', 'realizado'),
    (2, 2, '2025-08-15', '10:00:00', '10:30:00', 'realizado'),
    (3, 3, '2025-09-16', '08:30:00', '09:15:00', 'realizado'),
    (4, 4, '2025-09-16', '14:00:00', '14:45:00', 'cancelado'),
    (5, 5, '2025-09-17', '11:00:00', '11:40:00', 'realizado'),
    (6, 6, '2025-01-17', '15:30:00', '16:15:00', 'paci_ausente'),
    (1, 1, '2025-10-24', '13:00:00', '13:50:00', 'confirmado'),
    (7, 2, '2025-10-24', '16:00:00', '16:45:00', 'confirmado'),
    (8, 3, '2025-10-25', '09:30:00', '10:20:00', 'confirmado'),
    (2, 4, '2025-10-26', '14:30:00', '15:15:00', 'confirmado');

-- Inserindo prontuários
INSERT INTO Prontuarios 
    (id_consulta, diagnostico, prescricao, data_registro) 
VALUES
    (1, 'Hipertensão arterial estágio 1', 'Losartana 50mg 1x ao dia; Orientação dieta hipossódica', '2024-01-15'),
    (2, 'Dermatite de contato', 'Pomada de corticóide 2x ao dia por 7 dias; Evitar contato com agente causador', '2024-01-15'),
    (3, 'Resfriado comum', 'Repouso relativo; Hidratação; Sintomáticos para febre se necessário', '2024-01-16'),
    (5, 'Consulta de rotina - preventivo', 'Solicitado exames: Papanicolau, US transvaginal; Retorno em 30 dias', '2024-01-17'),
    (7, 'Controle de hipertensão', 'Manter medicação; Aferir PA 2x ao dia; Retorno em 60 dias', '2024-01-18');

-- Demonstração:

INSERT INTO Especialidades 
    (nome, descricao) 
VALUES
    ('Campo para teste', 'Usaremos esse campo para testar os demais comandos');

-- UPDATE
UPDATE Especialidades 
    SET nome = 'Teste'
WHERE
    nome = 'Campo para teste';

-- DELETE
DELETE FROM Especialidades WHERE nome = 'Teste';
