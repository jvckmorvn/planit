import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-event"
export default class extends Controller {
  static targets = [ "eventCalendar" ]

  selectEvent(e) {
    // e.preventDefault
    // let eventColour = e.currentTarget.dataset.eventColour
    // this.eventCalendarTarget.style.backgroundColor = eventColour
    // this.eventCalendarTarget.style.borderRadius = "6px"
  }

  unSelectAll() {
//     this.eventCalendarTarget.style.backgroundColor = "transparent"
  }
}
