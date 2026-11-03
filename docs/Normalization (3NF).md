# Normalization (3NF)



Each table meets 3NF because every non-key column depends only on the PK, on the whole PK, and on nothing but the PK



Table by table | Table | Key | Non-key columns | Depends on |  Meets 3NF? Why
| |---|---|---|---|---| |
| Employee | EmployeeID | BossID | Name | Surname | Yes: All columns describe the employee itself|
| Client | ClientID | Name | Surname | Email | Yes: All columns describe the client itself |
| Service | ServiceID | Name | Price | Yes: All columns describe service |
|Visit | VisitID | EmployeeID | ClientID | Yes: All columns describe visit |  
| VisitService | VisitID | ServiceID | Price |  Yes: All columns describe the history of visits |

## 

## 

## Design Decisions:

### 

### Why VisitService is a weak entity : VisitService is a weak entity because it depends on another entity, this entity being Visit. Even though both Visit and Service are FK and form the PK, If a Visit row is deleted, it makes no sense to have a service charged on a visit that doesn't exist. The automatic deletion of VisitService when deleting Visit is disabled, and the FKs don't have ON DELETE CASCADE. This is to keep the history intact.

### 

### 

### Why the price is stored in VisitService: The price is stored in both VisitService and Service because the one in Service is a catalog, showing the current prices, while the price in VisitService shows the historical price of the service on that date. It doesn’t break 3NF because the charged price is a different piece of data, it’s not derived from the catalog price.

### 

### 

### How the boss is identified : Boss is identified using BossID. Employees report to the EmployeeID that matches their BossID, owner having NULL BossID.

