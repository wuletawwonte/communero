import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="group"
export default class extends Controller {
  connect() {}

  closeModal() {
    this.element.remove();
  }
}
