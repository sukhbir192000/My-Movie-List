
function scrollPrev(e) {
  this.parentNode.children[2].scrollLeft -= this.parentNode.offsetWidth;
}

function scrollNext(e) {
  this.parentNode.children[2].scrollLeft += this.parentNode.offsetWidth;
}

let prevBtns = document.querySelectorAll(".custom-carousel-prev");
let nextBtns = document.querySelectorAll(".custom-carousel-next");

prevBtns.forEach((item) => item.addEventListener('click', scrollPrev));
nextBtns.forEach((item) => item.addEventListener('click', scrollNext));
