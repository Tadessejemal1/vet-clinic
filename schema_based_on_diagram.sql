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
    patient_id int reference patients(id),
    status varchar(60),
    primary key(id)
);

create table invoices(
    id int generated always as identity,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id  int reference medical_histories(id),
    primary key(id)
);

create table invoices_items(
    id int generated always as identity,
    unit_price decimal,
    quantity  int,
    total_price  decimal,
    invoice_id  int reference invoices(id),
    treatment_id int reference treatments(id),
    primary key(id)
);

create table treatments(
    id int generated always as identity,
    type varchar(60),
    name varchar(60),
    primary key(id)
);


/* FK indexes */

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_has_treatments (medical_history_id);
CREATE INDEX ON medical_histories_has_treatments (treatment_id);
