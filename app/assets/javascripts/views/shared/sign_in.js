Listener.Views.SignIn = Backbone.View.extend({

  initialize: function(options){
    this.model = Listener.currentUser;
    this.callback = options ? options.callback : false;
    this.required = options ? options.required : false;
    // this.listenTo(Listener.currentUser, "signIn", this.signInCallback);
  },

  events: {
    "submit form": "submit",
    'click .js-modal-close': 'closeForm',
    "click .sign-up-link": "signUp",
    'click .guest-btn': 'guestSignIn',
  },

  template: JST['shared/sign_in'],

  render: function(){
    this.$el.html(this.template({required: this.required}));
    return this;
  },

  closeForm: function () {
    event.preventDefault();
    $(".modal").removeClass("is-open");
  },

  submit: function(event){
    event.preventDefault();
    var that = this;
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().user;
    var credentials = {
      "user[username_or_email]": formData.username_or_email,
      "user[password]": formData.password
    };

    $.ajax({
      url: "/api/session",
      type: "POST",
      data: credentials,
      dataType: "json",
      success: function(data) {
        data = that.model.parse(data);
        that.model.set(data);
        $(".modal").removeClass("is-open");
        if (that.callback) {
          that.callback();
        }
      },
      error: function() {
        $("#errors").html($('<div>Wrong username/password combination. Please try again.</div>'));
      }
    });
  },

  signUp: function (event) {
    event.preventDefault();
    var model = new Listener.users.model();
    var userFormView = new Listener.Views.UsersForm({
      model: model
    });
    Listener.modalRouter.trigger('swapModal', userFormView)
  },
  
});
