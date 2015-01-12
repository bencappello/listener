window.Listener = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Listener.Routers.BandsRouter();
    new Listener.Routers.BlogsRouter();
    new Listener.Routers.SongsRouter();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Listener.initialize();
});
