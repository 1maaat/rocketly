const uploadFilesBtn = document.querySelector(".upload-files");

const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('files-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
      uploadFilesBtn.style.display = "none"
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('files-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('files-preview').classList.remove('hidden');
  }
}

export { previewImageOnFileSelect };
