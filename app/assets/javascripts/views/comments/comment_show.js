Listener.Views.CommentShow = Backbone.CompositeView.extend({
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
    console.log(this.model)
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
    var attrs = {
      body: this.$('textarea').val(),
      author_name: Listener.currentUser.get('username')
    };
    this.model.save(attrs);
  },

  delete: function (event) {
    event.preventDefault();
    this.model.destroy();
    this.parent.removeSubview('#comments', this);
  },
});
