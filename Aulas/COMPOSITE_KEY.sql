USE [Curso]

DROP TABLE [dbo].[Aluno]

CREATE TABLE [dbo].[Aluno]
(

    [Id] INT NOT NULL,   
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(80) NOT NULL,
    [Nascimento] DATE NULL,
    [Active] BIT NOT NULL DEFAULT 0,

    CONSTRAINT [PK_Aluno] PRIMARY KEY ([Id]),
    CONSTRAINT [UQ_Aluno_Email] UNIQUE ([Email]),   
)
GO

DROP TABLE [dbo].[Curso]    

CREATE TABLE [dbo].[Curso]
(
    [Id] INT NOT NULL,   
    [Nome] NVARCHAR(80) NOT NULL,
    [CategoriaId] INT NOT NULL,  -- CHAVE ESTRANGEIRA: criei uma coluna para armazenar o id da categoria

    CONSTRAINT [PK_Curso] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY ([CategoriaId]) 
        REFERENCES [dbo].[Categoria]([Id])  -- CHAVE ESTRANGEIRA
)
GO


DROP TABLE [dbo].[ProgressoCurso]

CREATE TABLE [dbo].[ProgressoCurso]
(  
    [AlunoId] INT NOT NULL,
    [CursoId] INT NOT NULL,
    [Progress] INT NOT NULL,
    [UltimaAtualizacao] DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT PK_ProgrssoCurso PRIMARY KEY ([AlunoId], [CursoId]),  -- CHAV PRIMARIA COMPOSTA
    )
GO


DROP TABLE [dbo].[Categoria]

CREATE TABLE [dbo].[Categoria]
(  
    [Id] INT NOT NULL,
    [Nome] NVARCHAR(80) NOT NULL,

    CONSTRAINT PK_Categoria PRIMARY KEY ([Id])  -- CHAVE PRIMARIA
)
GO