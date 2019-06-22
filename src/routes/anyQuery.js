const Router = require('koa-router')
const QueryController = require('../controllers/anyQuery')
const router = new Router()

const ctrl = new QueryController()

router.post('/query', ctrl.query)

module.exports = router.routes()
