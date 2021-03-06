
alter session set nls_date_format = 'dd/mm/yy hh24:mi:ss';
SELECT  ROWID,
        NU_CAAE,
        CO_SEQ_PROJETO,
        CO_ORIGEM_EMENDA,   
        CO_PROJETO_ORIGEM,
        CO_EMENDA,
        NU_VERSAO_PROJETO,
        CO_TIPO_SITUACAO_PROJETO,
        TP_PROJETO,
        CO_COMITE_ETICA,
        ST_SUBMETIDA_EMENDA,
        ST_CONDICAO,
        ST_ESTUDO_INTERNACIONAL,
        CO_PROPOSITO_ESTUDO,
        ST_FINANCIAMENTO_PROPRIO,
        DT_PRIMEIRO_RECRUTAMENTO,
        ST_FONTE_SECUNDARIA,
        NU_INDIVIDUOS_ABORDADOS,
        VL_TOTAL_DESPESA,
        ST_SIGILO,
        DT_SIGILO,
        CO_PRAZO_SIGILO,
        DT_PREENCHIMENTO,
        DT_ALTERACAO_SITUACAO,
        CO_CARACTERIZACAO_SUJEITO,
        DT_SUBMISSAO,
        NU_VERSAO_PROJETO,
        DT_ACEITE_RELATORIA_CEP,
        DT_ACEITE_RELATORIA_CONEP,
        ST_ANTERIOR_PLATAFORMA,
        NU_VERSAO_ARQ_EMENDA,
        ST_REPLICA_CENTRO,
        ST_EXIBE_EDITADO,
        ST_CABE_RECURSO,
        CO_AGENTE_EDICAO,
        DT_ACEITE_RELATORIA_NOT_CEP,
        DT_ACEITE_RELATORIA_NOT_CONEP,
        ST_TITULO_ACADEMICO,
        CO_TIPO_TITULO_ACADEMICO,
        TP_PAPEL_ACADEMICO,
        ST_ENVIO_CONEP,
        CO_PESQUISADOR_RESPONSAVEL,
        DT_PRIMEIRA_SUBMISSAO,
        CO_RESOLUCAO,
        NU_CENTRO_PARTICIPANTE,
        CO_SITUACAO_RECURSO,
        NU_COPARTICIPANTE,
        CO_TIPO_SITUACAO_PROJETO,
        ST_GERADA_SUBMETER_EMENDA,
        SUBSTR(DS_BIBLIOGRAFIA, 1, 10) DS_BIBLIOGRAFIA,
        SUBSTR(DS_TITULO_PUBLICO, 1, 200) DS_TITULO_PUBLICO,
        DT_CRIACAO_PROJETO
FROM DBPLATAFORMABR.TB_PROJETO
WHERE CO_SEQ_PROJETO IN(SELECT CO_SEQ_PROJETO
                        FROM DBPLATAFORMABR.TB_PROJETO
                        START WITH CO_SEQ_PROJETO = (SELECT MIN(CO_SEQ_PROJETO)
                                                      FROM DBPLATAFORMABR.TB_PROJETO
                                                      START WITH CO_SEQ_PROJETO = (SELECT MIN(CO_SEQ_PROJETO) FROM DBPLATAFORMABR.TB_PROJETO WHERE NU_CAAE = '05290012.1.1001.5263')
                                                      CONNECT BY  CO_SEQ_PROJETO = PRIOR CO_ORIGEM_EMENDA)
                        CONNECT BY PRIOR CO_SEQ_PROJETO = CO_ORIGEM_EMENDA)
order by co_seq_projeto;

05080212.0.0000.5372
06042912.1.0000.5372
15702913.3.0000.5372

SELECT * FROM DBPLATAFORMABR.TB_PARECER WHERE CO_PROJETO = 364641 ORDER BY DT_PARECER;

select * from dbplataformabr.tb_arquivo
where co_seq_arquivo in(6080783,
6080786,
6083386);

select * from DBPLATAFORMABR.RL_FUNCIONALIDADE_TIPO_ARQUIVO where CO_TIPO_ARQUIVO in(2, 20, 28);

select * from dbplataformabr.tb_arquivo where no_arquivo = 'PB_PARECER_CONSUBSTANCIADO_CEP_558985_E2.pdf';

select * from dbplataformabr.tb_parecer where co_seq_parecer = '558985';

