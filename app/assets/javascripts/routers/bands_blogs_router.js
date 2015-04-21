Listener.Routers.BandsBlogsRouter = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content');
    this.blogs = new Listener.Collections.Blogs();
    this.bands = new Listener.Collections.Bands();
  },

  routes: {
    'bands/:id': 'bandShow',
    'blogs/:id': 'blogShow',
    'blogs/find/:suffix': 'find',
  },

  bandShow: function (id) {
    var band = this.bands.getOrFetch(id)
    var view = new Listener.Views.BandShow({model: band});
    this._swapView(view);
  },

  blogShow: function (id) {
    var blog = this.blogs.getOrFetch(id)
    var view = new Listener.Views.BlogShow({model: blog});
    this._swapView(view);
  },

  find: function (suffix, page) {
    page = page || 1
    suffix = suffix || 'popular_now'
    var blogs = new Listener.Collections.Blogs();
    blogs.fetch ({
      data: {find: suffix, page: page}
    })
    var view = new Listener.Views.BlogsFind({collection: blogs, suffix: suffix})
    this._swapView(view);
  },

  _swapView: function (view) {
    Listener._currentView && Listener._currentView.remove();
    Listener._currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
