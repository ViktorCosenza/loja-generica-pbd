const Koa = require('koa')
const Logger = require('koa-logger')
const koaBody = require('koa-body')
const cors = require('@koa/cors')
const routes = require('../routes/index.js')
const respond = require('koa-respond')
const app = new Koa()

app.use(cors({
  origin: '*'
}))

app.use(Logger())

app.use(koaBody({
  parsedMethods: ['GET', 'POST', 'PUT', 'DELETE']
}))

/* app.use(routes.routes()).use(routes.allowedMethods()) */

app.use(respond())

app.use(routes.routes())

module.exports = app
