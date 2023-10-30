-- criação de novo banco de dados
CREATE DATABASE novaConst;

-- utilizar o comando
USE novaConst;

-- criar tabela funcionario
CREATE TABLE funcionario (
	codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR (50) NOT NULL,
	sobrenome VARCHAR (50) NOT NULL,
	dataNascimento DATETIME NOT NULL,
	codeEstado CHAR (2) NOT NULL,
	salario DECIMAL (10,2) NOT NULL,
	siglaDepartamento CHAR (3) NOT NULL
);

-- criar tabela departamento
CREATE TABLE departamento (
	siglaDepartamento CHAR (3) NOT NULL PRIMARY KEY,
    codigoGerente INT,
	nomeDepartamento VARCHAR (100) NOT NULL,
	andar int NOT NULL
);

-- fazer a ligação do codigo do funcionario ao gerente
ALTER TABLE departamento
ADD FOREIGN KEY (codigoGerente) REFERENCES funcionario (codigo);

ALTER TABLE funcionario
ADD FOREIGN KEY (siglaDepartamento) REFERENCES departamento (siglaDepartamento);

-- incluir gerente aos seus departamentos
INSERT INTO departamento (siglaDepartamento, codigoGerente, nomeDepartamento, andar) VALUES
	('MKT', NULL, 'Marketing', 3),
    ('VND', NULL, 'Vendas', 2),
    ('SAC', NULL, 'Atendimento ao Cliente', 6),
    ('SUP', NULL, 'Suprimentos', 1),
    ('FIN', NULL, 'Financeiro', 4),
    ('NNG', NULL, 'Novos Negocios', 5);

-- inserir dados dos funcionarios 
INSERT INTO funcionario (nome, sobrenome, DataNascimento, codeEstado, salario, SiglaDepartamento ) VALUES 
	('Lucia', 'Andrade', '1987-02-19', 'RJ', 5000.00, 'VND'),
	('Amanda', 'Silva', '1962-05-30', 'SP', 5000.00, 'VND'),
	('Gilberto', 'Santos', '1979-05-25', 'RN', 5000.00, 'VND'),
	('Cassio', 'Amaral', '1955-03-14', 'CE', 5000.00, 'VND'),
	('Lidia', 'Couto', '1988-07-02', 'SP', 5000.00, 'VND'),
	('Bruna', 'Oliveira', '1962-05-30', 'SP', 4200.00, 'SAC'),
	('Pedro', 'Santos', '1978-03-18', 'RS', 3690.00, 'SAC'),
	('Katia', 'Menezes', '1990-01-01', 'SP', 2590.00, 'SAC'),
	('Luciana', 'Guimarães', '1987-09-19', 'RJ', 5000.00, 'MKT'),
	('Daiane', 'Santos', '1962-05-30', 'SC', 2700.00, 'MKT'),
	('Gilberto', 'Costa', '1979-08-26', 'RN', 3700.00, 'SUP'),
	('Cassio', 'Soares', '1995-09-14', 'SP', 5300.00, 'SUP'),
	('Hugo', 'Alves', '1978-03-02', 'CE', 2500.00, 'FIN'),
	('Bianca', 'Barbosa', '1977-01-30', 'AC', 6900.00, 'FIN'),
	('Paulo', 'Jorge', '1969-01-05', 'RJ', 5200.00, 'FIN'),
	('Kim', 'Park', '1962-05-30', 'SC', 4900.00, 'FIN'),
	('Natasha', 'Sampaio', '1962-05-30', 'RN', 3700.00, 'NNG');
    
-- listar funcionarios por nome e sobrenome 
SELECT * FROM funcionario;
SELECT nome, sobrenome FROM funcionario;

-- salario inferior dos funcionarios de VND para atualização dos 5k
UPDATE funcionario SET salario = '2500' WHERE codigo = 1;

-- atualização do salario do funcionario 2
UPDATE funcionario SET salario = '4900' WHERE codigo = 2;

-- atualização do salario do funcionario 3
UPDATE funcionario SET salario = '3550' WHERE codigo = 3;

-- atualização do salario do funcionario 4
UPDATE funcionario SET salario = '4720' WHERE codigo = 4;

-- atualização do salario do funcionario 5
UPDATE funcionario SET salario = '2880' WHERE codigo = 5;

