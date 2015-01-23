Listener.Views.FollowedBlogs = Backbone.CompositeView.extend({
  template: JST['users/followed_blogs'],

  className: 'blogs',

  initialize: function(options){
  },

  addBlog: function (blog) {
    var view = new Listener.Views.BlogListShow({
      model: blog,
      collection: this.model.followedBlogs(),
    });
    this.addSubview('section#followed-blogs', view);
  },

  render: function () {
    this.$el.html(this.template({model: this.model}))
    this.model.followedBlogs().each(this.addBlog.bind(this));
    return this;
  },

});
