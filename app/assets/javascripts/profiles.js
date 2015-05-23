$(document).ready('page:change', function() {
  $('.body').on('click', '.vendor_list',function(event) {
    event.preventDefault();
    debugger
    var request = $.ajax({
      url: '/call',
      method: 'GET',
      dataType: 'JSON'
    })
    request.done(function(data) {
      debugger
      console.log(data.content)
    })
    request.fail(function(data) {
      console.log('fail')
    })
  });
});