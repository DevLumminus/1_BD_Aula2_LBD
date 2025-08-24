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
		CONSTRAINT FK_CPF_Autor FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
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
		CONSTRAINT FK_CPF_Aluno	FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
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
);

/*
=========================
Criação do relacionamento "tem"
=========================
*/

CREATE TABLE Autor_Livro(
	Autor_ID INT NOT NULL,
	Livro_ISBN CHAR(13) NOT NULL,
    CONSTRAINT FK_Autor_Livro PRIMARY KEY (Autor_ID, Livro_ISBN), -- Obriga ao par Autor/Livro só aparecer 1 vez
    CONSTRAINT FK_AutorID
		FOREIGN KEY (Autor_ID) REFERENCES Autor(ID)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT FK_LivroISBN
		FOREIGN KEY (Livro_ISBN) REFERENCES Livro(ISBN)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

/*
=========================
Criação do Objeto Emprestimo e Relacionamento Registra
=========================
*/

CREATE TABLE Empréstimo(
	ID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN_Livro CHAR(13) NOT NULL,
		CONSTRAINT FK_ISBN_Livro FOREIGN KEY (ISBN_Livro) REFERENCES Livro(ISBN)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
    Matricula_Aluno INT NOT NULL,
		CONSTRAINT FK_Matricula	FOREIGN KEY (Matricula_Aluno) REFERENCES Aluno(Matricula)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
    DataEmprestimo DATE NOT NULL,
    DataEDevolução DATE NOT NULL
);

/*
=========================
Criação da tabela Curso
=========================
*/

CREATE TABLE Curso(
	Código_Curso INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(200) NOT NULL
);

/*
=========================
Criação da tabela Turma
=========================
*/

CREATE TABLE Turma(
	Código_Turma INT AUTO_INCREMENT PRIMARY KEY,
    Semestre INT NOT NULL
);

/*
=========================
Criação do relacionamento "tem"
=========================
*/

CREATE TABLE Cursa(
	Matricula_Aluno INT NOT NULL DEFAULT 0,
	Código_Curso INT NOT NULL DEFAULT 0,
	Código_Turma INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Cursando PRIMARY KEY (Matricula_Aluno, Código_Curso, Código_Turma),
    CONSTRAINT FK_Matricula_Aluno
		FOREIGN KEY (Matricula_Aluno) REFERENCES Aluno(Matricula)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
    CONSTRAINT FK_Código_Curso
		FOREIGN KEY (Código_Curso) REFERENCES Curso(Código_Curso)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT FK_Código_Turma
		FOREIGN KEY (Código_Turma) REFERENCES Turma(Código_Turma)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);