Listener.Views.BandsIndex = Backbone.View.extend ({
  template: JST['bands/index'],

  className: 'bands-index',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({bands: this.collection}))
    return this;
  },

  showBand: function () {
    Backbone.history.navigate('')
  },

});
