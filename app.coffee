views = require 'co-views'
# co = require 'co'
logger = require 'koa-logger'
route = require 'koa-route'
koa = require 'koa'
app = koa()

app.use logger()

# var render = views('examples', {
  # map: { html: 'swig' }
# });

console.log __dirname
console.log "#{__dirname}/views"

render = views(
  "#{__dirname}/views",
  map: {html: 'lodash'}
)

# require('util').inspect render, {depth: 4}
# app.use views
#
console.log 'cron test'
test = ->
  console.log 12313123131231313
  this.body = yield render 'index'
app.use route.get '/', test


app.use (next) ->
  start = new Date
  yield next
  ms = new Date - start
  if not /browser-sync/.test @url
    console.log '%s %s - %s', @method, @url, ms
# app.use (next) ->
  # this.body = 'hello, koa!!'
  # yield next

app.listen 3000
console.log 'listening to 3000'

# app.use (next) ->
#   start = new Date
#   yield next
#   ms = new Date - start
#   @set 'X-Response-Time', ms + 'ms'
#
# # logger
#
# app.use (next) ->
#   start = new Date
#   yield next
#   ms = new Date - start
#   console.log '%s %s - %s', this.method, this.url, ms
#
# # response
