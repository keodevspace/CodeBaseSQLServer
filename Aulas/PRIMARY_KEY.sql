USE [Curso]

-- DROP TABLE [dbo].[Aluno]
CREATE TABLE [dbo].[Aluno]
(

    [Id] INT NOT NULL UNIQUE,
    -- garante que não vai ter 2 ids iguais
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(80) NOT NULL UNIQUE,
    [Nascimento] DATE DEFAULT GETDATE(),
    [Active] BIT,

    PRIMARY KEY ([Id], [Email])    
)
GO


-- ALTER TABLE [dbo].[Aluno]
-- DROP CONSTRAINT [PK_Aluno]