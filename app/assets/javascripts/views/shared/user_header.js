Listener.Views.UserHeader = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(Listener.currentUser, "signIn signOut", this.render);
    this.render();
  },

  events: {
    "click #sign-out-link": "signOut",
    "click #sign-in-link": "signIn",
    "click #sign-up-link": "signUp",
    "click #add-song-link": "createSong",
    "click #add-blog-link": "createBlog",
    'click .edit': 'editUser',
  },

  template: JST['shared/user_header'],

  render: function () {
    var html = this.template({ currentUser: Listener.currentUser });
    this.$el.html(html);
    return this;
  },

  signOut: function (event) {
    event.preventDefault();
    Listener.currentUser.signOut();
  },

  signIn: function (event) {
    event.preventDefault();
    var signInView = new Listener.Views.SignIn();
    Listener.modalRouter.trigger('swapModal', signInView);
  },

  signUp: function (event) {
    event.preventDefault();
    var userFormView = new Listener.Views.UsersForm({edit: false});
    Listener.modalRouter.trigger('swapModal', userFormView);
  },

  createSong: function (event) {
    event.preventDefault();
    var song = new Listener.Models.Song();
    var view = new Listener.Views.SongForm({
      model: song,
    })
    Listener.modalRouter.trigger('swapModal', view);
  },

  createBlog: function (event) {
    event.preventDefault();
    var blog = new Listener.Models.Blog();
    var view = new Listener.Views.BlogForm({
      model: blog,
    })
    Listener.modalRouter.trigger('swapModal', view);
  },

  editUser: function (event) {
    event.preventDefault();
    var view = new Listener.Views.UsersForm({
      edit: true
    })
    Listener.modalRouter.trigger('swapModal', view);
  },

});
