Listener.Views.BlogForm = Backbone.CompositeView.extend({
  template: JST['blogs/form'],

  className: 'blog-form',

  events : {
    'submit form': 'saveBlog'
  },

  initialize: function () {
    this.listenTo(Listener.tags, 'sync', this.render);
  },

  render: function () {
    this.$el.html(this.template({blog: this.model}))
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

  saveBlog: function (event) {
    event.preventDefault();
    var that = this;
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().blog;
    if (this.model.isNew()) {
      this.collection.create(formData, {
        success: function (model, resp) {
          Backbone.history.navigate('blogs/' + resp.id, {trigger: true});
        },
        error: function (model, resp) {
          that.renderErrors(resp);
        }
      })
    } else {
      this.model.save(formData, {
        success: function (model, resp) {
          Backbone.history.navigate('blogs/' + resp.id, {trigger: true});
        },
        error: function (model, resp) {
          that.renderErrors(resp);
        }
      })
    }
  },
});