select * from DBPLATAFORMABR.RL_APRECIACAOCERTCAAE_ARQUIVO where co_arquivo in(6080783,
6080786,
6083386);

select * from DBPLATAFORMABR.TB_TIPO_ARQUIVO order by 1;

SELECT C.ROWID,  C.* FROM DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE C WHERE CO_PROJETO IN(288825) ORDER BY CO_PROJETO, DT_ESTADO;
SELECT * FROM DBPLATAFORMABR.TH_TRAMITE_APRECIACAO WHERE CO_PROJETO in(74312, 50802) AND CO_TIPO_TRAMITE = 30 AND CO_COMITE_ETICA = I.CO_COMITE_ETICA ORDER BY co_projeto,  DT_TRAMITE;
SELECT * FROM DBPLATAFORMABR.TB_PARECER WHERE CO_PROJETO in(288825)  ORDER BY DT_PARECER;
SELECT * FROM DBPLATAFORMABR.RL_APRECIACAOCERTCAAE_ARQUIVO WHERE CO_PROJETO in(288825);


UPDATE DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE SET DT_ESTADO = '13/09/2012 09:44:49,000000000' WHERE CO_PROJETO = 50802 AND ROWID = 'AAA/sMABzAAC9S3ABD';
UPDATE DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE SET DT_ESTADO = '13/09/2012 09:44:50,000000000' WHERE CO_PROJETO = 50802 AND ROWID = 'AAA/sMAB2AACXXGAAO';
UPDATE DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE SET DT_ESTADO = '13/09/2012 09:44:51,000000000' WHERE CO_PROJETO = 50802 AND ROWID = 'AAA/sMAB2AACXXGAAP';
COMMIT;


SELECT C.ROWID,  C.* FROM DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE C WHERE CO_PROJETO in(157029, 171073) ORDER BY CO_PROJETO,  DT_ESTADO;



---################################################################################
---########################### TRANSFERE PROJETOS #################################
---################################################################################
SET SERVEROUTPUT ON;
DECLARE
V_PROJETO_A_TRANSFERIR    NUMBER(9);
V_CO_COMITE_ETICA_ORIGEM  NUMBER(9);
V_CO_COMITE_ETICA_DESTINO NUMBER(9);
V_DT_TRANSFERENCIA        DATE;
V_NO_COMITE_ETICA_DESTINO VARCHAR(2000);
V_NU_VERSAO_PROJETO       NUMBER(9);

BEGIN
V_PROJETO_A_TRANSFERIR    := ????;
V_CO_COMITE_ETICA_DESTINO := ????;
V_CO_COMITE_ETICA_ORIGEM  := ????;
V_DT_TRANSFERENCIA        := TO_DATE('??/??/???? ??:??:??', 'DD/MM/YYYY HH24:MI:SS');

SELECT NO_COMITE_ETICA INTO V_NO_COMITE_ETICA_DESTINO FROM DBPLATAFORMABR.TB_COMITE_ETICA WHERE CO_SEQ_COMITE_ETICA = V_CO_COMITE_ETICA_DESTINO;
SELECT NU_VERSAO_PROJETO INTO V_NU_VERSAO_PROJETO FROM DBPLATAFORMABR.TB_PROJETO WHERE CO_SEQ_PROJETO = V_PROJETO_A_TRANSFERIR;

DBMS_OUTPUT.PUT_LINE('PROJETO A SER TRANSFERIDO ..: '||V_PROJETO_A_TRANSFERIR);
DBMS_OUTPUT.PUT_LINE('COMITE DE ETICA DE ESTINO ..: '||V_CO_COMITE_ETICA_DESTINO);
DBMS_OUTPUT.PUT_LINE('COMITE DE ETICA ORIGEM .....: '||V_CO_COMITE_ETICA_ORIGEM);
DBMS_OUTPUT.PUT_LINE('DATA DE TRANSFERENCIA ......: '||V_DT_TRANSFERENCIA);
DBMS_OUTPUT.PUT_LINE(' ');

