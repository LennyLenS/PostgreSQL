CREATE TABLE country(
	id integer PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE patient(
	first_name varchar(200) NOT NULL,
	second_name varchar(200) NOT NULL,
	third_name varchar(200) NOT NULL,
	card_number integer NOT NULL PRIMARY KEY
		check(card_number < 1000000000000000),
	polis_number integer UNIQUE 
		CHECK(polis_number >= 0 and polis_number <= 1000000000),
	reason varchar(2000) NOT NULL DEFAULT 'черепно-мозговая травма',
	diagnosis varchar(2000) NOT NULL,
	UNIQUE(first_name, second_name, third_name),
	country_id integer REFERENCES country(id) NOT NULL
);