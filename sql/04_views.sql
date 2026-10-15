
USE controle_estoque;

-- VIEW 1: Relatório completo do estoque
CREATE VIEW vw_estoque_atual AS
SELECT
    p.id_produto,
    p.nome AS produto,
    c.nome AS categoria,
    f.nome AS fornecedor,
    p.custo_unitario,
    p.preco_venda,
    p.estoque_minimo,
    COALESCE(
        SUM(
            CASE
                WHEN m.tipo = 'ENTRADA' THEN m.quantidade
                WHEN m.tipo = 'SAIDA' THEN -m.quantidade
                ELSE 0
            END
        ), 0
    ) AS estoque_atual,
    COALESCE(
        SUM(
            CASE
                WHEN m.tipo = 'ENTRADA' THEN m.quantidade
                WHEN m.tipo = 'SAIDA' THEN -m.quantidade
                ELSE 0
            END
        ), 0
    ) * p.custo_unitario AS valor_total_estoque
FROM produtos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
LEFT JOIN fornecedores f
    ON p.id_fornecedor = f.id_fornecedor
LEFT JOIN movimentacoes m
    ON p.id_produto = m.id_produto
GROUP BY
    p.id_produto,
    p.nome,
    c.nome,
    f.nome,
    p.custo_unitario,
    p.preco_venda,
    p.estoque_minimo;

-- VIEW 2: Produtos abaixo do estoque mínimo
CREATE VIEW vw_estoque_baixo AS
SELECT
    id_produto,
    produto,
    categoria,
    estoque_atual,
    estoque_minimo
FROM vw_estoque_atual
WHERE estoque_atual < estoque_minimo;
