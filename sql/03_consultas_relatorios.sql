
USE controle_estoque;

-- 1. Produtos com preço de venda acima de R$ 100
SELECT nome, custo_unitario, preco_venda
FROM produtos
WHERE preco_venda > 100;

-- 2. Estoque atual de cada produto
SELECT
    p.id_produto,
    p.nome AS produto,
    p.estoque_minimo,
    COALESCE(
        SUM(
            CASE
                WHEN m.tipo = 'ENTRADA' THEN m.quantidade
                WHEN m.tipo = 'SAIDA' THEN -m.quantidade
                ELSE 0
            END
        ), 0
    ) AS estoque_atual
FROM produtos p
LEFT JOIN movimentacoes m
    ON p.id_produto = m.id_produto
GROUP BY p.id_produto, p.nome, p.estoque_minimo
ORDER BY p.id_produto;

-- 3. Produtos abaixo do estoque mínimo
SELECT *
FROM vw_estoque_baixo;

-- 4. Relatório completo do estoque
SELECT *
FROM vw_estoque_atual
ORDER BY produto;

-- 5. Relatório de saídas e valor estimado de vendas
SELECT
    p.nome AS produto,
    SUM(m.quantidade) AS quantidade_vendida,
    p.preco_venda,
    SUM(m.quantidade) * p.preco_venda AS valor_estimado_vendas
FROM movimentacoes m
INNER JOIN produtos p
    ON m.id_produto = p.id_produto
WHERE m.tipo = 'SAIDA'
GROUP BY p.id_produto, p.nome, p.preco_venda
ORDER BY valor_estimado_vendas DESC;

-- 6. Indicadores de produtos ativos e inativos
SELECT
    COUNT(*) AS total_produtos,
    SUM(CASE WHEN ativo = TRUE THEN 1 ELSE 0 END)
        AS produtos_ativos,
    SUM(CASE WHEN ativo = FALSE THEN 1 ELSE 0 END)
        AS produtos_inativos
FROM produtos;

-- 7. Indicadores gerais do estoque
SELECT
    COUNT(*) AS total_produtos,
    SUM(estoque_atual * custo_unitario)
        AS valor_total_estoque,
    SUM(
        CASE
            WHEN estoque_atual < estoque_minimo THEN 1
            ELSE 0
        END
    ) AS produtos_abaixo_minimo
FROM vw_estoque_atual;
