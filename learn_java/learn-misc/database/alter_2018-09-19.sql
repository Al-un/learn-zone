
-- ###############################################################
-- ##          User                                             ##
-- ###############################################################

-- Create if not exists http://stackoverflow.com/questions/8092086/create-postgresql-role-user-if-it-doesnt-exist
-- #### /!\ FOREACH requires PostgreSQL 9.1 /!\ ####
-- http://stackoverflow.com/questions/9783422/postgres-array-for-loop
DO LANGUAGE plpgsql
    $body$
DECLARE 
    u_name      VARCHAR[];
    u_name_list VARCHAR[][2] :=
    ARRAY[
        ['padawan', 'padawan'], 
        ['padawan_auth0', 'padawan_auth0']
    ];
BEGIN
    FOREACH u_name SLICE 1 IN ARRAY u_name_list
    LOOP
        IF NOT EXISTS (SELECT * FROM pg_catalog.pg_user WHERE pg_user.usename = u_name[1]) THEN
            EXECUTE 'CREATE ROLE ' || u_name[1] || ' WITH LOGIN PASSWORD ''' || u_name[2] || '''';
            RAISE NOTICE 'user [%] created', u_name[1];
        ELSE
            RAISE NOTICE 'user [%] already exists', u_name[1];
        END IF;
    END LOOP;
END
$body$;



-- ###############################################################
-- ##          Database                                         ##
-- ###############################################################

-- https://www.postgresql.org/docs/9.5/static/manage-ag-createdb.html
DROP DATABASE IF EXISTS learn_java;
CREATE DATABASE learn_java OWNER padawan;
-- CREATE DATABASE learn_java_test OWNER padawan;



-- ###############################################################
-- ##          Schema                                           ##
-- ###############################################################

-- Metacommand: https://www.postgresql.org/docs/9.1/static/app-psql.html
\connect learn_java;
-- https://www.postgresql.org/docs/9.5/static/sql-createschema.html
CREATE SCHEMA learn AUTHORIZATION padawan;

-- do the same for the test environement
--\connect learn_java_test;
--CREATE SCHEMA learn AUTHORIZATION padawan;



-- ###############################################################
-- ##          Sequences                                        ##
-- ###############################################################

CREATE SEQUENCE learn.seq_article;
CREATE SEQUENCE learn.seq_catalog;
CREATE SEQUENCE learn.seq_catalog_article;
CREATE SEQUENCE learn.seq_ordering;
CREATE SEQUENCE learn.seq_order_item;

ALTER SEQUENCE learn.seq_article OWNER TO padawan;
ALTER SEQUENCE learn.seq_catalog OWNER TO padawan;
ALTER SEQUENCE learn.seq_catalog_article OWNER TO padawan;
ALTER SEQUENCE learn.seq_ordering OWNER TO padawan;
ALTER SEQUENCE learn.seq_order_item OWNER TO padawan;

-- ###############################################################
-- ##          Tables                                           ##
-- ###############################################################

CREATE TABLE learn.t_article(
    id          INTEGER DEFAULT NEXTVAL('learn.seq_article'),
    name        TEXT NOT NULL,
    description TEXT,
    created     TIMESTAMP WITHOUT TIME ZONE,
    updated     TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT "pk_article" PRIMARY KEY(id)
);

CREATE TABLE learn.t_catalog(
    id          INTEGER DEFAULT NEXTVAL('learn.seq_catalog'),
    name        TEXT NOT NULL,
    description TEXT,
    created     TIMESTAMP WITHOUT TIME ZONE,
    updated     TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT "pk_catalog" PRIMARY KEY(id)
);

CREATE TABLE learn.t_catalog_article(
    id          INTEGER DEFAULT NEXTVAL('learn.seq_catalog_article'),
    catalog_id  INTEGER NOT NULL,
    article_id  INTEGER NOT NULL,
    CONSTRAINT "pk_catalog_article" PRIMARY KEY(id),
    CONSTRAINT "fk_catalog_article_catalog" FOREIGN KEY (catalog_id)
        REFERENCES learn.t_catalog(id) MATCH FULL
        ON UPDATE NO ACTION ON DELETE CASCADE,
    CONSTRAINT "fk_catalog_article_article" FOREIGN KEY (article_id)
        REFERENCES learn.t_article(id) MATCH FULL
        ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE learn.t_ordering(
    id          INTEGER DEFAULT NEXTVAL('learn.seq_ordering'),
    created     TIMESTAMP WITHOUT TIME ZONE,
    updated     TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT "pk_order" PRIMARY KEY(id)
);

CREATE TABLE learn.t_order_item(
    id          INTEGER DEFAULT NEXTVAL('learn.seq_order_item'),
    ordering_id INTEGER NOT NULL,
    article_id  INTEGER NOT NULL,
    quantity    SMALLINT NOT NULL,
    created     TIMESTAMP WITHOUT TIME ZONE,
    updated     TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT "pk_orderitem" PRIMARY KEY(id),,
    CONSTRAINT "fk_orderitem_ordering" FOREIGN KEY (ordering_id)
        REFERENCES learn.t_ordering(id) MATCH FULL
        ON UPDATE NO ACTION ON DELETE CASCADE
    CONSTRAINT "fk_orderitem_article" FOREIGN KEY (article_id)
        REFERENCES learn.t_article(id) MATCH FULL
        ON UPDATE NO ACTION ON DELETE CASCADE
);


ALTER TABLE learn.t_article OWNER TO padawan;
ALTER TABLE learn.t_catalog OWNER TO padawan;
ALTER TABLE learn.t_catalog_article OWNER TO padawan;
ALTER TABLE learn.t_ordering OWNER TO padawan;
ALTER TABLE learn.t_order_item OWNER TO padawan;