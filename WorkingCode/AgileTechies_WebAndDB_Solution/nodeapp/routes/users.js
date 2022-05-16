var express = require('express');
var router = express.Router();
var pg = require('pg');
const async = require('async');
const assert = require('assert');
const fs = require('fs');
var py_response = '';

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

  router.get('/', function(req, res, next) { 
    res.render('index'); 
    });

router.post('/create', function(req, res, next) {
  console.log('entered created');
// store all the user input data
var company_num=req.body.dunsnum;
var company_name=req.body.dunsname;
var company_url=req.body.dunsurl;

var client = new pg.Client(config);

/* GET home page. */

  async.series([
    function connect(next) {
      client.connect(next);
    },
    function insert(next) {
      // Query the row for employee id 1 and print the results to the console.
      const insert = "insert into duns (dunsnum, dunsname, dunsurl) values ('"+company_num+"','"+company_name+"','"+company_url+"')";

      client.query(insert, next);
      var resp_py = runPythonScript();
      res.render('home', {resp:resp_py});
      
    }
  ], function (err) {
    if (err) {
      console.error('There was an error', err.message, err.stack);
    }
    console.log('Shutting down');
    client.end();
  });

 
    function runPythonScript() {
       //console.log("Im calling my script")
       const spawn = require('child_process').spawn;
          // Get the python script filepath
          var path = require('path');
          var script_file = path.join(__dirname, '../../../', 'AgileTechies_PythonSolution', 'multiprocessrun.py');
          // Call the python process and pass the data as command line argument.
       const py = spawn('py', [script_file]);

          responseData = '';

          py.stdout.on('data', function (stdData) 
          {
              responseData += stdData.toString();
              

          });

          py.stdout.on('end', function () {
              console.log('Checking the response data', responseData);
              let resultData = JSON.parse(responseData);
              let resp = resultData['response'];
              console.log('Response: ', resp);
                       
          });
        //console.log('Printing the var outside of the func', py_response)
         //return py_response;
            }
            
          
}); 

module.exports = router;
