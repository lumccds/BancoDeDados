create database universidade;
use universidade;

/* tabela CURSO */
CREATE TABLE curso(
   codigoCurso INTEGER      NOT NULL AUTO_INCREMENT,
   nome        VARCHAR(100) NOT NULL,
   area        VARCHAR(50),
   modalidade  CHAR(1),
   
   CONSTRAINT pk_curso PRIMARY KEY (codigoCurso)
);

/*TABELA GRADE */
CREATE TABLE grade(
   codigoGrade INTEGER NOT NULL AUTO_INCREMENT,
   anoVigencia INTEGER NOT NULL,
   portariaDOU VARCHAR(20),
   codigoCurso INTEGER NOT NULL,
    
   CONSTRAINT pk_grade PRIMARY KEY (codigoGrade),
   CONSTRAINT fk_curso FOREIGN KEY (codigoCurso) REFERENCES curso(codigoCurso)
);

/* TABELA PROFESSOR */
CREATE TABLE professor(
   numRegistro INTEGER NOT NULL AUTO_INCREMENT,
   nome        VARCHAR(100),
   email       VARCHAR(100),
   telefone    VARCHAR(20),
   salarioHora FLOAT,
   
   CONSTRAINT pk_professor PRIMARY KEY (numRegistro)
);


/* TABELA INFO_ACADEMICA */
CREATE TABLE infoacademica (
   numRegistro  INTEGER NOT NULL,
   tituloMaximo VARCHAR(30),
   anoTitulo    INTEGER,
   instituicao  VARCHAR(100),
   curso        VARCHAR(100),
   
   CONSTRAINT pk_infoacademica PRIMARY KEY (numRegistro),
   CONSTRAINT fk_professor FOREIGN KEY (numRegistro) REFERENCES professor (numRegistro)
);
/* TABELA DISCIPLINA */
CREATE TABLE disciplina (
   codDisciplina INTEGER NOT NULL AUTO_INCREMENT,
   nome          VARCHAR(100),
   ementa        TEXT,
   justificativa TEXT,
   cargaHoraria  INTEGER,
   bibliografia  TEXT,
   unTematicas   TEXT,	
   numRegistro   INTEGER,
   
   CONSTRAINT pk_disciplin PRIMARY KEY (codDisciplina),
   CONSTRAINT fk_profresp  FOREIGN KEY (numRegistro) REFERENCES professor(numRegistro)
   
);
/* TABELA GRADE_CONTEM_DISCIPLINA */
CREATE TABLE grade_disciplina (
   codigoGrade      INTEGER NOT NULL,
   codDisciplina    INTEGER NOT NULL,
   semestre         INTEGER NOT NULL,
   
   CONSTRAINT pk_grade_disc PRIMARY KEY (codigoGrade, codDisciplina),
   CONSTRAINT fk_grade FOREIGN KEY (codigoGrade) REFERENCES grade(codigoGrade),
   CONSTRAINT fk_discg FOREIGN KEY (codDisciplina) 
                      REFERENCES disciplina(codDisciplina)
   
);

/* TABELA PROFESSOR_MINISTRA_DISCIPLINA */
CREATE TABLE prof_disciplina (
   codDisciplina INTEGER NOT NULL,
   numRegistro   INTEGER NOT NULL,
   semestre      INTEGER NOT NULL,
   ano           INTEGER NOT NULL,
   
   CONSTRAINT pk_prof_disc PRIMARY KEY (codDisciplina, numRegistro, semestre, ano),
   CONSTRAINT fk_disc_m    FOREIGN KEY (codDisciplina) 
                    REFERENCES disciplina(codDisciplina),
   CONSTRAINT fk_prof_m    FOREIGN KEY (numRegistro)
                    REFERENCES professor(numRegistro)
                    
);

/* recuperando dados */
SELECT 	disciplina.nome as "disciplina",
		professor.nome as "prof. responsavel",
        tituloMaximo as "titulacao"
        
        FROM disciplina INNER JOIN professor USING (numRegistro)
						INNER JOIN infoacademica using (numRegistro);
      

INSERT INTO curso VALUES (null ,'Ciencia da Computacao' , 'Exatas', 'I');
INSERT INTO curso VALUES (null ,'Gastronomia', 'Saude', 'I');

