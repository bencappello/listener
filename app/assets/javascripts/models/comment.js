Listener.Models.Comment = Backbone.Model.extend ({
  urlRoot: 'api/comments',

  initialize: function (options) {
  },

  toJSON: function(){
    var json = { comment: _.clone(this.attributes) };

    return json;
  },
});
