initSetupPsqlCommands () {
	psql postgres
	if [ \conninfo == "You are connected to database 'postgres' as user"* ]; then echo "DB connected" fi
	CREATE ROLE sam WITH LOGIN PASSWORD 'sam123';
	ALTER ROLE sam CREATEDB;
	\q
	psql -d postgres -U sam
	CREATE DATABASE gurdwaradatabase;
 	\c gurdwaradatabase
	CREATE TABLE logins(
		id SERIAL PRIMARY KEY,
		username VARCHAR(255) NOT NULL,
		passcode VARCHAR(255) NOT NULL,
		loginStatus SMALLINT NOT NULL
	);
	INSERT INTO logins (username, passcode, loginStatus) VALUES
	('Jaswinder', '$2a$10$.tj9ZP18PuPWGU74ZdUFXuJGnBwHkfNOjS8MSZbhdK/pzS4bQArL6', '0'),
	('Manmohan', '$2a$10$el4wtnb1D3ujGjfmEi7L5OIK9KpVEh3acGFBCOAj53vvNjk8bC9xO', '0'),
	('Navdeep', '$2a$10$QLa9BToN9ikuFc/KgwnrtOUNBfCGmCGKZsQxQo9LPFb7Df6hgnYES', '0'),
	('Sam', '$2a$10$mtQ70KeSBhGWhXE0bPmuheWWOQrFWc3IoPFaBxuHYN5mww/iyQhBK', '0'),
	('test', '$2a$10$HGl4MIm/CvFttnSgkNXrPuZEDe3TULr4xgvP3SEY.yJALcg1vv/B6', '0');
	CREATE TABLE events (
  		id SERIAL PRIMARY KEY,
  		date VARCHAR(255) NOT NULL,
  		event VARCHAR(255) NOT NULL
	);
	INSERT INTO events (date, event) VALUES
	('February 1, 2019', 'dfg'),
	('February 2, 2019', ''),
	('February 3, 2019', 'fdgfdg'),
	('February 4, 2019', ''),
	('February 5, 2019', ''),
	('February 6, 2019', ''),
	('February 7, 2019', 'Its not a saturday today'),
	('February 8, 2019', ''),
	('February 9, 2019', 'fdg'),
	('February 10, 2019', 'sdfds'),
	('February 11, 2019', 'dfgfdg'),
	('February 12, 2019', ''),
	('February 13, 2019', 'I have an interview today!!!'),
	('February 14, 2019', ''),
	('February 15, 2019', ''),
	('February 16, 2019', ''),
	('February 17, 2019', ''),
	('February 18, 2019', ''),
	('February 19, 2019', ''),
	('February 20, 2019', ''),
	('February 21, 2019', ''),
	('February 22, 2019', ''),
	('February 23, 2019', ''),
	('February 24, 2019', ''),
	('February 25, 2019', ''),
	('February 26, 2019', ''),
	('February 27, 2019', ''),
	('February 28, 2019', '');
}

npm install
cd client
npm install
brew doctor
brew update
if [ psql --version != "pqsl (PostgreSQL)"* ]; then brew install postgres fi
if [ "$OSTYPE" == "linux-gnu" ]; then
    # Windows Linux Subsystem
	pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start
	initSetupPsqlCommands
elif [ "$OSTYPE" == "darwin"* ]; then
    # Mac OSX
	brew services start postgresql
	initSetupPsqlCommands
#elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
# elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
# elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # ...
else
    # Unknown.
	echo "Unknown"
fi

echo "Done running script."