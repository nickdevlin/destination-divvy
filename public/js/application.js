$(document).ready(function() {
  console.log("gotcha")
  google.maps.event.addDomListener(window, 'load', initAutocomplete);

  $.ajax(settings).done(function (response) {
    console.log(response);
  });
});
