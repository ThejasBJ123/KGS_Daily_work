### Data query language- SQL

--------------------------
* to display the recouds of a table.
* Major Clause: SELECT
* Conceptually: projection, Selction, Joins

projection:
---------------
 It is a used to a select and display the records present in each specific columns


    Order of execution: 
    -----------------
    1. FROM: It searches the specified table in the current active database and loads to the server.
    2. SELECT: It helps to select and display the records 
        It also helps to display the o/p of experssions
        * (Asterisk) --> indicatesd all the cols
        col_name --> fetches the records only of the specified table


alias Name:
------------
    It is a temporary name that is provided to a column or table that will be used for the active query execution.
* It doesn't affect the original table.

DISTINCT: 
--------------
 it is used to remove the duplicated records under a column of a table.


selection:
----------
    it is used to select and display the records of a table using the combination of col_name and record. 

Experssion: 
-----------
    A stmt that perform an operation.
    +,=, IN, IS, BETWEEN


operator:
--------
     its is a special symbol or a keyword that includes in-built functionality  based on which the operation is performed on val's

TYPES:
--------------
    * Arithmetic --> +, - , *, /, %
    * It is used to perform mathematical operations on values
    * Comparsion / Relationl Op: >, <, = , != ,/ <>, >= , <=
    * IT is used to compare the given 2 val's 
    * LOGICAL op: AND , OR , NOT
        * It is returns boolean val
        * It is used to combine and check multiple Boolean condintions 
            * AND --> it returns True / 1 when given all the coneditions are satisfied 
            * OR -->  IT returns True / 1 When any one 1 condition is satisifed amongst all 
            * NOT  --> IT negates the actual o/p

            