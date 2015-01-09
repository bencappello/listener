window.Listener = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Listener.Routers.Router();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Listener.initialize();
});
