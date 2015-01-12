Listener.Routers.BandsRouter = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content')
    this.bands = new Listener.Collections.Bands();
  },

  routes: {
    'bands': 'bandsIndex',
    'bands/new': 'bandNew',
    'bands/:id': 'bandShow',
  },

  bandsIndex: function () {
    this.bands.fetch();
    var view = new Listener.Views.BandsIndex({collection: this.bands});
    this._swapView(view);
  },

  bandShow: function (id) {
    var band = this.bands.getOrFetch(id)
    var view = new Listener.Views.BandShow({model: band});
    this._swapView(view);
  },

  bandNew: function () {
    var band = new Listner.Models.Band();
    var view = new Listener.Views.BandForm({model: band})
    this._swapView(view);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
