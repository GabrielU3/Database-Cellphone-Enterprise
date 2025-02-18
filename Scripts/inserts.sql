INSERT INTO DEPARTAMENTO (NOME) VALUES
('Vendas'),
('Suporte Técnico'),
('Produção'),
('Estoque');


INSERT INTO ESTOQUE (NOME_DEPARTAMENTO, CAPACIDADE_MAX, STATUS) VALUES
('Estoque', 1000, 'ADEQUADO');

/* Inserindo dados na tabela CLIENTE */
INSERT INTO CLIENTE (CPF, NOME, EMAIL) VALUES
('111.222.333-44', 'João Silva', 'joao@email.com'),
('222.333.444-55', 'Maria Oliveira', 'maria@email.com'),
('11122233344', 'Lucas Santos', 'lucas@email.com'),
('55566677788', 'Fernanda Lima', 'fernanda@email.com'),
('98765432102', 'André Matos', 'andre.matos@email.com'),
('98765432103', 'Beatriz Souza', 'beatriz.souza@email.com');

/* Inserindo dados na tabela ENDERECO_CLIENTE*/ 
INSERT INTO ENDERECO_CLIENTE (RUA, BAIRRO, CIDADE, ESTADO, PAIS, ID_CLIENTE) VALUES
('Rua General', 'Centro', 'São Paulo', 'SP', 'Brasil', 1),
('Rua Osório', 'Jardins', 'Rio de Janeiro', 'RJ', 'Brasil', 2),
('Rua Capitão', 'Centro', 'São Paulo', 'SP', 'Brasil', 3),
('Rua Macedo', 'Zona Sul', 'Rio de Janeiro', 'RJ', 'Brasil', 4),
('Rua Inglaterra', 'Jardim Europa', 'Belo Horizonte', 'MG', 'Brasil', 5),
('Avenida Comitre', 'Campolim', 'Sorocaba', 'SP', 'Brasil', 6);

/* Inserindo dados na tabela TELEFONE_CLIENTE */
INSERT INTO TELEFONE_CLIENTE (ID_CLIENTE, NUMERO) VALUES
(1, '11999998888'),
(2, '21988887777'),
(3, '11987654321'),
(4, '21998765432'),
(5, '11988776655'),
(6, '11977665544');

/* Inserindo dados na tabela FUNCIONARIO */
INSERT INTO FUNCIONARIO (SALARIO, CPF, NOME, DATA_NASCIMENTO,NOME_DEPARTAMENTO, AREA_ATUACAO) VALUES
(3000.00, '333.444.555-66', 'Carlos Mendes', '1985-06-15', 'Vendas', 'VENDEDOR'),
(3500.00, '444.555.666-77', 'Ana Souza', '1990-08-20', 'Suporte Técnico', 'SUPORTE'),
(2500.00, '123.456.789-02', 'Carlos Silva', '1990-05-12', 'Vendas', 'VENDEDOR'),
(3000.00, '111.456.789-03', 'Ana Souza', '1985-07-22', 'Suporte Técnico', 'SUPORTE'),
(2800.00, '222.140.789-04', 'Mariana Costa', '1992-11-30', 'Produção', 'PRODUTOR'),
(3100.00, '091.456.789-05', 'Paulo Mendes', '1987-09-15', 'Estoque', 'ESTOQUISTA'),
(3500.00, '140.758.389-02', 'Carlos Souza', '1985-03-22', 'Suporte Técnico', 'SUPORTE'),
(3200.00, '123.456.789-03', 'Mariana Lima', '1992-07-19', 'Vendas', 'VENDEDOR'),
(5000.00, '123.456.789-04', 'Roberto Mendes', '1980-01-05', 'Produção', 'PRODUTOR'),
(2900.00, '123.456.789-05', 'Tatiane Costa', '1995-06-15', 'Estoque', 'ESTOQUISTA');

INSERT INTO TELEFONE_FUNCIONARIO (ID_FUNCIONARIO, NUMERO) VALUES
(1, '11912345678'),
(2, '11998765432'),
(3, '1188887777'),
(4, '3577336446'),
(5, '11932145611'),
(6, '19990101432'),
(6, '1188881111'),
(7, '1372239946'),
(8, '1188994477'),
(9, '3577337295'),
(9, '1185297777'),
(10, '3570202446');

/* Inserindo dados na tabela VENDEDOR */
INSERT INTO VENDEDOR (IDFUNCIONARIO, META_SEMANA) VALUES
(1, 50000.00),
(3, 30000.00),
(8, 25000.00);

/* Inserindo dados na tabela SUPORTE */
INSERT INTO SUPORTE (IDFUNCIONARIO, FORMACAO) VALUES
(2, 'Engenharia da Computação'),
(4, 'Engenharia da Computação'),
(7, 'Ciência da Computação');

