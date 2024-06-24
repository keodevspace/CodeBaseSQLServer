# CodebaseSQLServer

[Link de Instalações](https://balta.io/player/assistir/cae580e7-d215-4d08-9414-fe988713cc97)
[Link do GitHub](https://github.com/balta-io/2805)
[Link do Curso](https://balta.io/player/assistir/cae580e7-d215-4d08-9414-fe988713cc97)
[Artigo: SQL Server Docker](https://balta.io/blog/sql-server-docker)

Requisitos:
[[Fundamentos de CSharp]]
[[Fundamentos da OO]]

👾
✔️

### 👾Introdução👾
Docker - servidor que roda dentro da nossa máquina
Verificar o link #intalações que são requisitos
Opcional: verificar artigo Windows Terminal do Balta

### 👾Ferramentas 👾
✔️ docker rodando
✔️ azure data studo
✔️ .net sdk
✔️ wsl
✔️ sql server

Connection String
- Faz a conexão com o BD	``Server=localhost,1433;Database=balta;User ID=sa;Password=1q2w3e4r@#$

### 👾Create Database 👾
- Criar sempre na master
- Cria o bd com configs padrão
- Se for um banco grande, fazer com DBA
````
CREATE DATABASE [CURSO]
// run para executar

6:02:27 PM
Started executing query at Line 1
Commands completed successfully.
Total execution time: 00:00:00.287
````
![[Pasted image 20240619180619.png]]
- MANAGE -> mostra mais opções do banco criado
- Para EXCLUIR esse banco vou usar: DROP DATEBASE 
````
CREATE DATABASE [CURSO]
// run para executar
// cria o banco

DROP DATABASE [CURSO]
// deleta o banco

6:02:27 PM
Started executing query at Line 1
Commands completed successfully.
Total execution time: 00:00:00.287
````
- SCRIPT PARA DROP: https://github.com/balta-io/2805/blob/master/drop_database.sql

### 👾Create Table 👾
- Garantindo que eu estou no bd certo:
````
USE [Curso]
````
- -- inserindo tabela ou schemas
- NoSQL não tem schemas
- GO -> toda vez que eu salvo no banco, se eu tenho o GO no final da linha, ele vai inserindo conforme eu salvo
````
USE [Curso]  

-- inserindo tabela ou schemas
CREATE TABLE [Aluno] (

    [Id] INT, -- coluna tipo int
    [Nome] NVARCHAR(80),
    [Nascimento] DATETIME,
    [Active] BIT    
)
GO
````
- CHAR -> Nº FIXO DE CARACTERES
- VARCHAR -> VARIOS
- NVARCHAR -> MUITOS
- BIT -> salva 0 ou 1, true ou false

### 👾Alter / Drop Table👾
````
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
````
![[Pasted image 20240619190714.png]]

### 👾Constraints - Not Null e Unique👾
````
USE [Curso]  

CREATE TABLE [dbo].[Pessoa]
(

    [Id] INT NOT NULL UNIQUE,   -- garante que não vai ter 2 ids iguais
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(80) NOT NULL UNIQUE,
    [Nascimento] DATE DEFAULT GETDATE(),
    [Active] BIT,
	  
	PRIMARY KEY ([Id])  -- chave primária
)
GO
````
### 👾Primary Key👾
![[Pasted image 20240619193601.png]]
````
USE [Curso]  

CREATE TABLE [dbo].[Pessoa]
(

    [Id] INT NOT NULL UNIQUE,   -- garante que não vai ter 2 ids iguais
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(80) NOT NULL UNIQUE,
    [Nascimento] DATE DEFAULT GETDATE(),
    [Active] BIT,
	  
	PRIMARY KEY ([Id])  -- chave primária
)
GO
````
- Primary Key é muito usado para as tabelas associativas nos BD Relacionais

### 👾Composite Key👾
- TABELA ASSOCIATIVA
	- tabela que existe para associar outras tabelas
- PK - Chave Primária: É como o número de identidade único para cada linha em uma tabela.   
- FK - Chave Estrangeira: É como um link para a chave primária de outra tabela, ajudando a conectar as duas tabelas.

A tabela `Alunos` pode ter as seguintes colunas:
- `Id` (Chave Primária): um número único para cada aluno. Por exemplo, João pode ter o Id 1, Maria o Id 2, etc.
- `Nome`: o nome do aluno.

A tabela `Cursos` pode ter as seguintes colunas:
- `Id` (Chave Primária): um número único para cada curso. Por exemplo, Matemática pode ter o Id 1, Português o Id 2, etc.
- `Nome`: o nome do curso.

Agora, digamos que queremos saber qual aluno está matriculado em qual curso. 
Para isso, criamos uma terceira tabela chamada `Matriculas` com as seguintes colunas:
- `AlunoId` (Chave Estrangeira): este é o Id do aluno na tabela `Alunos`. Ele nos diz qual aluno está matriculado.
- `CursoId` (Chave Estrangeira): este é o Id do curso na tabela `Cursos`. Ele nos diz em qual curso o aluno está matriculado.

Então, se tivermos uma linha na tabela `Matriculas` com `AlunoId` 1 e `CursoId` 2, isso significa que o aluno com Id 1 (João) está matriculado no curso com Id 2 (Português).

Se isso fosse uma tabela, tipo excel, seria como:
A tabela `Alunos` seria assim:

|Id|Nome|
|---|---|
|1|João|
|2|Maria|

A tabela `Cursos` seria assim:

|Id|Nome|
|---|---|
|1|Matemática|
|2|Português|
E a tabela `Matriculas` seria assim:

|AlunoId|CursoId|
|---|---|
|1|2|
|2|1|
Na tabela `Matriculas`, a linha com `AlunoId` 1 e `CursoId` 2 significa que o aluno João (Id 1 na tabela `Alunos`) está matriculado no curso de Português (Id 2 na tabela `Cursos`). A linha com `AlunoId` 2 e `CursoId` 1 significa que a aluna Maria (Id 2 na tabela `Alunos`) está matriculada no curso de Matemática (Id 1 na tabela `Cursos`).

### 👾Índices👾
Melhora a performance de consultas ao criar estruturas de dados adicionais para acesso rápido às colunas específicas.
- Usar nos campos que mais uso
`CREATE INDEX IDX_NomeAluno ON Alunos(Nome);`

![[Pasted image 20240620190137.png]]

### 👾Identity👾
Cria uma coluna autoincrementável, útil para gerar automaticamente valores únicos para chaves primárias.
- Se eu colocar (1,1), ele vai incrementando em 1, 2, 3...
- Gera o próximo baseado no último item criado
- UNIQUEIDENTIFIER tb pode ser usado
````
CREATE TABLE Alunos (     
	AlunoID INT IDENTITY(1,1) PRIMARY KEY,     
	Nome NVARCHAR(100) NOT NULL,     
	DataNascimento DATE,     
	Email NVARCHAR(100) 
);
GO
	
INSERT INTO Alunos (Nome, DataNascimento, Email) 
	VALUES ('Maria Silva', '2000-05-15', 'maria@email.com');
````

### 👾Insert👾
Insere dados nas tabelas para registrar novos alunos e cursos.
- Tenho que passar os calores
````
INSERT INTO Alunos (AlunoID, Nome, DataNascimento, Email) 
	VALUES (1, 'Maria Silva', '2000-05-15', 'maria@email.com');
```` 
![[Pasted image 20240620191256.png]]
![[Pasted image 20240620191317.png]]

### 👾Select👾
Recupera dados das tabelas para visualização ou análise.
`SELECT * FROM Alunos;`
![[Pasted image 20240620191447.png]]
 - SEMPRE executar o SELECT TOP se o banco for muito grande
	 - SELECT TOP 2...
- O * é para pegar tudo, mas posso usar campos específicos na busca
	![[Pasted image 20240620191717.png]]
- DISTINCT
	- Usado pra diferenciar
	- ![[Pasted image 20240620191852.png]]
- 

### 👾Queries👾
Conjunto de instruções SQL para manipular dados, incluindo seleção, inserção, atualização e exclusão.
- =
- !=
- >=
- <=
- >
- <
- AND
- OR
- IS NOT NULL
- IS NULL
![[Pasted image 20240620192405.png]]

### 👾Order By👾
Ordena os resultados de uma consulta baseado em uma ou mais colunas.
- ASC -> a-z
- DESC ->z-a
![[Pasted image 20240620192538.png]]

### 👾Update👾
Atualiza dados existentes em uma tabela.
- SEMPRE INICIAR COM 
	- BEGIN TRANSACTION
- FECHAR COM
	- ROLLBACK
Para evitar que eu envie cagadas de primeira, testo antes
````
SELECT * FROM [Categoria]

BEGIN TRANSACTION
	UPDATE
		[Categoria]
	SET
		[Nome] = 'Frontend'
	WHERE
		[Id] = 1
ROLLBACK

-- se o resultado for uma linha afetada, aí faço o update
-- trocar ROLLBACK por COMMIT
````
![[Pasted image 20240620193554.png]]

### 👾Delete👾
Remove registros de uma tabela.
- Mesmo processo do update
````
SELECT * FROM [Categoria]

BEGIN TRANSACTION
	DELETE FROM
		[Curso]
	WHERE
		[CategoriaId] = 3
ROLLBACK

-- se o resultado for uma linha afetada, aí faço o update
-- trocar ROLLBACK por COMMIT
````

### 👾MIN, MAX e Count👾
Funções de agregação para calcular valores em conjuntos de dados.
````
SELECT TOP 100
	MIN([Id]) -- evitar usar **
	MAX([Id])
	COUNT([Id])
	AVG([Id]) -- media
	SUM([Id])
FROM
	[Categoria]
````
### 👾Like👾
Filtra registros baseado em padrões de texto.
````
SELECT TOP 100
	**
FROM
	[Curso]
WHERE
	[Nome] = 'Fundamentos'  --ele não vai achar pq busca exatamente a palavra
	[Nome] LIKE '%Fundamentos%' -- vai funcionar 
	
	-- %começa/termina com 
	-- % % contém
````
### 👾In, Between👾
Filtros que permitem verificar se um valor está em um conjunto específico ou dentro de um intervalo.
````
SELECT TOP 100
	*
FROM
	[Curso]
WHERE
	[Id] IN (1,3) --todos os cursos cujo id tá entre 1 e 3
	[Id] IN (SELECT [Id] FROM] [Categoria])
	[Id] BETWEEN 2 AND 3
	[Id] BETWEEN 2024-06/21 AND 2024-06-31	
````

### 👾Alias👾
Fornece nomes alternativos para colunas ou tabelas em uma consulta.
````
SELECT TOP 100
	[Id] AS [Codigo]  -- pra não dar conflitos entre os ids das tabelas
	COUNT(Id]) AS [Total]	
````
### 👾Joins👾
Combina informações de múltiplas tabelas com base em uma condição relacionada.
````
SELECT TOP 100
	[Curso].[Id],  -- para mostrar os dados de forma mais clara no output
	[Curso].[Nome],
	[Categoria].[Id] AS [Categoria],
	[Categoria].[Nome]
FROM
	[Curso]     
	INNER JOIN [Categoria] 
		ON [Curso].[CategoriaId] = [Categoria].[Id]  
		
-- quero fazer join em outras tabelas
	INNER JOIN [NomeTabela] 
		ON [Curso].[CategoriaId] = [Categoria].[Id]
	
	-- quando preciso fazer junção de tabelas
	-- quero juntar tudo que esteja em Curso que tenha Categoria
	-- on eu digo  como é a junção
	-- inner join é a intersecção de tudo que tem em curso e categora
````
![[Pasted image 20240621110922.png]] como sai sem usar especificação dos dados no select, apnas *
![[Pasted image 20240621111245.png]] como aparece qdo uso especificações no select, igual ex acima

### 👾Leff / Right / Full Join👾
Retorna todos os registros da tabela à esquerda e os registros correspondentes da tabela à direita (se houver).
````
FROM
	[Curso] 
	LEFT JOIN [NomeTabela] 
		ON [Curso].[CategoriaId] = [Categoria].[Id]

-- pega tudo da primeira tabela à esquerda(Cursos)
-- se a Categoria não existisse, retornaria NULL
-- inner join só pega o que tem na intersecção, ou seja, só os cursos que tem categoria


FROM
	[Curso] 
	RIGHT JOIN [NomeTabela] 
		ON [Curso].[CategoriaId] = [Categoria].[Id]

-- pega tudo da segunda tabela à direita (Categoria)
-- se o Curso não existisse, mas tiver Categoria, ele retorna 


FROM
	[Curso] 
	FULL JOIN [NomeTabela] 
		ON [Curso].[CategoriaId] = [Categoria].[Id]

-- pega tudo da primeira e segunda tabela (Curso e Categoria)


FROM
	[Curso] 
	FULL OUTER JOIN [NomeTabela] 
		ON [Curso].[CategoriaId] = [Categoria].[Id]

-- mesma coisa do FULL
````
### 👾Union👾
Combina os resultados de duas ou mais consultas em um único conjunto de resultados.
- Join as infos estão relacionadas
- Union não necessariamente as infos estão relacionadas
````
SELECT TOP 100
	*  -- tem que ter dados similares
FROM
	[Curso]  

UNION  -- UNION ALL vai evitar o que tem de duplicado = SELECT DISTINCT
	
SELECT TOP 100
	*
FROM
	[Curso] 
````
### 👾Group By👾
Agrupa linhas que têm o mesmo valor em uma ou mais colunas.
- Quero saber quantos cursos tem nas categorias
- Vou agrupar por categorias
````
SELECT TOP 100
	*	  
FROM
	[Categoria]  
		INNER JOIN [Cursos] ON [Cursos].[CategoriaId] = [Categoria].[Id]
````
![[Pasted image 20240621112905.png]]
````
SELECT TOP 100
	[Categoria].[Nome],  --tem que obrigatoriamente colocar no gourp by tb
	COUNT ([Cursos]).([Categoria]) 
		  
FROM
	[Categoria]  
		INNER JOIN [Cursos] ON [Cursos].[CategoriaId] = [Categoria].[Id]
GROUP BY
	[Cursos].[Nome],
	[Cursos].[CategoriaId]
````
![[Pasted image 20240621113251.png]]
### 👾Having👾
Filtra os resultados de uma consulta `GROUP BY` com base em uma condição específica.
- Agora que saber todas as categorias que tem mais de 1 curso
- HAVING = CONTENDO
- ![[Pasted image 20240621113729.png]]
````
SELECT TOP 100
	[Categoria].[Nome],  
	COUNT ([Cursos]).([Categoria])
		  
FROM
	[Categoria]  
		INNER JOIN [Cursos] ON [Cursos].[CategoriaId] = [Categoria].[Id]		
GROUP BY
	[Cursos].[Nome],
	[Cursos].[CategoriaId]

HAVING
	COUNT ([Cursos]).([Categoria]) > 1	
	
	-- TODAS AS CATEGORIAS QUE TEM MAIS DE 1 CURSO
````

### 👾Views👾
Consulta armazenada como um objeto virtual que pode ser referenciado como uma tabela.
- View pe uma foto de um SELECT que a gente fez
- CREATE OR ALTER VIEW nomeDaView AS
````
CREATE OR ALTER VIEW  vwContagemCursosPorCategoria  AS

	SELECT TOP 100
		[Categoria].[Nome],  
		COUNT ([Cursos]).([Categoria])
			  
	FROM
		[Categoria]  
		INNER JOIN [Cursos] ON [Cursos].[CategoriaId] = [Categoria].[Id]		
	GROUP BY
		[Cursos].[Nome],
		[Cursos].[CategoriaId]
	
	HAVING
		COUNT ([Cursos]).([Categoria]) > 1	
````

- Depois da view criada, eu posso fazer um select nela
	- Vai executar exatamente o SELECT que eu montei =)
	- A vantagem é que agora eu posso executar um WHERE
```
SELECT * FROM  vwContagemCursosPorCategoria
WHERE Nome = 'Backend'
````
### 👾Stored Procedures👾
- Procedimentos armazenados no banco de dados para execução repetida.
````
CREATE OR ALTER PROCEDURE [spListaCursos] AS 
	SELECT * FROM [Curso]
````

- Posso então executar a sp
````
EXEC [spListaCurso]
````
### 👾Variáveis👾
Variáveis são usadas para armazenar valores temporários dentro de um bloco de código SQL.
- Recomendado não colocar regras de negócio na sp
- Mesma coisa de criar variáveis no c#
````
CREATE OR ALTER PROCEDURE [spListaCursos] AS 

	DECLARE @CategoriaId INT  -- declarei uma variável
	SET @CategoriaId = 9
	SET @CategoriaId = (SELECT TOP 1 [Id] FROM [Categoria] WHERE [Nome] = 'Backend' )
	
	SELECT * FROM [Curso] WHERE [CategoriaId] = @CategoriaId
````


