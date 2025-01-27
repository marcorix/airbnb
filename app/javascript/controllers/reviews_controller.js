import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reviews"
export default class extends Controller {
  static targets = [ "form", "reviews" ]
  connect() {

  }

  submit(e) {
    e.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      if (data.inserted_item) {
        this.reviewsTarget.insertAdjacentHTML('beforeend', data.inserted_item)
      }
      this.formTarget.outerHTML = data.form
    })
  }
}
