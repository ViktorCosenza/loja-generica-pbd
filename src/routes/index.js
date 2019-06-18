const Router = require('koa-router')
const products = require('./products')

const router = new Router()
const api = new Router()

api.use(products)

router.use('/v1', api.routes())

module.exports = router
