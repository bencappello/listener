Listener.Collections.Bands = Backbone.Collection.extend({
  model: Listener.Models.Band,
  url: 'api/bands',

  comparator: function (band) {
    return band.escape('name');
  },

  getOrFetch: function (id) {
    var band = this.get(id);

    if(!band) {
      band = new Listener.Models.Band({ id: id });
      band.fetch({
        success: function () {
          this.add(band);
        }.bind(this)
      });
    } else {
      band.fetch();
    }

    return band;
  },

});
