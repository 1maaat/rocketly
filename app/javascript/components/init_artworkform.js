function initArtworkform() {
  const steps = Array.from(document.querySelectorAll(".step"));
  const nextBtn = document.querySelector("form .next-btn");
  const prevBtn = document.querySelector("form .previous-btn");
  const filesInput = document.querySelector("#files-input");
  const textsInput = document.querySelector(".texts-input")
  const submitBtn = document.querySelector("form .submit-btn");

  nextBtn.addEventListener("click", (e) => {
    e.preventDefault();
    changeStep("next");
  });

  prevBtn.addEventListener("click", (e) => {
    e.preventDefault();
    changeStep("prev");
  });

  filesInput.addEventListener('change', () => {
    submitBtn.disabled = false
  });

  textsInput.addEventListener('change', () => {
    if (textsInput != "") {
      nextBtn.disabled = false
    }
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
    } else if (button === "next") {
      alert("Fill in all the fiels !")
    }
    steps[index].classList.add("stepactive");
  }
}

export { initArtworkform };
