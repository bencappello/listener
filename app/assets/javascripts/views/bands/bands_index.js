Listener.Views.BandsIndex = Backbone.View.extend ({
  template: JST['bands/index'],

  // className: 'bands-index',

  // initialize: function () {
  // },

  render: function () {
    this.$el.html(this.template({bands: this.collection}))
    return this;
  },
});
