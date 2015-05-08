// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
// /= require geocomplete
$( function(){
  $(".form_colloc").find("#colloc_adresse").geocomplete();
});


function placeAllPoints(){
  console.log(locations.length);
  for(i=0; i<locations.length; i++) {
    placePoint(locations[i]);
  }
}

function initMap(){
  var bounds = new google.maps.LatLngBounds();
  for(i=0; i<locations.length; i++) {
    bounds.extend(new google.maps.LatLng(locations[i].lat,locations[i].long));
  }

  var center = bounds.getCenter();
  console.log(center);

  var mapOptions = {
    center:center,
    zoom:13
  }

  map = new google.maps.Map($("#google-map")[0],mapOptions);
  if(locations.length >= 2){
    map.fitBounds(bounds);
    map.panToBounds(bounds);
  }
}

function placePoint(p){
  var lat_ln = new google.maps.LatLng(p.lat,p.long);
  var content_string =  "<h5>"+ p.name+"</h5><br/> Prix : "+p.price+"€/mois <br/> Pour "+p.max_people+"<br/> <a href=\""+p.path+"\">Plus d'informations</a>";
  var infoWindow = new google.maps.InfoWindow({
    content:content_string
  });
  var marker = new google.maps.Marker({
    position: lat_ln,
    map: map,
    title: p.name
  });

  google.maps.event.addListener(marker,'click',function(){
    infoWindow.open(map,marker)
  });
  console.log("On place "+p.name+" ("+p.lat+","+p.long+")")
}
