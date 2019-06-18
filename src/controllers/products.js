const assert = require('assert')
const queries = require('../utils/queries')

class Controller {
  async show (ctx) {
    const response = await queries.select.products()
    ctx.body = response
  }

  async create (ctx) {
    const { body } = ctx.request
    const data = {
      nome: body.nome,
      tipo: body.tipo,
      preco: body.preco
    }
    const response = await queries.insert.products(data)
    ctx.body = response
  }

  async update (ctx) {
    const { body } = ctx.request
    const params = ctx.query
    const where = {
      id: params.id,
      nome: params.nome
    }
    const data = {
      nome: body.nome,
      tipo: body.tipo,
      preco: body.preco
    }
    const response = await queries.update.products(data, where)
    ctx.body = response
  }

  async remove (ctx) {
    const params = ctx.query
    const where = {
      id: params.id,
      nome: params.nome
    }
    assert(where.id !== undefined && where.nome !== undefined)
    const response = await queries.del.products(where)
    ctx.body = response
  }
}

module.exports = Controller
