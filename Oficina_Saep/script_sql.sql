
CREATE DATABASE IF NOT EXISTS oficina_pro
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE oficina_pro;

-- TABELA DE USUÁRIOS
CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    email_verified_at TIMESTAMP NULL,
    password VARCHAR(255) NOT NULL,
    remember_token VARCHAR(100) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- TABELA DE TUTORES
CREATE TABLE tutores (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf TEXT NULL,
    email VARCHAR(255) NULL,
    telefone VARCHAR(20) NULL,
    cidade VARCHAR(100) NULL,
    endereco VARCHAR(255) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- TABELA DE PETS
CREATE TABLE pets (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tutor_id BIGINT UNSIGNED NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(100) NOT NULL,
    raca VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    CONSTRAINT fk_pets_tutores
    FOREIGN KEY (tutor_id)
    REFERENCES tutores(id)
    ON DELETE CASCADE
);

-- TABELA DE AGENDAMENTOS
CREATE TABLE agendamentos (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tutor_id BIGINT UNSIGNED NOT NULL,
    pet_id BIGINT UNSIGNED NOT NULL,
    data_agendamento DATETIME NOT NULL,
    servico VARCHAR(150) NOT NULL,
    descricao TEXT NULL,
    status ENUM(
        'Agendado',
        'Em andamento',
        'Concluído',
        'Cancelado'
    ) NOT NULL DEFAULT 'Agendado',
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    CONSTRAINT fk_agendamentos_tutores
    FOREIGN KEY (tutor_id)
    REFERENCES tutores(id)
    ON DELETE CASCADE,

    CONSTRAINT fk_agendamentos_pets
    FOREIGN KEY (pet_id)
    REFERENCES pets(id)
    ON DELETE CASCADE
);
