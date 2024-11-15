# DB Schema Creation Script
# Author: Reinier Garcia
# Assignment 13: Kendall Houses, LLC (New Homes)


# The table dropping must be performed in the reverse order in which they are created.
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS house_models;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sellers;

CREATE TABLE IF NOT EXISTS sellers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,                                 -- Unique identifier for each seller

    first_name  VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255) NULL,
    last_name   VARCHAR(255) NOT NULL,
    email       VARCHAR(255) NOT NULL,
    phone       VARCHAR(255) NOT NULL,

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                            -- When the record was created
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Last update timestamp
);

CREATE TABLE IF NOT EXISTS customers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,                                  -- Unique identifier for each customer

    seller_id   INT          NOT NULL,                                           -- Foreign key linking to the sellers table

    first_name  VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255) NULL,
    last_name   VARCHAR(255) NOT NULL,
    email       VARCHAR(255) NOT NULL,
    phone       VARCHAR(255) NOT NULL,

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- When the record was created
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last update timestamp

    FOREIGN KEY (seller_id) REFERENCES sellers (id) ON DELETE CASCADE            -- Belongs-to-one Relation to sellers

);

CREATE TABLE IF NOT EXISTS house_models
(
    id               INT AUTO_INCREMENT PRIMARY KEY,                                 -- Unique identifier for each house_model

    name             VARCHAR(255)        NOT NULL,
    bedrooms         INT       DEFAULT 1 NOT NULL,
    bathrooms        INT       DEFAULT 1 NOT NULL,
    square_footage   INT                 NOT NULL,
    number_of_floors INT       DEFAULT 1 NOT NULL,
    garage_capacity  INT       DEFAULT 0 NULL,
    price            decimal(12, 2)      NOT NULL,
    description      text                NULL,
    is_active        boolean   DEFAULT NULL,

    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                            -- When the record was created
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Last update timestamp
);

CREATE TABLE IF NOT EXISTS houses
(
    id             INT AUTO_INCREMENT PRIMARY KEY,                                                               -- Unique identifier for each house

    house_model_id INT          NOT NULL,                                                                        -- Foreign key linking to the house_models table

    address        VARCHAR(255) NOT NULL,                                                                        -- Address of the house
    status         ENUM ('available', 'sold', 'reserved') DEFAULT 'available',                                   -- Status of the house
    lot_size       INT,                                                                                          -- Lot size in square feet
    build_date     DATE,                                                                                         -- Date when the house was built
    price          DECIMAL(12, 2),                                                                               -- Selling price of the house
    description    TEXT,                                                                                         -- Optional description of the house

    created_at     TIMESTAMP                              DEFAULT CURRENT_TIMESTAMP,                             -- When the record was created
    updated_at     TIMESTAMP                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last update timestamp

    FOREIGN KEY (house_model_id) REFERENCES house_models (id) ON DELETE CASCADE                                  -- Relation to house_models
);

CREATE TABLE IF NOT EXISTS visits
(
    id          INT AUTO_INCREMENT PRIMARY KEY,                                  -- Unique identifier for each visit

    customer_id INT NOT NULL,                                                    -- Foreign key linking to the customers table
    house_id    INT NOT NULL,                                                    -- Foreign key linking to the houses table

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- When the record was created
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last update timestamp

    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,       -- Relation to customers
    FOREIGN KEY (house_id) REFERENCES houses (id) ON DELETE CASCADE              -- Relation to houses
);

CREATE TABLE IF NOT EXISTS comments
(
    id          INT AUTO_INCREMENT PRIMARY KEY,                                  -- Unique identifier for each comment

    visit_id    INT  NOT NULL,                                                   -- Foreign key linking to the visits table

    description TEXT NOT NULL,

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                             -- When the record was created
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last update timestamp

    FOREIGN KEY (visit_id) REFERENCES visits (id) ON DELETE CASCADE              -- Relation to visits
);


