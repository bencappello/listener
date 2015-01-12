Listener.Views.BandForm = Backbone.CompositeView.extend({
  template: JST['bands/form'],

  className: 'band-form',

  events : {
    'submit form': 'saveBand'
  },

  initialize: function () {
    this.listenTo(Listener.tags, 'sync', this.render);
  },

  render: function () {
    this.$el.html(this.template({band: this.model}))
    return this;
  },

  saveBand: function (event) {
    event.preventDefault();
    var that = this;
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().band;
    if (this.model.isNew()) {
      this.collection.create(formData, {
        success: function () {
          Backbone.history.navigate('bands', {trigger: true});
        },
        error: function () {
          console.log('error');
        }
      })
    } else {
      this.model.save(formData, {
        success: function () {
          Backbone.history.navigate('bands', {trigger: true});
        },
        error: function (model, resp) {
          $('.errors').empty();
          resp.responseJSON.forEach(function (el) {
            var li = $('<li></li>');
            li.html(el);
            $('.errors').append(li);
          })
        }
      })
    }
  },
});
