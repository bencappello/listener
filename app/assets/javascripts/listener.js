window.Listener = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new Listener.Models.CurrentUser();
    this.currentUser.fetch();

    this.users = new Listener.Collections.Users();

    this.tags = new Listener.Collections.Tags();
    this.tags.fetch();

    this.allBands = new Listener.Collections.Bands();
    this.allBands.fetch();

    this.allSongs = new Listener.Collections.Bands();
    this.allSongs.fetch();

    this.topHeader = new Listener.Views.TopHeader({ el: "#top-header" });
    this.userHeader = new Listener.Views.UserHeader({ el: "#user-nav" });

    new Listener.Routers.BandsRouter();
    new Listener.Routers.BlogsRouter();
    new Listener.Routers.SongsRouter();
    this.usersRouter = new Listener.Routers.UsersRouter();
    this.modalRouter = new Listener.Routers.ModalRouter();
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
