# Projeto de Banco de Dados - Sistema de Pedidos e Livros

Este projeto é um modelo de banco de dados que representa um sistema de gerenciamento de pedidos e livros, onde os clientes podem fazer pedidos, adicionar livros a um carrinho e os autores podem ser associados aos livros que escrevem. 

## Estrutura do Projeto

O banco de dados foi projetado para permitir que:

- Clientes façam pedidos de livros.
- Livros sejam organizados por categorias.
- Autores sejam vinculados aos livros que escreveram.
- Carrinhos contenham os livros selecionados pelos clientes em cada pedido.

## Equipe do Projeto

| Nome                             | E-mail                       | RA         |
|----------------------------------|------------------------------|------------|
| Guilherme Delciro da Silva       | g.delciro@uni9.edu.br        | 923209023  |
| Eduardo Martins de Souza Gonçalves | Dudu.060306@uni9.edu.br     | 924105036  |
| Gabriel Henrique Mahmoud Cardoso | mahmoud.gabriel@uni9.edu.br  | 924104941  |

## Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas principais:

- `CLIENTE`: Armazena informações sobre os clientes (ID, nome, tipo, CPF).
- `PEDIDOS`: Registra os pedidos realizados por cada cliente (ID, data, status).
- `LIVROS`: Contém informações sobre os livros (ISBN, ano, editora, título).
- `CATEGORIA`: Define as categorias de livros disponíveis.
- `AUTOR`: Armazena dados dos autores dos livros.
- `CARRINHO`: Representa os itens que um cliente adiciona ao carrinho em cada pedido.
- `CLASSIFICA` e `ESCREVE`: Relacionamentos entre livros e suas categorias e entre livros e autores, respectivamente.

## Comandos SQL

O projeto inclui os scripts SQL para criar as tabelas e popular o banco de dados com dados de exemplo. Consulte o arquivo `database.sql` para os detalhes dos comandos de criação e inserção de dados.

## Instruções de Uso

1. Execute os comandos de criação de tabelas presentes no arquivo SQL.
2. Use os comandos `INSERT` para adicionar dados iniciais ao banco.
3. Explore e modifique os dados conforme necessário para simular operações de pedidos, adição de livros e gestão de categorias.
