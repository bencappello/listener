Listener.Views.AudioPlayer = Backbone.View.extend({

  initialize: function(options){
    this.render();
    $('#audio-player').on("playing", this.addCurrentSong.bind(this));
    $('#audio-player').on("ended", this.nextSong.bind(this));
  },

  events: {
    'click #next-song': 'nextSong',
    'click #last-song': 'lastSong',
  },

  template: JST['shared/audio_player'],

  render: function () {
    var html = this.template();
    var that = this
    this.$el.html(html);
    return this;
  },

  maybeLoadSong: function (song) {
    if (!this.current_song) {
      this.changeSong(song, 'load')
    }
  },

  changeSong: function (song, load) {
    if (song.collection) {
      this.current_blog = song.collection;
      this.current_index = song.collection.indexOf(song);
    }
    var imageUrl = song.escape('nav_image_url');
    var audioUrl = song.escape('audio_url');
    var bandN = song.escape('band_name');
    var bandU = '#/bands/' + song.escape('band_id');
    var songN = song.fullName();
    var songU = '#/songs/' + song.id;
    var name = $('<a class="audio-underline-link" href="' + bandU + '">' + bandN + '</a> - <a class="audio-underline-link tour-user-nav" href="' + songU + '">' + songN + '</a>')

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

  nextSong: function () {
    if (this.current_index < (this.current_blog.length - 1)) {
      this.current_index += 1;
      this.changeSong(this.current_blog.at(this.current_index));
    }
  },

  lastSong: function () {
    if (this.current_index > 0) {
      this.current_index -= 1;
      this.changeSong(this.current_blog.at(this.current_index));
    }
  },

  addCurrentSong: function () {
    this.current_song = true;
  },

});
