const queries = require('../utils/queries')

class Controller {
  async show (ctx) {
    const { query } = ctx
    const queryResult = await queries.select.itemVenda(query)
    const response = {
      rows: queryResult,
      rowCount: queryResult.length
    }
    ctx.body = response
  }

  async create (ctx) {
    const { body } = ctx.request
    const data = body.search
    const queryResult = await queries.insert.itemVenda(data)
    const response = {
      rows: {},
      rowCount: queryResult.rowCount
    }
    ctx.body = response
  }

  async update (ctx) {
    const { body } = ctx.request
    const data = body.search
    const where = body.where
    const queryResult = await queries.update.itemVenda(data, where)
    const response = {
      rows: {},
      rowCount: queryResult
    }
    ctx.body = response
  }

  async remove (ctx) {
    const { body } = ctx.request
    const where = body.where
    const queryResult = await queries.del.itemVenda(where)
    const response = {
      rows: {},
      rowCount: queryResult
    }
    ctx.body = response
  }
}

module.exports = Controller
