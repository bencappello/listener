Listener.Views.BlogForm = Backbone.CompositeView.extend({
  template: JST['blogs/form'],

  className: 'blog-form',

  events : {
    'submit form': 'saveBlog',
    'click .js-modal-close': 'closeForm',
  },

  initialize: function (options) {
    this.listenTo(Listener.tags, 'sync', this.render);
    this.edit = options.edit;
  },

  render: function () {
    this.$el.html(this.template({blog: this.model, edit: this.edit}))
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

    this.model.set(formData);
    this.model.save({}, {
      success: function (model, resp) {
        $(".modal").removeClass("is-open");
        Backbone.history.navigate('blogs/' + resp.id, {trigger: true});
      },
      error: function (model, resp) {
        that.renderErrors(resp);
      }
    })
    this.renderLoading();
  },

  closeForm: function () {
    event.preventDefault();
    $(".modal").removeClass("is-open");
  },
});
