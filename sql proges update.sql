-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS sistema_escolar_proges
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE sistema_escolar_proges;

-- Tabela de usuários
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('gestor', 'professor', 'aluno') NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de gestores
CREATE TABLE gestores (
    id_gestor INT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(20),
    telefone VARCHAR(20),
    endereco TEXT,
    formacao VARCHAR(100),
    data_nascimento DATE,
    FOREIGN KEY (id_gestor) REFERENCES usuarios(id_usuario)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de professores
CREATE TABLE professores (
    id_professor INT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(20),
    telefone VARCHAR(20),
    endereco TEXT,
    formacao VARCHAR(100),
    data_nascimento DATE,
    FOREIGN KEY (id_professor) REFERENCES usuarios(id_usuario)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de turmas
CREATE TABLE turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome_turma VARCHAR(50) NOT NULL,
    horario VARCHAR(20),
    ano_letivo YEAR
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de alunos
CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY auto_increment,
    nome_completo VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    cpf CHAR(11),
    rg VARCHAR(20),
    data_nascimento DATE,
    endereco TEXT,
    telefone VARCHAR(20),
    email_pessoal VARCHAR(100),
    turma_id INT
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de responsáveis
CREATE TABLE responsaveis (
    id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    nome_completo VARCHAR(100) NOT NULL,
    cpf CHAR(11),
    rg VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(100),
    grau_parentesco VARCHAR(50),
    endereco TEXT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de disciplinas
CREATE TABLE disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(50) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Relacionamento turma-professor-disciplina
CREATE TABLE turma_professor_disciplina (
    id_turma INT,
    id_professor INT,
    id_disciplina INT,
    PRIMARY KEY (id_turma, id_professor, id_disciplina),
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de notas
CREATE TABLE notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_disciplina INT,
    bimestre TINYINT NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de frequência
CREATE TABLE frequencias (
    id_frequencia INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_disciplina INT,
    data DATE NOT NULL,
    presente BOOLEAN NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de avisos
CREATE TABLE avisos (
    id_aviso INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_envio DATE NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Tabela de cardápios
CREATE TABLE cardapios (
    id_cardapio INT PRIMARY KEY AUTO_INCREMENT,
    segunda varchar(30),
    terca varchar(30),
    quarta varchar(30),
    quinta varchar(30),
    sexta varchar(30)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
select * from usuarios;
