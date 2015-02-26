Listener.Views.SongForm = Backbone.CompositeView.extend({
  template: JST['songs/form'],

  className: 'song-form',

  events : {
    'submit form': 'saveSong',
    "change #input-song-audio": "audioInputChange",
    "change #input-song-image": "imageInputChange",
    'click .js-modal-close': 'closeForm',
  },

  initialize: function (options) {
    this.listenTo(Listener.tags, 'sync', this.render);
    this.currentBlogId = options.currentBlogId;
    this.edit = options.edit;
  },

  render: function () {
    this.$el.html(this.template({
      song: this.model,
      currentBlogId: this.currentBlogId,
      edit: this.edit
    }))
    return this;
  },

  renderErrors: function (resp) {
    $('#loading').empty();
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
        // that.collection.add(that.model);
        delete that.model._audio;
        delete that.model._image;
        $(".modal").removeClass("is-open");
        Backbone.history.navigate('songs/' + resp.id, {trigger: true});
      },
      error: function (model, resp) {
        that.renderErrors(resp);
      }
    })
    this.renderLoading();
  },

  audioInputChange: function(event){

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

  imageInputChange: function(event){

    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that._updatePreview(reader.result);
      that.model._image = reader.result;
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      this._updatePreview("");
      delete this.model._image;
    }
  },

  _updatePreview: function(src){
    this.$el.find("#preview-song-image").attr("src", src);
  },

  closeForm: function (event) {
    event.preventDefault();
    $(".modal").removeClass("is-open");
  },
});
