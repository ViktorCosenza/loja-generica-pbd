const knex = require('../config/server')

const queries = {
  select: {
    products: () => knex.select('*').from('produtos')
  },
  insert: {
    products: (data) => knex.insert(data).into('produtos')
  },
  delete: null,
  update: null
}

module.exports = queries
