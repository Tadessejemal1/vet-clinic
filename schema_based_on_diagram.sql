/* Creating tables for clinic database and primery keys*/

create table patients(
id int generated always as identity,
name varchar(60),
date_of_birth date,
primary key(id)
)

create table medical_histories(
id int generated always as identity,
admitted_at timestamp,
patient_id int,
status varchar(60),
primary key(id)
);

create table invoices(
id int generated always as identity,
total_amount decimal,
generated_at timestamp,
payed_at timestamp,
medical_history_id  int,
primary key(id)
);

create table invoices_items(
id int generated always as identity,
unit_price decimal,
quantity  int,
total_price  decimal,
invoice_id  int,
treatment_id int,
primary key(id)
);

create table treatments(
id int generated always as identity,
type varchar(60),
name varchar(60),
primary key(id)
);

/*Creating  foreign keys for the relationship between one to many tables */

ALTER TABLE patients ADD FOREIGN KEY (id) REFERENCES medical_histories(id);
ALTER TABLE invoices ADD FOREIGN KEY (id) REFERENCES invoices_items(id);

/* transition table between medical_histories and treatments */

create table medical_form();

/*Creating  foreign keys for the relationship between many to many tables */

ALTER TABLE medical_form ADD COLUMN medical_histories_id INT REFERENCES medical_histories(id);
ALTER TABLE medical_form ADD COLUMN treatments_id INT REFERENCES treatments(id);

/* FK indexes */

CREATE INDEX patients_refid ON patients(id);
CREATE INDEX invoices_refid ON invoices(id);
CREATE INDEX treatment_refid ON treatments(id);
CREATE INDEX medical_histories_refid ON medical_histories(id);
