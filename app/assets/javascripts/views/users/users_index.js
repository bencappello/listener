Listener.Views.UsersIndex = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(Listener.users, "sync", this.render);
  },

  template: JST['users/index'],

  render: function(){
    var html = this.template({ users: Listener.users });
    this.$el.html(html);

    return this;
  }

});
