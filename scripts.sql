-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-05-26 20:06:20 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE relation_5 (
    t_fintech_conta_nm_saldo                           NUMBER NOT NULL, 
    t_fintech_investimentos_t_fintech_investimentos_id NUMBER NOT NULL
);

ALTER TABLE relation_5 ADD CONSTRAINT relation_5_pk PRIMARY KEY ( t_fintech_conta_nm_saldo,
                                                                  t_fintech_investimentos_t_fintech_investimentos_id );

CREATE TABLE relation_6 (
    t_fintech_conta_nm_saldo               NUMBER NOT NULL, 
    t_fintech_credito_t_fintech_credito_id NUMBER NOT NULL
);

ALTER TABLE relation_6 ADD CONSTRAINT relation_6_pk PRIMARY KEY ( t_fintech_conta_nm_saldo,
                                                                  t_fintech_credito_t_fintech_credito_id );

CREATE TABLE relation_7 (
    t_fintech_conta_nm_saldo                 NUMBER NOT NULL, 
    t_fintech_servicos_t_fintech_servicos_id NUMBER NOT NULL
);

ALTER TABLE relation_7 ADD CONSTRAINT relation_7_pk PRIMARY KEY ( t_fintech_conta_nm_saldo,
                                                                  t_fintech_servicos_t_fintech_servicos_id );

CREATE TABLE t_criar_conta (
    nm_nome          VARCHAR2 
     NOT NULL,
    nm_sobrenome     VARCHAR2 
     NOT NULL,
    ds_endereco      VARCHAR2 
     NOT NULL,
    ds_email         VARCHAR2 
     NOT NULL,
    nm_cpf           NUMBER NOT NULL,
    t_criar_conta_id NUMBER NOT NULL
);

ALTER TABLE t_criar_conta ADD CONSTRAINT t_criar_conta_pk PRIMARY KEY ( t_criar_conta_id );

CREATE TABLE t_fintech_acesso (
    nr_cpf                            NUMBER NOT NULL,
    ds_senha                          VARCHAR2 
     NOT NULL, 
    t_fintech_dados_cliente_cd_clinte VARCHAR2 
     NOT NULL,
    t_fintech_acesso_id               NUMBER NOT NULL
);

ALTER TABLE t_fintech_acesso ADD CONSTRAINT t_fintech_acesso_pk PRIMARY KEY ( t_fintech_acesso_id );

CREATE TABLE t_fintech_conta (
    nm_saldo                             NUMBER NOT NULL, 
    t_fintech_acesso_t_fintech_acesso_id NUMBER NOT NULL
);

ALTER TABLE t_fintech_conta ADD CONSTRAINT t_fintech_conta_pk PRIMARY KEY ( nm_saldo );

CREATE TABLE t_fintech_credito (
    cb_cashback          NUMBER NOT NULL,
    pg_pagamento         NUMBER NOT NULL,
    t_fintech_credito_id NUMBER NOT NULL
);

ALTER TABLE t_fintech_credito ADD CONSTRAINT t_fintech_credito_pk PRIMARY KEY ( t_fintech_credito_id );

CREATE TABLE t_fintech_dados_cliente (
    cd_clinte                      VARCHAR2 
     NOT NULL,
    en_cliente                     VARCHAR2 
     NOT NULL,
    dt_nascimento_cliente          NUMBER NOT NULL,
    ds_email                       unknown 
     NOT NULL,
    t_criar_conta_t_criar_conta_id NUMBER NOT NULL
);

ALTER TABLE t_fintech_dados_cliente ADD CONSTRAINT t_fintech_dados_cliente_pk PRIMARY KEY ( cd_clinte );

CREATE TABLE t_fintech_investimentos (
    nm_investimentos           NUMBER NOT NULL,
    dt_inicio                  unknown 
     NOT NULL,
    dt_fim                     unknown 
     NOT NULL,
    t_fintech_investimentos_id NUMBER NOT NULL
);

ALTER TABLE t_fintech_investimentos ADD CONSTRAINT t_fintech_investimentos_pk PRIMARY KEY ( t_fintech_investimentos_id );

CREATE TABLE t_fintech_servicos (
    sd_saldo              NUMBER,
    lm_conta              unknown 
     NOT NULL,
    t_fintech_servicos_id NUMBER NOT NULL
);

