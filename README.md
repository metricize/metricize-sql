# Current SQL Schema

    CREATE TABLE Agent
    (
        agent_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
        customer_id INT UNSIGNED NOT NULL,
        name VARCHAR(64) DEFAULT '' NOT NULL,
        agent_key VARCHAR(512) DEFAULT '' NOT NULL,
        agent_type CHAR(5) DEFAULT 'NONE' NOT NULL
    );
    CREATE TABLE Customer
    (
        customer_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
        name VARCHAR(64) DEFAULT '' NOT NULL,
        customer_key VARCHAR(512) DEFAULT '' NOT NULL
    );
    CREATE TABLE MYSQLAgentConfig
    (
        mysql_agent_config_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
        agent_id INT UNSIGNED NOT NULL,
        username VARCHAR(256) DEFAULT '' NOT NULL,
        password VARCHAR(256) DEFAULT '' NOT NULL,
        fqdn VARCHAR(256) DEFAULT '' NOT NULL,
        port INT DEFAULT 3306 NOT NULL,
        query_string LONGTEXT NOT NULL,
        count_per TINYINT DEFAULT 1,
        time_unit CHAR(7) DEFAULT 'SECOND'
    );
    CREATE TABLE User
    (
        user_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
        email VARCHAR(64) DEFAULT '' NOT NULL,
        first_name VARCHAR(64) DEFAULT '' NOT NULL,
        last_name VARCHAR(64) DEFAULT '' NOT NULL,
        password VARCHAR(64) DEFAULT '' NOT NULL,
        salt VARCHAR(16) DEFAULT '' NOT NULL,
        customer_id INT UNSIGNED DEFAULT 0 NOT NULL,
        admin TINYINT DEFAULT 0 NOT NULL
    );
    CREATE TABLE UserSession
    (
        session_key VARCHAR(64) PRIMARY KEY NOT NULL,
        user_id INT UNSIGNED NOT NULL,
        expiration DATETIME NOT NULL
    );
    CREATE UNIQUE INDEX agent_key_idx ON Agent (agent_key);
    CREATE UNIQUE INDEX customer_key_idx ON Customer (customer_key);
    CREATE UNIQUE INDEX email_indx ON User (email);