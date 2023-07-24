-- Criação do Banco de Dados
CREATE DATABASE farmacia_db;

-- Utilização do Banco de Dados
USE farmacia_db;

-- Tabela: Produto
CREATE TABLE Produto (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    codigo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(100),
    fornecedor VARCHAR(100),
    preco DECIMAL(10,2) NOT NULL,
    data_validade DATE NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Tabela: Cliente
CREATE TABLE Cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(500),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_nascimento DATE,
    sexo ENUM('M', 'F', 'Outro'),
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Tabela: Venda
CREATE TABLE Venda (
    id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    forma_pagamento ENUM('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'Boleto'),
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: ItemVenda
CREATE TABLE ItemVenda (
    id INT NOT NULL AUTO_INCREMENT,
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (venda_id) REFERENCES Venda (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES Produto (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: Estoque
CREATE TABLE Estoque (
    id INT NOT NULL AUTO_INCREMENT,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    data_atualizacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (produto_id) REFERENCES Produto (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: Fornecedor
CREATE TABLE Fornecedor (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    endereco VARCHAR(500),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Tabela: Compra
CREATE TABLE Compra (
    id INT NOT NULL AUTO_INCREMENT,
    fornecedor_id INT NOT NULL,
    data_compra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    forma_pagamento ENUM('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'Boleto'),
    PRIMARY KEY (id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: ItemCompra
CREATE TABLE ItemCompra (
    id INT NOT NULL AUTO_INCREMENT,
    compra_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (compra_id) REFERENCES Compra (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES Produto (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: Funcionario
CREATE TABLE Funcionario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(500),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cargo VARCHAR(100),
    data_nascimento DATE,
    data_admissao DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Tabela: VendaFuncionario
CREATE TABLE VendaFuncionario (
    id INT NOT NULL AUTO_INCREMENT,
    venda_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    comissao DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (venda_id) REFERENCES Venda (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: Categoria
CREATE TABLE Categoria (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    PRIMARY KEY (id)
);

-- Tabela: ProdutoCategoria
CREATE TABLE ProdutoCategoria (
    id INT NOT NULL AUTO_INCREMENT,
    produto_id INT NOT NULL,
    categoria_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (produto_id) REFERENCES Produto (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES Categoria (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: FornecedorCategoria
CREATE TABLE FornecedorCategoria (
    id INT NOT NULL AUTO_INCREMENT,
    fornecedor_id INT NOT NULL,
    categoria_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES Categoria (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: Usuario
CREATE TABLE Usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(500),
    telefone VARCHAR(20),
    email VARCHAR(100),
    senha VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    PRIMARY KEY (id)
);
