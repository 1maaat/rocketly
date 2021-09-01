import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";
import Swal from "sweetalert2";
// [...]

export default class extends Controller {
  static targets = ["form", "finalSlide", "slide"]
  connect() {
    console.log(this.finalSlideTarget);
  }

  send(event) {
    event.preventDefault();
    // alert("You have click on create an artwork");
    showConfirmationDialog()
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      this.slideTargets.forEach((slide) => {
        slide.classList.remove("stepactive")
      });
      this.finalSlideTarget.classList.add("stepactive");
      console.log()
      this.finalSlideTarget.innerHTML = data.sharehtml;
    });

  };
}

function showConfirmationDialog() {
  Swal.fire({
    title: "🎉 Well done, thank's for your contribution !🎉",
    timer: 4000,
    width: 600,
    showConfirmButton: false,
    padding: '3em',
    background: '#fff url(/images/trees.png)',
    backdrop: `
    rgba(0,0,123,0.4)
    url("/images/nyan-cat.gif")
    left top
    no-repeat
    `
  });
};
