create database universidade; -- Creates the new database
use universidade;
CREATE TABLE curso(
	codCurso integer not null auto_increment,
    nome varchar(100) not null,
    area varchar(50) not null,
    modalidade char(1),
    
    CONSTRAINT pk_curso primary key (codCurso)
);

SELECT * from curso;


-- create user 'springuser'@'%' identified by 'ThePassword'; Creates the user
-- grant all on db_example.* to 'springuser'@'%';  Gives all privileges to the new user on the newly created database      