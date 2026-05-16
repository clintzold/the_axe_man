import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-image"
export default class extends Controller {
  static targets = ["input", "fileField"]
  connect() {

  }

  openField() {
    this.fileFieldTarget.click()
  }

  submit() {
    this.element.requestSubmit()
  }
}
