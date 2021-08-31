// var loadFile = function (event) {
//   var image = document.getElementById('output');
//   image.src = URL.createObjectURL(event.target.files[0]);
// };

const editAvatar = () => {
  const imageUser = document.getElementById('output');
  const fakeInput = document.getElementById('fake-input');
  const input = document.querySelector('#input-user-pic > div > input');
  if (fakeInput)  {
    fakeInput.addEventListener('click', () => {
      input.click()

    })
    input.addEventListener("change", () => {
      imageUser.src = URL.createObjectURL(input.files[0]);
    })
    const fakeUpdate = document.getElementById("fake-update");
    const picForm = document.getElementById("user-pic-form");

    fakeUpdate.addEventListener("click", () => {
      picForm.submit()
    })
  }
}

export {editAvatar}
