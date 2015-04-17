Listener.Routers.UsersRouter = Backbone.Router.extend({

  initialize: function(){
    this.$rootEl = $('#content');
  },

  routes: {
    "users/:id": "show",
    "users/:id/:suffix": "show",
  },

  index: function () {
    Listener.users.fetch();
    var callback = this.index.bind(this);
    var indexView = new Listener.Views.UsersIndex();
    this._swapView(indexView);
  },

  show: function (id, suffix) {
    var callback = this.show.bind(this, id);
    var model = Listener.users.getOrFetch(id, 'reload');
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
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
