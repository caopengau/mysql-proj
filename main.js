const mysql = require('mysql');

const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "ANSKk08aPEDbFjDO",
  database: "testing"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");

  con.query("SELECT * FROM `users`", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});