 #chamar mysql 
mysql -u root 
 #criar uma banco
create database aulasetembro;
#usar o banco de dados 
use aulasetembro18;
#criar uma tabela
create table pessoa(
    idpessoa int primary key auto_increment,
    nome varchar(30) not null, 
    sexo enum('M','F') not null,
    email varchar(100) unique not null


);
#DESCREVER A TABELA
DESC pessoa;

#delimitador 
delimiter $
#criar uma procedure
create procedure CADPESSOA(
    PNOME VARCHAR(30),
    PSEXO enum('M','F'),
    PEMAIL VARCHAR(100)
    )
    BEGIN 
    INSERT INTO pessoa (NOME, SEXO, EMAIL) VALUES (PNOME, PSEXO, PEMAIL);
    END$
    call CADPESSOA('MARIA','F','maria@gmail.com')$
    call CADPESSOA('JOAO','M','joao@gmail.com')$
    call CADPESSOA('ANA','F','ANA@gmail.com')$
    call CADPESSOA('PEDRO','M','pedro@gmail.com')$
    call CADPESSOA('PAULO','M','paulotejando@gmail.com')$
    
    create table BACKUP_PESSOA (
        IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
        IDPESSOA INT,
        NOME VARCHAR(30),
        SEXO ENUM('M','F'),
        EMAIL VARCHAR(100),
        OPERACAO VARCHAR(30)
    )
    #CRIAR O GATILHO

    SELECT * FROM PESSOA$
    SELECT * FROM BACKUP_PESSOA$

CREATE TRIGGER BKP_DEL_PESSOA
BEFORE DELETE ON PESSOA
FOR EACH ROW 
BEGIN
INSERT INTO BACKUP_PESSOA (IDPESSOA, NOME, SEXO, EMAIL, OPERACAO) VALUES (OLD.IDPESSOA, OLD.NOME, OLD.SEXO, OLD.EMAIL, 'DELETE');




END $
SELECT * FROM PESSOA$
DELETE FROM PESSOA WHERE IDPESSOA=1$

#Exercício 1:
// fazer um gatilho de inserir uma pessoa em duas tabelas 
CREATE TRIGGER BKP_INS_PESSOA 
AFTER INSERT ON PESSOA
FOR EACH ROW

BEGIN
INSERT INTO BACKUP_PESSOA (IDPESSOA, NOME, SEXO, EMAIL, OPERACAO) VALUES (NEW.IDPESSOA, NEW.NOME, NEW.SEXO, NEW.EMAIL, 'insert');


END$
// CHAMAR PROCEDURE
CALL CADPESSOA('ANGELA', 'F', 'ANGE@GMAIL.COM')$
Call CADPESSOA('SIMONE','F','SIMONE@gmail.com')$
DELETE FROM PESSOA WHERE IDPESSOA = '1'$