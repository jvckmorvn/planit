import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-group"
export default class extends Controller {
  static targets = ["infos", "form"]

  displayForm() {
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
