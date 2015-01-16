window.Listener = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new Listener.Models.CurrentUser();
    this.currentUser.fetch();

    this.tags = new Listener.Collections.Tags();
    this.tags.fetch();

    this.topHeader = new Listener.Views.TopHeader({ el: "#top-header" });
    this.userHeader = new Listener.Views.UserHeader({ el: "#user-nav" });

    new Listener.Routers.BandsRouter();
    new Listener.Routers.BlogsRouter();
    new Listener.Routers.SongsRouter();
    new Listener.Routers.Users({ $rootEl: $("#content") });
    Backbone.history.start();

    $(window).bind('scroll', function() {
      if ($(window).scrollTop() > 62) {
        $('#sub-header').addClass('fixed');
      }
      else {
        $('#sub-header').removeClass('fixed');
      }
    });
  }
};

$(document).ready(function(){
  Listener.initialize();
});
