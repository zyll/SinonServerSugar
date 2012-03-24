#
# Shorten helper to stack responses on a sinon fake server
# 
# @todo license
# @todo commonjs module
#
#
# default options :
#    method: "GET"
#    url: '/'
#    status: 200
#    headers:
#      "Content-Type": "application/json"
#    content: ''

class Response
  constructor: (server) ->
    @server = server || sinon.fakeServer.create()
    @default()

  with: (options) =>
    data = options
    if _.isFunction(options.url) && _.isFunction(options.toJSON)
      data =
        url: options.url()
        content: JSON.stringify options.toJSON()
    _.extend @options, data
    @

  defaultOptions: ->
    method: "GET"
    url: '/'
    status: 200
    headers:
      "Content-Type": "application/json"
    content: ''

  default: =>
    @options = @defaultOptions()
    @

  queue: =>
    @server.respondWith @options.method, @options.url, [
      @options.status
      @options.headers
      @options.content
    ]
    @

  restore: =>
    @server.restore.call @server

  log: =>
    console?.log?(@options)
    @

window.Response = Response
