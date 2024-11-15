CREATE TABLE customers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,

    first_name  VARCHAR(255)                        NOT NULL,
    middle_name VARCHAR(255)                        NULL,
    last_name   VARCHAR(255)                        NOT NULL,
    email       VARCHAR(255)                        NOT NULL,
    phone       VARCHAR(255)                        NOT NULL,

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE house_models
(
    id               INT AUTO_INCREMENT PRIMARY KEY,

    name             VARCHAR(255)                         NOT NULL,
    bedrooms         INT        DEFAULT 1                 NOT NULL,
    bathrooms        INT        DEFAULT 1                 NOT NULL,
    square_footage   INT                                  NOT NULL,
    number_of_floors INT        DEFAULT 1                 NOT NULL,
    garage_capacity  INT        DEFAULT 0                 NULL,
    price            decimal(12, 2)                       NOT NULL,
    description      text                                 NULL,
    is_active        tinyint(1) DEFAULT 1                 NULL,

    created_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NULL,
    updated_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP
);



CREATE TABLE sellers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,

    first_name  VARCHAR(255)                        NOT NULL,
    middle_name VARCHAR(255)                        NULL,
    last_name   VARCHAR(255)                        NOT NULL,
    email       VARCHAR(255)                        NOT NULL,
    phone       VARCHAR(255)                        NOT NULL,

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP
);