INSERT INTO PRODUTOR (IDFUNCIONARIO, HORAS_SEMANA) VALUES
(5, 20),
(9, 25);

INSERT INTO ESTOQUISTA (IDFUNCIONARIO, TURNO) VALUES
(6, 'MANHÃ'),
(10, 'TARDE');

/* Inserindo dados na tabela MODELO */
INSERT INTO MODELO (NOME, TAMANHO_MEMORIA, TIPO_CAMERA, DURACAO_BATERIA, PROCESSADOR) VALUES
('Jaspion 3', 128, 12, 10, 'Snapdragon 888'),
('AeroFone', 256, 48, 15, 'Apple A15'),
('Galaxy S22', 128, 108, 24, 'Exynos 2200'),
('Pokophone 13', 256, 12, 22, 'A15 Bionic'),
('Pokophone 14', 128, 12, 20, 'A15 Bionic'),
('Galaxy S21', 256, 50, 24, 'Snapdragon 8 Gen 1'),
('Xiaomi Mi 11', 128, 48, 30, 'Snapdragon 680'),
('Moto G200', 256, 108, 28, 'Snapdragon 888+'),
('Asus ROG Phone 6', 256, 64, 40, 'Snapdragon 8+ Gen 1');

/* Inserindo dados na tabela PEDIDO */
INSERT INTO PEDIDO (VALOR, DESCRICAO, DATAHORA, ID_CLIENTE, ID_FUNCIONARIO) VALUES
(5000.00, 'Compra de um Jaspion 3', '2025-02-15 14:30:00', 1, 1),
(1200.00, 'Compra de um Galaxy S22', '2024-01-15 14:30:00', 2, 3),
(2300.00, 'Compra de dois Aerofone', '2025-02-16 10:15:00', 3, 8),
(4500.00, 'Compra de um Pokophone 14', '2024-02-17 10:00:00', 5, 3),
(1200.00, 'Compra de um Galaxy S22', '2025-02-17 13:45:00', 3, 3),
(2200.00, 'Compra de um Xiaomi Mi 11', '2023-03-18 09:30:00', 4, 3),
(2900.00, 'Compra de um Moto G200', '2025-02-18 11:20:00', 3, 3),
(5600.00, 'Compra de um Asus ROG Phone 6', '2025-02-19 15:50:00', 2, 3),
(1150.00, 'Compra de um AeroFone', '2025-01-19 13:47:00', 1, 8),
(15000.00, 'Compra de 3 Jaspion 3', '2024-12-15 14:30:00', 1, 1);

/* Inserindo dados na tabela CELULAR */
INSERT INTO CELULAR (NUMERO_SERIE, NOME_MODELO, IDPEDIDO) VALUES
('ABC123', 'AeroFone', 1),
('ABC456', 'AeroFone', 9),
('SN0012', 'Galaxy S22', 2),
('SN9463', 'Galaxy S22', 5),
('SN9883', 'Galaxy S21', NULL),
('SN9945', 'Jaspion 3', 1),
('SN0045', 'Pokophone 13', NULL),
('SN9987', 'Pokophone 14', 4),
('SN1234', 'Xiaomi Mi 11', NULL),
('AB4320', 'Xiaomi Mi 11', 6),
('BC9873', 'Moto G200', 7),
('GH6012', 'Moto G200', NULL),
('CDE988', 'Asus ROG Phone 6', 8);

/* Inserindo dados na tabela PECA */
INSERT INTO PECA (NOME, QUANTIDADE, NOME_MODELO) VALUES
('Microfone Spacial', 50, 'Galaxy S22'),
('Tela', 30, 'Jaspion 3'),
('Tela LCD 6.43"', 20, 'Xiaomi Mi 11'),
('Tela OLED 6.8"', 7, 'Moto G200'),
('Bateria 6000mAh', 8, 'Asus ROG Phone 6'),
('Câmera Frontal', 9, 'Galaxy S22');

/* Inserindo dados na tabela SOLICITACAO */
INSERT INTO SOLICITACAO (DESCRICAO, DATAHORA, STATUS, ID_CLIENTE, ID_SUPORTE, NUMERO_SERIE, NOME_MODELO) VALUES
('Problema na câmera', '2025-02-16 10:00:00', 'ABERTO', 1, 2, 'ABC456', 'AeroFone'),
('Troca de tela quebrada', '2024-02-14 09:00:00', 'EM ANDAMENTO', 2, 4, 'SN0012', 'Galaxy S22'),
('Problema na bateria', '2024-06-15 11:30:00', 'ABERTO', 5, 4, 'SN9987', 'Pokophone 14'),
('Tela rachada após queda', '2023-04-16 16:30:00', 'EM ANDAMENTO', 4, 2, 'AB4320', 'Xiaomi Mi 11');
