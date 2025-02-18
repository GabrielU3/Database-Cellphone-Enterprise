/* Para criar o banco (no terminal) */
-- CREATE DATABASE EMPRESA_CELULAR;

/* Conectar ao banco (no terminal) */
-- \c EMPRESA_CELULAR;

/* Criando a tabela DEPARTAMENTO primeiro */
CREATE TABLE DEPARTAMENTO (
    NOME VARCHAR(50) PRIMARY KEY,
    NUM_FUNCIONARIO INT DEFAULT 0
);

/* Criando a tabela ESTOQUE (herda de DEPARTAMENTO) */
CREATE TABLE ESTOQUE (
    NOME_DEPARTAMENTO VARCHAR(50) PRIMARY KEY,
    CAPACIDADE_MAX INT NOT NULL CHECK (CAPACIDADE_MAX >= 0),
    STATUS VARCHAR(15) NOT NULL CHECK (STATUS IN('ADEQUADO', 'VAZIO', 'CHEIO')),
    FOREIGN KEY (NOME_DEPARTAMENTO) REFERENCES DEPARTAMENTO(NOME)
);

/* Cliente e suas tabelas */
CREATE TABLE CLIENTE (
    IDCLIENTE INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CPF VARCHAR(15) UNIQUE,
    NOME VARCHAR(30) NOT NULL,
    EMAIL VARCHAR(50) UNIQUE
);

CREATE TABLE ENDERECO_CLIENTE (
    IDENDERECO INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    PAIS VARCHAR(30) NOT NULL,
    ID_CLIENTE INT UNIQUE NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) ON DELETE CASCADE ON    UPDATE CASCADE
);

