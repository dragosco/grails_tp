/**
 * Created by cojoc on 30/10/2016.
 */
function myMap() {
    var nice = new google.maps.LatLng(43.7, 7.25);

    var mapCanvas = document.getElementById("map");
    var mapOptions = {
        center: nice,
        zoom: 10
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);

    var marker = new google.maps.Marker({
        position: nice,
        map: map
    });

    var infowindow = new google.maps.InfoWindow({
        content: 'Latitude: ' + nice.lat() + '<br>Longitude: ' + nice.lng()
    });

    infowindow.open(map,marker);

    google.maps.event.addListener(map, 'click', function(event) {
        placeMarker(map, marker, event.latLng, infowindow);
    });
}


function placeMarker(map, marker, location, infoWindow) {
    marker.setPosition(location);
    infoWindow.setContent('Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng());
    var lat = document.getElementById("lat");
        lat.value = location.lat();
    var lng = document.getElementById("lng");
        lng.value = location.lng();
}


function mapGroupe() {
    var nice = new google.maps.LatLng(43.7, 7.25);
    var mapCanvas = document.getElementById("map_activites");
    var mapOptions = {
        center: nice,
        zoom: 10
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);

    document.getElementsByClassName("activiteListItem").forEach(function (item) {
        console.log("coucou");
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng($(this).find(".latInput").val(), $(this).find(".lngInput").val()),
            map: map
        });

        var infowindow = new google.maps.InfoWindow({
            content: $(this).html()
        });

        infowindow.open(map,marker);
    });
}

