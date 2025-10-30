CREATE DATABASE IF NOT EXISTS clinica_db; -- Cria da database se não existe

USE clinica_db;

-- DDL =======================================================

CREATE TABLE Especialidades (
    id_especialidade    INT PRIMARY KEY AUTO_INCREMENT,
    nome                VARCHAR(50) NOT NULL,
    descricao           VARCHAR(500)    
);

CREATE TABLE Pacientes (
    id_paciente         INT PRIMARY KEY AUTO_INCREMENT,
    nome                VARCHAR(50) NOT NULL,
    data_nasc           DATE NOT NULL,  -- YYYY-MM-DD
    telefone            VARCHAR(16) NOT NULL, -- (XX) 9 XXXX XXXX
    email               VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE Medicos (
    id_medico           INT PRIMARY KEY AUTO_INCREMENT,
    nome                VARCHAR(50) NOT NULL,
    CRM                 VARCHAR(14) UNIQUE NOT NULL, -- CRM/SP 123456
    id_especialidade    INT  NOT NULL, 
    data_nasc           DATE NOT NULL,  -- YYYY-MM-DD
    telefone            VARCHAR(16) NOT NULL, -- (XX) 9 XXXX XXXX

    FOREIGN KEY(id_especialidade) REFERENCES Especialidades(id_especialidade) ON DELETE CASCADE
);

CREATE TABLE Consultas (
    id_consulta         INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente         INT NOT NULL, 
    id_medico           INT NOT NULL,
    data_consulta       DATE NOT NULL, -- YYYY-MM-DD
    hora_inicio         TIME NOT NULL, -- hh:mm:ss
    hora_fim            TIME NOT NULL, -- hh:mm:ss
    status_consulta     VARCHAR(30), -- confirmado, cancelado, realizado, paci_ausente             

    -- Checa hora válida com horário de funcionamento da clínica:
    CONSTRAINT chk_horario_valido CHECK 
        (hora_inicio >= '8:00:00' AND hora_inicio <= '17:00:00'),
    CONSTRAINT chk_horario_fim_valido CHECK 
        (hora_fim > hora_inicio AND hora_fim <= '18:00:00'),

    CONSTRAINT chk_status CHECK 
        (status_consulta IN ('confirmado', 'cancelado', 'realizado', 'paci_ausente')), -- apenas 4 valores são aceitos

    FOREIGN KEY(id_paciente) REFERENCES Pacientes(id_paciente) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT,
    FOREIGN KEY(id_medico) REFERENCES Medicos(id_medico) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);

CREATE TABLE Prontuarios (
    id_prontuario       INT PRIMARY KEY AUTO_INCREMENT,
    id_consulta         INT NOT NULL,
    diagnostico         VARCHAR(500) NOT NULL,
    prescricao          VARCHAR(500),
    data_registro       DATE NOT NULL,

    FOREIGN KEY(id_consulta) REFERENCES Consultas(id_consulta) ON DELETE CASCADE
);

-- Alterações ======================================================
ALTER TABLE Prontuarios ADD validade DATE NOT NULL;
DESCRIBE Prontuarios;
ALTER TABLE Prontuarios DROP COLUMN validade;
DESCRIBE Prontuarios;
