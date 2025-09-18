#Chamar Mysql - XAMPP
mysql -u root

#Criar banco de dados
create database AULASETEMBRO18;

#Conectar ao banco de dados
use AULASETEMBRO18; 

#Criar tabela
create table pessoa(
    idpessoa int Primary Key auto_increment,
    nome varchar(30) not null,
    sexo Enum('M','F') not null,
    email varchar(30)
);

#descrever tabela
desc pessoa;

#Inserir outro delimitador por $
status;
delimiter $

#Criar procedimento
create procedure cadpessoa(
    pnome varchar(30),
    psexo enum('M','F'),
    pemail varchar(30)
)
Begin
    insert into pessoa(nome,sexo,email)
    values(NULL, pnome,psexo,pemail);
end$

call cadpessoa('Adriano','M', 'Adriano@gmail.com')$
call cadpessoa('Lilian','F','lilian@email.com')$
call cadpessoa('Carlos','M','carlos@email.com')$
call cadpessoa('João','M','João@globo.com')$
call cadpessoa('Ana','F','ana@email.com')$
call cadpessoa('Adriana','F','adriana@email.com')$
call cadpessoa('Geraldo','M','geraldo@email.com')$

select * from pessoa$

create table  backup_pessoa(
    idbackup int Primary Key auto_increment,
    idpessoa int,
    nome varchar(30),
    sexo char(1),
    email varchar(30),
    operacao varchar(30)
)$

#Gatilho
create trigger backup_pessoa
before delete on pessoa
for each row
Begin
    insert into backup_pessoa(idpessoa,nome,sexo,email,operacao)
    values(null, old.idpessoa,old.nome,old.sexo,old.email,'delete');
end$

DELETE FROM pessoa where idpessoa=1$
