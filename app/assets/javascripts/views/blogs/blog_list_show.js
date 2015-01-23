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
    event.preventDefault();
    var button = $(event.currentTarget)
    var blog_id = button.data('id');
    var followed = Listener.currentUser.toggleBlogFollow(blog_id);
    button.toggleClass("blog-unfollow");
  },
});
