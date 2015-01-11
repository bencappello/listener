Listener.Views.BandShow = Backbone.CompositeView.extend({
  template: JST['bands/show'],

  className: 'band-show',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
  },

  render: function () {
    this.$el.html(this.template({band: this.model}))
    this.renderComments();
    this.renderCommentForm();
    return this;
  },

  addComment: function (comment) {
    var view = new Listener.Views.CommentShow({
      model: comment,
      collection: this.model.comments(),
      parent: this
    });
    this.addSubview('#comments', view);
  },

  renderComments: function () {
    this.$el.find('ul#comments').empty();
    this.model.comments().each(this.addComment.bind(this));
  },

  renderCommentForm: function () {
    var view = new Listener.Views.CommentForm({
      collection: this.model.comments(),
      parent_id: this.model.id,
      parent_type: 'Band'
    });
    this.addSubview('#comment-form', view);
  },
});
