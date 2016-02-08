CREATE TABLE `Mu2`.`JOBS_COMMENTS`(
  `ID` INT NOT NULL AUTO_INCREMENT COMMENT 'Stores comment ID',
  `JOB_ID` INT NOT NULL COMMENT 'Stores ID of job comment relates to',
  `POSTED_BY` INT NOT NULL COMMENT 'Holds DBREF of poster minus #',
  `POSTED_ON` DATETIME COMMENT 'Holds datetime of post',
  `FLAGS` INT(1) NOT NULL DEFAULT 0 COMMENT 'Flag indicator for post',
  `READERS` TINYTEXT NULL COMMENT 'Holds list of reader DBREFs without #',
  `BODY` LONGTEXT NOT NULL COMMENT 'Stores comment text',
  PRIMARY KEY (`ID`),
  FULLTEXT (BODY));
