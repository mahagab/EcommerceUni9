CREATE TABLE LOG (
    id_int INT IDENTITY(1,1) PRIMARY KEY,
    nome_tabela VARCHAR(50) NOT NULL,
    operacao VARCHAR(10) NOT NULL CHECK (operacao IN ('INSERT', 'UPDATE', 'DELETE')),
    valor_atual VARCHAR(500),
    valor_novo VARCHAR(500)
);

CREATE TRIGGER trg_log_insert_cliente
ON CLIENTE
AFTER INSERT
AS
BEGIN
    INSERT INTO log (nome_tabela, operacao, valor_atual, valor_novo)
    SELECT 
        'CLIENTE',
        'INSERT',
        NULL,
        STRING_AGG(CONCAT('ID_CLIENTE: ', ID_CLIENTE, ', NOME: ', NOME, ', TIPO_CLI: ', TIPO_CLI, ', CPF: ', CPF), ', ') 
    FROM INSERTED;
END;

CREATE TRIGGER trg_log_update_cliente
ON CLIENTE
AFTER UPDATE
AS
BEGIN
    INSERT INTO log (nome_tabela, operacao, valor_atual, valor_novo)
    SELECT 
        'CLIENTE',
        'UPDATE',
        STRING_AGG(CONCAT('ID_CLIENTE: ', d.ID_CLIENTE, ', NOME: ', d.NOME, ', TIPO_CLI: ', d.TIPO_CLI, ', CPF: ', d.CPF), ', ') AS valor_atual,
        STRING_AGG(CONCAT('ID_CLIENTE: ', i.ID_CLIENTE, ', NOME: ', i.NOME, ', TIPO_CLI: ', i.TIPO_CLI, ', CPF: ', i.CPF), ', ') AS valor_novo
    FROM DELETED d
    JOIN INSERTED i ON d.ID_CLIENTE = i.ID_CLIENTE;
END;

CREATE TRIGGER trg_log_update_cliente
ON CLIENTE
AFTER UPDATE
AS
BEGIN
    INSERT INTO log (nome_tabela, operacao, valor_atual, valor_novo)
    SELECT 
        'CLIENTE',
        'UPDATE',
        STRING_AGG(CONCAT('ID_CLIENTE: ', d.ID_CLIENTE, ', NOME: ', d.NOME, ', TIPO_CLI: ', d.TIPO_CLI, ', CPF: ', d.CPF), ', ') AS valor_atual,
        STRING_AGG(CONCAT('ID_CLIENTE: ', i.ID_CLIENTE, ', NOME: ', i.NOME, ', TIPO_CLI: ', i.TIPO_CLI, ', CPF: ', i.CPF), ', ') AS valor_novo
    FROM DELETED d
    JOIN INSERTED i ON d.ID_CLIENTE = i.ID_CLIENTE;
END;


CREATE TRIGGER trg_log_delete_cliente
ON CLIENTE
AFTER DELETE
AS
BEGIN
    INSERT INTO log (nome_tabela, operacao, valor_atual, valor_novo)
    SELECT 
        'CLIENTE',
        'DELETE',
        STRING_AGG(CONCAT('ID_CLIENTE: ', d.ID_CLIENTE, ', NOME: ', d.NOME, ', TIPO_CLI: ', d.TIPO_CLI, ', CPF: ', d.CPF), ', ') AS valor_atual,
        NULL
    FROM DELETED d;
END;

UPDATE CLIENTE
SET NOME = 'João da Silva Santos', TIPO_CLI = 'Físico Atualizado'
WHERE ID_CLIENTE = 1;

DROP TABLE log;

select *  from log
