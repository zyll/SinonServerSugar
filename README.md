Not a lot of stuf, i often write less code when using it.

# Example

      @xhr = (new Response).with(
        content: JSON.stringify @model.toJSON()
        url: @segment.url())
      @xhr.queue(method: 'POST')
      @xhr.server.respond()

# Default

      method: "GET"
      url: '/'
      status: 200
      headers:
        "Content-Type": "application/json"
      content: ''
