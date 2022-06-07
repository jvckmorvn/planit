import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-group"
export default class extends Controller {
  static targets = ["card", "form"]

  showForm() {
    this.cardTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
