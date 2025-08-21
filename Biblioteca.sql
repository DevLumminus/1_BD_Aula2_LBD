CREATE DATABASE IF NOT EXISTS  Biblioteca; -- Criação do BD
USE Biblioteca; -- Aplicação no banco de dados criado

/*
==========================
Criação da tabela Pessoa
==========================
*/

CREATE TABLE Pessoa(
	CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(200) NOT NULL,
    Data_Nascimento DATE
);

/*
==========================
Criação da tabela Autor
==========================
*/

CREATE TABLE Autor(
	ID INT AUTO_INCREMENT PRIMARY KEY,
    CPF CHAR NOT NULL,
    CONSTRAINT FK_CPF_Autor
    FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

/*
==========================
Criação da tabela Aluno
==========================
*/

CREATE TABLE Aluno(
	Matricula INT AUTO_INCREMENT PRIMARY KEY,
    Entrada DATE NOT NULL,
    Ativo BOOLEAN NOT NULL,
    CPF CHAR NOT NULL,
    CONSTRAINT FK_CPF_Aluno
    FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

/*
=========================
Criação da tabela Livro
=========================
*/

CREATE TABLE Livro(
	ISBN CHAR(13) PRIMARY KEY,
    Título VARCHAR(250) NOT NULL,
    Ano YEAR,
    Editora VARCHAR(250) NOT NULL
    /*
    CONSTRAINT FK_CPF_Aluno
    FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    */
);

/*
=========================
Criação do relacionamento "tem"
=========================
*/

CREATE TABLE Autor_Livro(
	Autor_ID INT,
	Livro_ISBN CHAR,
    CONSTRAINT FK_CPF_Aluno
    FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);