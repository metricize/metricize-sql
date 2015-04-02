USE metricize;

CREATE TABLE CustomerDatabaseMap (
  customer_id INT UNSIGNED NOT NULL,
  fqdn VARCHAR(256) NOT NULL DEFAULT 'localhost',
  port INT NOT NULL DEFAULT 3306,
  db_name VARCHAR(256) NOT NULL DEFAULT '',
  username VARCHAR(256) NOT NULL DEFAULT '',
  password VARCHAR(256) NOT NULL DEFAULT '',
  PRIMARY KEY (customer_id)
) ENGINE=INNODB;