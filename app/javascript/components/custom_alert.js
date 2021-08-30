import Swal from 'sweetalert2'

function customAlert() {
  document.querySelector("#submit-alert").addEventListener("mouseup", function(){
    // event.preventDefault();
    Swal.fire({
      title: 'Custom width, padding, background.',
      width: 600,
      padding: '3em',
      background: '#fff url(/images/trees.png)',
      backdrop: `
    rgba(0,0,123,0.4)
    url("/images/nyan-cat.gif")
    left top
    no-repeat
  `});
  });
}


export { customAlert };
