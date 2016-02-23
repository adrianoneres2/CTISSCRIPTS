

update DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE c1  set co_tipo_estado = 11 
where ST_APRECIACAO_VIGENTE = 'S' and CO_COMITE_ETICA !=8 and co_tipo_estado = 12
and exists(select 1 
           from DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE c2
           where c2.co_projeto = c1.co_projeto
           and c2.co_comite_etica = 8
           and c2.dt_estado >= c1.dt_estado
           and c2.co_tipo_estado = 9
           and C2.ST_APRECIACAO_VIGENTE = 'S');


select c1.rowid, c1.* from DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE c1 where ST_APRECIACAO_VIGENTE = 'S' and CO_COMITE_ETICA !=8 and co_tipo_estado = 12
and exists(select 1 
           from DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE c2
           where c2.co_projeto = c1.co_projeto
           and c2.co_comite_etica = 8
           and c2.dt_estado >= c1.dt_estado
           and c2.co_tipo_estado = 9
           and C2.ST_APRECIACAO_VIGENTE = 'S');
           
SELECT c1.rowid, c1.* FROM DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE c1 WHERE CO_PROJETO IN(557138) ORDER BY CO_PROJETO, DT_ESTADO;
SELECT c1.co_comite_etica, c1.rowid, c1.* FROM DBPLATAFORMABR.tb_projeto c1 WHERE CO_seq_PROJETO IN(420420);



