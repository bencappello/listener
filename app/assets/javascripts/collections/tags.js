Listener.Collections.Tags = Backbone.Collection.extend({
  model: Listener.Models.Tag,
  url: 'api/tags',

  initialize: function (options) {
    // this.band = options.band
  },

  getOrFetch: function (id) {
    var tag = this.get(id);

    if(!tag) {
      tag = new Listener.Models.Tag({ id: id });
      tag.fetch({
        success: function () {
          this.add(tag);
        }.bind(this)
      });
    } else {
      tag.fetch();
    }

    return tag;
  },

});
