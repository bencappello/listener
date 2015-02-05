Listener.Views.AudioPlayer = Backbone.View.extend({

  initialize: function(options){
    this.render();
  },

  events: {
  },

  template: JST['shared/audio_player'],

  render: function () {
    var html = this.template();
    this.$el.html(html);
    return this;
  },

  changeSong: function (song) {
    var imageUrl = song.escape('image_url');
    var audioUrl = song.escape('audio_url');
    var name = song.escape('band_name') + ' - ' + song.escape('name');

    var audioPlayer = this.$el.find('#audio-player')
    this.$el.find('#mp3_src').attr('src', audioUrl);
    this.$el.find('#player-img').attr('src', imageUrl);
    this.$el.find('#song-title').html(name);
    audioPlayer[0].pause();
    audioPlayer[0].load();
    audioPlayer[0].play();
  },

});
