Listener.Views.AudioPlayer = Backbone.View.extend({

  initialize: function(options){
    this.render();
    $('#audio-player').on("playing", this.addCurrentSong.bind(this));
  },

  events: {
  },

  template: JST['shared/audio_player'],

  render: function () {
    var html = this.template();
    var that = this
    this.$el.html(html);
    return this;
  },

  loadSong: function (song) {
    if (!this.current_song) {
      this.changeSong(song, 'load')
    }
  },

  changeSong: function (song, load) {
    var imageUrl = song.escape('nav_image_url');
    var audioUrl = song.escape('audio_url');
    var bandN = song.escape('band_name');
    var bandU = '#/bands/' + song.escape('band_id');
    var songN = song.fullName();
    var songU = '#/songs/' + song.id;
    var name = $('<a class="audio-underline-link" href="' + bandU + '">' + bandN + '</a> - <a class="audio-underline-link" href="' + songU + '">' + songN + '</a>')

    var audioPlayer = this.$el.find('#audio-player')
    this.$el.find('#mp3_src').attr('src', audioUrl);
    this.$el.find('#player-img').attr('src', imageUrl);
    this.$el.find('#song-title').html(name);
    audioPlayer[0].pause();
    audioPlayer[0].load();
    if (!load) {
      audioPlayer[0].play();
    }
  },

  addCurrentSong: function () {
    this.current_song = true
  },

});
