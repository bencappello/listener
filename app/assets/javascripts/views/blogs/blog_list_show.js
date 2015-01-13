Listener.Views.BlogListShow = Backbone.CompositeView.extend({
  template: JST['blogs/list_show'],

  className: 'blog-show',

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({blog: this.model}))
    return this;
  },
});
