import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ['mobilemenu'];

  toggleMobileMenu() {
    const mobileMenu = this.mobilemenuTarget;
    mobileMenu.classList.toggle('hidden');
  }
}
