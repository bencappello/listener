Add flash messages when you successfully create/update stuff (rendering html element already made)

Add 'song' views and make sure to account for the band_id and blog_id in the new form

When all the songs are listed on a band's show page have the @band.songs be filtered for repeats

A song has one blog and one band. However, there can be multiple songs with same band/name but diff blog

Add tags:
  can be associated with blogs, bands, or songs through join tables
  bands, blogs, and songs will have 'tag' checkboxes on the new/edit form
  each respective model will have an update tags method which will CREATE new Tag/Item join table object and DESTROY the old ones based on which tags were selected/deselected in the new/edit form
  this update tags method will be invoked by its create and update controller actions
  update new/edit forms for bands, songs, and blogs to add checkboxes
  update 3 models to add update_tags method for each
  update 3 controllers to liase between view forms and model update methods

Maybe add polymorphic comments

Feed page should be able to be split up between followed blogs and followed users' loved songs


<h4>Comments</h4>
<% band.comments().forEach(function (comment) { %>
  <p><%= comment.get('author_name') %>: <%= comment.get('body') %></p>
  <button class="edit-button"><a class='edit-link' href="#">Edit</a></button>
  <button class="delete-button"><a class='delete-link' href="#">Delete</a></button>
  <% }) %>


  <%= render "shared/comments_form", commentable_id: @band.id, commentable_type: "Band" %>


  https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/115343497&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false

"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/109962663&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"

  User.create(username: 'thatpurplestuff', email: 'ben@gmail.com', password: 'password',image_url: "http://www.mtv.com/crop-images/2013/09/09/slash.jpg")

  Song.create(name: "Over Your Shoulder", band_id: 5, blog_id: 1, song_type: 'regular', audio_url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/109962663&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true")
