# Normalization (3NF)



Each table meets 3NF because every non-key column depends only on the PK, on the whole PK, and on nothing but the PK

## Table by table

| Table | Key | Non-key columns | Depends on | Meets 3NF? Why |
|---|---|---|---|---|
| Employee | EmployeeID | BossID, Name, Surname | EmployeeID | Yes: all columns describe the employee itself. BossID is a foreign key to the boss's EmployeeID. |
| Client | ClientID | Name, Surname, Email | ClientID | Yes: all columns describe the client. Email is UNIQUE and NOT NULL, so it is a candidate key and depending on it does not break 3NF. |
| Service | ServiceID | Name, Price | ServiceID | Yes: both columns describe the service in the catalog (Price is the current catalog price). |
| Visit | VisitID | EmployeeID, ClientID, VisitDate | VisitID | Yes: all columns describe this visit. Only foreign keys are stored, so there is no transitive dependency. |
| VisitService | VisitID, ServiceID | Price | The whole key (VisitID + ServiceID) | Yes: Price is the amount charged for that service in that visit. In the seed data, Haircut is charged 25 in visit 1 while the catalog price is 20, so it depends on the whole key, not on ServiceID alone. |

## 

## 

## Design Decisions:

### 

### Why VisitService is a weak entity : VisitService is a weak entity because it depends on another entity, this entity being Visit. Even though both Visit and Service are FK and form the PK, If a Visit row is deleted, it makes no sense to have a service charged on a visit that doesn't exist. The automatic deletion of VisitService when deleting Visit is disabled, and the FKs don't have ON DELETE CASCADE. This keeps the history intact.

### 

### 

### Why the price is stored in VisitService: Service.Price is the current catalog price. VisitService.Price is the price actually charged in that visit. Storing both does not break 3NF because they are different pieces of data: the charged price depends on the whole key and cannot be derived from the catalog price, which may change later.


### 

### 

### How the boss is identified : BossID is a foreign key to Employee.EmployeeID (a self-reference). Each employee reports to the employee whose EmployeeID matches their BossID. The top boss has a NULL BossID. The model only stores the current boss, not who the boss was at each date.

