Listener.Views.BandForm = Backbone.CompositeView.extend({
  template: JST['bands/form'],

  className: 'band-form',

  initialize: function () {
  },

  render: function () {
    this.$el.html(this.template({band: this.model}))
    return this;
  },
});
