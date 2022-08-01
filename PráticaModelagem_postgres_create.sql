CREATE TABLE "public.Usuarios" (
	"id" serial NOT NULL,
	"nome" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "Usuarios_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Produtos" (
	"id" serial NOT NULL,
	"idImage" real NOT NULL,
	"CategoriaId" integer NOT NULL,
	"nome" TEXT NOT NULL,
	"preco" real NOT NULL,
	"Tamanho" char NOT NULL,
	CONSTRAINT "Produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ImagensProdutos" (
	"id" serial NOT NULL,
	"imageURL" serial NOT NULL UNIQUE,
	CONSTRAINT "ImagensProdutos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categorias" (
	"id" serial,
	"NomeCategoria" TAMANHOTYPE TEXT NOT NULL,
	CONSTRAINT "Categorias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Compras" (
	"id" serial,
	"UsuarioId" integer NOT NULL,
	"ProdutoId" integer NOT NULL,
	"EndereçoId" TEXT NOT NULL,
	"Status" STATUSTYPE NOT NULL,
	"Quantidade" integer NOT NULL,
	"Data" DATE NOT NULL,
	CONSTRAINT "Compras_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.Endereços" (
	"id" serial,
	"UsuarioId" integer NOT NULL,
	"CidadeId" integer NOT NULL,
	"EstadoId" integer NOT NULL,
	"CEP" TEXT NOT NULL,
	"Bairro" TEXT NOT NULL,
	"NumeroResidencia" integer NOT NULL,
	"Complemento" varchar(50),
	CONSTRAINT "Endereços_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Cidades" (
	"id" serial,
	"Nome" TEXT NOT NULL,
	CONSTRAINT "Cidades_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Estados" (
	"id" serial,
	"Nome" TEXT NOT NULL,
	CONSTRAINT "Estados_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_fk0" FOREIGN KEY ("idImage") REFERENCES "ImagensProdutos"("id");
ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_fk1" FOREIGN KEY ("CategoriaId") REFERENCES "Categorias"("id");


ALTER TABLE "Compras" ADD CONSTRAINT "Compras_fk0" FOREIGN KEY ("UsuarioId") REFERENCES "Usuarios"("id");
ALTER TABLE "Compras" ADD CONSTRAINT "Compras_fk1" FOREIGN KEY ("ProdutoId") REFERENCES "Produtos"("id");
ALTER TABLE "Compras" ADD CONSTRAINT "Compras_fk2" FOREIGN KEY ("EndereçoId") REFERENCES "Endereços"("id");

ALTER TABLE "Endereços" ADD CONSTRAINT "Endereços_fk0" FOREIGN KEY ("UsuarioId") REFERENCES "Usuarios"("id");
ALTER TABLE "Endereços" ADD CONSTRAINT "Endereços_fk1" FOREIGN KEY ("CidadeId") REFERENCES "Cidades"("id");
ALTER TABLE "Endereços" ADD CONSTRAINT "Endereços_fk2" FOREIGN KEY ("EstadoId") REFERENCES "Estados"("id");

CREATE TYPE TAMANHOTYPE as ENUM ('P','M','G')
CREATE TYPE STATUSTYPE as ENUM ('criada','paga','entregue','cancelada')









