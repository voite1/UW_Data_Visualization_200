
SELECT *
FROM table1


SELECT *
FROM table2

SELECT * 
FROM table1
INNER JOIN table2 
    ON table1.join_field = table2.join_field


SELECT * 
FROM table1
LEFT OUTER JOIN table2 
    ON table1.join_field = table2.join_field


SELECT * 
FROM table1
RIGHT OUTER JOIN table2 
    ON table1.join_field = table2.join_field


SELECT * 
FROM table1
FULL OUTER JOIN table2 
    ON table1.join_field = table2.join_field


SELECT * 
FROM table1
LEFT OUTER JOIN table2 
    ON table1.join_field = table2.join_field
WHERE table2.join_field IS NULL


SELECT * 
FROM table1
UNION
SELECT *
FROM table2