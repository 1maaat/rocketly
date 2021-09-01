import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";
import Swal from "sweetalert2";

export default class extends Controller {
  static targets = ["form", "finalSlide", "slide"]
  connect() {
    console.log(this.finalSlideTarget);
  }

  send(event) {
    event.preventDefault();
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
    toast: true,
    position: 'top-end',
    title: "🎉 Well done, thank's for your contribution !🎉",
    timer: 4000,
    showConfirmButton: false,
    padding: '3em',
    backdrop: `
      rgba(0,0,123,0.1)
      url("https://img1.picmix.com/output/stamp/normal/0/0/5/3/1503500_929b1.gif")
      center
      no-repeat
      `
    });
  };

  // url("https://sweetalert2.github.io/images/nyan-cat.gif")
