CREATE SCHEMA favoritesitesdb;
USE favoritesitesdb;

CREATE TABLE userinfo (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) unique NOT NULL,
    password VARCHAR(255) NOT NULL
);

alter table userinfo auto_increment = 100;

INSERT INTO userinfo (username, password) VALUES
('Kemal', 'password1'),
('Bob', 'password2'),
('Frank', 'password3'),
('Micheal', 'password4'),
('Ron', 'password5');

CREATE TABLE visits (
    visit_id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    country_name VARCHAR(255) NOT NULL,
    city_name VARCHAR(255) NOT NULL,
    year_visited INT NOT NULL,
    season_visited ENUM('Spring', 'Summer', 'Autumn', 'Winter') NOT NULL,
    best_feature ENUM('Historic Places', 'Castles','Museums', 'Food', 'Beaches', 'None') NOT NULL,
    user_comment TEXT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    PRIMARY KEY (visit_id),
    FOREIGN KEY (username) REFERENCES userinfo(username)
);


INSERT INTO visits (username, country_name, city_name, year_visited, season_visited, best_feature, user_comment, rating) VALUES
('Kemal', 'Germany', 'Berlin', 2019, 'Spring', 'Historic Places', 'Beautiful city with amazing architecture.', 5),
('Bob', 'Turkey', 'Istanbul', 2020, 'Summer', 'Historic Places', 'Visited the Haiga Sophia and loved it.', 4),
('Frank', 'England', 'London', 2018, 'Autumn', 'Historic Places', 'Explored the Tower of London.', 5),
('Micheal', 'France', 'Paris', 2021, 'Winter', 'None', 'Enjoyed the hustle and bustle of the city.', 3),
('Kemal', 'Spain', 'Madrid', 2022, 'Summer', 'Castles', 'Amazing architecture.', 4),
('Ron', 'Greece', 'Athens', 2017, 'Spring', 'Historic Places', 'The Acropolis is a must-see.', 5),
('Bob', 'Thailand', 'Bangkok', 2019, 'Winter', 'Food', 'Tried lots of street food, delicious!', 4),
('Frank', 'Australia', 'Sydney', 2016, 'Summer', 'Beaches', 'Bondi Beach was stunning.', 5),
('Micheal', 'Japan', 'Tokyo', 2023, 'Autumn', 'Food', ' The sushi here is incredible!', 4),
('Ron', 'Brazil', 'Rio de Janeiro', 2020, 'Summer', 'Beaches', 'Carnival was an unforgettable experience.', 5),
('Kemal', 'Germany', 'Berlin', 2018, 'Spring', 'Castles', 'Visited Neuschwanstein Castle, breathtaking!', 5),
('Bob', 'China', 'Beijing', 2021, 'Autumn', 'Historic Places', 'The Great Wall was amazing.', 5),
('Frank', 'India', 'Jaipur', 2019, 'Winter', 'Historic Places', 'The Amber Fort was spectacular.', 4),
('Micheal', 'South Africa', 'Cape Town', 2017, 'Summer', 'Beaches', 'Relaxed on Clifton Beach.', 4),
('Ron', 'Mexico', 'Mexico City', 2022, 'Spring', 'Historic Places', 'Explored the ancient ruins of Teotihuacan.', 5),
('Kemal', 'Canada', 'Vancouver', 2020, 'Autumn', 'None', 'Enjoyed the beautiful scenery.', 4),
('Bob', 'Iceland', 'Reykjavik', 2018, 'Winter', 'None', 'Loved the Northern Lights.', 5),
('Frank', 'Portugal', 'Lisbon', 2019, 'Spring', 'Food', 'Tasted amazing pastéis de nata.', 5),
('Micheal', 'Netherlands', 'Amsterdam', 2023, 'Summer', 'Museums', 'Visited the Van Gogh Museum.', 4),
('Ron', 'South Korea', 'Seoul', 2017, 'Winter', 'None', 'Enjoyed shopping in Myeongdong.', 4),
('Kemal', 'Singapore', 'Singapore', 2016, 'Summer', 'None', 'The food markets were great.', 4),
('Bob', 'Switzerland', 'Zurich', 2021, 'Spring', 'None', 'Loved exploring the old town.', 5),
('Frank', 'Argentina', 'Buenos Aires', 2018, 'Autumn', 'Food', 'The steakhouses here are amazing.', 5),
('Micheal', 'Vietnam', 'Ho Chi Minh City', 2022, 'Winter', 'Food', 'Tried delicious pho.', 4),
('Ron', 'Morocco', 'Marrakesh', 2017, 'Summer', 'Historic Places', 'The Medina was fascinating.', 4),
('Kemal', 'Norway', 'Oslo', 2020, 'Spring', 'None', 'Enjoyed the fjords.', 4),
('Bob', 'Spain', 'Madrid', 2019, 'Autumn', 'Museums', 'Visited the Prado Museum.', 5),
('Frank', 'Greece', 'Santorini', 2018, 'Summer', 'Beaches', 'The sunsets here are incredible.', 5),
('Micheal', 'Italy', 'Venice', 2023, 'Spring', 'Historic Places', 'Took a gondola ride.', 4),
('Ron', 'France', 'Nice', 2017, 'Summer', 'Beaches', 'Relaxed on the French Riviera.', 4);

 
CREATE TABLE sharedvisits (
    shared_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id INT NOT NULL,
    sharer_username VARCHAR(50) NOT NULL,
    friend_username VARCHAR(50) NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY (sharer_username) REFERENCES userinfo(username),
    FOREIGN KEY (friend_username) REFERENCES userinfo(username)
);


INSERT INTO sharedvisits (visit_id, sharer_username, friend_username) VALUES
(1, 'Kemal', 'Bob'),
(3, 'Frank', 'Micheal'),
(6, 'Ron', 'Kemal'),
(8, 'Micheal', 'Frank'),
(11, 'Bob', 'Ron'),
(14, 'Micheal', 'Bob'),
(16, 'Kemal', 'Frank'),
(20, 'Frank', 'Ron'),
(22, 'Bob', 'Micheal'),
(28, 'Ron', 'Bob');
