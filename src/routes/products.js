const Router = require('koa-router')
const ProductsController = require('../controllers/products')
const router = new Router()

const ctrl = new ProductsController()

router.get('/products', ctrl.show)
router.post('/products', ctrl.create)
router.put('/products', ctrl.update)
router.del('/products', ctrl.remove)

module.exports = router.routes()
