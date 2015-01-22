Backbone.GeneralView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(Listener.currentUser, 'signIn signOut signUp', this.render);
  },
});