INSERT INTO professor VALUES (null, 'Professor Isidro', 'isidro@isidro.com', '91234-5678', 100); 
INSERT INTO professor VALUES (null, 'Jose Henrique', 'jh@escola.com', '91234-5677', 80);
INSERT INTO professor VALUES (null, 'Pedro Almeida', 'pa@escola.com', '91234-5676', 80);
INSERT INTO professor VALUES (null, 'Jurandir Lemos', 'jl@escola.com', '91234-5675', 80);
INSERT INTO professor VALUES (null, 'Nilsonclecio Nunes', 'nn@escola.com', '91234-5674', 100);
INSERT INTO professor VALUES (null, 'Liderce Lopes', 'll@escola.com', '91234-5673', 100);

INSERT INTO infoacademica VALUES (1, 'Doutor', 2007, 'USP', 'Computacao');
INSERT INTO infoacademica VALUES (2, 'Mestre', 2009, 'UNESP', 'Matematica');
INSERT INTO infoacademica VALUES (3, 'Mestre', 2005, 'MACKENZIE', 'Engenharia');
INSERT INTO infoacademica VALUES (4, 'Mestre', 2003, 'SENAC', 'Gastronomia');
INSERT INTO infoacademica VALUES (5, 'Doutor', 2002, 'SENAC', 'Hotelaria');
INSERT INTO infoacademica VALUES (6, 'Doutor', 2000, 'UNICAMP', 'Administracao');

INSERT INTO grade VALUES (null, 2020, "1568/20", 1);
INSERT INTO grade VALUES (null, 2018, "9851/18", 2);

INSERT INTO disciplina VALUES (null, 'Programacao I', 'Programacao I em java', 'Base do curso', 80, 'Livros de Java', 'Conteudo de Java', 1);
INSERT INTO disciplina VALUES (null, 'Programacao II', 'Back End em java', 'Base do curso', 80, 'Livros de Back End', 'Conteudo de Back End', 1);
INSERT INTO disciplina VALUES (null, 'Bancos de Dados', 'BD Mysql', 'Base do curso', 60, 'Livros de BD', 'Conteudo de BD', 2);
INSERT INTO disciplina VALUES (null, 'Front End', 'Programacao I em java', 'Base do curso', 60, 'Livros de Front', 'Conteudo de Front', 2);
INSERT INTO disciplina VALUES (null, 'Sistemas Operacionais', 'Programacao I em java', 'Base do curso', 60, 'Livros de SO', 'Conteudo de SO', 3);
INSERT INTO disciplina VALUES (null, 'Entradas', 'Com fazer petiscos', 'Base do curso', 80, 'Livros de Culinaria', 'Conteudo de Entradas', 4);
INSERT INTO disciplina VALUES (null, 'Pratos Principais', 'Com fazer comida', 'Base do curso', 100, 'Livros de comida', 'Conteudo de Comidas', 4);
INSERT INTO disciplina VALUES (null, 'Sobremesas', 'Como fazer sobremesa', 'Base do curso', 60, 'Livros de sobremesa', 'Conteudo de Sobremesa', 5);
INSERT INTO disciplina VALUES (null, 'Bebidas', 'Como fazer drinks', 'Base do curso', 20, 'Livros de Bebidas', 'Conteudo de drinks', 6);

INSERT INTO grade_disciplina VALUES (1, 1, 1);
INSERT INTO grade_disciplina VALUES (1, 2, 2);
INSERT INTO grade_disciplina VALUES (1, 3, 3);
INSERT INTO grade_disciplina VALUES (1, 4, 4);
INSERT INTO grade_disciplina VALUES (1, 5, 5);
INSERT INTO grade_disciplina VALUES (2, 6, 1);
INSERT INTO grade_disciplina VALUES (2, 7, 2);
INSERT INTO grade_disciplina VALUES (2, 8, 3);
INSERT INTO grade_disciplina VALUES (2, 9, 3);

INSERT INTO prof_disciplina VALUES (1, 1, 1, 2020);
INSERT INTO prof_disciplina VALUES (1, 2, 1, 2020);
INSERT INTO prof_disciplina VALUES (2, 3, 1, 2020);
INSERT INTO prof_disciplina VALUES (2, 3, 2, 2020);

INSERT INTO prof_disciplina VALUES (6, 4, 1, 2020); 
INSERT INTO prof_disciplina VALUES (6, 5, 1, 2020);
INSERT INTO prof_disciplina VALUES (7, 6, 1, 2020);

select professor.nome, disciplina.nome, semestre, ano
from prof_disciplina inner join disciplina using (codDisciplina)








