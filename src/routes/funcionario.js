const Router = require('koa-router')
const Controller = require('../controllers/funcionarios')
const router = new Router()

const ctrl = new Controller()

router.get('/funcionarios', ctrl.show)
router.post('/funcionarios', ctrl.create)
router.put('/funcionarios', ctrl.update)
router.del('/funcionarios', ctrl.remove)

module.exports = router.routes()
