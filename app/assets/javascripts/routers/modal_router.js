Listener.Routers.ModalRouter = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content');
    this.$modalEl = $('#modal-window');
    this.listenTo(this, 'swapModal', this._swapModal);
  },

  _swapModal: function (modalView) {
    this._currentModal && this._currentModal.remove();
    this._currentModal = modalView;
    this.$modalEl.html(modalView.render().$el);
  },

});
