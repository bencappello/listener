Listener.Views.BlogListShow = Backbone.CompositeView.extend({
  template: JST['blogs/list_show'],

  className: 'blog-list-show',

  events: {
    'click .blog-follow': 'toggleFollow',
  },

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({blog: this.model}))
    return this;
  },

  toggleFollow: function (event) {
    if (event) { event.preventDefault(); }
    var callback = this.toggleFollow.bind(this);
    if (!this._requireSignedIn(callback)) { return; }
    Listener.currentUser.toggleBlogFollow(this.model.id);
    this.$('.blog-follow').toggleClass("blog-unfollow");
  },
});
