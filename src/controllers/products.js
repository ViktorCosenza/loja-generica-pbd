const assert = require('assert')
const queries = require('../utils/queries')

class Controller {
  async show (ctx) {
    const { query } = ctx
    console.log(query)
    const filter = {
      ...(query.tipo !== '' && { tipo: query.tipo }),
      ...(query.nome !== '' && { nome: query.nome }),
      ...(query.preco !== '' && { preco: query.preco })
    }
    console.log(filter)
    const response = await queries.select.products('*', filter)
    ctx.body = response
  }

  async create (ctx) {
    const { body } = ctx.request
    console.log(body)
    const data = {
      nome: body.search.nome,
      tipo: body.search.tipo,
      preco: body.search.preco
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
