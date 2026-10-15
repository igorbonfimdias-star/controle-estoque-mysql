# Diagrama do Banco de Dados

Este diagrama apresenta as tabelas do projeto Controle de Estoque e seus relacionamentos.

```mermaid
erDiagram
    CATEGORIAS ||--o{ PRODUTOS : classifica
    FORNECEDORES o|--o{ PRODUTOS : fornece
    PRODUTOS ||--o{ MOVIMENTACOES : possui

    CATEGORIAS {
        int id_categoria PK
        varchar nome
        varchar descricao
    }

    FORNECEDORES {
        int id_fornecedor PK
        varchar nome
        varchar telefone
        varchar email
        varchar cidade
    }

    PRODUTOS {
        int id_produto PK
        varchar nome
        int id_categoria FK
        int id_fornecedor FK
        decimal custo_unitario
        decimal preco_venda
        int estoque_minimo
        boolean ativo
    }

    MOVIMENTACOES {
        int id_movimentacao PK
        int id_produto FK
        enum tipo
        int quantidade
        datetime data_movimentacao
        varchar observacao
    }
```

## Relacionamentos

- **Categorias e produtos:** uma categoria pode ter vários produtos.
- **Fornecedores e produtos:** um fornecedor pode fornecer vários produtos; um produto pode não ter fornecedor associado.
- **Produtos e movimentações:** um produto pode ter várias movimentações de entrada e saída.

As siglas `PK` e `FK` representam, respectivamente, chave primária e chave estrangeira.
