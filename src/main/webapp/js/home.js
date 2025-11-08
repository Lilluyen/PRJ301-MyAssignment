const track = document.querySelector('.slider-track');
const items = document.querySelectorAll('.slider-item');
const prevBtn = document.querySelector('.slider-btn.prev');
const nextBtn = document.querySelector('.slider-btn.next');

let currentIndex = 0;
let visibleCount = Math.floor(document.querySelector('.slider-wrapper').offsetWidth / items[0].offsetWidth);

function updateSlider() {
    if (!items[0]) return; // tránh lỗi khi slider rỗng
    const style = getComputedStyle(items[0]);
    const marginRight = parseFloat(style.marginRight) || 0;
    const width = items[0].offsetWidth + marginRight;
    track.style.transform = `translateX(-${currentIndex * width}px)`;
}

// Nút next
nextBtn.addEventListener('click', () => {
    if (currentIndex < items.length - visibleCount) {
        currentIndex++;
    } else {
        currentIndex = 0; // quay về đầu
    }
    updateSlider();
});

// Nút prev
prevBtn.addEventListener('click', () => {
    if (currentIndex > 0) {
        currentIndex--;
    } else {
        currentIndex = items.length - visibleCount; // quay về cuối
    }
    updateSlider();
});

// Resize window
window.addEventListener('resize', () => {
    visibleCount = Math.floor(document.querySelector('.slider-wrapper').offsetWidth / items[0].offsetWidth);
    updateSlider();
});

// Auto slide mỗi 3 giây
setInterval(() => {
    if (currentIndex < items.length - visibleCount) {
        currentIndex++;
    } else {
        currentIndex = 0;
    }
    updateSlider();
}, 3000);
