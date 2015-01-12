window.Listener = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Listener.Routers.BandsRouter();
    new Listener.Routers.BlogsRouter();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Listener.initialize();
});
