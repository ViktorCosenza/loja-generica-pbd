const Router = require('koa-router')
const Controller = require('../controllers/cargos')
const router = new Router()

const ctrl = new Controller()

router.get('/cargos', ctrl.show)
router.post('/cargos', ctrl.create)
router.put('/cargos', ctrl.update)
router.del('/cargos', ctrl.remove)

module.exports = router.routes()
