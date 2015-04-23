Listener.Views.UsersForm = Backbone.CompositeView.extend({

  initialize: function(options){
    this.edit = options.edit;
    this.model = this.edit ? Listener.currentUser : new Listener.users.model();
  },

  template: JST['users/form'],

  events: {
    "submit form": "submit",
    "change #input-user-image": "fileInputChange",
    "keyup .upload-url": "imageURLInputChange",
    "click #sign-in-link": "signIn",
    'click .js-modal-close': 'closeForm',
    'click .guest-btn': 'guestSignIn',
  },

  render: function(){
    var html = this.template({ user: this.model, edit: this.edit });
    this.$el.html(html);

    return this;
  },

  renderErrors: function (resp) {
    $('#errors').empty();
    resp.responseJSON.forEach(function (el) {
      var li = $('<li></li>');
      li.html(el);
      $('#errors').append(li);
    })
  },

  closeForm: function (event) {
    event.preventDefault();
    $(".modal").removeClass("is-open");
  },

  submit: function(event){
    event.preventDefault();
    var $form = $(event.currentTarget);
    var userData = $form.serializeJSON().user;
    if (userData.password == '') {
      delete userData.password;
    }
    var that = this;

    this.model.set(userData);
    this.model.save({}, {
      success: function(model, resp){
        Listener.currentUser.fetch();
        Listener.users.add(that.model, { merge: true });
        delete that.model._image;
        $(".modal").removeClass("is-open");
        if (Backbone.history.fragment == 'users/' + resp.id) {
          Listener.usersRouter.show(resp.id);
        }
        Backbone.history.navigate("users/" + resp.id, { trigger: true });
      },
      error: function (model, resp) {
        that.renderErrors(resp);
      }
    });
    this.renderLoading();
  },

  fileInputChange: function(event){

    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that._addPreview("#preview-user-image", reader.result);
      that.model._image = reader.result;
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      this._removePreview("#preview-user-image", "");
      delete this.model._image;
    }
  },

  imageURLInputChange: function(event){
    var that = this;
    var url = $(event.currentTarget).val();
    console.log(url)

    if (url == "") {
      this._removePreview("#preview-user-image-url", "");
    } else {
      that._addPreview("#preview-user-image-url", url);
    }
  },

  _addPreview: function(el, src){
    var $preview = this.$el.find(el);
    $preview.attr("src", src);
    $preview.addClass('show');
  },

  _removePreview: function(el, src){
    var $preview = this.$el.find(el);
    $preview.attr("src", src);
    $preview.removeClass('show');
  },

  signIn: function (event) {
    event.preventDefault();
    var signInView = new Listener.Views.SignIn();
    Listener.modalRouter.trigger('swapModal', signInView)
  },

  guestSignIn: function (event) {
    event.preventDefault();
    $.ajax({
      url: "/api/session/guest",
      type: "POST",
      dataType: "json",
      success: function(data) {
        Listener.currentUser.fetch();
        Backbone.history.navigate("users/" + data.id, { trigger: true })
        $(".modal").removeClass("is-open");
        setTimeout(signOutCallback, 3000)
      },
      error: function() {
        console.log('guest sign in error')
      }
    });
  },

});
