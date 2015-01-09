Listener.Views.BandShow = Backbone.View.extend ({
  template: JST['bands/show'],

  className: 'band-show',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({band: this.model}))
    return this;
  },
});
