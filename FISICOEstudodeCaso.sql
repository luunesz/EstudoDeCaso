/* LogicoEstudodeCaso: */

CREATE TABLE Aluno (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    idade INTEGER,
    serie VARCHAR(50)
);

CREATE TABLE Viagem (
    id CHAR(10) PRIMARY KEY,
    local_saida VARCHAR(50),
    local_chegada VARCHAR(50),
    fk_Rota_id CHAR(10),
    fk_Motorista_cnh CHAR(11),
    status_viagem VARCHAR(50),
    horario_ida TIME,
    horario_volta TIME,
    fk_Onibus_placa CHAR(7)
);

CREATE TABLE Motorista (
    cnh CHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    idade INTEGER,
    genero VARCHAR(50),
    num_multa INTEGER
);

CREATE TABLE Multa (
    id CHAR(10) PRIMARY KEY,
    data_emissao DATE,
    valor_multa FLOAT,
    status_multa VARCHAR(50),
    fk_Onibus_placa CHAR(10),
    fk_Viagem_id CHAR(10),
    tipo VARCHAR(50)
);

CREATE TABLE Cidade (
    clima VARCHAR(50),
    estado VARCHAR(50),
    pais VARCHAR(50),
    nome VARCHAR(50),
    id INTEGER PRIMARY KEY,
    tipo VARCHAR(50)
);

CREATE TABLE Rota (
    tipo VARCHAR(50),
    id CHAR(10) PRIMARY KEY,
    horario_ida_previsto TIME,
    horario_retorno_previsto TIME,
    fk_Cidade_id_origem INTEGER,
    fk_Cidade_id_destino INTEGER,
    status_rota VARCHAR(50)
);

CREATE TABLE Responsavel (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50),
    parentesco VARCHAR(50)
);

CREATE TABLE Presenca (
    fk_Viagem_id CHAR(10),
    fk_Aluno_cpf CHAR(11),
    data_presenca DATE,
    horario_presenca TIME
);

CREATE TABLE inscrito (
    fk_Aluno_cpf CHAR(11),
    fk_Rota_id CHAR(10)
);

CREATE TABLE Responsavel_Aluno (
    fk_Responsavel_cpf CHAR(11),
    fk_Aluno_cpf CHAR(11)
);

CREATE TABLE Onibus (
    placa CHAR(7) PRIMARY KEY,
    cor VARCHAR(50),
    medida FLOAT,
    num_assentos INTEGER,
    statuts_onibus VARCHAR(50)
);
 
ALTER TABLE Viagem ADD CONSTRAINT FK_Viagem_1
    FOREIGN KEY (fk_Rota_id)
    REFERENCES Rota (id);
 
ALTER TABLE Viagem ADD CONSTRAINT FK_Viagem_2
    FOREIGN KEY (fk_Motorista_cnh)
    REFERENCES Motorista (cnh)
    ON DELETE CASCADE;
 
ALTER TABLE Viagem ADD CONSTRAINT FK_Viagem_3
    FOREIGN KEY (fk_Onibus_placa)
    REFERENCES Onibus (placa);
 
ALTER TABLE Multa ADD CONSTRAINT FK_Multa_2
    FOREIGN KEY (fk_Viagem_id)
    REFERENCES Viagem (id)
    ON DELETE CASCADE;
 
ALTER TABLE Multa ADD CONSTRAINT FK_Multa_3
    FOREIGN KEY (fk_Onibus_placa)
    REFERENCES Viagem (id);
 
ALTER TABLE Rota ADD CONSTRAINT FK_Rota_2
    FOREIGN KEY (fk_Cidade_id_origem)
    REFERENCES Cidade (id)
    ON DELETE CASCADE;
 
ALTER TABLE Rota ADD CONSTRAINT FK_Rota_3
    FOREIGN KEY (fk_Cidade_id_destino)
    REFERENCES Cidade (id);
 
ALTER TABLE Presenca ADD CONSTRAINT FK_Presenca_1
    FOREIGN KEY (fk_Viagem_id)
    REFERENCES Viagem (id)
    ON DELETE SET NULL;
 
ALTER TABLE Presenca ADD CONSTRAINT FK_Presenca_2
    FOREIGN KEY (fk_Aluno_cpf)
    REFERENCES Aluno (cpf)
    ON DELETE SET NULL;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_1
    FOREIGN KEY (fk_Aluno_cpf)
    REFERENCES Aluno (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_2
    FOREIGN KEY (fk_Rota_id)
    REFERENCES Rota (id)
    ON DELETE SET NULL;
 
ALTER TABLE Responsavel_Aluno ADD CONSTRAINT FK_Responsavel_Aluno_1
    FOREIGN KEY (fk_Responsavel_cpf)
    REFERENCES Responsavel (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE Responsavel_Aluno ADD CONSTRAINT FK_Responsavel_Aluno_2
    FOREIGN KEY (fk_Aluno_cpf)
    REFERENCES Aluno (cpf)
    ON DELETE RESTRICT;