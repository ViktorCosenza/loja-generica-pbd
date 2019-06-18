const { PGHOST, PGUSER, PGPASS, PGDATABASE } = require('../config/env')

const pg = require('knex')({
  client: 'pg',
  connection: {
    host: PGHOST,
    user: PGUSER,
    password: PGPASS,
    database: PGDATABASE
  }
})

module.exports = pg
