drop database alunocurso;
create database if not exists alunocurso;

use alunocurso;

insert into tblcurso values (null, 'Tecnologia', 'Osasco', 8, 'Presencial', 'Jogos Digiais', 'Tecnólogo');
insert into tblcurso values (null, 'Tecnologia', 'Lapa', 10, 'Semi-Presencial', 'ADS', 'Bacharelado');
insert into tblcurso values (null, 'Artes', 'Paulista', 4, 'Presencial', 'Desenho', 'Técnico');
insert into tblcurso values (null, 'Tecnologia', 'Osasco', 10, 'Presencial', 'Ciência da Computação', 'Bacharelado');
insert into tblcurso values (null, 'Artes', 'Paulista', 6, 'EAD', 'Jogos Digiais', 'Técnico');

insert into tblaluno values (null, 'haroldo@tmail.com', 'Haroldo', 'Herald', '(11)11111-1111', '1');
insert into tblaluno values (null, 'peppinha@tmail.com', 'Peppa', 'Popper', '(22)22222-2222', '2');
insert into tblaluno values (null, 'xeniaxonda@tmail.com', 'Xênia', 'Xônda', '(11)33333-3333', '3');
insert into tblaluno values (null, 'hayleykiyoko@tmail.com', 'Hayley', 'Kiokotoko', '(22)44444-4444', '4');
insert into tblaluno values (null, 'Crystal@tmail.com', 'Crystal', 'Labeija', '(66)66666-9999', '5');