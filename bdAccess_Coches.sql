CREATE DATABASE rent_a_car;
USE rent_a_car;

CREATE TABLE distribuidores(
codigo_distribuidor VARCHAR(20) NOT NULL,
direccion VARCHAR(30) NOT NULL,
ciudad VARCHAR(15) NOT NULL,
telefono VARCHAR (10) NOT NULL,
direccion_internet VARCHAR (100) NOT NULL,
PRIMARY KEY (codigo_distribuidor)
);

CREATE TABLE flota(
matricula VARCHAR(10) NOT NULL,
marca VARCHAR(20) NOT NULL,
modelo VARCHAR(20) NOT NULL,
marca_español BOOLEAN NOT NULL,
fecha_compra DATE NOT NULL,
precio_diario FLOAT NOT NULL,
codigo_distribuidor VARCHAR(20) NOT NULL,
PRIMARY KEY (matricula),
FOREIGN KEY (codigo_distribuidor) REFERENCES distribuidores(codigo_distribuidor)
);

CREATE TABLE alquileres(
numero_servicio int AUTO_INCREMENT,
matricula VARCHAR(10) NOT NULL,
fecha_salida DATE NOT NULL,
fecha_entrada DATE NOT NULL,
dni_usuario VARCHAR(10) NOT NULL,
telefono_usuario VARCHAR(10) NOT NULL,
observaciones VARCHAR(100),
PRIMARY KEY (numero_servicio),
FOREIGN KEY (matricula) REFERENCES flota (matricula)
);

INSERT INTO flota
VALUES('GC-4328-CC','OPEL','CORSA',FALSE,'98-11-02',3500,'FLICK CANARIAS'),
	 ('M-5423-VB','BMW','635',FALSE,'99-02-01',8300,'OTAYSA'),
     ('GC-1843-BZ','SEAT','IBIZA',TRUE,'98-12-19',3600,'CANAUTO'),
     ('GC-9943-CC','TOYOTA','LAND CRUISER',FALSE,'99-01-04',8000,'TOYOTA CANARIAS'),
     ('M-3451-XD','SEAT','IBIZA',TRUE,'99-02-03',3150,'AUTOS CASTILLA'),
     ('GC-6634-CC','MERCEDES','190',FALSE,'99-01-04',7575,'CANAUTO');
     
INSERT INTO distribuidores
VALUES('FLICK CANARIAS','AV.ESCALERAS,40','LAS PALMAS DE G.C.','928-357211','www.flick.es'),    
     ('OTAYSA','C/SERRANO 23','MADRID','91-4453214','www.otaysa.es'),    
     ('CANAUTO','AV.CANARIAS,44','VECINDARIO','928-344322','www.canauto.es'),   
     ('TOYOTA CANARIAS','C/TOMAS MORALES 7','LAS PALMAS DE G.C.','928-354319','www.toyota.com'),   
     ('AUTOS CASTILLA','PASEO CASTELLANA 9','MADRID','91-4429914','www.autos-cast.es');
     
INSERT INTO alquileres
VALUES ('GC-4328-CC','99-02-01','99-02-04','42.500.126','928-234512','ROTA UNA LUNA'), 
	  ('GC-6634-CC','99-02-06','99-02-11','43.235.125','928-511955',' '),    
      ('M-3451-XD','99-02-09','99-02-10','56.432.555','616-542975',' '),
      ('GC-1843-BZ','99-02-23','99-02-26','19.235.199','616-653466',' '),
      ('M-5423-VB','99-03-02','99-03-05','42.500.126','928-234512',' '),
      ('GC-9943-CC','99-03-07','99-03-20','56.432.555','616-542975','CAMBIAR ACEITE'),
      ('GC-9943-CC','99-03-25','99-03-30','42.500.126','928-234512',' '),
      ('M-3451-XD','99-04-0','99-04-06','44.112.765','606-431955',' '),
      ('GC-4328-CC','99-04-04','99-04-09','23.119.654','928-551987',' '),
      ('GC-1843-BZ','99-04-30','99-05-05','44.112.765','606-431955','MOTOR QUEMADO'),
      ('GC-6634-CC','99-05-16','99-05-20','56.432.555','616-542975',' '),
      ('M-3451-XD','99-05-30','99-06-03','19.235.199','616-653466',' '),
      ('GC-9943-CC','99-06-05','99-06-10','19.235.199','616-653466',' '),
      ('GC-1843-BZ','99-06-11','99-06-14','56.432.555','616-542975','LLEVAR AL DESGUACE');
