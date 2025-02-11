-- create_shipment_table.sql

CREATE TABLE IF NOT EXISTS Shipment (
  shipmentId VARCHAR(50) NOT NULL,
  customerId VARCHAR(50) NOT NULL,
  weight DOUBLE NOT NULL,
  shipmentType VARCHAR(50) NOT NULL,
  origin VARCHAR(100) NOT NULL,
  destination VARCHAR(100) NOT NULL,
  depositDate DATETIME NOT NULL,
  height DOUBLE NOT NULL,
  width DOUBLE NOT NULL,
  length DOUBLE NOT NULL,
  PRIMARY KEY (shipmentId)
);
