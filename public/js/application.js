$(document).ready(function() {

  var settings = {
    "async": true,
    "crossDomain": true,
    "url": "https://feeds.divvybikes.com/stations/stations.json",
    "method": "GET",
    "headers": {
      "content-type": "application/json",
      "cache-control": "no-cache",
      "postman-token": "09050133-bb14-0445-ae9e-af6d9af4aed9"
    },
    "processData": false,
    "data": "{\n\t\"key\":\"5f75f526f26879dd4cc77981979d076e\",\n\t\"token\":\"MYy7bdaWQAMCttzhqgS8ZFYp\"\n}"
  }

  $.ajax(settings).done(function (response) {
    console.log(response);
  });
});
