$(document).ready(function() {
  console.log("gotcha");
  google.maps.event.addDomListener(window, 'load', initAutocomplete);

  function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  var autocomplete1 = new google.maps.places.Autocomplete(
      (document.getElementById('starting-box')),
      {types: ['geocode']});
  var autocomplete2 = new google.maps.places.Autocomplete(
      (document.getElementById('end-box')),
      {types: ['geocode']});
  }

// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.

  function geolocate() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var geolocation = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        var circle = new google.maps.Circle({
          center: geolocation,
          radius: position.coords.accuracy
        });
        autocomplete1.setBounds(circle.getBounds());
        autocomplete2.setBounds(circle.getBounds());
      });
    }
  }

});
