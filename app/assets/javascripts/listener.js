window.Listener = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new Listener.Models.CurrentUser();
    this.currentUser.fetch();

    this.users = new Listener.Collections.Users();

    this.tags = new Listener.Collections.Tags();
    this.tags.fetch();

    this.topHeader = new Listener.Views.TopHeader({ el: "#top-header" });
    this.audioPlayer = new Listener.Views.AudioPlayer({ el: '#audio-container'})
    this.userHeader = new Listener.Views.UserHeader({ el: "#user-nav" });

    new Listener.Routers.BandsBlogsRouter();
    new Listener.Routers.SongsRouter();
    this.usersRouter = new Listener.Routers.UsersRouter();
    this.modalRouter = new Listener.Routers.ModalRouter();

    //TOUR
    this.tour = true;
    this.tourNumber = 0;
    this.endTour = function () {
      debugger
      this.tour = false;
    };
    $('body').on("click", ".joyride-close-tip", this.endTour.bind(Listener));

    Backbone.history.start();
  }
};

$(document).ready(function(){
  Listener.initialize();
});