FOR I IN(SELECT CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, CO_TIPO_ESTADO, TP_COMITE_ETICA, DT_ESTADO, DT_RELATORIA, ST_REGISTRO, ST_RECURSO, TP_APRECIACAO, ST_AD_REFERENDUM, CO_AGENTE_EDICAO, CO_TIPO_ESTADO_ANTERIOR, ST_NOTA_TECNICA, DS_JUSTIFICATIVA_TEMP, DT_RECEPCAO, ST_CRITERIO_CEP, DT_REJEICAO, ST_PARECER_COLEGIADO, CO_ASSESSOR_RESERVA, CO_RELATOR, DT_SUBMISSAO, 'S' ST_APRECIACAO_VIGENTE, DS_JUSTIFICATIVA_ENVIO_CONEP, ST_RESPOSTA_PENDENCIA, CO_PESQUISADOR_RESPONSAVEL, DT_CRIACAO_APRECIACAO, NU_NOTIFICACAO, NU_SUBMISSAO, CO_COMITE_INATIVADO, CO_COMITE_DESTINO_INDICADO
         FROM DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE
         WHERE (dt_estado, CO_PROJETO) in (SELECT max(dt_estado), co_projeto 
                                            FROM DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE 
                                            WHERE CO_PROJETO = V_PROJETO_A_TRANSFERIR --- projeto a ser transferido
                                            AND TP_APRECIACAO != 'N'
                                            AND CO_COMITE_ETICA = V_CO_COMITE_ETICA_ORIGEM
                                            group by co_projeto)
    )LOOP
      
      --- ********* GERA APRECIAÇÕES *************************
      ---GERA APRECIAÇÃO DE INDICAÇÃO DE COMITE DE ÉTICA 8000 E TIPO ESTADO 17 
      INSERT INTO DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE(CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, CO_TIPO_ESTADO, TP_COMITE_ETICA, DT_ESTADO, DT_RELATORIA, ST_REGISTRO, ST_RECURSO, TP_APRECIACAO, ST_AD_REFERENDUM, CO_AGENTE_EDICAO, CO_TIPO_ESTADO_ANTERIOR, ST_NOTA_TECNICA, DS_JUSTIFICATIVA_TEMP, DT_RECEPCAO, ST_CRITERIO_CEP, DT_REJEICAO, ST_PARECER_COLEGIADO, CO_ASSESSOR_RESERVA, CO_RELATOR, DT_SUBMISSAO, ST_APRECIACAO_VIGENTE, DS_JUSTIFICATIVA_ENVIO_CONEP, ST_RESPOSTA_PENDENCIA, CO_PESQUISADOR_RESPONSAVEL, DT_CRIACAO_APRECIACAO, NU_NOTIFICACAO, NU_SUBMISSAO, CO_COMITE_INATIVADO, CO_COMITE_DESTINO_INDICADO)
      VALUES(I.CO_PROJETO, I.NU_VERSAO, I.NU_DIGITO_VERIFICADOR, I.TP_CENTRO_PESQUISA, I.NU_ANO_SUBMISSAO, I.NU_GESTAO, 8000, 17, I.TP_COMITE_ETICA, V_DT_TRANSFERENCIA+NUMTODSINTERVAL(1, 'SECOND'), I.DT_RELATORIA, I.ST_REGISTRO, I.ST_RECURSO, I.TP_APRECIACAO, I.ST_AD_REFERENDUM, I.CO_AGENTE_EDICAO, I.CO_TIPO_ESTADO, I.ST_NOTA_TECNICA, I.DS_JUSTIFICATIVA_TEMP, I.DT_RECEPCAO, I.ST_CRITERIO_CEP, I.DT_REJEICAO, I.ST_PARECER_COLEGIADO, I.CO_ASSESSOR_RESERVA, I.CO_RELATOR, I.DT_SUBMISSAO, 'S', I.DS_JUSTIFICATIVA_ENVIO_CONEP, I.ST_RESPOSTA_PENDENCIA, I.CO_PESQUISADOR_RESPONSAVEL, I.DT_CRIACAO_APRECIACAO, I.NU_NOTIFICACAO, I.NU_SUBMISSAO, I.CO_COMITE_INATIVADO, I.CO_COMITE_DESTINO_INDICADO);
      DBMS_OUTPUT.PUT_LINE('GERANDO APRECIAÇÃO DE INDICAÇÃO DE COMITE DE ÉTICA 8000 E TIPO ESTADO 17 : '||SQL%ROWCOUNT);
      
  
      ---GERA APRECIAÇÃO PARA O NOVO COMITE DE ÉTICA(DESTINO)
      INSERT INTO DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE(CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, CO_TIPO_ESTADO, TP_COMITE_ETICA, DT_ESTADO, DT_RELATORIA, ST_REGISTRO, ST_RECURSO, TP_APRECIACAO, ST_AD_REFERENDUM, CO_AGENTE_EDICAO, CO_TIPO_ESTADO_ANTERIOR, ST_NOTA_TECNICA, DS_JUSTIFICATIVA_TEMP, DT_RECEPCAO, ST_CRITERIO_CEP, DT_REJEICAO, ST_PARECER_COLEGIADO, CO_ASSESSOR_RESERVA, CO_RELATOR, DT_SUBMISSAO, ST_APRECIACAO_VIGENTE, DS_JUSTIFICATIVA_ENVIO_CONEP, ST_RESPOSTA_PENDENCIA, CO_PESQUISADOR_RESPONSAVEL, DT_CRIACAO_APRECIACAO, NU_NOTIFICACAO, NU_SUBMISSAO, CO_COMITE_INATIVADO, CO_COMITE_DESTINO_INDICADO)
      VALUES(I.CO_PROJETO, I.NU_VERSAO, I.NU_DIGITO_VERIFICADOR, I.TP_CENTRO_PESQUISA, I.NU_ANO_SUBMISSAO, I.NU_GESTAO, V_CO_COMITE_ETICA_DESTINO, I.CO_TIPO_ESTADO, I.TP_COMITE_ETICA, V_DT_TRANSFERENCIA+NUMTODSINTERVAL(2, 'SECOND'), I.DT_RELATORIA, I.ST_REGISTRO, I.ST_RECURSO, I.TP_APRECIACAO, I.ST_AD_REFERENDUM, I.CO_AGENTE_EDICAO, I.CO_TIPO_ESTADO_ANTERIOR, I.ST_NOTA_TECNICA, I.DS_JUSTIFICATIVA_TEMP, I.DT_RECEPCAO, I.ST_CRITERIO_CEP, I.DT_REJEICAO, I.ST_PARECER_COLEGIADO, I.CO_ASSESSOR_RESERVA, I.CO_RELATOR, I.DT_SUBMISSAO, 'S', I.DS_JUSTIFICATIVA_ENVIO_CONEP, I.ST_RESPOSTA_PENDENCIA, I.CO_PESQUISADOR_RESPONSAVEL, I.DT_CRIACAO_APRECIACAO, I.NU_NOTIFICACAO, I.NU_SUBMISSAO, I.CO_COMITE_INATIVADO, I.CO_COMITE_DESTINO_INDICADO);
      DBMS_OUTPUT.PUT_LINE('GERANDO APRECIAÇÃO PARA O NOVO COMITE DE ÉTICA(DESTINO) : '||SQL%ROWCOUNT);
      
      --- ********* GERA TRAMITES *************************
      --- GERA TRAMITE DE TRANSFERENCIA PARA O COMITE DE ORIGEM
      INSERT INTO DBPLATAFORMABR.TH_TRAMITE_APRECIACAO(CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, DT_TRAMITE, CO_AGENTE, CO_TIPO_TRAMITE, DS_JUSTIFICATIVA3, ST_PUBLICO, CO_COMPROVANTE_ENVIO, DS_JUSTIFICATIVA, NO_TRAMITE_ORIGEM, NO_TRAMITE_DESTINO, NU_VERSAO_PROJETO, CO_FUNCAO_AGENTE)
      SELECT CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, V_DT_TRANSFERENCIA+NUMTODSINTERVAL(3, 'SECOND'), 314414, 30, DS_JUSTIFICATIVA3, ST_PUBLICO, CO_COMPROVANTE_ENVIO, DS_JUSTIFICATIVA, NO_TRAMITE_ORIGEM, 'CONEP', V_NU_VERSAO_PROJETO, 24 CO_FUNCAO_AGENTE
      FROM DBPLATAFORMABR.TH_TRAMITE_APRECIACAO 
      WHERE (CO_PROJETO, DT_TRAMITE) IN(SELECT CO_PROJETO, MAX(DT_TRAMITE)
                                        FROM DBPLATAFORMABR.TH_TRAMITE_APRECIACAO 
                                        WHERE CO_PROJETO            = I.CO_PROJETO
                                          AND NU_VERSAO             = I.NU_VERSAO
                                          AND NU_DIGITO_VERIFICADOR = I.NU_DIGITO_VERIFICADOR
                                          AND TP_CENTRO_PESQUISA    = I.TP_CENTRO_PESQUISA
                                          AND NU_ANO_SUBMISSAO      = I.NU_ANO_SUBMISSAO
                                          AND NU_GESTAO             = I.NU_GESTAO
                                          AND CO_COMITE_ETICA       = I.CO_COMITE_ETICA
                                        GROUP BY CO_PROJETO
                                       );
      DBMS_OUTPUT.PUT_LINE('GERANDO TRAMITE DE TRANSFERENCIA PARA O COMITE DE ORIGEM : '||SQL%ROWCOUNT);

      --- GERA TRAMITE PARA O COMITE DE DESTINO
      INSERT INTO DBPLATAFORMABR.TH_TRAMITE_APRECIACAO(CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, DT_TRAMITE, CO_AGENTE, CO_TIPO_TRAMITE, DS_JUSTIFICATIVA3, ST_PUBLICO, CO_COMPROVANTE_ENVIO, DS_JUSTIFICATIVA, NO_TRAMITE_ORIGEM, NO_TRAMITE_DESTINO, NU_VERSAO_PROJETO, CO_FUNCAO_AGENTE)
      SELECT CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO_PESQUISA, NU_ANO_SUBMISSAO, NU_GESTAO, V_CO_COMITE_ETICA_DESTINO, V_DT_TRANSFERENCIA+NUMTODSINTERVAL(4, 'SECOND'), 314414, 26, DS_JUSTIFICATIVA3, ST_PUBLICO, CO_COMPROVANTE_ENVIO, DS_JUSTIFICATIVA, 'CONEP', V_NO_COMITE_ETICA_DESTINO, V_NU_VERSAO_PROJETO, 24 CO_FUNCAO_AGENTE
      FROM DBPLATAFORMABR.TH_TRAMITE_APRECIACAO 
      WHERE (CO_PROJETO, DT_TRAMITE) IN(SELECT CO_PROJETO, MAX(DT_TRAMITE)
                                        FROM DBPLATAFORMABR.TH_TRAMITE_APRECIACAO 
                                        WHERE CO_PROJETO            = I.CO_PROJETO
                                          AND NU_VERSAO             = I.NU_VERSAO
                                          AND NU_DIGITO_VERIFICADOR = I.NU_DIGITO_VERIFICADOR
                                          AND TP_CENTRO_PESQUISA    = I.TP_CENTRO_PESQUISA
                                          AND NU_ANO_SUBMISSAO      = I.NU_ANO_SUBMISSAO
                                          AND NU_GESTAO             = I.NU_GESTAO
                                          AND CO_COMITE_ETICA       = I.CO_COMITE_ETICA
                                        GROUP BY CO_PROJETO
                                       );
      DBMS_OUTPUT.PUT_LINE('GERANDO TRAMITE PARA O COMITE DE DESTINO : '||SQL%ROWCOUNT);

      --- ********* GERA PARECERES *************************
      INSERT INTO DBPLATAFORMABR.TB_PARECER(CO_SEQ_PARECER, CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO, NU_ANO_SUBMISSAO, NU_SEQ_GESTAO, CO_COMITE_ETICA, TP_PARECER, ST_PARECER, ST_APRECIACAO_CONEP, DT_PARECER, CO_AGENTE, ST_AD_REFERENDUM, ST_REGISTRO_ATIVO, DS_OBJETIVO, DS_APRESENTACAO_PROTOCOLO, DS_AVALIACAO_RISCO_BENEFICIO, DS_COMENTARIO_CONSIDERACAO, DS_RECOMENDACAO, DS_CONCLUSAO_PENDENCIA, DS_PARECER, DS_CONSIDERACAO_TERMO, ST_PARECER_TRANSFERIDO)
      SELECT DBPLATAFORMABR.SQ_PARECER_COSEQPARECER.NEXTVAL, CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO, NU_ANO_SUBMISSAO, NU_SEQ_GESTAO, V_CO_COMITE_ETICA_DESTINO, TP_PARECER, ST_PARECER, ST_APRECIACAO_CONEP, DT_PARECER, CO_AGENTE, ST_AD_REFERENDUM, ST_REGISTRO_ATIVO, DS_OBJETIVO, DS_APRESENTACAO_PROTOCOLO, DS_AVALIACAO_RISCO_BENEFICIO, DS_COMENTARIO_CONSIDERACAO, DS_RECOMENDACAO, DS_CONCLUSAO_PENDENCIA, DS_PARECER, DS_CONSIDERACAO_TERMO, 'S' ST_PARECER_TRANSFERIDO
      FROM DBPLATAFORMABR.TB_PARECER
      WHERE CO_PROJETO            = I.CO_PROJETO
        AND NU_VERSAO             = I.NU_VERSAO
        AND NU_DIGITO_VERIFICADOR = I.NU_DIGITO_VERIFICADOR
        AND TP_CENTRO             = I.TP_CENTRO_PESQUISA
        AND NU_ANO_SUBMISSAO      = I.NU_ANO_SUBMISSAO
        AND NU_SEQ_GESTAO         = I.NU_GESTAO
        AND CO_COMITE_ETICA       = I.CO_COMITE_ETICA
        AND ST_REGISTRO_ATIVO = 'S';
      DBMS_OUTPUT.PUT_LINE('GERANDO PARECERES PARA O COMITE DE DESTINO : '||SQL%ROWCOUNT);

      --- ********* GERA ARQUIVOS *************************
      INSERT INTO DBPLATAFORMABR.RL_APRECIACAOCERTCAAE_ARQUIVO(CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO, NU_ANO_SUBMISSAO, NU_GESTAO, CO_COMITE_ETICA, CO_ARQUIVO, ST_ARQUIVO, DT_INCLUSAO)
      SELECT CO_PROJETO, NU_VERSAO, NU_DIGITO_VERIFICADOR, TP_CENTRO, NU_ANO_SUBMISSAO, NU_GESTAO, V_CO_COMITE_ETICA_DESTINO, CO_ARQUIVO, ST_ARQUIVO, SYSDATE
      FROM DBPLATAFORMABR.RL_APRECIACAOCERTCAAE_ARQUIVO
      WHERE CO_PROJETO            = I.CO_PROJETO
        AND NU_VERSAO             = I.NU_VERSAO
        AND NU_DIGITO_VERIFICADOR = I.NU_DIGITO_VERIFICADOR
        AND TP_CENTRO             = I.TP_CENTRO_PESQUISA
        AND NU_ANO_SUBMISSAO      = I.NU_ANO_SUBMISSAO
        AND NU_GESTAO             = I.NU_GESTAO
        AND CO_COMITE_ETICA       = I.CO_COMITE_ETICA;
      DBMS_OUTPUT.PUT_LINE('GERANDO ARQUIVOS PARA O COMITE DE DESTINO : '||SQL%ROWCOUNT);

      --- ********* ATUALIZA COMITE ORIGEM PARA TRANSFERIDO *************************
      UPDATE DBPLATAFORMABR.TB_APRECIACAO_CERTIFICADO_CAAE SET CO_TIPO_ESTADO = 19, DT_ESTADO = V_DT_TRANSFERENCIA+NUMTODSINTERVAL(0, 'SECOND')
      WHERE CO_PROJETO            = I.CO_PROJETO
        AND NU_VERSAO             = I.NU_VERSAO
        AND NU_DIGITO_VERIFICADOR = I.NU_DIGITO_VERIFICADOR
        AND TP_CENTRO_PESQUISA    = I.TP_CENTRO_PESQUISA
        AND NU_ANO_SUBMISSAO      = I.NU_ANO_SUBMISSAO
        AND NU_GESTAO             = I.NU_GESTAO
        AND CO_COMITE_ETICA       = I.CO_COMITE_ETICA;
      DBMS_OUTPUT.PUT_LINE('ATUALIZANDO APRECIAÇÃO PARA TRANSFERIDO (19) NO COMITE DE ORIGEM : '||SQL%ROWCOUNT);

    END LOOP; ----- FIM LOOP I                                      
    DBMS_OUTPUT.PUT_LINE('CONCLUÍDO.');

      EXCEPTION WHEN OTHERS THEN
      BEGIN 
       DBMS_OUTPUT.PUT_LINE('ERRO!!! '||SQLERRM);
       ROLLBACK;
      END;
END;
/


