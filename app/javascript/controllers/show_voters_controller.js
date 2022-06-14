import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-voters"
export default class extends Controller {
  connect() {
    console.log("Hello from show-voters!");
  }

  show(e) {
    console.log(e.currentTarget);
  }
}
