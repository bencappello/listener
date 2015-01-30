Backbone.GeneralView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(Listener.currentUser, 'signIn signOut signUp update', this.render);
  },

  _requireSignedIn: function(callback){
    if (!Listener.currentUser.isSignedIn()) {
      var signInView = new Listener.Views.SignIn({callback: callback, required: true});
      Listener.modalRouter.trigger('swapModal', signInView)
      return false;
    }
    return true;
  },
});
