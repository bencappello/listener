Listener.Routers.Router = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content')
  },

  routes: {
    'bands': 'bandsIndex',
  },

  bandsIndex: function () {
    this.bands = new Listener.Collections.Bands();
    this.bands.fetch();
    var view = new Listener.Views.BandsIndex({collection: this.bands});
    this._swapView(view);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
