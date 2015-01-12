Listener.Views.BandsIndex = Backbone.CompositeView.extend({
  template: JST['bands/index'],

  className: 'bands-index',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({bands: this.collection}))
    return this;
  },
});
