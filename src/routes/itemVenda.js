const Router = require('koa-router')
const ProductsController = require('../controllers/itemVenda')
const router = new Router()

const ctrl = new ProductsController()

router.get('/itemVenda', ctrl.show)
router.post('/itemVenda', ctrl.create)
router.put('/itemVenda', ctrl.update)
router.del('/itemVenda', ctrl.remove)

module.exports = router.routes()
