Listener.Views.TopHeader = Backbone.View.extend({

  initialize: function(options){
    this.render();
  },

  events: {
    'submit #search': 'songSearch',
  },

  template: JST['shared/top_header'],

  render: function(){
    var html = this.template();
    this.$el.html(html);

    return this;
  },

  songSearch: function (event) {
    event.preventDefault();
    var query = this.$('#q').val();
    Backbone.history.navigate('songs/search/' + query, {trigger: true});
  },

});
