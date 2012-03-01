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
    _.extend @options, options
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

window.Response = Response
