const queries = require('../utils/queries')

class Controller {
  async show (ctx) {
    const response = await queries.select.products()
    ctx.body = response
  }
  async create (ctx) {
    const { body } = ctx.request
    const product = {
      nome: body.nome,
      tipo: body.tipo,
      preco: body.preco
    }
    const response = await queries.insert.products(product)
    ctx.body = response
  }
}

module.exports = Controller
