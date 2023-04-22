-- Criação de login
-- Conceder e Revogar permissões

CREATE LOGIN PROFSERGIO WITH PASSWORD = 'root@123'  --Imaginar tela de login do Studio
GO                                                  -- ?Usado para rodar script, por exemplo: Rodar o script pelo CMD, ele executar se tiver o GO

CREATE USER PROFSLM FOR LOGIN PROFSERGIO            -- O usuário é o dono das tabelas
GO

CREATE DATABASE PROFSLM
GO

USE RA2017208552

SELECT * FROM FUNCIONARIOS
GO

-- GRANT SELECT ON FUNCIONARIOS TO PROFSLM             -- CONCEDE permissão para o usuário PROFSLM poder utilizar o SELECT na tabela FUNCIONARIOS
-- GO

REVOKE SELECT ON FUNCIONARIOS FROM PROFSLM          -- REVOGA permissão para o usuário PROFSLM poder utilizar o SELECT na tabela FUNCIONARIOS
GO

CREATE TABLE FUNCIONARIOS
(CODIGO INT,
NOME VARCHAR(200)
)
GO

CREATE SCHEMA BRINDES AUTHORIZATION PROFSLM
GO       -- O CORRETO É COLOCAR DEPOIS DE CADA COMANDO, COMO SE MARCASSE A LINHA TODA E DESSE "F5" - PARA EXECUTAR

-- CRIA A TABELA FUNCIONARIOS COM ESQUEMA BRINDES
CREATE TABLE BRINDES.FUNCIONARIOS
(CODIGO INT NOT NULL IDENTITU(1,1),
NOME VARCHAR(200),
PRIMARY KEY(CODIGO)
)

CREATE SYNONYM FUNCIONARIOS FROM BRINDES.FUNCIONARIOS -- Cria um sinonimo para não precisar chamando "BRINDES.FUNCIONARIOS", chama somente pelo "FUNCIONARIOS"