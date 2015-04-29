Backbone.GeneralView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(Listener.currentUser, 'signIn signOut signUp update', this.render);
    $(window).off("scroll");
    this.bindStickyNav();
    this.bindTourClose();
  },

  bindTourClose: function () {
    $(".joyride-close-tip").on("click", Listener.endTour.bind(Listener));
    $(window).on('resize', function () {
      console.log('resize')
    });
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
      wait: 300,
      resize: false,
      waitResize: 800
    }
    $.extend(settings, options)

    $(settings.tourID).joyride('hide');
    setTimeout(function(){
      $(settings.tourID).joyride('show');
    }, settings.wait);

    if (false) {
      setTimeout(function(){
        $(window).trigger('resize')
      }, settings.waitResize);
    }
  },

  startNewTour: function (options) {
    Listener.tourNumber
    settings = {
      endTourID: "#tour" + Listener.tourNumber,
      startTourID: "#tour" + (Listener.tourNumber + 1),
      wait: 300,
      resize: false,
      waitResize: 800
    }
    $.extend(settings, options)

    $(settings.endTourID).joyride('destroy');
    setTimeout(function(){
      $(settings.startTourID).joyride();
    }, settings.wait);

    if (settings.resize) {
      setTimeout(function(){
        $(window).trigger('resize')
      }, settings.waitResize);
    }
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
