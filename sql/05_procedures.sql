
USE controle_estoque;

DELIMITER //

CREATE PROCEDURE registrar_movimentacao(
    IN p_id_produto INT,
    IN p_tipo VARCHAR(10),
    IN p_quantidade INT,
    IN p_observacao VARCHAR(255)
)
BEGIN
    DECLARE v_estoque_atual INT DEFAULT 0;

    IF p_tipo NOT IN ('ENTRADA', 'SAIDA') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'Tipo deve ser ENTRADA ou SAIDA';
    END IF;

    IF p_quantidade IS NULL OR p_quantidade <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'A quantidade deve ser maior que zero';
    END IF;

    SELECT COALESCE(
        SUM(
            CASE
                WHEN tipo = 'ENTRADA' THEN quantidade
                WHEN tipo = 'SAIDA' THEN -quantidade
                ELSE 0
            END
        ), 0
    )
    INTO v_estoque_atual
    FROM movimentacoes
    WHERE id_produto = p_id_produto;

    IF p_tipo = 'SAIDA'
       AND p_quantidade > v_estoque_atual THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'Estoque insuficiente para esta saida';
    END IF;

    INSERT INTO movimentacoes
        (id_produto, tipo, quantidade, observacao)
    VALUES
        (p_id_produto, p_tipo, p_quantidade, p_observacao);
END //

DELIMITER ;
