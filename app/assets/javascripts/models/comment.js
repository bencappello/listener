Listener.Models.Comment = Backbone.Model.extend ({
  urlRoot: 'api/comments',

  initialize: function (options) {
    this.author_name = options.author_name
  },
});
