(function() {
  describe("Sugar provided ", function() {
    return describe("Response", function() {
      it('is defined', function() {
        return expect(Response).to.exist;
      });
      beforeEach(function() {
        return this.xhr = new Response;
      });
      afterEach(function() {
        return this.xhr.restore();
      });
      return it('can queue mock xhr with sugar', function() {
        var spy1, spy2;
        spy1 = sinon.spy();
        spy2 = sinon.spy();
        this.xhr["with"]({
          url: '/steven'
        }).log().queue();
        this.xhr.queue({
          url: '/steven/seagal'
        }).log();
        $.get('/steven').always(spy1);
        this.xhr.respond();
        $.get('/steven/seagal').done(spy2);
        this.xhr.respond();
        console.log(spy1.called, spy2.called);
        expect(spy1.calledOnce).to.be["true"];
        return expect(spy2.calledOnce).to.be["true"];
      });
    });
  });

}).call(this);
