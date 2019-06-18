const Koa = require('koa')
const Logger = require('koa-logger')
const koaBody = require('koa-body')
const Cors = require('@koa/cors')
const routes = require('../routes/index.js')
const respond = require('koa-respond')
const app = new Koa()

app.use(Logger())

app.use(Cors())

app.use(koaBody({ multipart: true }))

app.use(respond())

app.use(routes.routes())

module.exports = app
