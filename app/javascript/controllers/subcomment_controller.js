import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="subcomment"
export default class extends Controller {
  static targets = ['subcommentform'];

  toggleSubcomment() {
    const subcommentForm = this.subcommentformTarget;
    subcommentForm.classList.toggle('hidden');
  }
}
