import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = [`card`, "input", "actionBar"]

  connect() {
    this.toggleActionBar();
  }

  async select(evt) {
    evt.preventDefault();
    const element = evt.currentTarget;

    const options = { method: 'PATCH', headers: { accept: 'application/json', 'X-CSRF-Token': csrfToken() } }

    const response = await fetch(`/artworks/${evt.target.dataset.artworkId}/update_status`, options)
    const data = await response.json();

    if (data.status === 'selected') {
      document.getElementById(element.getAttribute("for")).checked = true;
      element.parentElement.parentElement.classList.add("card-index-selected")
    }
    if (data.status === 'unselected') {
      document.getElementById(element.getAttribute("for")).checked = false;
      element.parentElement.parentElement.classList.remove("card-index-selected")
    }

    this.toggleActionBar();
  }

  toggleActionBar() {
    const selectedCards = this.inputTargets.filter(input => {
    return input.checked == true;
    })
    if (selectedCards.length === 0) {
      this.actionBarTarget.classList.remove("active");
    } else {
      if (!this.actionBarTarget.classList.contains("active")) { this.actionBarTarget.classList.add("active") };
    }
    this.actionBarTarget.firstElementChild.firstElementChild.innerText = selectedCards.length
  }
};
