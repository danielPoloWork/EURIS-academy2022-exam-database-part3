# EURIS Academy 2022
## Database Exam Part 3

### SQL
Given the following relational scheme for accidents management:
- **CAR** (**licensePlate**, brand, engineSize, power, owner, insurance)
- **OWNER** (**taxCode**, name, surname, address)
- **INSURANCE** (**insuranceCode**, name, location)
- **ACCIDENT** (**accidentCode**, location, date)
- **CAR INVOLVED** (**accident**, **car**, damageAmount)

Write SQL queries that return the following information: 
1. Find the license plate and the brand of cars with an engine size greater than 2000 cc or a power greater than 120 hp
2. Find the names of the owners and the license plate of their cars with an engine size greater than 2000 cc or a power greater than 120 hp
3. Find the license plate and the names of the owners of cars with an engine size greater than 2000 cc or a power greater than 120 hp, insured with 'Name0' 
4. Find the license plate and names of the owners of the cars insured with 'Name1' and those who were involved in accidents on October 15, 2015
5. Find for each insurance, the name, location and number of insured cars
6. Find the license plate and the number of accidents for cars with 'Brand0' and 'Brand1' brand in which those were involved 
7. Find the license plate of the car, the name of the insurance and the total damage reported for each car involved in more than one accident (NB: use the function sum(*) in a similar way to count(*))
8. Find the license plate of cars that were not involved in accidents after October 20, 2010
9. Find the accident code in which cars with an engine size of less than 2000 cc have not been involved
10. Create a view of your choice (not among the queries above)

# Before starting some advice:

- Try the queries, if you can not make them work in any way write those anyway, if the idea is correct is a good starting point, which will be evaluated positively;
- The scheme of the DB to be designed is a suggestion, you can follow it, but if you have other ideas you can implement them (watch out for time though);
- Google is the best tool to find a solution to a problem, knowing how to use it well is essential to solve unexpected issues every day;