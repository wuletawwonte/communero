import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="avatar"
export default class extends Controller {
  static targets = ['dropdown'];

  toggledd() {
    const dropdown = this.dropdownTarget;
    dropdown.classList.toggle('invisible');
  }
}
