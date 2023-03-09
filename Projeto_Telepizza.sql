CREATE DATABASE IF NOT EXISTS pizzaline

DEFAULT CHARSET = utf8

DEFAULT COLLATE = utf8_general_ci;

USE pizzaline;

CREATE TABLE IF NOT EXISTS cliente (
id INT AUTO_INCREMENT PRIMARY KEY,

nome VARCHAR(20) NOT NULL,

endereco VARCHAR(50) NOT NULL,

tel VARCHAR(15) NOT NULL

);

CREATE TABLE IF NOT EXISTS produtos (

id INT AUTO_INCREMENT PRIMARY KEY,

descricao VARCHAR(255),

tipo VARCHAR(6),

tamanho VARCHAR(20),

valor FLOAT 

);

CREATE TABLE IF NOT EXISTS pedidos (

id INT AUTO_INCREMENT PRIMARY KEY,

data_hora DATETIME,

id_cliente INT,

tipo_pagamento ENUM('Débito', 'Crédito', 'Dinheiro', 'Pix') NOT NULL ,

CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id)

);

CREATE TABLE IF NOT EXISTS produtos_pedido (

id INT AUTO_INCREMENT PRIMARY KEY,

id_produtos INT,

id_pedido INT,

quantidade SMALLINT,

CONSTRAINT fk_produtos FOREIGN KEY (id_produtos) REFERENCES produtos (id),

CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos (id)

);


insert into cliente (nome, endereco,tel)values('Giovanni','rua C, 2333, centro','9999-8988'),('Luciana','rua D, 23, centro','9999-8988'),('Fabiano','rua A, 23, centro','9999-8988');

insert into produtos (descricao, tipo, tamanho, valor) values('calabresa', 'pizza', 'M', '45.00'),
('chocolate', 'pizza', 'P', '35.00'),('Coca Cola', 'bebida', '2L', '10.00');

insert into pedidos (id_cliente, data_hora, tipo_pagamento) values
((SELECT id FROM cliente WHERE nome = 'Fabiano' LIMIT 1), current_timestamp(), 'Débito'),
((SELECT id FROM cliente WHERE nome = 'Giovanni' LIMIT 1), current_timestamp(), 'pix');   

insert into produtos_pedido (id_pedido, id_produtos,quantidade)values
((SELECT p.id FROM pedidos p INNER JOIN cliente c ON c.id = p.id_cliente where c.nome = 'Fabiano' LIMIT 1), (SELECT pr.id FROM produtos pr WHERE descricao = 'calabresa' AND tamanho = 'M' LIMIT 1), 1), 
((SELECT p.id FROM pedidos p INNER JOIN cliente c ON c.id = p.id_cliente where c.nome = 'Fabiano' LIMIT 1), (SELECT pr.id FROM produtos pr WHERE descricao = 'Coca Cola' AND tamanho = '2L' LIMIT 1), 2), 
((SELECT p.id FROM pedidos p INNER JOIN cliente c ON c.id = p.id_cliente where c.nome = 'Giovanni' LIMIT 1),(SELECT pr.id FROM produtos pr WHERE descricao = 'chocolate' AND tamanho = 'P' LIMIT 1), 1);


 

