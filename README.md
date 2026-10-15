Controle de Estoque com MySQL

Sobre o projeto

Sistema de controle de estoque desenvolvido com MySQL para praticar SQL, modelagem de bancos de dados relacionais e criação de relatórios para pequenos negócios.

Tecnologias

- MySQL
- MySQL Workbench
- SQL

Funcionalidades

- Cadastro de produtos, categorias e fornecedores.
- Registro de entradas e saídas de estoque.
- Cálculo do estoque atual por meio das movimentações.
- Identificação de produtos abaixo do estoque mínimo.
- Relatórios de estoque e valores estimados de vendas.
- Views para reutilização de consultas.
- Stored procedure para registrar movimentações e bloquear saídas superiores ao estoque disponível.
- Indicadores de produtos e estoque.

Estrutura do banco de dados

O banco `controle_estoque` contém quatro tabelas principais:

- `categorias`
- `fornecedores`
- `produtos`
- `movimentacoes`

Conceitos SQL praticados

- CREATE DATABASE e CREATE TABLE
- INSERT e SELECT
- WHERE, GROUP BY e HAVING
- INNER JOIN e LEFT JOIN
- SUM, COUNT, CASE e COALESCE
- Chaves primárias e estrangeiras
- Restrições de integridade
- Views
- Stored procedures

Organização dos arquivos

A pasta `sql/` contém os scripts para criar as tabelas, inserir dados, executar consultas, criar views e criar a procedure.

Como executar o projeto

1. Instale o MySQL Server e o MySQL Workbench.
2. Execute `01_criar_tabelas.sql` em um banco de teste vazio.
3. Execute `02_inserir_dados.sql`.
4. Execute `03_consultas_relatorios.sql` após criar as views.
5. Execute `04_views.sql` para criar as views.
6. Execute `05_procedures.sql` para criar a procedure.

**Observação:** para seguir a ordem correta, crie as views antes de executar as consultas que dependem delas. Portanto, execute `04_views.sql` antes de `03_consultas_relatorios.sql`.

Objetivo profissional

Projeto de estudo desenvolvido para demonstrar conhecimentos iniciais em bancos de dados relacionais e SQL, com foco em controle de estoque e relatórios gerenciais.

Autor

Projeto pessoal de portfólio.
