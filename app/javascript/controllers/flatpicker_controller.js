import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpicker"
export default class extends Controller {
  static targets = ['start', 'end', 'checkIn']

  connect() {
    console.log("Hello, Stimulus!", this.element)
    flatpickr(this.checkInTarget, {
      mode: "range",
      onChange: ([start, end]) => {
        if (start && end) {
          this.startTarget.value = start
          this.endTarget.value = end
        }
      }
    })
  }
}
