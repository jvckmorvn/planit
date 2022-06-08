import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-map"
export default class extends Controller {
  static targets = [ "calendar", "map" ]

  connect() {
    console.log("switch-tabs controller connected");
  }

  showCalendar() {
    this.calendarTarget.classList.remove("d-none");
    this.mapTarget.classList.add("d-none");
  }

  showMap() {
    this.mapTarget.classList.remove("d-none");
    this.calendarTarget.classList.add("d-none");
  }
}
