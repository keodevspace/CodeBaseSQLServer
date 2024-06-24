USE [Curso]

-- criei a tabela e esqueci de adicionar um campo
ALTER TABLE [dbo].[Aluno]
    ADD [Document] NVARCHAR(11)
  
-- quero excluir uma coluna
ALTER TABLE [dbo].[Aluno]
    DROP COLUMN [Document]

-- esse tb altera a tabela
ALTER TABLE [dbo].[Aluno]
    ALTER COLUMN [Document] CHAR(11)