USE guiatur;
 
 INSERT INTO ponto_tur (nome, coordenada)
 VALUES ('Ponte da Amizade',POINT(1.123456,3.434343));
 
 SELECT * FROM ponto_tur;
 SELECT *, ST_Y(coordenada) as coordY FROM ponto_tur;
 
 -- Alterar tabela de Elementos Turisticos, adicionando latitude e longitude.
 DESCRIBE ponto_tur;
 ALTER TABLE ponto_tur ADD coordenada POINT;
 DROP TABLE coordenada;
 
 -- Alterar a tabela "Paises", adicionando uma nota de 0 a 10 com o nivel de interesse para o turista 
 ALTER TABLE pais ADD interesse ENUM('0','1','2','3','4','5','6','7','8','9','10');
 
 -- Alterar tabela "Cidade", incluindo uma lista com os tres melhores restaurantes.
 ALTER TABLE cidade ADD melhoresRest VARCHAR(300) DEFAULT '';
 