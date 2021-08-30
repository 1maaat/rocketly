function initArtworkform() {
  const steps = Array.from(document.querySelectorAll(".step"));
  const nextBtn = document.querySelectorAll("form .next-btn");
  const prevBtn = document.querySelectorAll("form .previous-btn");
  const filesInput = document.querySelector("#files-input");
  const submitBtn = document.querySelector("form .submit-btn");

  // const form = document.querySelector('form');

  nextBtn.forEach((button) => {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      changeStep("next");
    });
  });

  prevBtn.forEach((button) => {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      changeStep("prev");
    });
  });

  // submitBtn.addEventListener("click", (e) => {
  //   e.preventDefault();
  //   changeStep("submit");
  // });

  filesInput.addEventListener('change', () => {
    submitBtn.disabled = false
  });

  function changeStep(button) {
    let index = 0;
    const active = document.querySelector(".stepactive");
    const inputDescription = document.getElementById("artwork_description");
    const inputTitle = document.getElementById("artwork_title");
    index = steps.indexOf(active);
    steps[index].classList.remove("stepactive");
    if (button === "next" && inputTitle.value != "" && inputDescription.value != "") {
      index ++;
    } else if (button === "prev") {
      index --;
    }
    steps[index].classList.add("stepactive");
  }
}

export { initArtworkform };
