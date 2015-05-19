Backbone.GeneralView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(Listener.currentUser, 'signIn signOut signUp update', this.render);
    $(window).off("scroll");
    this.bindStickyNav();
  },

  bindStickyNav: function () {
    $(window).bind('scroll', function() {
      if ($(window).scrollTop() > 65) {
        $('#sub-header').addClass('fixed');
      }
      else {
        $('#sub-header').removeClass('fixed');
      }
    });
  },

  renderLoading: function () {
    this.$el.find('#loading').html($('<div> Saving...</div>'));
  },

  pauseStartTour: function (options) {
    var settings = {
      tourID: "#tour1",
      wait: 300
    }
    $.extend(settings, options)

    $(settings.tourID).joyride('hide');
    setTimeout(function(){
      $(settings.tourID).joyride('show');
    }, settings.wait);

  },

  startNewTour: function (options) {
    settings = {
      endTourID: "#tour" + Listener.tourNumber,
      startTourID: "#tour" + (Listener.tourNumber + 1),
      wait: 300
    }
    $.extend(settings, options)

    $(settings.endTourID).joyride('destroy');
    if (Listener.tourNumber >= 12) {
      Listener.tour = false;
      return;
    }

    setTimeout(function(){
      $(settings.startTourID).joyride();
    }, settings.wait);

    Listener.tourNumber += 1;
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
