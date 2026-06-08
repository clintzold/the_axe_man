import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-controls"
export default class extends Controller {
  connect() {

    this.checkScreenSize()
  }

  checkScreenSize() {
    const width = window.innerWidth

    if (width < 500) {
      this.element.classList.add("opacity-0")
    }
  }

}
