/* You can also simply import the dump file into your local system INSTEAD OF running this script. */

-- Let's start with a clean DB.
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS addresses;
DROP PROCEDURE IF EXISTS FillDatabase;

CREATE TABLE roles (
  id int(11) PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) NOT NULL
);

CREATE TABLE users (
  id int(11) PRIMARY KEY AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  role_id int(11) NULL
);

CREATE TABLE addresses (
  id int(11) PRIMARY KEY AUTO_INCREMENT,
  address_1 varchar(255) NOT NULL,
  city varchar(255) NOT NULL,
  state varchar (2) NOT NULL,
  zip varchar(5) NOT NULL,
  user_id int(11) NOT NULL
);

INSERT into roles(name) values('administrator');
INSERT into roles(name) values('visitor');
INSERT into roles(name) values('editor');
INSERT into roles(name) values('writer');

-- Since we're creating a stored procedure, we'll change the delimiter.
DELIMITER $$

-- Create it.
CREATE PROCEDURE FillDatabase(CountLimit INT)
BEGIN
	-- A counter for our loop.
	SET @count = 1;
	SET @city = '';
	SET @state = '';
	SET @zip = '';
	SET @locVar = 0;
	SET @first_name = '';
	SET @last_name = '';
	
	-- Let's create a TON of records
	WHILE @count < CountLimit DO
	
		-- Create the unique names outside of the loop
		SET @first_name = concat('First', CAST(@count as char));
		SET @last_name = concat('Last', CAST(@count as char));
	
		IF @count % 123 = 0 THEN
			-- Every 123rd user is an admin
			INSERT into users(first_name, last_name, role_id) values(@first_name, @last_name, 1);
		ELSEIF @count %45 = 0 THEN
			-- Every 45th users has no roles assigned..
			INSERT into users(first_name, last_name) values(@first_name, @last_name);
		ELSE
			-- Everyone else is one of the other user types.
			INSERT into users(first_name, last_name, role_id) values(@first_name, @last_name, ((@count % 3) + 2));
		END IF;
		
		SET @locVar = @count % 8;

		CASE @locVar
			WHEN 0 THEN
				SET @city = 'arlington';
				SET @state = 'va';
				SET @zip = '22201';
			WHEN 1 THEN
				SET @city = 'long island city';
				SET @state = 'ny';
				SET @zip = '11101';
			WHEN 2 THEN
				SET @city = 'beverly hills';
				SET @state = 'ca';
				SET @zip = '90210';
			WHEN 3 THEN
				SET @city = 'boulder';
				SET @state = 'co';
				SET @zip = '80301';
			WHEN 4 THEN
				SET @city = 'paris';
				SET @state = 'tx';
				SET @zip = '75460';
			WHEN 5 THEN
				SET @city = 'oklahoma city';
				SET @state = 'ok';
				SET @zip = '73102';
			WHEN 6 THEN
				SET @city = 'portland';
				SET @state = 'or';
				SET @zip = '97205';
			WHEN 7 THEN
				SET @city = 'boston';
				SET @state = 'ma';
				SET @zip = '02108';
		END CASE;
		
    -- Every 31st record is missing address info
    IF @count % 31 != 0 THEN
		INSERT into addresses(address_1, city, state, zip, user_id) values( concat( CAST(@count as char),' Filler st' ) , @city, @state, @zip, @count);
    END IF;

		-- Let's also remember to increment our loop
   	SET @count = @count + 1;
   		
	END WHILE;
END$$

-- And finallly let's set the delimiter back to ';'
DELIMITER ;

-- Now, let's create a ton of records.
CALL FillDatabase(25000);
