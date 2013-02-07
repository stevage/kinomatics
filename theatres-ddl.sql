CREATE TABLE theater (
theater_id int(10) NOT NULL,
theater varchar(200),
theater_address varchar(200),
theater_adult char(1),
theater_adult_bargain char(1),
theater_adult_super char(1),
theater_attributes char(1),
theater_child char(1),
theater_child_bargain char(1),
theater_child_super char(1),
theater_city char(19),
theater_closed_reason char(1),
theater_country char(3),
theater_county varchar(30),
theater_desc char(1),
theater_extra char(1),
theater_lat char(9),
theater_location varchar(200),
theater_lon char(9),
theater_market varchar(50),
theater_name varchar(100),
theater_phone varchar(20),
theater_price_comment varchar(200),
theater_screens char(2),
theater_seating char(1),
theater_senior char(1),
theater_senior_bargain char(1),
theater_senior_super char(1),
theater_special_bargain char(1),
theater_state varchar(200),
theater_ticketing char(1),
theater_types char(1),
theater_zip varchar(10),

source_country char(3),
source_file varchar(50),

PRIMARY KEY (theater_id)
);


CREATE TABLE theater_types (
ID char(3),
theater_ID char(3),
theater_types char(1),
type char(7)
);

