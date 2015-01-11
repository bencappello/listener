Listener.Views.CommentShow = Backbone.View.extend ({
  template: JST['comments/show'],

  className: 'comment-show',

  events: {
    'click .edit-comment': 'edit',
    'click .delete-comment': 'delete',
  },

  initialize: function (options) {
    this.parent = options.parent
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({comment: this.model}))
    return this;
  },

  edit: function (event) {
    event.preventDefault();

  },

  delete: function (event) {
    event.preventDefault();
    console.log(this.model.collection);
    this.model.destroy();
    this.parent.removeSubview('#comments', this);
  },
});
