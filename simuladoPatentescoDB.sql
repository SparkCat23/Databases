use alunos_fit;
go
-- EX 2
CREATE TABLE Pessoa646(
	ID int not null,
	nome varchar(30) not null,
	idade tinyint not null,
	IDParente int not null,
	CONSTRAINT pkPessoa PRIMARY KEY (ID),
	CONSTRAINT chkIdade CHECK (idade > 0),
	CONSTRAINT fkParente FOREIGN KEY (IDParente) REFERENCES Pessoa646(ID)
);
GO
-- EX 3
INSERT INTO Pessoa646(ID, nome, idade) VALUES (1,'Pedro',77)
INSERT INTO Pessoa646(ID, nome, idade, IDParente) VALUES (2,'Maria',41,1)
INSERT INTO Pessoa646(ID, nome, idade, IDParente) VALUES (3,'Felipe',16,2)
GO
-- EX 4
DELETE FROM Pessoa646 WHERE nome ='Felipe';
DELETE FROM Pessoa646 WHERE nome ='Maria';
GO
-- EX 6
ALTER TABLE Pessoa646 DROP CONSTRAINT fkParente;
ALTER TABLE Pessoa646 DROP COLUMN IDParente;
GO

CREATE TABLE Parentesco646(
	ID1 int not null,
	ID2 int not null,
	parentesco varchar(MAX) not null,
	CONSTRAINT pkParent PRIMARY KEY (ID1,ID2),
	CONSTRAINT fkParent1 FOREIGN KEY (ID1) REFERENCES Pessoa646(ID),
	CONSTRAINT fkParent2 FOREIGN KEY (ID2) REFERENCES Pessoa646(ID),
);
GO
-- EX 7
INSERT INTO Pessoa646 VALUES(2,'Joana',75);
INSERT INTO Pessoa646 VALUES(3,'Maria',41);
SELECT * FROM Pessoa646;
GO

INSERT INTO Parentesco646 VALUES(1,2,'Casado(a)');
INSERT INTO Parentesco646 VALUES(1,3,'Pai');
INSERT INTO Parentesco646 VALUES(2,3,'Mãe');
GO
-- EX 8
UPDATE Pessoa646
SET idade = 78 WHERE ID = 1;
UPDATE Pessoa646
SET idade = 76 WHERE ID = 2;
UPDATE Pessoa646
SET idade = 42 WHERE ID = 3;
SELECT * FROM Pessoa646;
GO
--EX 10
ALTER TABLE Pessoa646 ADD dataNasc DATE;
GO
ALTER TABLE Pessoa646 DROP CONSTRAINT chkIdade;
GO
ALTER TABLE Pessoa646 ALTER COLUMN idade INT null;
GO
ALTER TABLE Pessoa646 ADD CONSTRAINT chkIdade CHECK (idade > 0)
GO
-- EX 11
INSERT INTO Pessoa646(ID,nome,dataNasc) VALUES(4,'Felipe','19950221');
GO
INSERT INTO Parentesco646 VALUES(2,4,'Mãe');
GO

UPDATE Pessoa646 
SET idade = DATEDIFF(YEAR, dataNasc, GETDATE())
WHERE ID = 4;
GO
SELECT * FROM Pessoa646;
SELECT * FROM Parentesco646;
-- OBS: Eu pesquisei e achei mais interessante utilizar o DATEDIFF. Espero que isso não influencie muito.
--EX 12
UPDATE Parentesco646
SET parentesco = 'filho adotivo com guarda provisória segundo lei #63459/3'
WHERE ID2 = 4;
GO
--EX 13
DROP TABLE Parentesco646;
DROP TABLE Pessoa646;