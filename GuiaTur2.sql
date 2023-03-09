USE guiatur;
SHOW TABLES FROM guiatur;
DESCRIBE pais; 

 INSERT INTO pais (nome, continente, codigo)
 VALUES
 ('Brasil', 'América', 'BRA'),
 ('Índia', 'Ásia', 'IDN'),
 ('China', 'Ásia', 'CHI'),
 ('Japão', 'Ásia', 'JPN');

  SELECT * FROM pais;
  
INSERT INTO estado (nome, sigla)
VALUES('Maranhão', 'MA'),
('São Paulo', 'SP'),
('Santa Catarina', 'SC'),
('Rio de Janeiro', 'RJ');

SELECT * FROM estado;

INSERT INTO cidade (nome, populacao)
VALUES('Sorocaba', 700000),
('Déli', 26000000),
('Xangai', 22000000),
('Tóquio', 38000000);

SELECT * FROM cidade; 

INSERT INTO ponto_tur (nome, tipo)
VALUES('Quinzinho de Barros', 'Instituição'),
('Parque Estadual do Jalapão', 'Atrativo'),
('Torre Eiffel', 'Atrativo'),
('Fogo de Chão', 'Restaurante');
Describe ponto_tur;
SELECT * FROM ponto_tur;

UPDATE ponto_tur SET tipo = 'Atrativo'
WHERE id = 1;

SELECT * FROM pais;
UPDATE pais SET codigo = 'IND'
WHERE id = 2;

SELECT * FROM cidade;
DELETE FROM cidade WHERE id = 1;