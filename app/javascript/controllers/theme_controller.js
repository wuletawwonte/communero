import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="theme"
export default class extends Controller {
  connect() {}

  toggleTheme() {
    this.element.classList.toggle('dark');
  }
}