-- verificar dados dos funcionarios de vendas
SELECT * FROM funcionario WHERE SiglaDepartamento = 'VND';

-- funcionarios com salario superior a 5000 do departamento vendas
UPDATE funcionario SET salario = 5000.00 WHERE SiglaDepartamento = 'VND';

-- funcionarios de SP
SELECT * FROM funcionario WHERE codeEstado = 'SP';

-- nome dos funcionarios com salarios superior a 3000 errado
SELECT nome FROM funcionario WHERE salario > 3000;

-- nome dos funcionarios com salarios superior a 3000 certo
SELECT * FROM funcionario WHERE salario > 3000 ORDER BY nome;

-- atualização dos dados fora do exercicio 
UPDATE funcionario SET Nome = 'Natasha' WHERE codigo = 17;

-- atualização dos dados do funcionario 13
UPDATE funcionario SET Nome = 'Hugo' WHERE codigo = 13;

-- atualização dos dados do funcionario 14
UPDATE funcionario SET Nome = 'Bianca' WHERE codigo = 14;

-- atualização dos dados do funcionario 15
UPDATE funcionario SET Nome = 'Paulo', sobrenome = 'Jorge' WHERE codigo = 15;

-- atualização dos dados do funcionario 11
UPDATE funcionario SET Nome = 'Matteo', sobrenome = 'Aquino' WHERE codigo = 11;

-- atualização dos dados do funcionario 12
UPDATE funcionario SET Nome = 'Willian' WHERE codigo = 12;

-- atualização dos dados do funcionario 9
UPDATE funcionario SET Nome = 'Aurora', sobrenome = 'Bianchi' WHERE codigo = 9;

-- verificar nome e salario dos funcionarios 
SELECT nome, salario FROM funcionario;

-- atualização dos dados do funcionario 16
UPDATE funcionario SET salario = '4900' WHERE codigo = 16;

-- atualização dos dados do funcionario 15
UPDATE funcionario SET salario = '5200' WHERE codigo = 15;

-- atualização dos dados do funcionario 10
UPDATE funcionario SET salario = '2700' WHERE codigo = 10;

-- atualização dos dados do funcionario 13
UPDATE funcionario SET salario = '2500' WHERE codigo = 13;

-- 11.	Listar o nome e a data de nascimento dos funcionários ordenados do mais novo para o mais velho
SELECT nome, dataNascimento FROM funcionario ORDER BY dataNascimento DESC;

-- 12.	Listar o total da folha de pagamento da empresa
SELECT SUM(salario) AS TotalFolhaPagamento FROM funcionario;

-- 13.	Excluir do banco de dados um dos 4 funcionários do departamento de finanças, a sua escolha
DELETE FROM funcionario WHERE codigo = 26;

-- atualização de cadastro dos funcionarios 
INSERT INTO funcionario (nome, sobrenome, DataNascimento, codeEstado, salario, SiglaDepartamento ) VALUES 
	('Hugo', 'Alves', '1978-03-02', 'CE', 2500.00, 'FIN'),
	('Bianca', 'Barbosa', '1977-01-30', 'AC', 6900.00, 'FIN'),
	('Paulo', 'Jorge', '1969-01-05', 'RJ', 5200.00, 'FIN'),
	('Kim', 'Park', '1962-05-30', 'SC', 4900.00, 'FIN');

-- Listar a sigla e o nome de todos os departamentos, apresentando o nome de seus respectivos gerentes
SELECT d.siglaDepartamento, nomeDepartamento, nome AS gerente
FROM departamento AS d 
JOIN funcionario AS f ON d.codigoGerente = f.codigo;

-- VIEW COM A LISTA DE DEPARTAMENTOS E O NOME DE SEUS RESPECTIVOS GERENTES 
CREATE VIEW gerentesPorDepartamento AS 
SELECT d.siglaDepartamento, nomeDepartamento, nome AS gerente
FROM departamento AS d 
JOIN funcionario AS f ON d.codigoGerente = f.codigo;

-- VIEW COM NOME E ESTADO DOS FUNCIONARIOS COM SALARIO SUPERIOR A 3800.00 ORDENANDO POR ESTADO EM ORDEM DECRESCENTE
CREATE VIEW NomeEstado AS 
SELECT nome, codeEstado FROM funcionario WHERE salario > 3800
ORDER BY codeEstado DESC;

