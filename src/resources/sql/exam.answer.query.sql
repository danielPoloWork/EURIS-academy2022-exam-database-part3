# POLO DANIEL
# Test DB/SQL 2022
# Part 1 – SQL

# Query: 01.
SELECT Car.licensePlate, Car.brand
FROM AccidentManagement.Car
WHERE Car.engineSize > 2000
    OR Car.power > 120;

# Query 02.
SELECT Owner.firstName, Owner.lastName, Car.licensePlate
FROM AccidentManagement.Owner
    INNER JOIN AccidentManagement.Car ON Car.taxCode = Owner.taxCode
WHERE Car.engineSize > 2000
    OR Car.power > 120;

# Query 03.
SELECT Owner.firstName, Owner.lastName, Car.licensePlate
FROM AccidentManagement.Owner
    INNER JOIN AccidentManagement.Car       ON Car.taxCode = Owner.taxCode
    INNER JOIN AccidentManagement.Insurance ON Insurance.insuranceCode = Car.insuranceCode
WHERE (Car.engineSize > 2000
    OR Car.power > 120)
    AND Insurance.name LIKE '%Name0%';

# Query 04.
SELECT Owner.firstName, Owner.lastName, Car.licensePlate
FROM AccidentManagement.Owner
    INNER JOIN AccidentManagement.Car       ON Car.taxCode = Owner.taxCode
    INNER JOIN AccidentManagement.Insurance ON Insurance.insuranceCode = Car.insuranceCode
WHERE (Car.engineSize > 2000
    OR Car.power > 120)
    AND Insurance.name LIKE '%Name1%'
    AND EXISTS (
        SELECT 1
        FROM AccidentManagement.Car
            INNER JOIN AccidentManagement.CarInvolved ON CarInvolved.licensePlate = Car.licensePlate
            INNER JOIN AccidentManagement.Accident    ON Accident.accidentCode = CarInvolved.accidentCode
            WHERE Accident.accidentDate LIKE '2015-10-15');

# Query 05.
SELECT Insurance.name, Insurance.location, COUNT(Car.insuranceCode) AS insuredCars
FROM AccidentManagement.Insurance
    INNER JOIN AccidentManagement.Car ON Car.insuranceCode = Insurance.insuranceCode
GROUP BY Insurance.name, Insurance.location
ORDER BY insuredCars DESC;

# Query 06.
SELECT Car.brand, Car.licensePlate, COUNT(CarInvolved.licensePlate) AS accidentAmount
FROM AccidentManagement.Car
    INNER JOIN AccidentManagement.CarInvolved ON CarInvolved.licensePlate = Car.licensePlate
GROUP BY Car.brand, Car.licensePlate
HAVING Car.brand LIKE '%Brand0%'
    OR Car.brand LIKE '%Brand1%';

# Query 07.
SELECT Car.licensePlate, Insurance.name, SUM(CarInvolved.damageAmount) AS overAllAmount
FROM AccidentManagement.Insurance
    INNER JOIN AccidentManagement.Car         ON Car.insuranceCode = Insurance.insuranceCode
    INNER JOIN AccidentManagement.CarInvolved ON CarInvolved.licensePlate = Car.licensePlate
GROUP BY Car.licensePlate, Insurance.name
HAVING COUNT(CarInvolved.licensePlate) > 1;

# Query 08.
SELECT Car.licensePlate
FROM AccidentManagement.Car
    INNER JOIN AccidentManagement.CarInvolved ON CarInvolved.licensePlate = Car.licensePlate
    INNER JOIN AccidentManagement.Accident    ON Accident.accidentCode = CarInvolved.accidentCode
WHERE Accident.accidentDate < '2010-10-20'
UNION
SELECT Car.licensePlate
FROM AccidentManagement.Car
	LEFT JOIN AccidentManagement.CarInvolved ON CarInvolved.licensePlate = Car.licensePlate
WHERE Car.licensePlate IS NULL;

# Query 09.
SELECT CarInvolved.accidentCode
FROM AccidentManagement.CarInvolved
    INNER JOIN AccidentManagement.Car ON Car.licensePlate = CarInvolved.licensePlate
WHERE Car.engineSize < 2000;

# Query 10.
CREATE VIEW [viewAccidentAmount] AS
    SELECT Car.licensePlate, Accident.accidentDate, COUNT(CarInvolved.accidentCode) AS accidentAmount
    FROM AccidentManagement.Car
        LEFT JOIN AccidentManagement.CarInvolved ON CarInvolved.licensePlate = Car.licensePlate
        INNER JOIN AccidentManagement.Accident   ON Accident.accidentCode = CarInvolved.accidentCode
    GROUP BY Car.licensePlate, Accident.accidentDate
    HAVING Accident.accidentDate > '2010-10-20'
    ORDER BY accidentAmount DESC
SELECT * FROM [viewAccidentAmount];