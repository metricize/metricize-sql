-- USE _:customer_id;

CREATE TABLE Statistic (
  statistic_id BIGINT NOT NULL AUTO_INCREMENT,
  agent_id INT UNSIGNED NOT NULL DEFAULT 0,
  gathered BIGINT NOT NULL DEFAULT 0,
  query_time INT UNSIGNED NOT NULL DEFAULT 0,
  duplicate_id BIGINT DEFAULT NULL,
  status ENUM ('SUCCESS', 'FAILURE'),
  PRIMARY KEY (statistic_id)
) ENGINE=INNODB;

CREATE TABLE Record (
  record_id BIGINT NOT NULL AUTO_INCREMENT,
  statistic_id BIGINT NOT NULL,
  duplicate_id BIGINT DEFAULT NULL,
  PRIMARY KEY (record_id)
) ENGINE=INNODB;

CREATE TABLE RecordedField (
  field_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL DEFAULT '',
  PRIMARY KEY (field_id, name)
) ENGINE=INNODB;

CREATE TABLE RecordedData (
  record_id BIGINT NOT NULL,
  field_id BIGINT NOT NULL,
  value VARCHAR(1024) DEFAULT NULL,
  duplicate_id BIGINT DEFAULT NULL,
  PRIMARY KEY (record_id, field_id)
) ENGINE=INNODB;