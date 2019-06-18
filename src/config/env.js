require('dotenv').config()

const PORT = process.env.PORT || 3000
const PGDATABASE = process.env.PGDATABASE || 'postgres'
const PGHOST = process.env.PGHOST || 'localhost'
const PGUSER = process.env.PGUSER || 'postgres'
const PGPASS = process.env.PGPASS || '123456'
const PG_CONNECTION_STRING = process.env.PG_CONNECTION_STRING

module.exports = {
  PORT,
  PGDATABASE,
  PGHOST,
  PGUSER,
  PGPASS,
  PG_CONNECTION_STRING
}
