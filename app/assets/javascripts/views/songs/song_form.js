Listener.Views.SongForm = Backbone.CompositeView.extend({
  template: JST['songs/form'],

  className: 'song-form',

  events : {
    'submit form': 'saveSong',
    "change #input-song-audio": "fileInputChange"
  },

  initialize: function () {
    this.listenTo(Listener.tags, 'sync', this.render);
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    return this;
  },

  renderErrors: function (resp) {
    $('#errors').empty();
    resp.responseJSON.forEach(function (el) {
      var li = $('<li></li>');
      li.html(el);
      $('#errors').append(li);
    })
  },

  saveSong: function (event) {
    event.preventDefault();
    var that = this;
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().song;

    this.model.set(formData);
    this.model.save({}, {
      success: function (model, resp) {
        that.collection.add(that.model);
        delete that.model._audio;
        Backbone.history.navigate('songs/' + resp.id, {trigger: true});
      },
      error: function (model, resp) {
        that.renderErrors(resp);
      }
    })
  },

  fileInputChange: function(event){

    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that.model._audio = reader.result;
    }
    if (file) {
      reader.readAsDataURL(file);
    } else {
      delete this.model._audio;
    }
  },
});
