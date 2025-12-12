-- MySQL Workbench Synchronization
-- Generated: 2025-12-12 11:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Mercedes Bichweiler

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `netflix`.`users_has_movies` (
  `users_id` INT(11) NOT NULL,
  `movies_id` INT(11) NOT NULL,
  PRIMARY KEY (`users_id`, `movies_id`),
  INDEX `fk_users_has_movies_movies1_idx` (`movies_id` ASC) VISIBLE,
  INDEX `fk_users_has_movies_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_movies_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `netflix`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_movies_movies1`
    FOREIGN KEY (`movies_id`)
    REFERENCES `netflix`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `netflix`.`actors_has_movies` (
  `actors_id` INT(11) NOT NULL,
  `movies_id` INT(11) NOT NULL,
  PRIMARY KEY (`actors_id`, `movies_id`),
  INDEX `fk_actors_has_movies_movies1_idx` (`movies_id` ASC) VISIBLE,
  INDEX `fk_actors_has_movies_actors1_idx` (`actors_id` ASC) VISIBLE,
  CONSTRAINT `fk_actors_has_movies_actors1`
    FOREIGN KEY (`actors_id`)
    REFERENCES `netflix`.`actors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actors_has_movies_movies1`
    FOREIGN KEY (`movies_id`)
    REFERENCES `netflix`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
