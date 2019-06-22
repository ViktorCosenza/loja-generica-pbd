const Router = require('koa-router')
const Controller = require('../controllers/estoque')
const router = new Router()

const ctrl = new Controller()

router.get('/estoque', ctrl.show)
router.post('/estoque', ctrl.create)
router.put('/estoque', ctrl.update)
router.del('/estoque', ctrl.remove)

module.exports = router.routes()
