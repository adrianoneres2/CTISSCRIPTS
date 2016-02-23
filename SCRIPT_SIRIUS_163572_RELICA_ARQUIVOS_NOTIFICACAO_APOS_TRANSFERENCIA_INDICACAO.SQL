/*
	163572
	Script para migrar os arquivos de notificações que não foram levadas para o comite de ética de destino após uma transferência ou indicação de comite de ética.
*/


insert INTO DBPLATAFORMABR.rl_apreciacaocertcaae_arquivo(CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, CO_ARQUIVO, ST_ARQUIVO, DT_INCLUSAO)
SELECT distinct c.CO_PROJETO, c.NU_VERSAO, c.NU_DIGITO_VERIFICADOR, c.tp_centro_pesquisa, c.NU_ANO_SUBMISSAO, c.NU_GESTAO, 5667 CO_COMITE_ETICA, aa.CO_ARQUIVO, aa.ST_ARQUIVO, SYSDATE
FROM DBPLATAFORMABR.rl_apreciacaocertcaae_arquivo aa,
     DBPLATAFORMABR.tb_apreciacao_certificado_caae c
WHERE aa.CO_PROJETO = 126477
  AND c.tp_apreciacao = 'N'
  and c.CO_PROJETO                  = aa.CO_PROJETO
--  and c.NU_VERSAO                   = aa.NU_VERSAO
  and c.NU_DIGITO_VERIFICADOR       = aa.NU_DIGITO_VERIFICADOR
  and c.TP_CENTRO_PESQUISA          = aa.TP_CENTRO
  and c.NU_ANO_SUBMISSAO            = aa.NU_ANO_SUBMISSAO
  and c.NU_GESTAO                   = aa.NU_GESTAO
  and c.CO_COMITE_ETICA             != 8000
and c.co_comite_etica  = 5667 ---- comite de ética de destino
and aa.co_comite_etica = 5057; --- comite de ética de origem
