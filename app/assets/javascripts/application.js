// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function() {
  var pos1 = ""
  var pos2 = ""
  $('.black_space').on('click', function() {
    if(!pos1){
      pos1 = this.id;
      $(this).addClass("start_space");
      $('#start').append(pos1)
    } else if(!pos2 && this.id != pos1) {
      pos2 = this.id;
      $(this).addClass("end_space")
      $('#end').append(pos2)
      $.ajax({
        type: "GET",
        url: "/shortestpath",
        data: {start: pos1, finish: pos2},
        success: function(data, textStatus, jqXHR){
          data.forEach(highlightItem)
        },
        error: function(jqXHR, textStatus, errorThrown){
          alert(errorThrown);
        }
      })
    }
  });

  $('.white_space').on('click', function() {
    if(!pos1){
      pos1 = this.id;
      $(this).addClass("start_space");
      $('#start').append(pos1)
    } else if(!pos2 && this.id != pos1) {
      pos2 = this.id;
      $(this).addClass("end_space")
      $('#end').append(pos2)
      $.ajax({
        type: "GET",
        url: "/shortestpath",
        data: {start: pos1, finish: pos2},
        success: function(data, textStatus, jqXHR){
          data.forEach(highlightItem)
        },
        error: function(jqXHR, textStatus, errorThrown){
          alert(errorThrown);
        }
      })
    }
  });

  function onClick(clicked){
    if(!pos1){
      pos1 = clicked.id;
      $(clicked).addClass("start_space");
    } else if(!pos2 && clicked.id != pos1) {
      pos2 = clicked.id;
      $(clicked).addClass("end_space")
      $.ajax({
        type: "GET",
        url: "/shortestpath",
        data: {start: pos1, finish: pos2},
        success: function(data, textStatus, jqXHR){
          data.forEach(highlightItem)
        },
        error: function(jqXHR, textStatus, errorThrown){
          alert(errorThrown);
        }
      })
    }
  };

  function highlightItem(id, index){
    $('#' + id).addClass("path_space");
    $('#path').append(id + ' ')
  };

});
