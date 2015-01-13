Listener.Views.UsersShow = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(this.model, "sync change", this.render);
    this.listenTo(Listener.currentUser, 'sync', this.render)
  },

  template: JST['users/show'],

  events: {
    'click .follow': 'follow',
    'click .unfollow': 'unfollow',
  },

  render: function(){
    var html = this.template({ user: this.model });
    this.$el.html(html);

    return this;
  },

  follow: function () {
    var follow = new Listener.Models.UserFollow({
      followed_user_id: this.model.id
    });
    follow.save(null, {
      success: function () {
        Listener.currentUser.fetch();
      }
    });
  },

  unfollow: function () {
    new Listener.Models.UserFollow({
      id: this.model.id,
    }).destroy({
      success: function () {
        Listener.currentUser.fetch();
      }
    })
  },
});
