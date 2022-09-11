create database pesquisa;

# CRIAR A TABELA ELEITOR
use pesquisa;
CREATE TABLE IF NOT EXISTS eleitor (
  id INT  NOT NULL ,
  nome VARCHAR(255) NOT NULL,
  partido TEXT NOT NULL,
  imagem TEXT NULL,
  votos int(10) not null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

# INSERINDO DADOS NA TABELA ELEITOR
 
INSERT INTO eleitor(id, nome, partido, imagem, votos)
VALUES (1, 'Jair Bolsonaro', 'PL', '/bolsonaro.jpg',0);

INSERT INTO eleitor(id, nome, partido, imagem, votos)
VALUES (2, 'Lula', 'PT', '/lula.jpg',0);

INSERT INTO eleitor(id, nome, partido, imagem, votos)
VALUES (3, 'Ciro Gomes', 'PDT', '/ciro.jpg',0);

#EXIBIR TABELA
select *from eleitor;

# CRIAR A TABELA VOTO
use pesquisa;
CREATE TABLE voto (
  idVoto INT NOT NULL AUTO_INCREMENT,
  id INT (100)NOT NULL ,
  idade int(10) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  uf VARCHAR(4) NOT NULL,
  PRIMARY KEY (idVoto),
  CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES eleitor(id))
ENGINE = InnoDB;


# INSERIR VOTO NA TABELA
INSERT INTO voto(idVoto, id, idade, cidade, uf)
VALUES (null, 1, 10,'Ribeirao Preto', 'SP');


# EXIBIR TABELA
select *from pesquisa.voto;
