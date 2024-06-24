CREATE TABLE [dbo].[Pessoa]
(

    [Id] INT NOT NULL UNIQUE,
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(80) NOT NULL UNIQUE,
    [Nascimento] DATE DEFAULT GETDATE(),
    [Active] BIT,
)
GO