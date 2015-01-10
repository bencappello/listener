Listener.Views.CommentShow = Backbone.View.extend ({
  template: JST['comments/show'],

  className: 'comment-show',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({comment: this.model}))
    return this;
  },
});
