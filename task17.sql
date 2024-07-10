CREATE LOGIN new_user WITH PASSWORD = 'password';
CREATE USER new_user FOR LOGIN new_user;
EXEC sp_addrolemember 'db_owner', 'new_user';
