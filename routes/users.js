const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const bcrypt = require('bcryptjs');

// initalize connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'gurdwaradatabase'
});

// connection to database
db.connect((err) => {
  if(err) {
    throw err;
  }
  console.log('Mysql connected...');
});

// UPDATE event
router.get('/update-event', (req, res, next) => {
  let sql = '';
  let i_string = '';
  let success = false;
  for(let i = 0; i < Object.keys(req.query.array).length; i++) {
    i_string = i.toString();
    sql = `UPDATE events SET event = '${req.query.array[i_string].text}' WHERE id = ${Number(req.query.array[i_string].id)} `;
    let query = db.query(sql, (err, result) => {
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
  let sql = 'SELECT * FROM events';
  let query = db.query(sql, (err, result) => {
    if(err) {
      throw err;
    } else {
      console.log("Calendar Data Sent...");
      res.json(result);
    }
  });
});

// temparary password hashing for registeration
router.post("/register", (req, res, next) => {
  let sql_1 = `SELECT * FROM logins WHERE username='${req.query.username}'`;
  let query_1 = db.query(sql_1, (err, result_1) => {
    if(err) {
      throw err;
    } else {
      if(!(result_1.length)) {
        let sql_2 = `INSERT INTO logins (username, passcode, loginStatus) VALUES ('${req.query.username}', '${req.query.hash}', '${0}')`;
        let query_2 = db.query(sql_2, (err, result_2) => {
          if(err) {
            throw err;
            res.json(null);
          } else {
            console.log("New Registeration...");
            let sql_3 = `UPDATE logins SET loginStatus = '${1}' WHERE id = ${result_2.insertId}`;
            let query_3 = db.query(sql_3, (err, result_3) => {
              if(err) {
                throw err;
              } else {
                console.log("Authenication Successful...");
                res.send(result_2.insertId.toString());
              }
            });
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
  let sql_1 = `SELECT * FROM logins WHERE username='${req.query.username}'`;
  let query_1 = db.query(sql_1, (err, result) => {
    if(err) {
      throw err;
    } else {
      if(result.length) {
        bcrypt.compare(req.query.password, result[0].passcode, (err, p_result) => {
          if(p_result) {
            let sql_2 = `UPDATE logins SET loginStatus = '${1}' WHERE id = ${result[0].id}`;
            let query_2 = db.query(sql_2, (err, result_2) => {
              if(err) {
                throw err;
              } else {
                console.log("Authenication Successful...");
                res.send(result[0].id.toString());
              }
            });
          } else {
            console.log("Authenication Failed...");
            res.json(null);
          }
        });
      } else {
        console.log("Authenication Failed...");
        res.json(null);
      }
    }
  });
});

// CHECK is a user is signed in or not
router.get('/login-status', (req, res, next) => {
  let sql = `SELECT * FROM logins WHERE id=${req.query.id}`;
  let query = db.query(sql, (err, result) => {
    if(err) {
      throw err;
      res.json(false);
    } else {
      if(!result[0]) {
        console.log("No User Signed In...");
        res.json(false);
      } else if(result[0].loginStatus) {
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
  sql = `UPDATE logins SET loginStatus = '${0}' WHERE id = ${req.query.id} `;
  let query = db.query(sql, (err, result) => {
    if(err) {
      throw err;
    } else {
      console.log("Logged out...");
      res.send("User logged out.");
    }
  });
});

module.exports = router;
