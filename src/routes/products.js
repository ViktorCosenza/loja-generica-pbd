const Router = require('koa-router')
const ProductsController = require('../controllers/products')
const router = new Router()

const ctrl = new ProductsController()

router.get('/produtos', ctrl.show)
router.post('/produtos', ctrl.create)
router.put('/produtos', ctrl.update)
router.del('/produtos', ctrl.remove)

module.exports = router.routes()
