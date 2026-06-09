import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nav-highlight"
export default class extends Controller {
  static targets = ["navLink"]
  connect() {
    this.removeActive()
    this.setActive()
  }

  // Remove highlighting from all nav links
  removeActive() {

    this.navLinkTargets.forEach(element => {
    element.classList.remove("active")
    })
  }

  // Add highlighting to nav link for current page
  setActive() {

    const currentPath = window.location.pathname

    this.navLinkTargets.forEach(element => {
      if (currentPath.includes(element.id)) {
        element.classList.add("active")
      }
    })
  }

}
