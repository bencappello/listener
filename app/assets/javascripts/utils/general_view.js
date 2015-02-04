Backbone.GeneralView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(Listener.currentUser, 'signIn signOut signUp update', this.render);
    $(window).off("scroll");
    this.bindStickyNav();
  },

  bindStickyNav: function () {
    $(window).bind('scroll', function() {
      if ($(window).scrollTop() > 60) {
        $('#sub-header').addClass('fixed');
      }
      else {
        $('#sub-header').removeClass('fixed');
      }
    });
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
