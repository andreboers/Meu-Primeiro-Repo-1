create database projetoCacau;

use projetoCacau;

-- Tabela de Cadastro para Login e Cadastro no site
create table cadastro(
idCadastro int primary key auto_increment,
cpf char(10) not null,
cnpj char(14),
usuario varchar(25) not null,
email varchar(50) unique not null,
senha varchar(50) not null,
cidade varchar(30)
);

-- Inserindo os dados do cliente
insert into cadastro (cpf,cnpj,usuario,email,senha,cidade)values
('1234567890','12345678901234','José','zezinho@sptech.school','zezinho123','Campinas'),
('0987654321','09876543210321','João','joaozinho@sptech.school','joaozinho321','Minas Gerais'),
('1234512345','12345123451234','Gustavo','gustavinho@sptech.school','gustavinho012','Espirito Santo');

alter table cadastro add column rg char(9);

-- Selecionando dados com apelido para melhor visualização da tabela
select cpf as 'CPF',
	cnpj as 'CNPJ',
	usuario as 'Usuário',
	email as 'E-mail',
	senha as 'Senha',
	cidade as 'Cidade',
    ifnull(rg, 'Não informado') as 'RG' from cadastro;




-- Tabela de Dados gerais sobre o sensor
create table dados(
idDados int primary key auto_increment,
sensor varchar(30),
funcao varchar(100),
umidade decimal(3,2),
dtRegist datetime default current_timestamp,
funcionamento varchar(100)
constraint chkFuncionamento check(funcionamento in('Ligado','Desligado'))
);

-- Arrumando as colunas da tabela para inserir os valores corretos
alter table dados modify column sensor varchar(50);
alter table dados modify column umidade varchar (4);

-- Inserindo os dados que o sensor recebeu
insert into dados (sensor, funcao, umidade, funcionamento) values
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a Umidade do solo', '40%', 'Ligado'),
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a Umidade do solo', '25%', 'Ligado'),
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a Umidade do solo', '0%', 'Desligado'),
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a Umidade do solo', '82%', 'Ligado');

-- Selecionando dados do sensor com apelido para melhor visualização da tabela
select sensor as 'Nome do Sensor',
	funcao as 'Função do Sensor',
	umidade as 'Medição da Umidade',
	funcionamento as 'Funcionamento' from dados;




-- Tabela que guarda as informações do Simulador Financeiro
create table plantacao (
idPlant int primary key auto_increment,
tipo varchar(30),
hectares varchar(7),
colheita date,
precomedio int,
kg int
);

-- Inserindo dados das plantações dos clientes
insert into plantacao (tipo, hectares, colheita, precoMedio, kg) values
('Sombreado', '104 Hectares', '2024-12-23', 47, '190 kg'),
('Pleno Sol', '551 Hectares', '2024-06-12', 42, '290 kg'),
('Extra-Tivista', '670 Hectares', '2023-12-30', 50, '523 kg');

 alter table plantacao modify column precomedio varchar(10);
 
 update plantacao set precoMedio = 'R$ 47' where idPlant = 1;
 update plantacao set precoMedio = 'R$ 42' where idPlant = 2;
 update plantacao set precoMedio = 'R$ 50' where idPlant = 3;
 
 -- Selecionando dados da plantação com apelido para melhor visualização da tabela
 select tipo,
	hectares as 'Tamanho da plantação',
	colheita as 'Colheitas',
	precoMedio as 'Preço Médio',
	kg as 'Pesagem' from plantacao;