/**
 * Created by cojoc on 30/10/2016.
 */
function myMap() {
    var lat = document.getElementById("lat");
    var lng = document.getElementById("lng");
    var center;
    if(lat.value == "" && lng.value == "") {
        center = new google.maps.LatLng(43.7, 7.25);
    } else {
        center = new google.maps.LatLng(lat.value, lng.value);
    }


    var mapCanvas = document.getElementById("map");
    var mapOptions = {
        center: center,
        zoom: 9
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);

    var marker = new google.maps.Marker({
        position: center,
        map: map
    });

    var infowindow = new google.maps.InfoWindow({
        content: 'Latitude: ' + center.lat() + '<br>Longitude: ' + center.lng()
    });

    infowindow.open(map,marker);

    google.maps.event.addListener(map, 'click', function(event) {
        placeMarker(map, marker, event.latLng, infowindow);
    });
}


function placeMarker(map, marker, location, infoWindow) {
    marker.setPosition(location);
    infoWindow.setContent('Latitude: ' + location.lat().toFixed(6) + '<br>Longitude: ' + location.lng().toFixed(6));
    var lat = document.getElementById("lat");
        lat.value = location.lat().toFixed(6);
    var lng = document.getElementById("lng");
        lng.value = location.lng().toFixed(6);
}


function mapGroupe() {
    var nice = new google.maps.LatLng(43.7, 7.25);
    var mapCanvas = document.getElementById("map_activites");
    var mapOptions = {
        center: nice,
        zoom: 10
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);

    $(document).ready(function(){
        $(".activiteListItem").each(function () {
            console.log($(this).find(".latInput").val() +  "   " + $(this).find(".lngInput").val());
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng($(this).find(".latInput").val(), $(this).find(".lngInput").val()),
                map: map
            });

            var infowindow = new google.maps.InfoWindow({
                content: $(this).html()
            });

            infowindow.open(map,marker);
        });
    });
}

function mapActivite() {
    var lat = document.getElementById("latActivite");
    var lng = document.getElementById("lngActivite");

    var mapCanvas = document.getElementById("map_activite_unique");
    var mapOptions = {
        center: new google.maps.LatLng(lat.value, lng.value),
        zoom: 10
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);


    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat.value, lng.value),
        map: map
    });

    var infowindow = new google.maps.InfoWindow({
        content: $("#nomActiviteDiv").html()
    });

    infowindow.open(map,marker);

}

