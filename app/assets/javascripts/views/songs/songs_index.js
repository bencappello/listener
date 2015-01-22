Listener.Views.SongsIndex = Backbone.CompositeView.extend({
  template: JST['songs/index'],

  className: 'songs-index',

  events: {
    "click #add-song-link": "addSong"
  },

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({songs: this.collection}))
    return this;
  },

  addSong: function (event) {
    event.preventDefault();
    var song = new Listener.Models.Song();
    var view = new Listener.Views.SongForm({model: song, collection: this.collection})
    Listener.modalRouter.trigger('swapModal', view)
  },
});
