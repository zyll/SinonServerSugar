describe "Sugar provided ", ->

  describe "Response", ->

    it 'is defined', ->
      expect(Response).to.exist

    beforeEach ->
      @xhr = new Response

    afterEach ->
      @xhr.restore()

    it 'can queue mock xhr with sugar', ->
      spy1 = sinon.spy()
      spy2 = sinon.spy()
      @xhr.with(url: '/steven').log().queue()
      @xhr.queue(url: '/steven/seagal').log()
      $.get('/steven').done spy1
      @xhr.respond()
      $.get('/steven/seagal').done spy2
      @xhr.respond()

      console.log spy1.called, spy2.called
      expect(spy1.calledOnce).to.be.true
      expect(spy2.calledOnce).to.be.true

   # todo test using backbone model
