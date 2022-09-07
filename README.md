create database pesquisa;

CREATE TABLE IF NOT EXISTS eleitor (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  partido TEXT NOT NULL,
  imagem TEXT NULL,
  votos int(10) not null,
  PRIMARY KEY (id))
ENGINE = InnoDB;

INSERT INTO eleitor(id, nome, partido, imagem, votos)
VALUES (null, 'Jair Bolsonaro', 'PL', '/bolsonaro.jpg',0);

INSERT INTO eleitor(id, nome, partido, imagem, votos)
VALUES (null, 'Lula', 'PT', '/lula.jpg',0);

INSERT INTO eleitor(id, nome, partido, imagem, votos)
VALUES (null, 'Ciro Gomes', 'PDT', '/ciro.jpg',0);

select * from eleitor;




voto

use pesquisa;
CREATE TABLE IF NOT EXISTS voto (
  idVoto INT NOT NULL AUTO_INCREMENT,
  idade int(10) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  uf VARCHAR(4) NOT NULL,
  PRIMARY KEY (idVoto))
ENGINE = InnoDB;

INSERT INTO voto(idVoto, idade, cidade, uf)
VALUES (null, 20, 'Ribeirao Preto', 'SP');

INSERT INTO voto(idVoto, idade, cidade, uf)
VALUES (null, 24, 'Ribeirao Preto', 'SP');

INSERT INTO voto(idVoto, idade, cidade, uf)
VALUES (null, 10, 'Ribeirao Preto', 'SP');


select * from voto;