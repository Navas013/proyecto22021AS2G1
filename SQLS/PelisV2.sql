use cinevision;

insert into peliculas(Nombre,Clasificación,Genero,Subtitulado,Idioma,precio, sinopsis, estado) values("Rapidos y Furiosos 9", "T","Acción","Si","Español Latino",50,"Repollo",1);
insert into peliculas(Nombre,Clasificación,Genero,Subtitulado,Idioma,precio, sinopsis, estado) values("Spiderman 3", "T","Acción","Si","Español Latino",30,"Un clásico",1);
insert into peliculas(Nombre,Clasificación,Genero,Subtitulado,Idioma,precio, sinopsis, estado) values("COCO", "E","Aventura","No","Español Latino",40,"Sad",1);
insert into derechos(fkPelicula,estadoDerechos) values (1,1);


/*CREATE TABLE `peliculas` (
  `idPeliculas` int auto_increment,
  `Nombre` varchar(45) DEFAULT NULL,
  `Clasificación` varchar(45) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Subtitulado` varchar(45) DEFAULT NULL,
  `Idioma` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `sinopsis` varchar (100),
  `estado` tinyint default 1,
  PRIMARY KEY (`idPeliculas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;ENGINE=InnoDB DEFAULT CHARSET=utf8;*/


drop database cinevision;
/*Procedure de Insertar Película Actualizado 08-08-2021*/
DELIMITER //
create procedure insertPeli (in nom varchar(40), in  clas varchar(5), in gen varchar(30), in sub varchar(15), in lan varchar(15), in  precio int, in sinoPsis varchar (50), in esTado int, in idP int) BEGIN 
		insert into peliculas (Nombre, Estado, Clasificacion, Genero, Subtitulado, Idioma, precio, sonopsis, estado) values (nom,clas,gen,sub,lan,precio,sinoPsis,esTado);
		INSERT INTO derechos (fkPelicula,estadoDerechos) values (idP,1);
END//

/*Procedures de Consulta*/
/*Consulta Individual*/

DELIMITER //
	CREATE PROCEDURE consultaInpeli (in id int) BEGIN
		select * from peliculas where id = peliculas.idPeliculas;
END//
 /*Consulta General*/
 DELIMITER // 
 CREATE PROCEDURE consultaGenpelis () BEGIN
	select * from peliculas;
END //

/*Procedure para Eliminar*/
DELIMITER // 
CREATE PROCEDURE elimPelis (in id int) BEGIN
	UPDATE peliculas set estado = 0 where id = idPeliculas;
    END//

/*Procedure para Actualizar*/
DELIMITER //
	CREATE PROCEDURE actuPelis (in id int,in nom varchar(40), in  clas varchar(1), in gen varchar(30), in sub varchar(15), in lan varchar(15), in  preciop int, in sinopsisp varchar (50), in estate int)
    UPDATE peliculas set Nombre = nom, Clasificación = clas, Genero = gen, Subtitulado = sub, Idioma = lan, precio = preciop, sinopsis = sinopsisp, estado = estate where id = idPeliculas;
END//    
select * from peliculas;


/*Procedure para obtener el ID de película para los derechos*/
DELIMITER // 
	CREATE PROCEDURE contarD() BEGIN
		select count(*) from derechos;
        END//

/*Procedures del 08-08-2021*/        
/*Procedure para actualizar derechos*/
DELIMITER //
	CREATE PROCEDURE actuDer(in id int) BEGIN
		UPDATE derechos set estadoDerechos = 0 where id = fkPelicula;
        END//
        
/*Consulta individual de derechos*/
	DELIMITER //
		CREATE PROCEDURE consDer(in id int) BEGIN
			select * from derechos where id = fkPelicula;
            END//

/*Consulta general derechos*/
	DELIMITER //
		CREATE PROCEDURE cgDerechos() BEGIN
			SELECT * FROM derechos;
            END//