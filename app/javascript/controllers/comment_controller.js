import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="comment"
export default class extends Controller {
  static targets = ['commentform'];

  toggleForm() {
    const commentForm = this.commentformTarget;
    commentForm.classList.toggle('hidden');
  }
}
