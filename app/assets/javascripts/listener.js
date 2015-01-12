window.Listener = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {


    this.currentUser = new Listener.Models.CurrentUser();
    this.currentUser.fetch();

    this.header = new Listener.Views.Header({ el: "#header" });

    new Listener.Routers.BandsRouter();
    new Listener.Routers.BlogsRouter();
    new Listener.Routers.SongsRouter();
    new Listener.Routers.Users({ $rootEl: $("#content") });

    Backbone.history.start();
  }
};

$(document).ready(function(){
  Listener.initialize();
});
