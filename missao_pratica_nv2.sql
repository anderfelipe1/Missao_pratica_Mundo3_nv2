CREATE TABLE PessoaJuridica (
  idPessoa INT  NOT NULL   IDENTITY ,
  cnpj CHAR(14)      ,
PRIMARY KEY(idPessoa));
GO




-- Tabela Pessoa
CREATE TABLE Pessoa (
  idPessoa INT NOT NULL IDENTITY,
  nome VARCHAR(100) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  telefone VARCHAR(255),
  email VARCHAR(255),
  PRIMARY KEY(idPessoa)
);
GO

-- Tabela PessoaFisica
CREATE TABLE PessoaFisica (
  idPessoa INT NOT NULL,
  cpf CHAR(11),
  PRIMARY KEY(idPessoa),
  FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa)
);
GO

-- Tabela Usuario
CREATE TABLE Usuario (
  idUsuario INT NOT NULL IDENTITY,
  nome VARCHAR(100),
  login VARCHAR(50),
  senha VARCHAR(50),
  PRIMARY KEY(idUsuario)
);
GO

-- Tabela Produto
CREATE TABLE Produto (
  idProduto INT NOT NULL IDENTITY,
  nome VARCHAR(255),
  quantidade INT,
  precoVenda DECIMAL(10, 2),
  PRIMARY KEY(idProduto)
);
GO

-- Tabela Compra
CREATE TABLE Compra (
  idCompra INT NOT NULL IDENTITY,
  idUsuario INT,
  idPessoa INT,
  idProduto INT,
  quantidade INT,
  preco_unitario DECIMAL(10, 2),
  data_compra DATETIME,
  PRIMARY KEY(idCompra),
  FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario),
  FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa),
  FOREIGN KEY(idProduto) REFERENCES Produto(idProduto)
);
GO

-- Tabela Movimento (opcional, precisa de função clara)
CREATE TABLE Movimento (
  idMovimento INT NOT NULL IDENTITY,
  idCompra INT,
  idUsuario INT,
  PRIMARY KEY(idMovimento),
  FOREIGN KEY(idCompra) REFERENCES Compra(idCompra),
  FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario)
);
GO

