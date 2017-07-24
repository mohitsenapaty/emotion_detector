use dharna_app;
create table student_login(student_id MEDIUMINT NOT NULL AUTO_INCREMENT, username VARCHAR(100) NOT NULL UNIQUE, password VARCHAR(100) NOT NULL, PRIMARY KEY (student_id));
create index student_id on student_login(student_id);
create index std_username on student_login(username);
create table teacher_login(teacher_id MEDIUMINT NOT NULL AUTO_INCREMENT, username VARCHAR(100) NOT NULL UNIQUE, password VARCHAR(100) NOT NULL, PRIMARY KEY (teacher_id));
create index teacher_id on teacher_login(teacher_id);
create index tcr_username on teacher_login(username);
create table school_details(school_id MEDIUMINT NOT NULL AUTO_INCREMENT, school_name VARCHAR(200) NOT NULL, city VARCHAR(100), district VARCHAR(100), state VARCHAR(100), pin VARCHAR(10), PRIMARY KEY(school_id));
create index school_id on school_details(school_id);
create table entity_table(entity_id MEDIUMINT NOT NULL AUTO_INCREMENT, class INT NOT NULL, section VARCHAR(5), PRIMARY KEY (entity_id));
create unique index entity_param on entity_table(class, section);
create table student_detail(student_id MEDIUMINT NOT NULL UNIQUE, first_name VARCHAR(50) NOT NULL, middle_name VARCHAR(50), last_name VARCHAR(50) NOT NULL, school_id MEDIUMINT NOT NULL, entity_id MEDIUMINT NOT NULL, phone VARCHAR(12) UNIQUE, email VARCHAR (100) UNIQUE, CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student_login(student_id), CONSTRAINT fk_school_id FOREIGN KEY (school_id) REFERENCES school_details(school_id), CONSTRAINT fk_entity_id FOREIGN KEY (entity_id) REFERENCES entity_table(entity_id));
create index student_id1 on student_detail(student_id);
ALTER TABLE student_detail ADD id INT PRIMARY KEY AUTO_INCREMENT;
create table teacher_detail(teacher_id MEDIUMINT NOT NULL UNIQUE, first_name VARCHAR(50) NOT NULL, middle_name VARCHAR(50), last_name VARCHAR(50) NOT NULL, school_id MEDIUMINT, phone VARCHAR(12) UNIQUE, email VARCHAR (100) UNIQUE, CONSTRAINT fkt_teacher_id FOREIGN KEY (teacher_id) REFERENCES teacher_login(teacher_id), CONSTRAINT fkt_school_id FOREIGN KEY (school_id) REFERENCES school_details(school_id));
create index teacher_id1 on teacher_detail(teacher_id);
ALTER TABLE teacher_detail ADD id INT PRIMARY KEY AUTO_INCREMENT;

