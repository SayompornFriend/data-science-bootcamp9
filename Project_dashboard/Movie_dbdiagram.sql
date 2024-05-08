CREATE TABLE `movie` (
  `movieID` id PRIMARY KEY,
  `title` text,
  `lifetime_gross` int,
  `year` year,
  `studio` text,
  `rating` numeric,
  `runtime` int,
  `budget` int,
  `release_date` date,
  `vote_avg` numeric,
  `vote_count` int,
  `franchise_ID` id
);

CREATE TABLE `topbillcast` (
  `moviecastID` id PRIMARY KEY,
  `movieID` id,
  `actor_name` text
);

CREATE TABLE `moviedirector` (
  `moviedirectorID` id PRIMARY KEY,
  `director_name` text,
  `movieID` id
);

CREATE TABLE `moviegenre` (
  `moviegenreID` id PRIMARY KEY,
  `movieID` id,
  `genre` text
);

CREATE TABLE `franchise` (
  `franchiseID` id PRIMARY KEY,
  `franchiseName` text,
  `yearBegan` year,
  `creator` text
);

ALTER TABLE `topbillcast` ADD FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);

ALTER TABLE `moviedirector` ADD FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);

ALTER TABLE `moviegenre` ADD FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);

ALTER TABLE `movie` ADD FOREIGN KEY (`franchise_ID`) REFERENCES `franchise` (`franchiseID`);
