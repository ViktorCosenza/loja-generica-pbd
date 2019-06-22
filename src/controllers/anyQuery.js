const knex = require('../config/server')

class Controller {
  async query (ctx) {
    const { body } = ctx.request
    const queryResult = await knex.schema.raw(body.query)
    const { rowCount, rows } = queryResult
    ctx.body = { rowCount, rows }
  }
}

module.exports = Controller
