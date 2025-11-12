CREATE DATABASE FlightsDB;
USE FlightsDB;
DROP TABLE IF EXISTS Flights;
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    airline VARCHAR(50) NOT NULL,
    source VARCHAR(30),
    destination VARCHAR(30),
    fare INT DEFAULT 10000 CHECK (fare <= 20000)
);
INSERT INTO Flights (airline, source, destination, fare) VALUES
('Air India', 'Delhi', 'Mumbai', 12500),
('Indigo', 'Bangalore', 'Chennai', 3500),
('Vistara', 'Mumbai', 'Delhi', 18000);
INSERT INTO Flights (airline, source, destination) VALUES
('SpiceJet', 'Delhi', 'Goa');
SELECT * FROM Flights WHERE fare > 10000;
SELECT * FROM Flights WHERE source = 'Delhi' OR fare < 5000;
SELECT DISTINCT airline FROM Flights;
SELECT flight_id, airline, fare FROM Flights ORDER BY fare DESC LIMIT 2;
SELECT * FROM Flights WHERE fare BETWEEN 8000 AND 15000 ORDER BY fare ASC;
SELECT source, COUNT(flight_id) AS Flight_Count FROM Flights GROUP BY source;
SELECT flight_id, airline, fare FROM Flights ORDER BY fare DESC LIMIT 1;