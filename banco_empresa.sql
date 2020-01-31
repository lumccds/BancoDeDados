CREATE TABLE profissional(
idProfissional INTEGER NOT NULL auto_increment,
nome VARCHAR(100) NOT NULL,
email VARCHAR(40) NOT NULL,
tel INTEGER NOT NULL,
area VARCHAR(40),

constraint pk_profissional PRIMARY KEY (idProfissional)
);

CREATE TABLE departamento(
idDepto INTEGER NOT NULL auto_increment,
nome VARCHAR(100) NOT NULL,
andar INTEGER,

constraint pk_depto PRIMARY KEY (idDepto)
);

CREATE TABLE projeto(
idProjeto INTEGER NOT NULL auto_increment,
titulo VARCHAR(100) NOT NULL,
dataIn DATE,
idContrato INTEGER,
cliente VARCHAR(100),

constraint pk_depto PRIMARY KEY (idProjeto)
);

CREATE TABLE prof_proj(
idProfissional INTEGER NOT NULL,
idProjeto INTEGER NOT NULL,
datai date,
dataf date,

constraint pk_prof_proj PRIMARY KEY (idProfissional, idProjeto, datai),
constraint fk_profp foreign key (idProfissional)
references profissional (idProfissional),
constraint fk_projp foreign key (idProjeto)
references projeto (idProjeto)
);

select * idprofissional, idprojeto from profissional inner join projeto where 

select