ALTER TABLE t_fintech_servicos ADD CONSTRAINT t_fintech_servicos_pk PRIMARY KEY ( t_fintech_servicos_id );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_t_fintech_conta_fk FOREIGN KEY ( t_fintech_conta_nm_saldo )
        REFERENCES t_fintech_conta ( nm_saldo );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_t_fintech_investimentos_fk FOREIGN KEY ( t_fintech_investimentos_t_fintech_investimentos_id )
        REFERENCES t_fintech_investimentos ( t_fintech_investimentos_id );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_t_fintech_conta_fk FOREIGN KEY ( t_fintech_conta_nm_saldo )
        REFERENCES t_fintech_conta ( nm_saldo );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_t_fintech_credito_fk FOREIGN KEY ( t_fintech_credito_t_fintech_credito_id )
        REFERENCES t_fintech_credito ( t_fintech_credito_id );

ALTER TABLE relation_7
    ADD CONSTRAINT relation_7_t_fintech_conta_fk FOREIGN KEY ( t_fintech_conta_nm_saldo )
        REFERENCES t_fintech_conta ( nm_saldo );

ALTER TABLE relation_7
    ADD CONSTRAINT relation_7_t_fintech_servicos_fk FOREIGN KEY ( t_fintech_servicos_t_fintech_servicos_id )
        REFERENCES t_fintech_servicos ( t_fintech_servicos_id );

ALTER TABLE t_fintech_acesso
    ADD CONSTRAINT t_fintech_acesso_t_fintech_dados_cliente_fk FOREIGN KEY ( t_fintech_dados_cliente_cd_clinte )
        REFERENCES t_fintech_dados_cliente ( cd_clinte );

ALTER TABLE t_fintech_conta
    ADD CONSTRAINT t_fintech_conta_t_fintech_acesso_fk FOREIGN KEY ( t_fintech_acesso_t_fintech_acesso_id )
        REFERENCES t_fintech_acesso ( t_fintech_acesso_id );

ALTER TABLE t_fintech_dados_cliente
    ADD CONSTRAINT t_fintech_dados_cliente_t_criar_conta_fk FOREIGN KEY ( t_criar_conta_t_criar_conta_id )
        REFERENCES t_criar_conta ( t_criar_conta_id );

CREATE SEQUENCE t_criar_conta_t_criar_conta_id START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_criar_conta_t_criar_conta_id BEFORE
    INSERT ON t_criar_conta
    FOR EACH ROW
    WHEN ( new.t_criar_conta_id IS NULL )
BEGIN
    :new.t_criar_conta_id := t_criar_conta_t_criar_conta_id.nextval;
END;
/

CREATE SEQUENCE t_fintech_acesso_t_fintech_ace START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_fintech_acesso_t_fintech_ace BEFORE
    INSERT ON t_fintech_acesso
    FOR EACH ROW
    WHEN ( new.t_fintech_acesso_id IS NULL )
BEGIN
    :new.t_fintech_acesso_id := t_fintech_acesso_t_fintech_ace.nextval;
END;
/

CREATE SEQUENCE t_fintech_credito_t_fintech_cr START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_fintech_credito_t_fintech_cr BEFORE
    INSERT ON t_fintech_credito
    FOR EACH ROW
    WHEN ( new.t_fintech_credito_id IS NULL )
BEGIN
    :new.t_fintech_credito_id := t_fintech_credito_t_fintech_cr.nextval;
END;
/

CREATE SEQUENCE t_fintech_investimentos_t_fint START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_fintech_investimentos_t_fint BEFORE
    INSERT ON t_fintech_investimentos
    FOR EACH ROW
    WHEN ( new.t_fintech_investimentos_id IS NULL )
BEGIN
    :new.t_fintech_investimentos_id := t_fintech_investimentos_t_fint.nextval;
END;
/

CREATE SEQUENCE t_fintech_servicos_t_fintech_s START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_fintech_servicos_t_fintech_s BEFORE
    INSERT ON t_fintech_servicos
    FOR EACH ROW
    WHEN ( new.t_fintech_servicos_id IS NULL )
BEGIN
    :new.t_fintech_servicos_id := t_fintech_servicos_t_fintech_s.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           5
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          5
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
