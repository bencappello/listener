Listener.Collections.Songs = Backbone.Collection.extend({
  model: Listener.Models.Song,
  url: 'api/songs',

  // comparator: function (song) {
  //   return -song.get('id');
  // },

  getOrFetch: function (id) {
    var song = this.get(id);

    if(!song) {
      song = new Listener.Models.Song({ id: id });
      song.fetch({
        success: function () {
          this.add(song);
        }.bind(this)
      });
    } else {
      song.fetch();
    }

    return song;
  },

  parse: function(response) {
    if (response.page_number) {
      this.page_number = parseInt(response.page_number);
      this.total_pages = parseInt(response.total_pages);
      return response.models;
    } else {
      return response;
    }
  },

});
