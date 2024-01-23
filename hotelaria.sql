CREATE DATABASE Hotelaria;
USE Hotelaria;

CREATE TABLE Categoria(
	Codigo INT NOT NULL IDENTITY PRIMARY KEY,
	Descricao VARCHAR(50) NOT NULL,
	ValorDiaria INT NOT NULL
);

CREATE TABLE Produto(
	Codigo INT NOT NULL IDENTITY PRIMARY KEY,
	Descricao VARCHAR(50) NOT NULL,
	PrecoVenda INT NOT NULL,
	Estoque INT NOT NULL
);

CREATE TABLE Pessoa(
	Cpf VARCHAR(11) NOT NULL PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Cep VARCHAR(8) NOT NULL,
	Logradouro VARCHAR(50) NOT NULL,
	Numero INT NOT NULL,
	Bairro VARCHAR(50) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	Estado VARCHAR(50) NOT NULL
);

CREATE TABLE TelefonePessoa(
	Cpf VARCHAR(11) NOT NULL PRIMARY KEY,
	FOREIGN KEY(Cpf) REFERENCES Pessoa(Cpf),
	Ddi INT NOT NULL,
	Ddd INT NOT NULL,
	Telefone INT NOT NULL,
	NomeContato VARCHAR(50) NOT NULL,
	Descricao VARCHAR(50) NOT NULL
);

CREATE TABLE Cliente(
	Cpf VARCHAR(11) NOT NULL PRIMARY KEY,
	FOREIGN KEY(Cpf) REFERENCES Pessoa(Cpf),
	DataNascimento DATE
);

CREATE TABLE Funcionario(
	Cpf VARCHAR(11) NOT NULL PRIMARY KEY,
	FOREIGN KEY(Cpf) REFERENCES Pessoa(Cpf),
	DataEfetivacao DATE,
	CargaHorariaSemanal INT NOT NULL
);

CREATE TABLE EmailCliente(
	Cpf VARCHAR(11) NOT NULL PRIMARY KEY,
	FOREIGN KEY(Cpf) REFERENCES Pessoa(Cpf),
	Email VARCHAR(50) NOT NULL
);

CREATE TABLE Apartamento(
	Numero INT NOT NULL IDENTITY PRIMARY KEY,
	Status VARCHAR(50) NOT NULL,
	CodigoCategoria INT NOT NULL,
	FOREIGN KEY(CodigoCategoria) REFERENCES Categoria(Codigo)
);

CREATE TABLE Reserva(
	Codigo INT NOT NULL IDENTITY PRIMARY KEY,
	DataInicio DATE,
	DataPrevistaSaida DATE,
	NumeroApartamento INT NOT NULL,
	FOREIGN KEY(NumeroApartamento) REFERENCES Apartamento(Numero),
	CpfCliente VARCHAR(11) NOT NULL,
	FOREIGN KEY(CpfCliente) REFERENCES Cliente(Cpf),
	CpfFuncionario VARCHAR(11) NOT NULL,
	FOREIGN KEY(CpfFuncionario) REFERENCES Funcionario(Cpf)
);


CREATE TABLE Hospedagem(
	Codigo INT NOT NULL IDENTITY PRIMARY KEY,
	DataInicio DATE,
	DataTermino DATE,
	Status VARCHAR(50) NOT NULL,
	CodigoReserva INT NOT NULL,
	FOREIGN KEY(CodigoReserva) REFERENCES Reserva(Codigo),
	CpfFuncionarioAbertura VARCHAR(11) NOT NULL,
	FOREIGN KEY(CpfFuncionarioAbertura) REFERENCES Funcionario(Cpf),
	CpfFuncionarioEncerramento VARCHAR(11) NOT NULL,
	FOREIGN KEY(CpfFuncionarioEncerramento) REFERENCES Funcionario(Cpf),
	ValorTotal INT NOT NULL
);

CREATE TABLE Consumo(
	CodigoHospedagem INT NOT NULL,
	FOREIGN KEY(CodigoHospedagem) REFERENCES Hospedagem(Codigo),
	CodigoProduto INT NOT NULL,
	FOREIGN KEY(CodigoProduto) REFERENCES Produto(Codigo),
	Qtd INT NOT NULL,
	PrecoUnitario INT NOT NULL
);
