Listener.Views.BlogForm = Backbone.View.extend ({
  template: JST['blogs/form'],

  className: 'blog-form',

  initialize: function () {
  },

  render: function () {
    this.$el.html(this.template({blog: this.model}))
    return this;
  },
});
