WITH NodeTypes AS (
    SELECT N, 
           P, 
           CASE 
               WHEN P IS NULL THEN 'Root'
               WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
               ELSE 'Inner'
           END AS NodeType
    FROM BST
)
SELECT N, NodeType
FROM NodeTypes
ORDER BY N;