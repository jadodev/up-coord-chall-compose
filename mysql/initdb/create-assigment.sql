-- Selecciona la base de datos (ajusta el nombre según tu entorno)
USE mydb;

-- Elimina la tabla si ya existe (opcional)
DROP TABLE IF EXISTS Assignment;

-- Crea la tabla Assignment con las columnas necesarias
CREATE TABLE Assignment (
  assignmentId VARCHAR(50) NOT NULL,
  shipmentId   VARCHAR(50) NOT NULL,
  driverId     VARCHAR(50) NOT NULL,
  assignedAt   DATETIME   NOT NULL,
  score        DOUBLE     NOT NULL,
  PRIMARY KEY (assignmentId)
);
