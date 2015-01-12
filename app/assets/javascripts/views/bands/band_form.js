Listener.Views.BandForm = Backbone.View.extend ({
  template: JST['bands/form'],

  className: 'band-form',

  initialize: function () {
  },

  render: function () {
    this.$el.html(this.template({band: this.model}))
    return this;
  },
});
