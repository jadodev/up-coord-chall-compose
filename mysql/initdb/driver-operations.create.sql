-- Selecciona la base de datos (asegúrate de que coincida con la usada en tu contenedor)
USE mydb;

-- Si la tabla ya existe, se elimina para tener un script limpio (opcional)
DROP TABLE IF EXISTS DriverStatus;

-- Creación de la tabla DriverStatus
CREATE TABLE IF NOT EXISTS DriverStatus (
  driverStatusId VARCHAR(50) NOT NULL,
  driverId        VARCHAR(50) NOT NULL,
  vehicleType     VARCHAR(50) NOT NULL,
  totalCapacity   DOUBLE NOT NULL,
  averageSpeed    DOUBLE NOT NULL,
  averageConsump  DOUBLE NOT NULL,
  currentLocation VARCHAR(255) NOT NULL,
  availableCapacity DOUBLE NOT NULL,
  transportState  VARCHAR(50) NOT NULL,
  longCoordinate  DOUBLE NOT NULL,
  latCoordinate   DOUBLE NOT NULL,
  currentGridZone VARCHAR(50) NOT NULL,
  lastUpdated     DATETIME NOT NULL,
  PRIMARY KEY (driverStatusId)
);

-- Inserción de registros de ejemplo para conductores (DriverStatus)
INSERT INTO DriverStatus (
  driverStatusId, driverId, vehicleType, totalCapacity, averageSpeed, averageConsump,
  currentLocation, availableCapacity, transportState, longCoordinate, latCoordinate,
  currentGridZone, lastUpdated
) VALUES
  (
    'DS-001', 'DR-001', 'Truck', 10000, 60, 15.5,
    'Warehouse A', 8000, 'In Transit', 10, 20,
    'ZoneA', '2025-03-01 10:00:00'
  ),
  (
    'DS-002', 'DR-002', 'Van', 3000, 50, 10,
    'Depot B', 1500, 'Idle', 50, 70,
    'ZoneB', '2025-03-01 11:30:00'
  ),
  (
    'DS-003', 'DR-003', 'Bike', 200, 25, 5,
    'City Center', 200, 'Active', 70, 80,
    'ZoneD', '2025-03-01 12:00:00'
  ),
  (
    'DS-004', 'DR-001', 'Truck', 10000, 60, 15.5,
    'Warehouse A', 8000, 'In Transit', 10, 20,
    'ZoneA', '2025-03-01 10:00:00'
  ),
  (
    'DS-005', 'DR-002', 'Van', 3000, 50, 10,
    'Depot B', 1500, 'Idle', 50, 70,
    'ZoneB', '2025-03-01 11:30:00'
  ),
  (
    'DS-006', 'DR-003', 'Bike', 200, 25, 2,
    'City Center', 200, 'Active', 70, 80,
    'ZoneD', '2025-03-01 12:00:00'
  ),
  (
    'DS-007', 'DR-001', 'Truck', 10000, 60, 15.5,
    'Warehouse A', 8000, 'In Transit', 20, 40,
    'ZoneA', '2025-03-01 10:00:00'
  ),
  (
    'DS-008', 'DR-002', 'Van', 3000, 50, 10,
    'Depot B', 1500, 'Idle', 40, 40,
    'ZoneB', '2025-03-01 11:30:00'
  ),
  (
    'DS-009', 'DR-003', 'Bike', 200, 25, 5,
    'City Center', 200, 'Active', 30, 10,
    'ZoneD', '2025-03-01 12:00:00'
  ),
  (
    'DS-010', 'DR-001', 'Truck', 10000, 60, 15.5,
    'Warehouse A', 8000, 'In Transit', 80, 20,
    'ZoneA', '2025-03-01 10:00:00'
  ),
  (
    'DS-011', 'DR-002', 'Van', 3000, 50, 10,
    'Depot B', 1500, 'Idle', 50, 10,
    'ZoneB', '2025-03-01 11:30:00'
  ),
  (
    'DS-012', 'DR-003', 'Bike', 200, 25, 2,
    'City Center', 200, 'Active', 20, 80,
    'ZoneD', '2025-03-01 12:00:00'
  );
