Listener.Views.BlogsFind = Backbone.CompositeView.extend({
  template: JST['blogs/find'],

  className: 'find',

  initialize: function (options) {
    Backbone.GeneralView.prototype.initialize.call(this);
    this.suffix = options.suffix;
    this.listenTo(this.collection, 'sync', this.render)
    this.listenForScroll();
    this.newBlogs = new Listener.Collections.Blogs();
  },

  render: function () {
    this.$el.html(this.template({blogs: this.collection, title: this.suffix}))
    this.renderBlogs();
    return this;
  },

  addBlog: function (blog) {
    var view = new Listener.Views.BlogListShow({
      model: blog,
    });
    this.addSubview('section#blogs', view);
  },

  renderBlogs: function () {
    this.$el.find('section#blogs').empty();
    this.collection.each(this.addBlog.bind(this));
  },

  listenForScroll: function () {
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200, {leading: false});
    $(window).on("scroll", throttledCallback);
  },

  nextPage: function () {
    var view = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      var pageN = view.newBlogs.page_number || 1
      if (pageN < view.collection.total_pages) {
        view.newBlogs.fetch({
          data: { page: pageN + 1, find: view.suffix},
          success: function () {
            view.newBlogs.each(view.addBlog.bind(view));
          }
        });
      }
    }
  }
});
