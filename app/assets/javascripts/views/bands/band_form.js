Listener.Views.BandForm = Backbone.CompositeView.extend({
  template: JST['bands/form'],

  className: 'band-form',

  events : {
    'submit form': 'submit'
  },

  initialize: function () {
  },

  render: function () {
    this.$el.html(this.template({band: this.model}))
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var that = this;
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().band;
    debugger
    this.collection.create(formData, {
      success: function () {
        Backbone.history.navigate('bands', {trigger: true});
      },
      error: function () {
        console.log('error');
      }
    })
  },
});
