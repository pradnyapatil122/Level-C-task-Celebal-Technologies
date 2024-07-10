INSERT INTO TargetTable (KeyColumn, Column1, Column2)
SELECT KeyColumn, Column1, Column2
FROM SourceTable
WHERE NOT EXISTS (
    SELECT 1
    FROM TargetTable
    WHERE TargetTable.KeyColumn = SourceTable.KeyColumn
);