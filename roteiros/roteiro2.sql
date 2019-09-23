-- Questão 1

CREATE TABLE tasks (
	attribute1 INTEGER,
	attribute2 TEXT,
	attribute3 CHAR (11),
	attribute4 INTEGER,
	attribute5 CHAR (1)
);

INSERT INTO tasks VALUES (2147483646, 'limpar chão do corredor central', '98765432111', 0, 'F');
INSERT INTO tasks VALUES (2147483447, 'limpar janelas da sala 203', '98765432122', 1, 'F');
INSERT INTO tasks VALUES (null, null, null, null, null);

INSERT INTO tasks VALUES (2147483644, 'limpar chão do corredor superior', '987654323211', 0, 'F');
INSERT INTO tasks VALUES (2147483643, 'limpar chão do corredor superior', '98765432321', 0, 'FF');

-- Questão 2
ALTER TABLE tasks ALTER COLUMN attribute1 TYPE BIGINT;
INSERT INTO tasks VALUES (2147483648, 'limpar portas do térreo', '32323232955', 4, 'A');

-- Questão 3
ALTER TABLE tasks ALTER COLUMN attribute4 TYPE SMALLINT;

INSERT INTO tasks VALUES (2147483649, 'limpar portas da entrada principal', '32322525199', 32768, 'A');
INSERT INTO tasks VALUES (2147483650, 'limpar janelas da entrada principal', '32333233288', 32769, 'A');

INSERT INTO tasks VALUES (2147483651, 'limpar portas do 1º andar', '32323232911', 32767, 'A');
INSERT INTO tasks VALUES (2147483652, 'limpar portas do 2º andar', '32323232911', 32766, 'A');


-- Questão 4
ALTER TABLE tasks RENAME COLUMN attribute1 TO id;
ALTER TABLE tasks RENAME COLUMN attribute2 TO description;
ALTER TABLE tasks RENAME COLUMN attribute3 TO resp_func_cpf;
ALTER TABLE tasks RENAME COLUMN attribute4 TO priority;
ALTER TABLE tasks RENAME COLUMN attribute5 TO status;

DELETE FROM tasks WHERE id IS NULL;

ALTER TABLE tasks ALTER COLUMN id SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN description SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN resp_func_cpf SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN priority SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN status SET NOT NULL;

-- Questão 5
ALTER TABLE tasks ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);

INSERT INTO tasks VALUES (2147483653, 'limpar portas do 1º andas', '32323232911', 2, 'A');

INSERT INTO tasks VALUES (2147483653, 'aparar a grama da área frontal', '32323232911', 3, 'A');

-- Questão 6
-- a
ALTER TABLE tasks ADD CONSTRAINT chk_valid_resp_func_cpf CHECK (LENGTH(resp_func_cpf) = 11);

INSERT INTO tasks VALUES (2147483654, 'aaa', '3232323291', 3, 'A');
INSERT INTO tasks VALUES (2147483654, 'aaa', '323232329111', 3, 'A');

-- b
UPDATE tasks SET status = 'P' WHERE status = 'A';
UPDATE tasks SET status = 'E' WHERE status = 'R';
UPDATE tasks SET status = 'C' WHERE status = 'F';

ALTER TABLE tasks ADD CONSTRAINT chk_valid_satus CHECK (LENGTH (status) = 1 AND (status = 'P' OR status = 'E' OR status = 'C'));

-- Questão 7
UPDATE tasks SET priority = 5 WHERE priority > 5;

ALTER TABLE tasks ADD CONSTRAINT chk_valid_priority CHECK (priority >= 0 AND priority <= 5);

-- Questão 8
CREATE TABLE functionary (
	cpf CHAR (11) CONSTRAINT functionary_pkey PRIMARY KEY,
	birth DATE NOT NULL,
	name VARCHAR (20) NOT NULL,
	job VARCHAR (11) NOT NULL CONSTRAINT chk_valid_job CHECK (job = 'LIMPEZA' OR job = 'SUP_LIMPEZA'),
	lvl CHAR (1) NOT NULL CONSTRAINT chk_valid_lvl CHECK (lvl = 'J' OR lvl = 'P' OR lvl = 'S'),
	superior_cpf CHAR (11),
	CONSTRAINT functionary_superior_cpf_fkey FOREIGN KEY (superior_cpf) REFERENCES functionary (cpf),
	CONSTRAINT chk_valid_superior_cpf CHECK ((job = 'LIMPEZA' AND superior_cpf IS NOT NULL ) OR (job = 'SUP_LIMPEZA' AND superior_cpf IS NULL))
);

INSERT INTO functionary VALUES ('12345678911', '1980-05-07', 'Pedro da Silva', 'SUP_LIMPEZA', 'S', null);
INSERT INTO functionary VALUES ('12345678912', '1980-03-08', 'José da Silva', 'LIMPEZA', 'J', '12345678911');

INSERT INTO functionary VALUES ('12345678913', '1980-04-09', 'João da Silva', 'LIMPEZA', 'J', null);

-- Questão 9

