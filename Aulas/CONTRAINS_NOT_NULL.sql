USE [Curso]

CREATE TABLE [dbo].[Pessoa]
(
    [Id] INT NOT NULL,    
    [Nome] NVARCHAR(80) NOT NULL,
    [Nascimento] DATETIME DEFAULT GETDATE(),
    [Active] BIT,
)
GO



