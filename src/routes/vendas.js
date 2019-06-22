const Router = require('koa-router')
const ProductsController = require('../controllers/vendas')
const router = new Router()

const ctrl = new ProductsController()

router.get('/vendas', ctrl.show)
router.post('/vendas', ctrl.create)
router.put('/vendas', ctrl.update)
router.del('/vendas', ctrl.remove)

module.exports = router.routes()
