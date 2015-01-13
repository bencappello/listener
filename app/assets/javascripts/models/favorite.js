Listener.Models.Favorite = Backbone.Model.extend ({
  urlRoot: 'api/user_songs',

  // toJSON: function(){
  //   var json = { song_id: _.clone(this.attributes) };
  //   return json;
  // },
});
