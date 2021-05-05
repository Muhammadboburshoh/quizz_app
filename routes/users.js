var express = require('express');
var router = express.Router();

const { rows } = require('../util/db')

/* GET users listing. */
router.get('/', async function(req, res, next) {

  const users = await rows('select * from users')

  res.send(users);
});

module.exports = router;
