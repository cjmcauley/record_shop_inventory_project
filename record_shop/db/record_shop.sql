DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS record_labels;
DROP TABLE IF EXISTS years;
DROP TABLE IF EXISTS formats;
DROP TABLE IF EXISTS genres;

CREATE TABLE formats(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE genres(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE years(
  id SERIAL4 PRIMARY KEY,
  year INT4
);

CREATE TABLE record_labels(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE products(
  id SERIAL4 PRIMARY KEY,
  artist VARCHAR(255),
  title VARCHAR(255),
  genre_id VARCHAR(255),
  quantity INT4,
  cost_price DECIMAL(5,2),
  retail_price DECIMAL(5,2),
  img_url TEXT,
  record_label_id INT4 REFERENCES record_labels (id),
  year_id INT4 REFERENCES years (id),
  format_id INT4 REFERENCES formats (id)
);
