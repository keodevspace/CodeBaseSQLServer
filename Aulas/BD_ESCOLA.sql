CREATE DATABASE Escola

USE [Escola]

CREATE TABLE [Alunos] (
    [AlunoID] INT PRIMARY KEY,
    [Nome] NVARCHAR(100) NOT NULL,
    [DataNascimento] DATE,
    [Email] NVARCHAR(100)
)
GO

CREATE TABLE [Cursos] (
    [CursoID] INT PRIMARY KEY,
    [Nome] NVARCHAR(100) NOT NULL,
    [Descricao] NVARCHAR(255),
    [Categoria] NVARCHAR(50)
)
GO

CREATE TABLE [Matriculas] (
    [AlunoID] INT,
    [CursoID] INT,
    [DataMatricula] DATE,
    PRIMARY KEY (AlunoID, CursoID),
    FOREIGN KEY ([AlunoID]) REFERENCES Alunos([AlunoID]),
    FOREIGN KEY ([CursoID]) REFERENCES Cursos([CursoID])
)
GO

-- Inserir Alunos
INSERT INTO [Alunos] ([AlunoID], [Nome], [DataNascimento], [Email])
VALUES (1, 'Maria Silva', '2000-05-15', 'maria@email.com'),
       (2, 'João Oliveira', '1999-09-20', 'joao@email.com'),
       (3, 'Ana Souza', '2001-03-10', 'ana@email.com');
GO

-- Inserir Cursos
INSERT INTO [Cursos] ([CursoID], [Nome], [Descricao], [Categoria])
VALUES (1, 'Introdução à Programação', 'Fundamentos básicos de programação', 'Informática'),
       (2, 'Matemática Financeira', 'Cálculos e aplicações financeiras', 'Economia'),
       (3, 'Inglês Avançado', 'Gramática e conversação avançada', 'Idiomas');
GO

-- Inserir Matrículas
INSERT INTO [Matriculas] ([AlunoID], [CursoID], [DataMatricula])
VALUES (1, 1, '2023-01-15'),
       (2, 2, '2023-02-20'),
       (3, 1, '2023-03-05'),
       (1, 3, '2023-03-10'),
       (2, 1, '2023-04-18');
GO

-- Verificar Alunos
SELECT * FROM Alunos;

-- Verificar Cursos
SELECT * FROM Cursos;

-- Verificar Matrículas
SELECT * FROM Matriculas;

