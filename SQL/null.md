### NOT NULL 
-------------

 this constriant will restrict the user from not entering a value.


 ### unique 
 ---------------

 - This constraints will restrict the user to enter a  duplicate value into the same column of a table.
 - NULL val's are allowed



# LIKE OPERATOR --> IT IS USED OF PATTERN MATCHING 

% --> OR ANY NUM OF CHARACTERS
_ --> Exactly single charcter


SUB QUERY OPERATOR




### FUNCTIONS 
Block of code to perform a specific task 
types: 
1. single row function 
2. multi row function / aggregate function / group function 
    a. sum()
    b. AVG()
    C. COUNT()
    D. MAX()
    E. MIN ()

    - IT ACCEPTS MULTIPLE I/p's but provides a single o/p 
    - when used in select query , then only the col passed will be considered, no other col names are allowed


    



3. SELECT (BNAME || '  is a  famous book') AS  sentence form books 
WHERE BNAME IS NOT NULL;

DROP TABLE TRIAL;
CREATE TABLE TRIAL(
    TID INT,
    TNAME VARCHAR(20),
    TAMT Decimal(10, 2),
    TQTY INT,
    TQTY1 VARCHAR(5)
);



### sub queries:
     - query inside a query 