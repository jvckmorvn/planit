import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-tabs"
export default class extends Controller {
  static targets = [ "calendar", "map", "caltab", "maptab" ]

  showCalendar() {
    this.caltabTarget.classList.add("active-tab");
    this.mapTarget.classList.add("d-none");
    this.calendarTarget.classList.remove("d-none");
    this.maptabTarget.classList.remove("active-tab");
  }

  showMap() {
    this.maptabTarget.classList.add("active-tab");
    this.calendarTarget.classList.add("d-none");
    this.mapTarget.classList.remove("d-none");
    this.caltabTarget.classList.remove("active-tab");
  }
}
