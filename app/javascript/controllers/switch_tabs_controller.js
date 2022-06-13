import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-tabs"
export default class extends Controller {
  static targets = [ "calendar", "map", "calTab", "mapTab", "mapReload" ]

  get mapController() {
    return this.application.getControllerForElementAndIdentifier(this.mapReloadTarget, "map")
  }

  showCalendar() {
    this.calTabTarget.classList.add("active-tab");
    this.mapTarget.classList.add("d-none");
    this.calendarTarget.classList.remove("d-none");
    this.mapTabTarget.classList.remove("active-tab");
  }

  showMap() {
    this.mapTabTarget.classList.add("active-tab");
    this.calendarTarget.classList.add("d-none");
    this.mapTarget.classList.remove("d-none");
    this.calTabTarget.classList.remove("active-tab");
    this.mapController.map.resize();
  }
}
