describe "Sugar provided ", ->

  describe "Response", ->

    it 'is defined', ->
      expect(Response).toBeDefined()

    beforeEach ->
      @xhr = new Response

    afterEach ->
      @xhr.restore()

    it 'can queue mock xhr with sugar', ->
      spy1 = sinon.spy()
      spy2 = sinon.spy()
      @xhr.with(url: '/steven').queue()
      @xhr.queue url: '/steven/seagal'
      $.get('/steven').done spy1
      @xhr.respond()
      $.get('/steven/seagal').done spy2
      @xhr.respond()
      
      expect(spy1).toHaveBeenCalledOnce()
      expect(spy2).toHaveBeenCalledOnce()

   # todo test using backbone model
