BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "cliente" (
	"id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	"senha"	TEXT NOT NULL,
	"whatsapp"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "comerciante" (
	"id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	"senha"	TEXT NOT NULL,
	"nome_comercio"	TEXT,
	"endereco"	TEXT,
	"telefone"	TEXT,
	"horario"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "item_pedido" (
	"id"	INTEGER,
	"pedido_id"	INTEGER NOT NULL,
	"produto_id"	INTEGER NOT NULL,
	"quantidade"	INTEGER NOT NULL CHECK("quantidade" > 0),
	"preco_unitario"	REAL NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("pedido_id") REFERENCES "pedido"("id"),
	FOREIGN KEY("produto_id") REFERENCES "produto"("id")
);
CREATE TABLE IF NOT EXISTS "pedido" (
	"id"	INTEGER,
	"cliente_id"	INTEGER NOT NULL,
	"recebimento"	TEXT NOT NULL CHECK("recebimento" IN ('entrega', 'retirada')),
	"endereco_entrega"	TEXT,
	"bairro"	TEXT,
	"taxa_entrega"	REAL NOT NULL DEFAULT 0,
	"observacao"	TEXT,
	"total"	REAL NOT NULL,
	"status"	TEXT NOT NULL DEFAULT 'pendente' CHECK("status" IN ('pendente', 'preparando', 'pronto', 'concluido', 'cancelado')),
	"data"	TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("cliente_id") REFERENCES "cliente"("id"),
	CHECK("recebimento" = 'retirada' OR "endereco_entrega" IS NOT NULL)
);
CREATE TABLE IF NOT EXISTS "produto" (
	"id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"descricao"	TEXT,
	"preco"	REAL NOT NULL CHECK("preco" > 0),
	"peso"	REAL,
	"categoria"	TEXT,
	"disponivel"	INTEGER NOT NULL DEFAULT 1 CHECK("disponivel" IN (0, 1)),
	"imagem"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "produto" VALUES (1,'Carvão Faveiro','Carvão vegetal de madeira Faveiro. Alta durabilidade, brasa forte e uniforme.',25.0,4.0,'Carvão vegetal',1,NULL);
INSERT INTO "produto" VALUES (2,'Carvão Misto','Mistura de madeiras selecionadas. Ótimo custo-benefício.',20.0,3.0,'Carvão vegetal',1,NULL);
INSERT INTO "produto" VALUES (3,'Carvão Premium','Lenha nobre selecionada.',32.0,5.0,'Linha premium',1,NULL);
COMMIT;
