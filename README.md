# Embassy Management System (CMPS 244 MWF @ 8:00)

## Group Name and Members
### Peter Chen’s Group:
- Haidar Yasine
- Hadi Dabbouk
- Faysal Shlash
- Mustapha Harb

## Introduction
A database is a collection of data that is organized and maintained electronically. The purpose of this project is to develop a database system to store and manage information related to an Embassy. The system will be designed to meet the needs of the embassy employees and to ensure that the data is well stored, maintained, and accessed efficiently without the hassle of purchasing multiple softwares to run the embassy operations. It is mainly a hub that contains all necessary information to run the embassy from any desktop.

## Entities and Relationships
### Entities
The following entities will be maintained in the database system:
1. **Employees**: Different employees of the embassy including Ambassador, Diplomats, Foreign Service Officer, Security guards, and Translators.
2. **Citizens**: People having the citizenship of the country the embassy is representing.
3. **Residents**: Residents of the host country who apply for a visa at the embassy.
4. **Visas**: Different types of visas offered to the host country citizens.
5. **Addresses**: Each citizen has an address.
6. **Departments**: Operating departments at the embassy.
7. **Properties**: Possessions of the citizens.

### Relationships
- A citizen has one or more addresses.
- A department is managed by an employee.
- A citizen should have one visa.
- A resident should have an address.
- A citizen may have one or more properties.
- A resident may have one or more properties.

## Constraints
The following constraints apply to the entities and relationships in the database system:
- Employee phone number must be unique.
- Citizen phone number must be unique.
- Visa number must be unique.
- Resident visa application number must be unique.
- Address real-estate property number is unique.
- Properties owner and number is unique.
- Departments name is unique.
- Departments should be managed by one employee.
- A department will not exist if no employees work in it.

## Example Queries
- List of all citizens in the country and their addresses.
- All the employees working in a specific department.
- Citizens living in a specific area of the country.
- List of all pending visas application.
- List of all properties owned by citizens.

## Conclusion
In conclusion, the database system described in this document will store and manage information related to an embassy. The system will maintain information about the citizens, residents, addresses, visas etc., and the relationships between these entities. The database will be designed to meet the needs of the embassy, and the data will be stored, maintained, and retrieved efficiently. The constraints and example queries described in this document will provide guidance on how to use the database system to meet the needs of the embassy.

## Code Overview
The system is implemented using MySQL. The SQL code includes the creation of tables like `Department`, `Employee`, `Address`, `Visitor`, `Apply_for`, `Visa`, `Resident`, `Property`, and `Dependent`. It also contains commands to populate these tables with sample data, set up necessary foreign key relationships, create indices for performance optimization, and define several views for easier data retrieval.

### Database Setup
```sql
-- Database creation and table definitions here
