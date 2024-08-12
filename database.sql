-- Table: Countries
CREATE TABLE Countries (
    location                  VARCHAR (50) PRIMARY KEY,
    iso_code                  VARCHAR (10),
    last_observation_date     DATE,
    source_name               VARCHAR (200),
    source_website            VARCHAR (200) 
);

-- Table: Vaccinations
CREATE TABLE Vaccinations (
    date                                   DATE,
    location                               VARCHAR (50),
    daily_vacinations                      INTEGER,
    daily_vaccinations_per_million         INTEGER,
    daily_people_vaccinated                INTEGER,
    daily_people_vaccinated_per_hundred    DECIMAL,
    people_vaccinated                      INTEGER,
    people_vaccinated_per_hundred          DECIMAL,
    people_fully_vaccinated                INTEGER,
    people_fully_vaccinated_per_hundred    DECIMAL,
    total_vaccinations                     INTEGER,
    total_vaccinations_per_hundred         DECIMAL,
    total_boosters                         INTEGER,
    total_boosters_per_hundred             DECIMAL,
    PRIMARY KEY (
        date,
        location
    )
    FOREIGN KEY(location) REFERENCES Countries(location)
);

-- Table: Vaccines
CREATE TABLE Vaccines (
    vaccine                  VARCHAR (50) PRIMARY KEY,
    manufacturer             VARCHAR (50)
);

-- Table: Vaccine_type
CREATE TABLE Vaccine_type (
    date                 DATE,
    location             VARCHAR (50),
    vaccine              VARCHAR (50),
    total_vaccinations   INTEGER,
    PRIMARY KEY (
        location,
        date,
        vaccine
    ),
    FOREIGN KEY(date) REFERENCES Vaccinations(date)
    FOREIGN KEY(location) REFERENCES Countries(location)
    FOREIGN KEY(vaccine) REFERENCES Vaccines(vaccine)
);

-- Table: Age_Groups
CREATE TABLE Age_Groups (
    date                                 DATE,
    location                             VARCHAR (50),
    age_group                            VARCHAR (20),
    people_vaccinated_per_hundred        DECIMAL,
    people_fully_vaccinated_per_hundred  DECIMAL,
    people_with_booster_per_hundred      DECIMAL,
    PRIMARY KEY (
        date,
        location,
        age_group
    ),
    FOREIGN KEY(date, location) REFERENCES Vaccinations(date, location)
);

-- Table: US_States
CREATE TABLE US_States (
    date                                   DATE,
    location                               VARCHAR (50),
    daily_vaccinations                     INTEGER,
    daily_vaccinations_per_million         INTEGER,
    people_vaccinated                      INTEGER,
    people_vaccinated_per_hundred          DECIMAL,
    people_fully_vaccinated                INTEGER,
    people_fully_vaccinated_per_hundred    DECIMAL,
    share_doses_used                       DECIMAL,
    distributed_per_hundred                DECIMAL,
    total_distributed                      INTEGER,
    total_vaccinations                     INTEGER,
    total_vaccinations_per_hundred         DECIMAL,
    total_boosters                         INTEGER,
    total_boosters_per_hundred             DECIMAL,
    PRIMARY KEY (
        date,
        location
    ),
    FOREIGN KEY(date) REFERENCES Vaccinations(date)
);
