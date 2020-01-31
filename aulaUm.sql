codCursoCREATE TABLE prof_disciplina(

codDisciplina INTEGER NOT NULL,
numRegistro INTEGER NOT NULL,
semestre INTEGER NOT NULL,
ano INTEGER NOT NULL,

CONSTRAINT pk_prof_disciplina PRIMARY KEY (codDisciplina, numRegistro, semestre, ano),
CONSTRAINT fk_profMinistra FOREIGN KEY (numRegistro) REFERENCES professor(numRegistro),
CONSTRAINT fk_disciplinaMinistrada FOREIGN KEY (codDisciplina) REFERENCES disciplina(codDisciplina)
);
