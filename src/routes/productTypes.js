const Router = require('koa-router')
const Controller = require('../controllers/productTypes')
const router = new Router()

const ctrl = new Controller()

router.get('/tiposProduto', ctrl.show)
router.post('/tiposProduto', ctrl.create)
router.put('/tiposProduto', ctrl.update)
router.del('/tiposProduto', ctrl.remove)

module.exports = router.routes()
