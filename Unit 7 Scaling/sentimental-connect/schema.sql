CREATE TABLE `Users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32),
    `last_name` VARCHAR(32),
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `Company` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100),
    `industry` ENUM('Technology', 'Education', 'Business'),
    `location` VARCHAR(100),
    PRIMARY KEY (`id`)
);

CREATE TABLE `UserConnections` (
    `user1_id` INT,
    `user2_id` INT,
    PRIMARY KEY (`user1_id`, `user2_id`),
    FOREIGN KEY (`user1_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`user2_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `UserSchoolAffiliation` (
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `degree` VARCHAR(20),
    PRIMARY KEY (`user_id`, `school_id`, `start_date`, `degree`),
    FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `Schools`(`id`)
);

CREATE TABLE `UserCompanyAffiliations` (
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `title` VARCHAR(100),
    PRIMARY KEY (`user_id`, `company_id`, `start_date`, `title`),
    FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `Company`(`id`)
);
