import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    location: String
  }

  connect() {
    console.log(this.locationValue)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style:
        "mapbox://styles/marcorix/cl1gb0s5200nj14qo4lvdamk9",
    });

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    if (this.hasLocationValue) {
      this.#zoomToLocation(this.locationValue);
    }

    this.map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
      })
    );
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 10 })
  }

  #zoomToLocation(location) {
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${location}.json?types=place,postcode&access_token=${this.apiKeyValue}`)
      .then(response => response.json())
      .then((data) => {
        const [lng, lat] = data.features[0].center
        this.map.setCenter([lng, lat])
        this.map.setZoom(14)
      });
  }
}
