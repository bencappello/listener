Listener.Views.SongForm = Backbone.CompositeView.extend({
  template: JST['songs/form'],

  className: 'song-form',

  events : {
    'submit form': 'saveSong'
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
    if (this.model.isNew()) {
      this.collection.create(formData, {
        success: function (model, resp) {
          Backbone.history.navigate('songs/' + resp.id, {trigger: true});
        },
        error: function (model, resp) {
          that.renderErrors(resp);
        }
      })
    } else {
      this.model.save(formData, {
        success: function (model, resp) {
          Backbone.history.navigate('songs/' + resp.id, {trigger: true});
        },
        error: function (model, resp) {
          that.renderErrors(resp);
        }
      })
    }
  },
});
