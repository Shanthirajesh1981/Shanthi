var express = require('express');
var router = express.Router();
var pg = require('pg');
const async = require('async');
const assert = require('assert');
const fs = require('fs');

const config = {
    user: 'yugabyte',
    database: 'yugabyte',
    host: '20.62.171.47',
    password: 'Hackathon22!',
    port: 5433,
    // this object will be passed to the TLSSocket constructor
    ssl: {
      rejectUnauthorized: false,
    },
  }

var client = new pg.Client(config);

/* GET home page. */
router.get('/', function(req, res, next) {
  async.series([
    function connect(next) {
      client.connect(next);
    },
    function select(next) {
      // Query the row for employee id 1 and print the results to the console.
      // const select = 'select a.company_name, a.company_url, b.category_name from company a, category b, diversity_decision c where c.company_id = a.company_id and c.category_id = b.category_id order by a.company_name';
      const select = 'select dunsnum, dunsname, dunsurl, iswomenowned, minorityowneddesc from duns';
      client.query(select, function (err, result) {
        if (err) return next(err);
        res.render('resultPage', {data:result.rows});
      });
    }
  ], function (err) {
    if (err) {
      console.error('There was an error', err.message, err.stack);
    }
    console.log('Shutting down');
    client.end();
  });
  
});

module.exports = router;
