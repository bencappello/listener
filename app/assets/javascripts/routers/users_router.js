Listener.Routers.UsersRouter = Backbone.Router.extend({

  initialize: function(){
    this.$rootEl = $('#content');
  },

  routes: {
    "users/:id": "show",
    "users/:id/:suffix": "show",
  },

  show: function (id, suffix) {
    var callback = this.show.bind(this, id);
    var model = Listener.users.getOrFetch(id);
    var showView = new Listener.Views.UsersShow({
      model: model,
      content: suffix
    });
    this._swapView(showView);
  },

  _requireSignedIn: function (callback) {
    if (!Listener.currentUser.isSignedIn()) {
      callback = callback || this._goHome.bind(this);
      this.signIn(callback);
      return false;
    }
    return true;
  },

  _requireSignedOut: function (callback) {
    if (Listener.currentUser.isSignedIn()) {
      callback = callback || this._goHome.bind(this);
      callback();
      return false;
    }
    return true;
  },

  _goHome: function () {
    Backbone.history.navigate("", { trigger: true });
  },

  _swapView: function (view) {
    Listener._currentView && Listener._currentView.remove();
    Listener._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
