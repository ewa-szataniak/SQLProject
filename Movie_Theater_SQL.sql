-- the theater table
CREATE TABLE theater (
  theater_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);

-- the movie table
CREATE TABLE movie (
  movie_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  director VARCHAR(50) NOT NULL,
  release_date DATE NOT NULL,
  duration INT NOT NULL
);

-- the screening table
CREATE TABLE screening (
  screening_id INT PRIMARY KEY,
  theater_id INT NOT NULL,
  movie_id INT NOT NULL,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  FOREIGN KEY (theater_id) REFERENCES theater(theater_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

-- the seat table
CREATE TABLE seat (
  seat_id INT PRIMARY KEY,
  theater_id INT NOT NULL,
  row_number INT NOT NULL,
  seat_number INT NOT NULL,
  FOREIGN KEY (theater_id) REFERENCES theater(theater_id)
);

-- the ticket table
CREATE TABLE ticket (
  ticket_id INT PRIMARY KEY,
  screening_id INT NOT NULL,
  seat_id INT NOT NULL,
  price DECIMAL(5,2) NOT NULL,
  FOREIGN KEY (screening_id) REFERENCES screening(screening_id),
  FOREIGN KEY (seat_id) REFERENCES seat(seat_id)
);


