$(document).ready(function() {
  $('.vendor_list').click(function(event) {
    event.preventDefault();

    var request = $.ajax({
      url: '/profiles',

    })
  })
})