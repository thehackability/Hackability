document.addEventListener('hackability:ready', () => {
  const carousel = document.getElementById('incamp-carousel');
  if(!carousel) return;
  const slides = carousel.querySelectorAll('.carousel-slide');
  const dots = carousel.querySelectorAll('.carousel-dot');
  if(slides.length === 0) return;
  let currentSlide = 0;
  
  setInterval(() => {
    slides[currentSlide].classList.remove('opacity-100');
    slides[currentSlide].classList.add('opacity-0');
    dots[currentSlide].classList.remove('opacity-100');
    dots[currentSlide].classList.add('opacity-40');
    
    currentSlide = (currentSlide + 1) % slides.length;
    
    slides[currentSlide].classList.remove('opacity-0');
    slides[currentSlide].classList.add('opacity-100');
    dots[currentSlide].classList.remove('opacity-40');
    dots[currentSlide].classList.add('opacity-100');
  }, 3500);
});
