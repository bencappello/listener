Listener.Views.CommentForm = Backbone.CompositeView.extend({
  initialize: function (options) {
    this.parent_id = options.parent_id
    this.parent_type = options.parent_type
  },

  formTemplate: JST['comments/form'],
  linkTemplate: JST['comments/form_link'],
  className: 'comment-form',

  events: {
    'click a': 'showForm',
    'click .close': 'hideForm',
    'submit' : 'create',
    'keydown textarea': 'maybeCreate'
  },

  formShowing: false,

  render: function () {
    var content;
    if(this.formShowing) {
      content = this.formTemplate();
    } else {
      content = this.linkTemplate();
    }
    this.$el.html(content);
    this.delegateEvents();
    return this;
  },

  hideForm: function () {
    this.formShowing = false;
    this.render();
  },

  maybeCreate: function (event) {
    if(event.keyCode === 13) {
      this.create(event);
    }
  },

  showForm: function (event) {
    event.preventDefault();
    this.formShowing = true;
    this.render();
  },

  create: function (event) {
    if (event) {
      event.preventDefault();
      $(event.currentTarget).addClass('hello');
    }
    var callback = this.create.bind(this);
    if (!this._requireSignedIn(callback)) { return; }

    this.collection.create({
      body: this.$('textarea').val(),
      commentable_id: this.parent_id,
      commentable_type: this.parent_type
    }, {wait: true, at: 0});
    this.$('textarea').val('');
    this.$('textarea').focus();
  },
});
