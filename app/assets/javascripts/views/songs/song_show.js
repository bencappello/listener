Listener.Views.SongShow = Backbone.CompositeView.extend({
  template: JST['songs/show'],

  className: 'song-show',

  events: {
    'click .favorite': 'favorite',
    'click .unfavorite': 'unfavorite',
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
    this.listenTo(Listener.currentUser, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    this.renderComments();
    this.renderCommentForm('Song');
    return this;
  },

  favorite: function () {
    var favorite = new Listener.Models.Favorite({
      song_id: this.model.id
    });
    favorite.save(null, {
      success: function () {
        Listener.currentUser.fetch();
      }
    });
  },

  unfavorite: function () {
    new Listener.Models.Favorite({
      id: this.model.id,
    }).destroy({
      success: function () {
        Listener.currentUser.fetch();
      }
    })
  },

});
