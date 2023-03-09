use supergames;

INSERT jogo VALUES
(0, "Super Metroid", 205.00, 7),
(0, "DKC 2", 100.00, 8),
(0, "FF XV", 120.00, 5),
(0, "Xenoblade 2", 199.00, 6);

SELECT * FROM jogo;

/* Alterar valor dos jogos em promoção */

UPDATE jogo SET valor = valor * 0.5
WHERE nome = 'BF 1';

UPDATE jogo SET valor = valor * 0.5
WHERE nome = 'COD 3';

/* Criar uma tabela de promação */
CREATE TABLE promocao(
Promo INT (3) PRIMARY KEY AUTO_INCREMENT,
Cod_Jogo INT(3) NOT NULL,
FOREIGN KEY (Cod_Jogo)
REFERENCES Jogo (Cod)
);

/* inserção dos jogos em promoção */
INSERT promocao VALUE (0,1),(0,2);

SELECT * FROM promocao;

/* Selecionar os jogos em promoção */
SELECT jogo.nome, jogo.valor
FROM jogo
WHERE jogo.cod IN (SELECT cod_jogo FROM promocao);

/* ...ou utilizando JOIN... */ 
SELECT jogo.nome AS 'Titulo',
jogo.valor AS 'Preço'
FROM jogo INNER JOIN promocao ON jogo.cod = promocao.cod_jogo;

/* Selecionar os jogos que NãO estão em promoção */
SELECT jogo.nome AS 'Titulo', jogo.valor AS 'Preço'
FROM jogo WHERE jogo.cod NOT IN (SELECT cod_jogo FROM promocao);

/* Selecionar o jogo mais barato utilizando subconsultas e funções de agregação */

SELECT nome AS 'Mais barato!' FROM jogo WHERE valor = SOME (SELECT min(valor) FROM jogo);