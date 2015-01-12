Listener.Views.BlogsIndex = Backbone.View.extend ({
  template: JST['blogs/index'],

  className: 'blogs-index',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({blogs: this.collection}))
    return this;
  },
});
