DROP DATABASE IF EXISTS person;
CREATE DATABASE IF NOT EXISTS person; 
USE person;

DROP TABLE IF EXISTS personal_data,
					 address;

CREATE TABLE address(
	post_code		INT 			NOT NULL,
    city			VARCHAR(20)		NOT NULL,
    street			VARCHAR(40) 	NOT NULL,
    bld_no			INT				NOT NULL,
	PRIMARY KEY (post_code)
);


CREATE TABLE personal_data (
	national_code		BIGINT 			NOT NULL,
    first_name			VARCHAR(20) 	NOT NULL,
    last_name			VARCHAR(20)		NOT NULL,
    post_code			INT 			NOT NULL,
    gender				ENUM('M','F')	NOT NULL,
    birth_date			DATE 			NOT NULL,
    
    FOREIGN KEY (post_code) REFERENCES address (post_code) ON DELETE CASCADE,
    PRIMARY KEY (national_code)
);
SELECT * FROM personal_data;
SELECT * FROM address;
	