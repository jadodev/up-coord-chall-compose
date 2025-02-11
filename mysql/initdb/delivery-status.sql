-- Selecciona la base de datos (ajusta el nombre según corresponda)
USE mydb;

-- Elimina la tabla si ya existe (opcional)
DROP TABLE IF EXISTS DeliveryStatus;

-- Crea la tabla DeliveryStatus
CREATE TABLE DeliveryStatus (
  shipmentId VARCHAR(50) NOT NULL,
  currentState VARCHAR(50) NOT NULL,
  currentLocation VARCHAR(255) NOT NULL,
  estimatedDeliveryTime DATETIME NOT NULL,
  lastUpdated DATETIME NOT NULL,
  KEY idx_shipmentId (shipmentId)
);
