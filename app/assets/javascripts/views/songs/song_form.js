Listener.Views.SongForm = Backbone.CompositeView.extend({
  newTemplate: JST['songs/new_form'],
  editTemplate: JST['songs/edit_form'],

  className: 'song-form',

  events : {
    'submit form': 'saveSong',
    "change #input-song-audio": "audioInputChange",
    "change #input-song-image": "imageInputChange",
    "keyup .upload-url": "imageURLInputChange",
    'click .js-modal-close': 'closeForm',
  },

  initialize: function (options) {
    this.currentBlogId = options.currentBlogId;
    this.edit = options.edit;
  },

  render: function () {
    if (this.edit) {
      this.$el.html(this.editTemplate({
        song: this.model,
        currentBlogId: this.currentBlogId
      }))
    } else {
      this.$el.html(this.newTemplate({
        song: this.model,
        currentBlogId: this.currentBlogId
      }))
    }
    //if tour not ended
    if (Listener.tour) {
      this.startNewTour({
        wait: 400,
      });
    }

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
        Listener.tags.fetch();
        delete that.model._audio;
        delete that.model._image;
        $(".modal").removeClass("is-open");

        //will load the same url if already at that page
        Backbone.history.loadUrl('songs/' + resp.id);
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
      that._addPreview("#preview-song-image", reader.result);
      that.model._image = reader.result;
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      this._removePreview("#preview-song-image", "");
      delete this.model._image;
    }
  },

  imageURLInputChange: function(event){
    var that = this;
    var url = $(event.currentTarget).val();
    console.log(url)

    if (url == "") {
      this._removePreview("#preview-song-image-url", "");
    } else {
      that._addPreview("#preview-song-image-url", url);
    }
  },

  _addPreview: function(el, src){
    var $preview = this.$el.find(el);
    $preview.attr("src", src);
    $preview.addClass('show');
  },

  _removePreview: function(el, src){
    var $preview = this.$el.find(el);
    $preview.attr("src", src);
    $preview.removeClass('show');
  },

  closeForm: function (event) {
    event.preventDefault();
    $(".modal").removeClass("is-open");
  },
});
