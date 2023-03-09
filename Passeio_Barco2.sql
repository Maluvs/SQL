use litoral;
select * from destino;


#Para criar um ponto de restauração no banco
set autocommit = 0;
savepoint point1;

#Para fazer a alteração do COMMIT para que as alterações não sejam gravadas automaticamente
update destino set nome = 'Pequena Ilha do Mar';

#Para criar um ponto de restauração no banco
rollback to savepoint point1;