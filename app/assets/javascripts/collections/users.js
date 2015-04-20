Listener.Collections.Users = Backbone.Collection.extend({
  url: "/api/users",
  model: Listener.Models.User,

  getOrFetch: function(id) {
    var user = this.get(id),
    users = this;

    if(!user) {
      user = new this.model({ id: id });
    }
    user.fetch({
      data: {showPage: true},
      success: function() {
        users.add(user);
        user.trigger('reloadUser');
      }
    });
    return user;
  }
});
