Listener.Collections.Tags = Backbone.Collection.extend({
  model: Listener.Models.Tag,
  url: 'api/tags',

  comparator: function (tag) {
    return tag.get('name');
  },

  initialize: function (options) {
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
