CREATE DATABASE la_boleria;

\c la_boleria


CREATE TABLE cakes (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  price NUMERIC NOT NULL,
  image VARCHAR NOT NULL,
  description TEXT NOT NULL
);


CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  phone VARCHAR NOT NULL
);


CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  clientId INTEGER NOT NULL,
  cakeId INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  createdAt TIMESTAMP DEFAULT NOW(),
  totalPrice NUMERIC NOT NULL,
  FOREIGN KEY (clientId) REFERENCES clients (id),
  FOREIGN KEY (cakeId) REFERENCES cakes (id)
);

CREATE TABLE flavours (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

ALTER TABLE cakes ADD COLUMN flavourId INTEGER REFERENCES flavours(id);
ALTER TABLE orders ADD COLUMN isDelivered BOOLEAN DEFAULT FALSE;


