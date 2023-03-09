use SuperGames;

#Desenvolver uma função de  agregação que retorne a quantidade de registros na tabela jogos.
SELECT count(*) from JOGO;

#Desenvolver uma função de  agregação que retorne o valor do jogo de maior preço (valor).
SELECT max(valor) AS "Maior Valor" FROM jogo;

#Desenvolver uma função de  agregação que retorne o valor do jogo de menor preço (valor).
SELECT min(valor) AS "Menor Valor" FROM jogo;

#Desenvolver uma função de  agregação que retorne o valor médio dos jogos de guerra.
SELECT avg(valor) AS "Média guerra" FROM jogo INNER JOIN localizacao
ON localizacao.Id = jogo.localizacao_Id WHERE localizacao.secao = "Guerra";

#Desenvolver uma função de  agregação que retorne o valor total em estoque na loja.
SELECT sum(valor) AS "Total" FROM jogo;


