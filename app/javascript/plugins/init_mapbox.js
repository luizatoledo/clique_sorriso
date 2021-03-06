import mapboxgl from 'mapbox-gl';

// const fitMapToMarkers = (map, markers) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    navigator.geolocation.watchPosition(function(position) {
      const markers = JSON.parse(mapElement.dataset.markers);
      let positionLatLog = [position.coords.longitude, position.coords.latitude]; 
      if (markers.length <= 1) {
        positionLatLog = [markers[0]['lng'], markers[0]['lat']];
      }
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        center: positionLatLog, 
        zoom: 14
      });

      markers.forEach((marker) => {
          const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
          new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
          let el = document.createElement('div')
          el.innerHTML = marker.name
          new mapboxgl.Marker(el, { offset: [35, -35] })
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(map);
        });
      //fitMapToMarkers(map, markers);
    });
  };
};

export { initMapbox };