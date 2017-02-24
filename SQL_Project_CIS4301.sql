drop table stats;
drop table player;
drop table roster;
drop table teams;
CREATE TABLE Teams(Team_Name varchar(100) NOT NULL,
  Superbowl_Wins int,
  Located varchar(100),
  
  PRIMARY KEY(Team_Name)
);

insert into Teams(Team_Name) values ('SeaHawks');

CREATE TABLE Roster(Team varchar(100) NOT NULL,
  Team_Year int NOT NULL,
  Coach varchar(100),
  
  CONSTRAINT fk_perRoster FOREIGN KEY (Team)
REFERENCES Teams(Team_Name),
  PRIMARY KEY(Team, Team_Year)
);

insert into Roster(Team, Team_Year) values ('SeaHawks', 1997);

CREATE TABLE Player(PlayerName varchar(100) NOT NULL,
  playsFor varchar(100) NOT NULL,
  Year_Played int NOT NULL,
  Pos varchar(100) NOT NULL,
  
  CONSTRAINT fk_perPlayer FOREIGN KEY (playsFor, Year_Played)
REFERENCES Roster(Team, Team_Year),
  PRIMARY KEY(PlayerName, playsFor, Year_Played)  
);

insert into Player(PlayerName, playsFor, Year_Played, Pos) values ('Antonio', 'SeaHawks', 1997, 'QuarterBack');

CREATE TABLE Stats(Player varchar(100) NOT NULL,
  Stats_Year int NOT NULL,
  TeamID varchar(100) NOT NULL,
  Touchdowns int,
  Interceptions int,
  ReceivingYards int,
  RushingYards int,
  Sacks int,
  Safeties int,
  Reception int,
  
  CONSTRAINT fk_perStats FOREIGN KEY (Player, TeamID, Stats_Year)
REFERENCES Player(PlayerName, playsFor, Year_Played),
  PRIMARY KEY(Player, Stats_Year)
);

insert into Stats(Player, Stats_Year, TeamID) values ('Antonio', 1997, 'SeaHawks');