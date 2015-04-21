// Listener.Routers.BandsRouter = Backbone.Router.extend ({
//   initialize: function () {
//     this.$rootEl = $('#content');
//     this.bands = new Listener.Collections.Bands();
//   },
//
//   routes: {
//     'bands/:id': 'bandShow',
//   },
//
//   bandShow: function (id) {
//     var band = this.bands.getOrFetch(id)
//     var view = new Listener.Views.BandShow({model: band});
//     this._swapView(view);
//   },
//
//   _swapView: function (view) {
//     this.currentView && this.currentView.remove();
//     this.currentView = view;
//     this.$rootEl.html(view.render().$el);
//   },
// });
