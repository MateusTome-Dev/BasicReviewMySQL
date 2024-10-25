CREATE DATABASE rosaplane;

USE rosaplane;

CREATE TABLE destinos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_destino VARCHAR(100),
    pais VARCHAR(40),
    descricao VARCHAR(100)
);
CREATE TABLE pacotes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	idDestino INT,
	FOREIGN KEY (idDestino) REFERENCES destinos(id),
    nome_pacote VARCHAR(100),
    preco DOUBLE,
    data_inicio DATE,
    data_termino DATE
);
CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_cliente VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(100)
);
CREATE TABLE reservas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idCliente INT,
	idPacote INT,
    FOREIGN KEY (idCliente) REFERENCES clientes(id),
    FOREIGN KEY (idPacote) REFERENCES pacotes(id),
    data_reserva DATE,
    quantidade_pessoas INT,
    status_reserva ENUM('confirmada',' pendente','cancelada')
);
INSERT INTO Destinos (nome_destino,pais,descricao)
VALUES ("Jurerê","Brasil","Bom lugar para viajar");
 
INSERT INTO Destinos (nome_destino,pais,descricao)
VALUES ("Roma","Itália","Melhor lugar para viajar");
 
INSERT INTO Pacotes (nome_pacote,preco,data_inicio,data_termino,idDestino)
VALUES ("Viagem dos sonhos",5000,'2025-05-01','2025-06-01',1);
 
INSERT INTO Pacotes (nome_pacote,preco,data_inicio,data_termino,idDestino)
VALUES ("Melhor viagem",10000,'2025-08-10','2025-10-15',2);
 
INSERT INTO Clientes (nome_cliente,email,telefone,endereco)
VALUES ("Claudio","claudio@gmail.com","11 952253532","Rua Ana Rosa");
 
INSERT INTO Clientes (nome_cliente,email,telefone,endereco)
VALUES ("Lucas","lucas@gmail.com","11 21312421421","Rua Saint Moritz");
 
INSERT INTO Reservas (data_reserva,quantidade_pessoas,status_reserva,idCliente,idPacote)
VALUES ('2025-05-01',3,"confirmada",1,1);
 
INSERT INTO Reservas (data_reserva,quantidade_pessoas,status_reserva,idCliente,idPacote)
VALUES ('2025-08-10',3,"pendente",2,2);

CREATE VIEW visualizar_cliente_pacote_destino_reserva AS
SELECT 
    r.id AS reserva_id,
    c.nome_cliente,
    p.nome_pacote,
    d.nome_destino,
    r.data_reserva,
    r.quantidade_pessoas,
    r.status_reserva
FROM reservas r
JOIN clientes c ON r.idCliente = c.id
JOIN 
    pacotes p ON r.idPacote = p.id
JOIN 
    destinos d ON p.idDestino = d.id;
    
    SELECT * FROM visualizar_cliente_pacote_destino_reserva;

