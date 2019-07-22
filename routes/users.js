const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const bcrypt = require('bcryptjs');

const Pool = require('pg').Pool;
const db = new Pool({
  user: 'sam',
  host: 'localhost',
  database: 'gurdwaradatabase',
  password: 'sam123',
  port: 5432,
});

// connection to database
db.connect((err) => {
  if(err) {
    throw err;
  }
  console.log('PostgreSQL connected...');
});

// UPDATE event
router.get('/update-event', (req, res, next) => {
  for(let i = 0; i < Object.keys(req.query.array).length; i++) {
    const sql = `UPDATE events SET event = '${req.query.array[i.toString()].text}' WHERE id = ${Number(req.query.array[i.toString()].id)}; `;
    db.query(sql, (err, result) => {
      if(err) {
        throw err;
        console.log('Update Event Error...');
      } else {
        console.log('Program Schedule Updated...');
      }
    });
  }
  res.json('Thank you for updating Program Schedule!');
});

// GET all events data for displaying purposes
router.get('/', (req, res, next) => {
  const sql = 'SELECT * FROM events;';
  db.query(sql, (err, result) => {
    if(err) {
      throw err;
    } else {
      console.log("Calendar Data Sent...");
      res.json(result.rows);
    }
  });
});

// User Registeration
router.post("/register", (req, res, next) => {
  const sql_1 = `SELECT * FROM logins WHERE username='${req.query.username}';`;
  db.query(sql_1, (err, result_1) => {
    if(err) {
      throw err;
    } else {
      if(!(result_1.rows.length)) {
        const sql_2 = `INSERT INTO logins (username, passcode, loginstatus) VALUES ('${req.query.username}', '${req.query.hash}', '${1}') RETURNING id;`;
        db.query(sql_2, (err, result_2) => {
          if(err) {
            throw err;
          } else {
            console.log("New Registeration... Authenication Successful...");
            res.send(result_2.rows[0].id.toString());
          }
        });
      } else {
        console.log("Registeration Failed... User Already Exits...");
        res.json(null);
      }
    }
  })
});

// Authenicate User
router.get('/login', (req, res, next) => {
  const sql_1 = `SELECT * FROM logins WHERE username='${req.query.username}';`;
  db.query(sql_1, (err, result) => {
    if(err) {
      throw err;
    } else {
      if(result.rows.length) {
        // change to compare two hashs
        bcrypt.compare(req.query.password, result.rows[0].passcode, (err, p_result) => {
          if(p_result) {
            const sql_2 = `UPDATE logins SET loginStatus = '${1}' WHERE id = ${result.rows[0].id};`;
            db.query(sql_2, (err, result_2) => {
              if(err) {
                throw err;
              } else {
                console.log("Authenication Successful...");
                res.send(result.rows[0].id.toString());
              }
            });
          } else {
            console.log("Authenication Failed...");
            throw err;
            res.json(null);
          }
        });
      } else {
        console.log("Authenication Failed...");
        throw err;
        res.json(null);
      }
    }
  });
});

// CHECK is a user is signed in or not
router.get('/login-status', (req, res, next) => {
  const sql = `SELECT * FROM logins WHERE id=${req.query.id};`;
  db.query(sql, (err, result) => {
    if(err) {
      throw err;
    } else {
      if(!result.rows[0]) {
        console.log("No User Signed In...");
        res.json(false);
      } else if(result.rows[0].loginstatus) {
        console.log("User is currently signed in...");
        res.json(true);
      } else {
        console.log("No User Signed In...");
        res.json(false);
      }
    }
  });
});

// Sign User out by changing login status
router.get('/update-login-status', (req, res, next) => {
  const sql = `UPDATE logins SET loginStatus = '${0}' WHERE id = ${req.query.id};`;
  db.query(sql, (err, result) => {
    if(err) {
      throw err;
    } else {
      // db.end().then(() => console.log('Logged out...'))
      res.send("User logged out.");
    }
  });
});

module.exports = router;
