/*Consulta 1 – Quantas vendas foram realizadas por mês e por modelo? 
Essa consulta retorna a quantidade total de vendas realizadas, agrupadas por mês e modelo do celular. Responsável: André
*/

SELECT 
    EXTRACT(MONTH FROM v.data_venda) AS mes, 
    c.modelo, 
    COUNT(*) AS total_vendas
FROM venda v
JOIN celular c ON v.id_celular = c.id_celular
GROUP BY mes, c.modelo;


/*Consulta 2 - Quais os funcionários que pertencem ao setor de vendas e nunca venderam um celular do modelo Jaspion 3?
Essa consulta identifica os funcionários do setor de vendas que nunca realizaram uma venda do modelo Jaspion 3. Responsável: André*/

SELECT f.nome
FROM funcionario f
LEFT JOIN venda v ON f.idfuncionario = v.idfuncionario
LEFT JOIN celular c ON v.id_celular = c.id_celular AND c.modelo = 'Jaspion 3'
WHERE f.area_atuacao = 'VENDEDOR' AND c.id_celular IS NULL;

/*Consulta 3 - Qual a média salarial dos funcionários do setor de produção entre 22 e 40 anos?
Calcular a média salarial dos funcionários do setor de produção que possuem entre 22 e 40 anos. Responsável: Pedro
*/

SELECT AVG(SALARIO) AS MEDIA_SALARIAL FROM FUNCIONARIO WHERE AREA_ATUACAO = 'PRODUTOR' AND IDADE BETWEEN 22 AND 40;

/*Consulta 4 - Quais clientes fizeram solicitações de suporte de um modelo em um determinado mês?
Identificar os clientes que já realizaram solicitações de suporte de um modelo em um determinado mês. Responsável: Pedro
*/

SELECT DISTINCT c.IDCLIENTE, c.NOME, c.CPF, c.EMAIL 
FROM CLIENTE c
JOIN SOLICITACAO s on c.IDCLIENTE = s.ID_CLIENTE
WHERE s.NOME_MODELO = <nome_modelo> 
AND EXTRACT(MONTH FROM  s.DATAHORA) = <mes>;

/*Consulta 5 - Quais dispositivos que foram vendidos nunca foram levados para suporte?
Listar os dispositivos que foram vendidos e nunca foram levados para suporte. Responsável: Pedro*/

SELECT c.NUMERO_SERIE, c.NOME_MODELO 
FROM CELULAR c 
LEFT JOIN SOLICITACAO s ON c.NUMERO_SERIE = s.NUMERO_SERIE 
WHERE c.IDPEDIDO IS NOT NULL AND s.NUMERO_SERIE IS NULL;

/*Consulta 6 - Quais e quantos modelos de celular possuem disponíveis no estoque?
Verificar quais modelos de celular estão disponíveis no estoque e quantas unidades há de cada um. Responsável: Gabriel
*/

SELECT C.NOME_MODELO, COUNT(*) AS QUANTIDADE_DISPONIVEL
FROM CELULAR C
LEFT JOIN PEDIDO P ON C.IDPEDIDO = P.IDPEDIDO
WHERE C.IDPEDIDO IS NULL 
	GROUP BY C.NOME_MODELO;

/*Consulta 7 - Quais as solicitações de suporte com status "em andamento" ou "aberto", incluindo o funcionário e cliente responsável?
Listar as solicitações de suporte com status "em andamento" ou "aberto", incluindo o funcionário responsável e o cliente solicitante. Responsável: Gabriel
*/

SELECT 
	S.CODIGO, 
    S.DESCRICAO, 
    S.DATAHORA, 
    S.STATUS, 
    F.NOME AS FUNCIONARIO_RESPONSAVEL, 
    C.NOME AS CLIENTE_SOLICITANTE
FROM SOLICITACAO S
JOIN FUNCIONARIO F ON S.ID_SUPORTE = F.IDFUNCIONARIO
JOIN CLIENTE C ON S.ID_CLIENTE = C.IDCLIENTE
WHERE S.STATUS IN ('EM ANDAMENTO', 'ABERTO');

