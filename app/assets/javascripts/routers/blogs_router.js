Listener.Routers.BlogsRouter = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content')
    this.blogs = new Listener.Collections.Blogs();
  },

  routes: {
    'blogs': 'blogsIndex',
    'blogs/new': 'blogNew',
    'blogs/:id': 'blogShow',
    'blogs/:id/edit': 'blogEdit',
  },

  blogsIndex: function () {
    this.blogs.fetch();
    var view = new Listener.Views.BlogsIndex({collection: this.blogs});
    this._swapView(view);
  },

  blogShow: function (id) {
    var blog = this.blogs.getOrFetch(id)
    var view = new Listener.Views.BlogShow({model: blog});
    this._swapView(view);
  },

  blogNew: function () {
    var blog = new Listener.Models.Blog();
    var view = new Listener.Views.BlogForm({model: blog, collection: this.blogs})
    this._swapView(view);
  },

  blogEdit: function (id) {
    var blog = this.blogs.getOrFetch(id);
    var view = new Listener.Views.BlogForm({model: blog, collection: this.blogs})
    this._swapView(view);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
