function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var place = this.getPlace();

  // console.log(place);  // Uncomment this line to view the full object returned by Google API.

  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {  // Some types are ["country", "political"]
      var type_element = document.getElementById(component.types[j]);
      if (type_element) {
        type_element.value = component.long_name;
      }
    }
  }
}


google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('user_input_autocomplete_address');
});

// Autocomplete et de restreindre les recherches à une zone géographie précise voir
// à un type exclusif de lieux (villes, business...).
// Par exemple, grâce snippet ci-dessous, nous limitons les résultats aux business
// (types: ['establishment']) situés à Paris et Londres en déterminant
// leurs latitudes et longitudes respectives dans la variable defaultBounds.


var defaultBounds = new google.maps.LatLngBounds(
  new google.maps.LatLng(48.856614, 2.3522219000000177),
  new google.maps.LatLng(51.5073509, -0.12775829999998223));

var input = document.getElementById('searchTextField');
var options = {
  bounds: defaultBounds,
  types: ['establishment']
};

autocomplete = new google.maps.places.Autocomplete(input, options);
