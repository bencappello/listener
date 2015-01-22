Listener.Views.UsersForm = Backbone.View.extend({

  initialize: function(options){
  },

  template: JST['users/form'],

  events: {
    "submit form": "submit",
    "change #input-user-image": "fileInputChange",
    "click #sign-in-link": "signIn",
    'click .js-modal-close': 'closeForm',
  },

  render: function(){
    // debugger
    var html = this.template({ user: this.model });
    this.$el.html(html);

    return this;
  },

  closeForm: function () {
    event.preventDefault();
    $(".modal").removeClass("is-open");
  },

  submit: function(event){
    event.preventDefault();

    var $form = $(event.currentTarget);
    var userData = $form.serializeJSON().user;
    var that = this;

    this.model.set(userData);
    this.model.save({}, {
      success: function(model, resp){
        Listener.currentUser.fetch();
        Listener.users.add(that.model, { merge: true });
        delete that.model._image;
        $(".modal").removeClass("is-open");
        Backbone.history.navigate("users/" + resp.id, { trigger: true });
      },
      error: function (model, resp) {
        that.renderErrors(resp);
      }
    });
  },

  fileInputChange: function(event){

    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that._updatePreview(reader.result);
      that.model._image = reader.result;
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      this._updatePreview("");
      delete this.model._image;
    }
  },

  _updatePreview: function(src){
    this.$el.find("#preview-user-image").attr("src", src);
  },

  signIn: function (event) {
    event.preventDefault();
    var signInView = new Listener.Views.SignIn();
    Listener.modalRouter.trigger('swapModal', signInView)
  },

});
