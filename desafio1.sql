DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;


  CREATE TABLE SpotifyClone.planos(
	id_plano INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_plano VARCHAR(50) NOT NULL,
    valor DOUBLE NOT NULL
  ) engine = InnoDB;
    
    
  CREATE TABLE SpotifyClone.usuarios(
      id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(100) NOT NULL,
      idade INT,
      data_assinatura DATE NOT NULL,
      id_plano INT NOT NULL,
   		FOREIGN KEY(id_plano) REFERENCES SpotifyClone.planos(id_plano)
  ) engine = InnoDB;
  
  
CREATE TABLE SpotifyClone.artistas(
	id_artista INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome_artista VARCHAR(100)
  ) engine = InnoDB;
  

CREATE TABLE SpotifyClone.albuns( 
	id_album INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome_album VARCHAR(100) NOT NULL,
	ano_de_lancamento INT,
	id_artista INT NOT NULL,
		FOREIGN KEY(id_artista) REFERENCES SpotifyClone.artistas(id_artista) 
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.cancoes(
	id_cancao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_cancao VARCHAR(100) NOT NULL,
	duracao_segundo INT NOT NULL,
    id_album INT NOT NULL,
		FOREIGN KEY(id_album) REFERENCES SpotifyClone.albuns(id_album) 
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.reproducoes( 
      data_reproducao DATETIME NOT NULL,
      id_cancao INT NOT NULL,
      id_usuario INT NOT NULL,
      CONSTRAINT PRIMARY KEY (id_cancao, id_usuario),
		FOREIGN KEY(id_cancao) REFERENCES SpotifyClone.cancoes(id_cancao),
        FOREIGN KEY(id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario) 
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.seguindo(
	id_usuario INT NOT NULL,
	id_artista INT NOT NULL,
	CONSTRAINT PRIMARY KEY (id_usuario, id_artista),
		FOREIGN KEY(id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario),
        FOREIGN KEY(id_artista) REFERENCES SpotifyClone.artistas(id_artista)
  ) engine = InnoDB;
  
  
  
INSERT INTO SpotifyClone.planos (nome_plano, valor)
  VALUES
    ('gratuito', '0.00'),
    ('familiar', '7.99'),
	('universitário', '5.99'),
    ('pessoal', '6.99');
    

INSERT INTO SpotifyClone.usuarios (nome, idade, data_assinatura, id_plano)
  VALUES
    ('Barbara Liskov', '82','2019-10-20','1'),
    ('Robert Cecil Martin', '58', '2017-01-06','1'),
    ('Ada Lovelace', '37', '2017-12-30', '2'),
    ('Martin Fowler', '46', '2017-01-17','2'),
    ('Sandi Metz', '58', '2018-04-29','2'),
    ('Paulo Freire', '19', '2018-02-14','3'),
    ('Bell Hooks','26', '2018-01-05','3'),
    ('Christopher Alexander', '85', '2019-06-05','4'),
    ('Judith Butler', '45', '2020-05-13','4'),
    ('Jorge Amado', '58', '2017-02-17','4');

INSERT INTO SpotifyClone.artistas(nome_artista)
  VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'), 
  ('Nina Simone');
  
    
INSERT INTO SpotifyClone.albuns (nome_album, ano_de_lancamento, id_artista)
  VALUES
  ('Renaissance', '2022', '1'),
  ('Jazz', '1978','2'),
  ('Hot Space', '1982','2'),
  ('Falso Brilhate', '1992','3'),
  ('Vento de Maio', '2001','3'),
  ('QVVJFA?', '2003','4'),
  ('Somewhere Far Beyond', '2007','5'),
  ('I Put A Spell On You', '2012','6');


INSERT INTO SpotifyClone.cancoes (nome_cancao, duracao_segundo, id_album)
  VALUES
    ('Samba em Paris', '267', '6'),
    ('VIRGO’S GROOVE', '369','1'),
	('Feeling Good', '100', '8'),
    ('O Medo de Amar é o Medo de Ser Livre', '207', '5'),
    ('BREAK MY SOUL', '279', '1'),
    ('ALIEN SUPERSTAR','116','1'),
    ('Don’t Stop Me Now', '203', '2'),
    ('Under Pressure', '152','3'),
    ('Como Nossos Pais', '105', '4'),
    ('The Bard’s Song','244','7');
    
INSERT INTO	 SpotifyClone.seguindo (id_usuario, id_artista) 
	VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
	

INSERT INTO SpotifyClone.reproducoes (id_usuario, id_cancao, data_reproducao)
	VALUES	
    ('1', '1', '2022-02-28 10:45:55'),
    ('1', '2', '2020-05-02 05:30:35'),
    ('1', '3', '2020-03-06 11:22:33'),
    ('2', '3', '2022-08-05 08:05:17'),
    ('2', '4', '2020-01-02 07:40:33'),
    ('3', '3', '2020-11-13 16:55:13'),
    ('3', '2', '2020-12-05 18:38:30'),
    ('4', '1', '2021-08-15 17:10:10'),
    ('5', '1', '2022-01-09 01:44:33'),
    ('5', '8', '2020-08-06 15:23:43'),
    ('6', '4', '2017-01-24 00:31:17'),
    ('6', '5', '2017-10-12 12:35:20'),
    ('7', '7', '2011-12-15 22:30:49'),
    ('8', '7', '2011-12-15 22:30:49'),
    ('9', '10', '2022-02-24 21:14:22'),
    ('10', '6', '2015-12-13 08:30:22');