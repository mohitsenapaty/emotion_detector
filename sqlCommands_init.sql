create database dharna_app;
create user db_user identified by 'mohit';
grant all on dharna_app.* to 'db_user'@'%';
flush privileges;
