Listener.Collections.Blogs = Backbone.Collection.extend({
  model: Listener.Models.Blog,
  url: 'api/blogs',

  comparator: function (blog) {
    return blog.escape('name');
  },

  getOrFetch: function (id) {
    var blog = this.get(id);

    if(!blog) {
      blog = new Listener.Models.Blog({ id: id });
      blog.fetch({
        success: function () {
          this.add(blog);
        }.bind(this)
      });
    } else {
      blog.fetch();
    }

    return blog;
  },

});
