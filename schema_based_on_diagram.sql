CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE
);

CREATE TABLE invoices (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INTEGER REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INTEGER REFERENCES patients(id),
    status VARCHAR
);

CREATE TABLE invoice_items (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INTEGER,
    total_price DECIMAL,
    invoice_id INTEGER REFERENCES invoices(id),
    treatment_id INTEGER REFERENCES treatments(id)
);

CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE medical_histories_treatments (
    medical_history_id INTEGER REFERENCES medical_histories(id);
    treatment_id INTEGER REFERENCES treatments(id)
);

CREATE INDEX medical_history_index ON medical_histories(medical_history_id);
CREATE INDEX treatment_index ON treatments(treatment_id);
CREATE INDEX patients_index ON patients(patient_id);
CREATE INDEX invoice_index ON invoices(invoice_id); 
CREATE INDEX medical_history_index ON medical_histories_treatments(medical_history_id);
CREATE INDEX treatment_index ON medical_histories_treatments(treatment_id);

