const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const contentWrapper = document.querySelector('.content-wrapper');

  if (navbar) {
    contentWrapper.addEventListener('scroll', () => {
      if (contentWrapper.scrollTop > 0) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
