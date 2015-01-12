Listener.Views.SongsIndex = Backbone.CompositeView.extend({
  template: JST['songs/index'],

  className: 'songs-index',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({songs: this.collection}))
    return this;
  },
});
