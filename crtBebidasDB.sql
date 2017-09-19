USE alunos_fit;
GO

CREATE TABLE venda646(
	idBebida INT not null,
	dataVenda DATE not null,
	quantidade INT not null,
	CONSTRAINT pkVenda PRIMARY KEY(idBebida)
);
GO
CREATE TABLE medida646(
	idMedida INT NOT NULL,
	nome VARCHAR(20) NOT NULL,
	descricao VARCHAR(30) NOT NULL,
	CONSTRAINT pkMedida PRIMARY KEY(idMedida)
);
GO
CREATE TABLE tipoIngred646(
	idTipoIngred INT NOT NULL,
	descricao VARCHAR(30) NOT NULL,
	CONSTRAINT pkTipoIngred PRIMARY KEY(idTipoIngred)
);
GO
CREATE TABLE ingrediente646(
	idIngrediente INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	idTipoIngred INT NOT NULL,
	CONSTRAINT pkIngred PRIMARY KEY(idIngrediente),
	CONSTRAINT fkTipoIngred FOREIGN KEY(idTipoIngred) REFERENCES tipoIngred646(idTipoIngred)
);
GO
CREATE TABLE bebida646(
	idBebida INT NOT NULL,
	nome VARCHAR(20) NOT NULL,
	modoPrep VARCHAR(50) NOT NULL,
	tempoPrep VARCHAR(6) NOT NULL,
	quantidade SMALLINT NOT NULL,
	temperatura VARCHAR(6) NOT NULL,
	idMedida INT NOT NULL,
	CONSTRAINT pkBebida PRIMARY KEY(idBebida),
	CONSTRAINT fkMedida FOREIGN KEY(idMedida) REFERENCES medida646(idmedida)
);
GO
CREATE TABLE bebidaIngrediente646(
	idBebida INT NOT NULL,
	idIngrediente INT NOT NULL,
	idMedida INT NOT NULL,
	quantidade SMALLINT NOT NULL,
	CONSTRAINT pkBebidaIngred PRIMARY KEY(idBebida,idIngrediente),
	CONSTRAINT fkAssBeb FOREIGN KEY(idBebida) REFERENCES bebida646(idBebida),
	CONSTRAINT fkAssIngred FOREIGN KEY(idIngrediente) REFERENCES bebida646(idBebida),
	CONSTRAINT fkAssMedida FOREIGN KEY(idMedida) REFERENCES medida646(idMedida)
);
GO

