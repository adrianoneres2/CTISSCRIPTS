/*
	173155 - Erro na situação do projeto

O Parecer Consubstanciado foi emitido, mas o status deste protocolo continuou Aguardando a Revisão do Parecer do Colegiado.

CAAE: 38575514.4.1001.5342
CAAE: 40763415.0.1001.5327


*/

--- Script para corrigir todos os casos.

update DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE set CO_TIPO_ESTADO = 12
where CO_TIPO_ESTADO = 9
and (CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA)
IN(
select CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO, NU_ANO_SUBMISSAO, NU_SEQ_GESTAO, CO_COMITE_ETICA from 
dbplataformabr.tb_parecer par
inner join (select max(co_seq_parecer)co_seq_parecer
             from dbplataformabr.tb_parecer
             group by co_comite_etica, co_projeto
            ) max_parecer_aprovado
on par.co_seq_parecer = max_parecer_aprovado.co_seq_parecer
where 1=1
  ---and par.co_comite_etica != 8
  and par.st_parecer = 'A'
  and par.tp_parecer = 'D'
and exists(select 1 
            from DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE c
            where par.CO_PROJETO            = c.CO_PROJETO
              and par.NU_VERSAO             = c.NU_VERSAO
              and par.NU_DIGITO_VERIFICADOR = c.NU_DIGITO_VERIFICADOR
              and par.TP_CENTRO             = C.TP_CENTRO_PESQUISA
              and par.NU_ANO_SUBMISSAO      = c.NU_ANO_SUBMISSAO
              and par.NU_SEQ_GESTAO         = c.NU_GESTAO
              and par.CO_COMITE_ETICA       = c.CO_COMITE_ETICA
           and C.ST_APRECIACAO_VIGENTE = 'S'
           AND CO_TIPO_ESTADO = 9)
and exists(select 1 
            from DBPLATAFORMABR.TH_TRAMITE_APRECIACAO t
            where par.CO_PROJETO            = t.CO_PROJETO
              and par.NU_VERSAO             = t.NU_VERSAO
              and par.NU_DIGITO_VERIFICADOR = t.NU_DIGITO_VERIFICADOR
              and par.TP_CENTRO             = t.TP_CENTRO_PESQUISA
              and par.NU_ANO_SUBMISSAO      = t.NU_ANO_SUBMISSAO
              and par.NU_SEQ_GESTAO         = t.NU_GESTAO
              and par.CO_COMITE_ETICA       = t.CO_COMITE_ETICA
           AND CO_TIPO_TRAMITE = 16));
