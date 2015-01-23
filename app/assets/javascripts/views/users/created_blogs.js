Listener.Views.CreatedBlogs = Backbone.CompositeView.extend({
  template: JST['users/created_blogs'],

  className: 'blogs',

  initialize: function(options){
  },

  addBlog: function (blog) {
    var view = new Listener.Views.BlogListShow({
      model: blog,
      collection: this.model.createdBlogs(),
    });
    this.addSubview('section#created-blogs', view);
  },

  render: function () {
    this.$el.html(this.template({model: this.model}))
    this.model.createdBlogs().each(this.addBlog.bind(this));
    return this;
  },

});
