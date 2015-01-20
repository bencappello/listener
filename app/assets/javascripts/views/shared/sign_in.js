Listener.Views.SignIn = Backbone.View.extend({

  initialize: function(options){
    this.model = Listener.currentUser;
    // this.callback = options.callback;
    // this.listenTo(Listener.currentUser, "signIn", this.signInCallback);
  },

  events: {
    "submit form": "submit",
    'click .js-modal-close': 'closeForm'
  },

  template: JST['shared/sign_in'],

  render: function(){
    this.$el.html(this.template());
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
      "user[email]": formData.email,
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
      },
      error: function() {
        $("#errors").html($('<div>Wrong username/password combination. Please try again.</div>'));
      }
    });
  },

  // signInCallback: function(event){
  //   if(this.callback) {
  //     this.callback();
  //   } else {
  //     Backbone.history.navigate("", { trigger: true });
  //   }
  // }

});
