drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGeneros(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);

create table tbAutores(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(100),
primary key(idAutor)
);

create table tbClientes(
idCliente int not null auto_increment,
nome varchar(100),
telefone char(9),
primary key(idCliente)
);

create table tbLivros(
idLivro int not null auto_increment,
titulo varchar(100),
preco decimal(9,2),
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGeneros(idGenero)
);

create table tbVendas(
idVenda int not null auto_increment,
data date,
total decimal(9,2),
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbClientes(idCliente)
);

create table tbItens_Vendas(
idVenda int not null,
idLivro int not null,
quantidade int,
subTotal decimal(9,2),
foreign key(idVenda) references tbVendas(idVenda),
foreign key(idLivro) references tbLivros(idLivro)
);

create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivros(idLivro),
foreign key(idAutor) references tbAutores(idAutor)
);

desc tbGeneros;
desc tbAutores;
desc tbClientes;
desc tbLivros;
desc tbVendas;
desc tbItens_Vendas;
desc tbEscreve;

-- cadastrando os registros nas tabelas

insert into tbGeneros(descricao)values('Acao');
insert into tbGeneros(descricao)values('Ficcao');
insert into tbGeneros(descricao)values('Aventura');
insert into tbGeneros(descricao)values('Terror');
insert into tbGeneros(descricao)values('Comedia');
insert into tbGeneros(descricao)values('Romance');
insert into tbGeneros(descricao)values('Documentario');

insert into tbAutores(nome,email)values('Joanne Lipman','joanne.lipman@hotmail.com');
insert into tbAutores(nome,email)values('Joseph Grenny','joseph.grenny@hotmail.com');
insert into tbAutores(nome,email)values('Jonah Berger','jonah.berger@hotmail.com');
insert into tbAutores(nome,email)values('Uri Levine','uri.levine@hotmail.com');
insert into tbAutores(nome,email)values('Annie Duke','annie.duke@hotmail.com');
insert into tbAutores(nome,email)values('Vanessa Van Edwards','vanessa.veduwards@hotmail.com');
insert into tbAutores(nome,email)values('Peter N. Stearns','peter.nstearns@hotmail.com');


insert into tbClientes(nome,telefone)values('Eduardo Lucas','95741-5874');
insert into tbClientes(nome,telefone)values('Maria Gabrielly','93547-7412');
insert into tbClientes(nome,telefone)values('Ana Paula Pereira','92365-8574');


insert into tbLivros(titulo,preco,estoque,idGenero)values('Escute o que ela diz',55.47,3,4);
insert into tbLivros(titulo,preco,estoque,idGenero)values('Como decidir',59.92,8,1);
insert into tbLivros(titulo,preco,estoque,idGenero)values('Historia da felicidade',71.11,5,6);
insert into tbLivros(titulo,preco,estoque,idGenero)values('A linguagem secreta do carisma',46.47,5,5);

insert into tbVendas(data,total,idCliente)values('2024-05-16',150.50,2);
insert into tbVendas(data,total,idCliente)values('2024-05-14',230.25,1);
insert into tbVendas(data,total,idCliente)values('2024-05-16',350.00,3);

insert into tbItens_Vendas(idVenda,idLivro,quantidade,subTotal)values(3,4,5,150.00);
insert into tbItens_Vendas(idVenda,idLivro,quantidade,subTotal)values(1,3,10,350.00);
insert into tbItens_Vendas(idVenda,idLivro,quantidade,subTotal)values(2,1,12,550.00);

insert into tbEscreve(idLivro,idAutor)values(4,7);
insert into tbEscreve(idLivro,idAutor)values(3,5);
insert into tbEscreve(idLivro,idAutor)values(1,6);

-- Pesquisar os campos das tabelas

select * from tbGeneros;
select * from tbAutores;
select * from tbClientes;
select * from tbLivros;
select * from tbVendas;
select * from tbItens_Vendas;
select * from tbEscreve;