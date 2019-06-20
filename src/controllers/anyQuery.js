const knex = require('../config/server')

class Controller {
  async query (ctx) {
    const { body } = ctx.request
    const response = await knex.schema.raw(body.query)
    ctx.body = response
  }
}
