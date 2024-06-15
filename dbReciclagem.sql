drop database dbReciclagem;

create database dbReciclagem;

use database dbReciclagem;


CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    CPF VARCHAR(14 )PRIMARY KEY,
    Endereco VARCHAR(255),
    Senha VARCHAR(255)
);

CREATE TABLE ItensResgatados (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    Descricao VARCHAR(255),
    DataResgate DATETIME,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Recompensas (
    RecompensaID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(255),
    Descricao VARCHAR(255),
    PontosNecessarios INT
);


CREATE TABLE PontosUsuarios (
    UsuarioID INT,
    Pontos INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);


CREATE TABLE Login (
    UsuarioID INT,
    Email VARCHAR(255),
    Senha VARCHAR(255),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);
