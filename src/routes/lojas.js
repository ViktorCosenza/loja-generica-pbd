const Router = require('koa-router')
const Controller = require('../controllers/lojas')
const router = new Router()

const ctrl = new Controller()

router.get('/lojas', ctrl.show)
router.post('/lojas', ctrl.create)
router.put('/lojas', ctrl.update)
router.del('/lojas', ctrl.remove)

module.exports = router.routes()
