Listener.Views.AudioPlayer = Backbone.View.extend({

  initialize: function(options){
    this.initialSong = new Listener.Models.Song({name: 'Someday'})
    this.render();
  },

  events: {
  },

  template: JST['shared/audio_player'],

  render: function () {
    var html = this.template();
    var that = this
    this.$el.html(html);
    this.initialSong.fetch({
      success: function () {
        that.changeSong(that.initialSong, 'load');
      }
    })
    return this;
  },

  changeSong: function (song, load) {
    this.current_song = song;
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

});
