BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "comerciante" (
	"id"	INTEGER UNIQUE,
	"nome"	TEXT NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	"senha"	TEXT NOT NULL,
	"nome_comercio"	TEXT,
	"endereco"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "pedido" (
	"id"	INTEGER,
	"produto_id"	INTEGER NOT NULL,
	"quantidade"	INTEGER NOT NULL,
	"recebimento"	TEXT NOT NULL CHECK("recebimento" IN ('entrega', 'retirada')),
	"nome_cliente"	TEXT NOT NULL,
	"whatsapp"	TEXT NOT NULL,
	"observacao"	TEXT,
	"total"	REAL NOT NULL,
	"status"	TEXT NOT NULL DEFAULT 'pendente' CHECK("status" IN ('pendente', 'concluido', 'cancelado')),
	"data"	TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id"),
	FOREIGN KEY("produto_id") REFERENCES "produto"("id")
);
CREATE TABLE IF NOT EXISTS "produto" (
	"id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"descricao"	TEXT,
	"preco"	REAL NOT NULL,
	"categoria"	TEXT,
	"disponivel"	INTEGER NOT NULL DEFAULT 1,
	"imagem"	TEXT,
	PRIMARY KEY("id")
);
INSERT INTO "produto" VALUES (1,'Carvão Faveiro','Carvão vegetal de madeira Faveiro. Alta durabilidade e brasa forte.',25.0,'Carvão',1,NULL);
COMMIT;
