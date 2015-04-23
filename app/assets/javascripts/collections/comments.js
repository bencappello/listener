Listener.Collections.Comments = Backbone.Collection.extend({
  model: Listener.Models.Comment,
  url: 'api/comments',

  // initialize: function (options) {
  // },

  comparator: function (comment) {
    return String.fromCharCode.apply(String,
        _.map(comment.get("created_at").split(""), function (c) {
            return 0xffff - c.charCodeAt();
        })
    );
  },

  getOrFetch: function (id) {
    var comment = this.get(id);

    if(!comment) {
      comment = new Listener.Models.Comment({ id: id });
      comment.fetch({
        success: function () {
          this.add(comment);
        }.bind(this)
      });
    } else {
      comment.fetch();
    }

    return comment;
  },

});
