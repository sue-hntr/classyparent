// assets.google_maps.js

$(document).ready
(//e
	function()
	{ //d
  console.log(gon.geo_parent.latitude);

// //this is from https://developers.google.com/maps/documentation/javascript/maptypes
  var MyLatlng = new google.maps.LatLng
  ( //c
      gon.geo_parent.latitude, gon.geo_parent.longitude
   ); //c
// //gon.parent comes from parent controller

// //this is from the Gmaps 4rails site
  handler = Gmaps.build('Google');
  handler.buildMap
  ({ //a
//these options are from https://developers.google.com/maps/documentation/javascript/maptypes
    provider: 
    {//b
      zoom:  12,
      center: MyLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
     }, //b 
    internal: 
    {id: 'map'}
  }) //a
 }//d
)//e

// function(){
// markers = handler.addMarkers([
//     {
//       gon.geo_hash
//     ]}
//   );
//   handler.bounds.extendWith(markers);
//   handler.fitMapToBounds();
// });





  



















// markers = handler.addMarker(<%= raw @hash.to_json %>);



 //this is the function to use to add markers
  // function displayOnMap(){
//   var markers = handler.addMarkers(raw @hash.to_json);

    //   {
		// lat: gon.geo_parent.latitude,
		// lng: gon.geo_parent.longitude,
		// infowindow: "Your House"
      // }
      
//  	  handler.map.centerOn(marker);
//      };
//    });
//    handler.bounds.extendWith(markers);
//    handler.fitMapToBounds();
 //the next line is from Food Truck
 //   handler.getMap().setZoom(13);   
 // 	}
 // );
//}):

