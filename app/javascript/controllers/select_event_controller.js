import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-event"
export default class extends Controller {
  static targets = [ "eventCard", "eventCalendar" ]

  selectEvent(e) {
    e.preventDefault
    let eventColour = e.currentTarget.dataset.eventColour
    // console.log(e.currentTarget)
    // console.log(this.eventCardTarget.dataset.eventColour)
    if (this.eventCalendarTarget.style.border && this.eventCalendarTarget.style.border == `2px solid ${eventColour}`) {
      console.log("This event is already selected.")
    }
    else {
      e.currentTarget.style.border = `2px solid ${eventColour}`
      e.currentTarget.style.borderRadius = "6px"
      this.eventCalendarTarget.style.border = `2px solid ${eventColour}`
      this.eventCalendarTarget.style.borderRadius = "6px"
    }
    console.log(this.eventCalendarTarget.style.border)
  }

  unSelectAll() {
    this.eventCardTargets.style.border = "none"
    this.eventCalendarTarget.style.border = "none"
}
