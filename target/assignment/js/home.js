/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const track = document.querySelector(".slider-track");
const slides = document.querySelectorAll(".banner");
const prevBtn = document.querySelector(".slider-btn.prev");
const nextBtn = document.querySelector(".slider-btn.next");

let index = 0;

function updateSlider() {
    track.style.transform = `translateX(-${index * 100}%)`;
}

prevBtn.addEventListener("click", () => {
    index = (index > 0) ? index - 1 : slides.length - 1;
    updateSlider();
});

nextBtn.addEventListener("click", () => {
    index = (index < slides.length - 1) ? index + 1 : 0;
    updateSlider();
});

// Auto slide every 5s
setInterval(() => {
    index = (index + 1) % slides.length;
    updateSlider();
}, 5000);
