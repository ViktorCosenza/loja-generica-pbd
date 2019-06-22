const Router = require('koa-router')
const Controller = require('../controllers/cidades')
const router = new Router()

const ctrl = new Controller()

router.get('/cidades', ctrl.show)
router.post('/cidades', ctrl.create)
router.put('/cidades', ctrl.update)
router.del('/cidades', ctrl.remove)

module.exports = router.routes()
