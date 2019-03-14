CREATE TABLE member
(
	member_id             INTEGER  NOT NULL ,
	name                  VARCHAR(10)  NULL ,
	pwd                   VARCHAR(16)  NULL ,
	tel                   VARCHAR(11)  NULL ,
	email                 VARCHAR(50)  NULL ,
	birth_date            VARCHAR(8)  NULL ,
	date                  TIMESTAMP  NULL,
	email_check           BOOLEAN  NULL

);

INSERT INTO member VALUES (82202353,'¿Ãº“øµ','123','01012345678','abc@gmail.com','19950821',
'2019-03-15 15:42:39.0',true
)