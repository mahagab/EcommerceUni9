CREATE DATABASE ECOMMERCE; 
GO
USE ECOMMERCE; 
GO


-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    TIPO_CLI VARCHAR(50),
    CPF CHAR(11) NOT NULL
);

-- Tabela PEDIDOS
CREATE TABLE PEDIDOS (
    ID_PEDIDO INT PRIMARY KEY,
    DATA DATE NOT NULL,
    STATUS VARCHAR(20),
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

-- Tabela LIVROS
CREATE TABLE LIVROS (
    ISBN CHAR(13) PRIMARY KEY,
    ANO INT,
    EDITORA VARCHAR(100),
    TITULO VARCHAR(200) NOT NULL
);

-- Tabela CATEGORIA
CREATE TABLE CATEGORIA (
    CODIGO INT PRIMARY KEY,
    DESCRICAO VARCHAR(100) NOT NULL
);

-- Tabela AUTOR
CREATE TABLE AUTOR (
    IDAUTOR INT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    NACIONALIDADE VARCHAR(50)
);

-- Tabela CARRINHO
CREATE TABLE CARRINHO (
    ID_CLIENTE INT,
    ID_PEDIDO INT,
    ISBN CHAR(13),
    UNIDADES INT NOT NULL,
    PRIMARY KEY (ID_CLIENTE, ID_PEDIDO, ISBN),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDOS(ID_PEDIDO),
    FOREIGN KEY (ISBN) REFERENCES LIVROS(ISBN)
);

-- Tabela CLASSIFICA
CREATE TABLE CLASSIFICA (
    CODIGO INT,
    ISBN CHAR(13),
    PRIMARY KEY (CODIGO, ISBN),
    FOREIGN KEY (CODIGO) REFERENCES CATEGORIA(CODIGO),
    FOREIGN KEY (ISBN) REFERENCES LIVROS(ISBN)
);

-- Tabela ESCREVE
CREATE TABLE ESCREVE (
    IDAUTOR INT,
    ISBN CHAR(13),
    PRIMARY KEY (IDAUTOR, ISBN),
    FOREIGN KEY (IDAUTOR) REFERENCES AUTOR(IDAUTOR),
    FOREIGN KEY (ISBN) REFERENCES LIVROS(ISBN)
);
