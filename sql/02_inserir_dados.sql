
USE controle_estoque;

-- 1. Categorias
INSERT INTO categorias (nome, descricao)
VALUES
('Informática', 'Computadores e componentes'),
('Cabos', 'Cabos de rede e conectividade'),
('Periféricos', 'Teclados, mouses e acessórios'),
('Armazenamento', 'Discos, SSDs e dispositivos de armazenamento');

-- 2. Fornecedores
INSERT INTO fornecedores (nome, telefone, email, cidade)
VALUES
('Tech Distribuidora', '(11) 3333-1000',
 'vendas@techdistribuidora.com', 'São Paulo'),
('Conecta Suprimentos', '(11) 3333-2000',
 'contato@conectasuprimentos.com', 'Guarulhos'),
('Digital Componentes', '(11) 3333-3000',
 'comercial@digitalcomponentes.com', 'Osasco');

-- 3. Produtos
INSERT INTO produtos
    (nome, descricao, id_categoria, id_fornecedor,
     custo_unitario, preco_venda, estoque_minimo)
VALUES
('Mouse USB', 'Mouse óptico USB', 3, 1, 25.00, 39.90, 5),
('Teclado USB', 'Teclado padrão ABNT2', 3, 1, 45.00, 69.90, 5),
('Cabo de rede Cat6', 'Cabo de rede de 2 metros', 2, 2, 12.00, 22.90, 10),
('SSD 480GB', 'SSD SATA de 480GB', 4, 3, 180.00, 249.90, 3),
('Memória RAM 8GB', 'Memória DDR4 de 8GB', 1, 3, 95.00, 139.90, 4),
('Adaptador USB', 'Adaptador USB para rede Ethernet', 1, 2, 30.00, 49.90, 5);

-- 4. Movimentações iniciais
INSERT INTO movimentacoes
    (id_produto, tipo, quantidade, observacao)
VALUES
(1, 'ENTRADA', 20, 'Estoque inicial'),
(1, 'SAIDA', 3, 'Venda'),
(2, 'ENTRADA', 15, 'Estoque inicial'),
(2, 'SAIDA', 2, 'Venda'),
(3, 'ENTRADA', 50, 'Estoque inicial'),
(3, 'SAIDA', 12, 'Venda'),
(4, 'ENTRADA', 10, 'Estoque inicial'),
(4, 'SAIDA', 8, 'Venda'),
(5, 'ENTRADA', 12, 'Estoque inicial'),
(5, 'SAIDA', 4, 'Venda'),
(6, 'ENTRADA', 8, 'Estoque inicial'),
(6, 'SAIDA', 3, 'Venda');
