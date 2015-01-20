Listener.Routers.UsersRouter = Backbone.Router.extend({

  initialize: function(){
    this.$rootEl = $('#content');
    this.collection = new Listener.Collections.Users();
  },

  routes: {
    "users": "index",
    "users/new": "new",
    "users/:id": "show",
    "users/:id/favorites": "showFavorites",
    "users/:id/feed": "showFeed",
    // "session/new": "signIn"
  },

  index: function(){
    this.collection.fetch();
    var callback = this.index.bind(this);
    var indexView = new Listener.Views.UsersIndex({
      collection: this.collection
    });
    this._swapView(indexView);
  },

  new: function(){
    if (!this._requireSignedOut()) { return; }

    var model = new this.collection.model();
    var formView = new Listener.Views.UsersForm({
      collection: this.collection,
      model: model
    });
    this._swapView(formView);
  },

  show: function(id){
    var callback = this.show.bind(this, id);
    var model = this.collection.getOrFetch(id, 'reload');
    var showView = new Listener.Views.UsersShow({
      model: model
    });
    this._swapView(showView);
  },

  // signIn: function(callback){
  //   if (!this._requireSignedOut(callback)) { return; }
  //
  //   var signInView = new Listener.Views.SignIn({
  //     callback: callback,
  //     parentView = this._currentView
  //   });
  //   this._currentView.$el.append(signInView.render().$el);
  // },

  _requireSignedIn: function(callback){
    if (!Listener.currentUser.isSignedIn()) {
      callback = callback || this._goHome.bind(this);
      this.signIn(callback);
      return false;
    }

    return true;
  },

  _requireSignedOut: function(callback){
    if (Listener.currentUser.isSignedIn()) {
      callback = callback || this._goHome.bind(this);
      callback();
      return false;
    }
    return true;
  },

  _goHome: function(){
    Backbone.history.navigate("", { trigger: true });
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