CREATE TABLE TELEFONE_CLIENTE (
    IDTELEFONE INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    NUMERO VARCHAR(20) NOT NULL,
    CONSTRAINT FK_TELEFONE_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Funcionários e suas áreas */
/* Criando a tabela FUNCIONARIO sem a coluna gerada */
CREATE TABLE FUNCIONARIO (
    IDFUNCIONARIO INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    SALARIO NUMERIC(12,2) CHECK (SALARIO >= 1518.00),
    CPF VARCHAR(15) UNIQUE NOT NULL,
    IDADE INT,	
    NOME VARCHAR(30) NOT NULL,
    DATA_NASCIMENTO DATE NOT NULL CHECK (DATA_NASCIMENTO > '1960-01-01' AND DATA_NASCIMENTO < '2006-01-01'),
    NOME_DEPARTAMENTO VARCHAR(50),
    AREA_ATUACAO VARCHAR(15) NOT NULL CHECK (AREA_ATUACAO IN ('VENDEDOR', 'SUPORTE', 'PRODUTOR', 'ESTOQUISTA')),

    CONSTRAINT FK_FUNCIONARIO_DEPARTAMENTO FOREIGN KEY (NOME_DEPARTAMENTO) REFERENCES DEPARTAMENTO(NOME) ON DELETE CASCADE
);

/* Criando as tabelas particionadas */
CREATE TABLE VENDEDOR(
	IDFUNCIONARIO INT PRIMARY KEY,
	META_SEMANA NUMERIC(12,2) NOT NULL,
	FOREIGN KEY (IDFUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SUPORTE(
	IDFUNCIONARIO INT PRIMARY KEY,
	FORMACAO VARCHAR(50) NOT NULL,
	FOREIGN KEY (IDFUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO) ON DELETE CASCADE
);

CREATE TABLE PRODUTOR(
	IDFUNCIONARIO INT PRIMARY KEY,
	HORAS_SEMANA INT NOT NULL,
	FOREIGN KEY (IDFUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO) ON DELETE CASCADE
);

CREATE TABLE ESTOQUISTA(
	IDFUNCIONARIO INT PRIMARY KEY,
	TURNO VARCHAR(10) NOT NULL CHECK (TURNO IN ('MANHÃ', 'TARDE', 'NOITE')),
	FOREIGN KEY (IDFUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO) ON DELETE CASCADE
);

CREATE TABLE TELEFONE_FUNCIONARIO (
    IDTELEFONE INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_FUNCIONARIO INT NOT NULL,
    NUMERO VARCHAR(20) NOT NULL,
    CONSTRAINT FK_TELEFONE_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO) ON DELETE CASCADE
);


/* Criando a tabela MODELO */
CREATE TABLE MODELO (
    NOME VARCHAR(50) PRIMARY KEY,
    TAMANHO_MEMORIA INT NOT NULL CHECK (TAMANHO_MEMORIA >= 2 AND TAMANHO_MEMORIA <= 256),
    TIPO_CAMERA INT NOT NULL CHECK (TIPO_CAMERA >= 12 AND TIPO_CAMERA <= 200),
    DURACAO_BATERIA INT NOT NULL CHECK (DURACAO_BATERIA > 0),
    PROCESSADOR VARCHAR(50) NOT NULL
);

/* Criando a tabela PEDIDO */
CREATE TABLE PEDIDO (
    IDPEDIDO INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VALOR NUMERIC(12,2) NOT NULL CHECK (VALOR >= 999.99),
    DESCRICAO VARCHAR(300) NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    ID_CLIENTE INT NOT NULL,
    ID_FUNCIONARIO INT NOT NULL,
    
    CONSTRAINT FK_PEDIDO_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_PEDIDO_VENDEDOR FOREIGN KEY (ID_FUNCIONARIO) REFERENCES VENDEDOR(IDFUNCIONARIO) ON DELETE SET NULL ON UPDATE CASCADE
);

/* Criando a tabela CELULAR */
CREATE TABLE CELULAR (
    NUMERO_SERIE VARCHAR(50) PRIMARY KEY,
    NOME_MODELO VARCHAR(50) NOT NULL,
    IDPEDIDO INT NULL,

    CONSTRAINT FK_CELULAR_MODELO FOREIGN KEY (NOME_MODELO) REFERENCES MODELO(NOME) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_CELULAR_PEDIDO FOREIGN KEY (IDPEDIDO) REFERENCES PEDIDO(IDPEDIDO) ON DELETE SET NULL ON UPDATE CASCADE
);

/* Criando a tabela PEÇA */
CREATE TABLE PECA (
    IDPECA INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    QUANTIDADE INT NOT NULL CHECK (QUANTIDADE >= 0),
    NOME_MODELO VARCHAR(50) NOT NULL,

    CONSTRAINT FK_PECA_MODELO FOREIGN KEY (NOME_MODELO) REFERENCES MODELO(NOME) ON DELETE SET NULL
);

/* Criando a tabela SOLICITACAO */
CREATE TABLE SOLICITACAO(
    CODIGO INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    DESCRICAO VARCHAR(300) NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    STATUS VARCHAR(14) NOT NULL CHECK (STATUS IN ('ABERTO', 'EM ANDAMENTO', 'CONCLUIDO', 'CANCELADO')),
    ID_CLIENTE INT NOT NULL,
    ID_SUPORTE INT NOT NULL,
    NUMERO_SERIE VARCHAR(50) NOT NULL,
	NOME_MODELO VARCHAR(50) NOT NULL,

    CONSTRAINT FK_SOLICITACAO_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_SOLICITACAO_SUPORTE FOREIGN KEY (ID_SUPORTE) REFERENCES FUNCIONARIO(IDFUNCIONARIO) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_SOLICITACAO_CELULAR FOREIGN KEY (NUMERO_SERIE) REFERENCES CELULAR(NUMERO_SERIE) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_SOLICITACAO_MODELO FOREIGN KEY (NOME_MODELO) REFERENCES MODELO(NOME) ON DELETE CASCADE ON UPDATE CASCADE

);

ALTER SEQUENCE cliente_idcliente_seq RESTART WITH 1;