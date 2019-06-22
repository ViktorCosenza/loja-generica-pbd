const Router = require('koa-router')
const products = require('./products')
const anyQuery = require('./anyQuery')
const productTypes = require('./productTypes')
const cargos = require('./cargos')
const funcionarios = require('./funcionario')
const lojas = require('./lojas')
const cidades = require('./cidades')
const estoque = require('./estoque')
const vendas = require('./vendas')
const itemVenda = require('./itemVenda')

const router = new Router()
const api = new Router()

api.use(products)
api.use(anyQuery)
api.use(productTypes)
api.use(cargos)
api.use(funcionarios)
api.use(lojas)
api.use(cidades)
api.use(estoque)
api.use(vendas)
api.use(itemVenda)

router.use('/v1', api.routes())

module.exports = router
