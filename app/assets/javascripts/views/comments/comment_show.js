Listener.Views.CommentShow = Backbone.View.extend ({
  template: JST['comments/show'],
  editTemplate: JST['comments/edit'],

  className: 'comment-show',

  events: {
    'click .edit-comment': 'edit',
    'click .delete-comment': 'delete',
    'submit' : 'updateComment',
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
    this.$el.html(this.editTemplate({comment: this.model}))
  },

  updateComment: function () {
    event.preventDefault();
    var that = this;
    var comment = new Listener.Models.Comment({
      id: this.model.id,
      body: this.$('textarea').val(),
      author_name: 'currentUser'
    }, {});
    comment.save(null, {
      success: function () {
        that.collection.add(comment, { merge: true });
        that.model = comment;
        that.render();
      }
    });
  },

  delete: function (event) {
    event.preventDefault();
    console.log(this.model.collection);
    this.model.destroy();
    this.parent.removeSubview('#comments', this);
  },
});
