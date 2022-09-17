--DROP DATABASE IF EXISTS auto_oficina;


CREATE DATABASE auto_oficina
    WITH 
    OWNER = postgres
    ENCODING = UTF8
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


CREATE TABLE public.Pessoa (
	cpf varchar(11) NOT NULL,
	nome varchar(20) NOT NULL,
	sobrenome varchar(60) NOT NULL,
	rg varchar(7) NOT NULL UNIQUE,
	telefone varchar(11) NOT NULL,
	CONSTRAINT Pessoa_pk PRIMARY KEY (cpf)
) WITH (
  OIDS=FALSE
);


CREATE TYPE categoria_cliente AS ENUM ('esporadico', 'especial', 'mal_pagador', 'devedor');

CREATE TABLE public.Cliente(
	codigo serial NOT NULL,
	cpf_pessoa varchar(11) NOT NULL UNIQUE,
	tipo categoria_cliente NOT NULL DEFAULT 'esporadico',
	CONSTRAINT Cliente_pk PRIMARY KEY (codigo),
	CONSTRAINT Cliente_fk0 FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Endereco (
	codigo serial NOT NULL,
	logradouro varchar(30) NOT NULL,
	numero integer,
	complemento varchar(100),
	bairro varchar(30) NOT NULL,
	cidade varchar(30) NOT NULL DEFAULT 'Salgueiro',
	estado varchar(2) NOT NULL DEFAULT 'PE',
	latitude FLOAT(8),
	longitude FLOAT(8),
	CONSTRAINT Endereco_pk PRIMARY KEY (codigo)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Pessoa_Endereco (
	endereco_codigo integer NOT NULL,
	pessoa_cpf varchar(11) NOT NULL
) WITH (
  OIDS=FALSE
);


CREATE TYPE setor_atuacao AS ENUM ('administrativo', 'operacional', 'mecanico');
CREATE TYPE tipo_conserto AS ENUM ('geral','oleo','balanceamento','embreagem','freios','radiador');


CREATE TABLE public.Funcionario (
	codigo serial NOT NULL,
	cpf_pessoa varchar(11) NOT NULL UNIQUE,
	url_foto TEXT NOT NULL UNIQUE,
	data_admissao DATE NOT NULL,
	salario FLOAT NOT NULL DEFAULT 1200,
	setor setor_atuacao NOT NULL,
	especialidade tipo_conserto,
	CONSTRAINT Funcionario_pk PRIMARY KEY (codigo)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Veiculo (
	placa varchar(7) NOT NULL,
	modelo varchar(20) NOT NULL,
	marca varchar(20) NOT NULL,
	ano varchar(4) NOT NULL,
	CONSTRAINT Veiculo_pk PRIMARY KEY (placa)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Cliente_Veiculo (
	codigo_cliente varchar(11) NOT NULL,
	placa_veiculo varchar(7) NOT NULL
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Servico (
	codigo serial NOT NULL,
	descricao varchar(50) NOT NULL,
	custo FLOAT NOT NULL,
	CONSTRAINT Servico_pk PRIMARY KEY (codigo)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Atividade (
	codigo serial NOT NULL,
	descricao varchar(50) NOT NULL,
	CONSTRAINT Atividade_pk PRIMARY KEY (codigo)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Servico_Atividade (
	codigo_servico integer NOT NULL,
	codigo_atividade integer NOT NULL,
	CONSTRAINT Servico_Atividade_pk PRIMARY KEY (codigo_servico, codigo_atividade)
) WITH (
  OIDS=FALSE
);


CREATE TYPE status_geral AS ENUM ('espera', 'iniciado', 'concluido');


CREATE TABLE public.Ordem_Servico (
	codigo serial NOT NULL,
	placa_veiculo varchar(7) NOT NULL,
	codigo_cliente integer NOT NULL,
	codigo_supervisor integer NOT NULL,
	situacao status_geral NOT NULL DEFAULT 'concluido',
	data_entrada DATE NOT NULL,
	data_saida DATE,
	custo_total FLOAT,
	CONSTRAINT Ordem_Servico_pk PRIMARY KEY (codigo)
) WITH (
  OIDS=FALSE
);


CREATE TYPE forma_pagamento AS ENUM ('credito', 'debito', 'dinheiro', 'pix');


CREATE TABLE public.Pagamento (
	codigo serial NOT NULL,
	codigo_ordem_servico INTEGER NOT NULL,
	data_vencimento DATE NOT NULL,
	data_pagamento DATE,
	valor_pagamento FLOAT,
	parcela INTEGER NOT NULL DEFAULT 0,
	formato forma_pagamento,
	CONSTRAINT Pagamento_pk PRIMARY KEY (codigo),
	CONSTRAINT Pagamento_fk0 FOREIGN KEY (codigo_ordem_servico) REFERENCES Ordem_Servico(codigo)
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.Atividades_Realizadas (
	codigo serial NOT NULL,
	codigo_ordem_servico integer NOT NULL,
	codigo_servico integer NOT NULL,
	codigo_atividade integer NOT NULL,
	codigo_funcionario integer NOT NULL,
	situacao status_geral NOT NULL DEFAULT 'concluido',
	CONSTRAINT Atividades_Realizadas_pk PRIMARY KEY (codigo)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Unidade_Movel (
	placa_veiculo varchar(7) NOT NULL,
	codigo_motorista integer NOT NULL,
	codigo_atendente integer NOT NULL,
	CONSTRAINT Unidade_Movel_pk PRIMARY KEY (placa_veiculo),
	CONSTRAINT Unidade_Movel_fk0 FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa),
	CONSTRAINT Unidade_Movel_fk1 FOREIGN KEY (codigo_motorista) REFERENCES Funcionario(codigo),
	CONSTRAINT Unidade_Movel_fk2 FOREIGN KEY (codigo_atendente) REFERENCES Funcionario(codigo)
) WITH (
  OIDS=FALSE
);


CREATE TABLE public.Agendamento (
	codigo serial NOT NULL,
	codigo_cliente integer NOT NULL,
	placa_veiculo varchar(7) NOT NULL,
	codigo_endereco integer NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	situacao status_geral NOT NULL DEFAULT 'espera',
	CONSTRAINT Agendamento_pk PRIMARY KEY (codigo),
	CONSTRAINT Agendamento_fk3 FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa)
) WITH (
  OIDS=FALSE
);


CREATE TYPE tipo_mensagem AS ENUM ('iniciado','rejeitado', 'aceito', 'finalizado', 'impossivelIniciar');


CREATE TABLE public.Mensagem_Terminal (
	codigo serial NOT NULL,
	placa_unidade_movel varchar(7) NOT NULL,
	conteudo tipo_mensagem NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	latitude FLOAT(8) NOT NULL,
	longitude FLOAT(8) NOT NULL,
	CONSTRAINT Codigo_Mensagem_pk PRIMARY KEY (codigo),
	CONSTRAINT Codigo_Mensagem_fk0 FOREIGN KEY (placa_unidade_movel) REFERENCES Veiculo(placa)
) WITH (
  OIDS=FALSE
);


ALTER TABLE Pessoa_Endereco ADD CONSTRAINT Pessoa_Endereco_fk0 FOREIGN KEY (endereco_codigo) REFERENCES Endereco(codigo);
ALTER TABLE Pessoa_Endereco ADD CONSTRAINT Pessoa_Endereco_fk1 FOREIGN KEY (pessoa_cpf) REFERENCES Pessoa(cpf);

ALTER TABLE Funcionario ADD CONSTRAINT Funcionario_fk0 FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf);

ALTER TABLE Cliente_Veiculo ADD CONSTRAINT Cliente_Veiculo_fk0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo);
ALTER TABLE Cliente_Veiculo ADD CONSTRAINT Cliente_Veiculo_fk1 FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa);

ALTER TABLE Ordem_Servico ADD CONSTRAINT Ordem_Servico_fk0 FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa);
ALTER TABLE Ordem_Servico ADD CONSTRAINT Ordem_Servico_fk1 FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo);
ALTER TABLE Ordem_Servico ADD CONSTRAINT Ordem_Servico_fk2 FOREIGN KEY (codigo_supervisor) REFERENCES Funcionario(codigo);

ALTER TABLE Servico_Atividade ADD CONSTRAINT Servico_Atividade_fk0 FOREIGN KEY (codigo_servico) REFERENCES Servico(codigo);
ALTER TABLE Servico_Atividade ADD CONSTRAINT Servico_Atividade_fk1 FOREIGN KEY (codigo_atividade) REFERENCES Atividade(codigo);

ALTER TABLE Atividades_Realizadas ADD CONSTRAINT Atividades_Realizadas_fk0 FOREIGN KEY (codigo_ordem_servico) REFERENCES Ordem_Servico(codigo);
ALTER TABLE Atividades_Realizadas ADD CONSTRAINT Atividades_Realizadas_fk1 FOREIGN KEY (codigo_servico) REFERENCES Servico(codigo);
ALTER TABLE Atividades_Realizadas ADD CONSTRAINT Atividades_Realizadas_fk2 FOREIGN KEY (codigo_atividade) REFERENCES Atividade(codigo);
ALTER TABLE Atividades_Realizadas ADD CONSTRAINT Atividades_Realizadas_fk3 FOREIGN KEY (codigo_funcionario) REFERENCES Funcionario(codigo);

ALTER TABLE Agendamento ADD CONSTRAINT Agendamento_fk0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo);
ALTER TABLE Agendamento ADD CONSTRAINT Agendamento_fk1 FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa);
ALTER TABLE Agendamento ADD CONSTRAINT Agendamento_fk2 FOREIGN KEY (codigo_endereco) REFERENCES Endereco(codigo);

SET TIMEZONE TO 'America/Sao_Paulo';