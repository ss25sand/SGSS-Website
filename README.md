# Gurdwara-Website

Ongoing development of the new Cambridge Gurdwara Website.

```
Current Website: https://sgsscambridge.wordpress.com/
```

## Description

This website is designed with a React front end and Express back end.

## Features

Website includes multiple pages using React Router, an image slider and a RESTful API login system that allows admin to change program events in a schedule that is only visible to viewers implemented by making requests to a PostgreSQL Database.

## Getting Started

### Requirements

This is assuming you have Homebrew, and npm installed. If not please install them to be able to easily follow along.

### Installation

Run the following commands in terminal (mac/linux) assuming start in root project directory.

#### Manual Installation

```
git clone <copy link by pressing clone button>
cd SGSS-Website
// TODO: create a bash script for this
npm install
cd client
npm install
brew doctor
brew update
```
If you don't already have postgresql installed run:
```
brew install postgres
```
To start PostgreSQL server, run `brew services start postgresql` if on mac or `pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start` if on linux.
To start root postgres user session:
```
psql postgres
```
Create and alter role:
```
CREATE ROLE sam WITH LOGIN PASSWORD 'sam123';
ALTER ROLE sam CREATEDB;
\q
```
To start sam user session, create and connect to database:
```
psql -d postgres -U sam
CREATE DATABASE gurdwaradatabase;
\c gurdwaradatabase
```
Enter the sql commands from dataMigrationQueries.sql that have the `-- Postgresql` comment above the code block.

#### Automatic Installation

Run `gettingStarted.sh` at the root directory of the project. If you encounter any errors, attempt manual setup.

### Running Project

Navigate to backend and client directory and run `npm start` in two separate terminal windows.

### Reseeding

If you have been experimenting for a while run `reseeding.sh` to reset all the tables in the database.

### Terminating Project

Once done working, terminate all running commands including frontend and backend servers. Close postgresql session with `brew services stop postgresql` if on mac or `pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start` if on linux.

### Useful PostgreSQL commands

Display connection status: `\conninfo`
List all roles: `\du`
Quit current session: `\q`
Lists databases: `\list`
Lists all tables and schemas in database: `\dt`
