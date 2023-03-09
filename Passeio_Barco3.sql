use litoral;

create table vendas (
Numero int primary key auto_increment,
DestinoId int,
Embarque date,
Qtd int,
foreign key (DestinoId) references destino(id)
);

insert into vendas values
(0,1,20180203,3),
(0,7,20180203,2),
(0,5,20180203,1);

alter table destino add column Valor decimal (5,2);

select * from destino;
select * from vendas;

update destino set valor = 100 where id=1;
update destino set valor = 120 where id=2;
update destino set valor = 80 where id=3;
update destino set valor = 90 where id=4;
update destino set valor = 100 where id=5;
update destino set valor = 150 where id=6;
update destino set valor = 120 where id=7;
update destino set valor = 180 where id=8;

-- Criar function (desconto)
DELIMITER $$

create function fn_desc(x decimal(5,2), y int)
returns decimal(5,2)
DETERMINISTIC
BEGIN
return((x*y)*0.7);
END $$

DELIMITER ;
-- fim function

show function status where db = 'litoral';

create procedure proc_desc (VAR_VendaNumero int)
select (fn_desc(destino.valor, Vendas.Qtd)) as "Valor com desconto",
destino.Nome as "Destino",
vendas.Qtd as "Passagens",
vendas.Embarque
from Vendas inner join destino
on Vendas.DestinoId = destino.Id
where vendas.Numero = var_VendaNumero;

call proc_desc(1);
call proc_desc(2);
call proc_desc(3);

-- Caso queira apagar a function e procedure (n apaguei)
drop function fn_desc;
drop procedure proc_desc;


