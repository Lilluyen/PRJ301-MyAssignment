function openFilter() {
    const form = document.querySelector('.form-filter');
    form.style.display = 'block';
    // Kích hoạt animation
    requestAnimationFrame(() => {
        form.classList.add('show');
    });
}

function closeFilter() {
    const form = document.querySelector('.form-filter');
    form.classList.remove('show');
    // Đợi animation xong mới ẩn
    setTimeout(() => {
        form.style.display = 'none';
    }, 300);
}

function resetFilter() {
    const form = document.querySelector('.form-filter');
    
    // ✅ Xoá toàn bộ input text
    form.querySelectorAll('input[type="text"], input[type="date"]').forEach(input => {
        input.value = '';
    });

    // ✅ Đưa select về giá trị mặc định "Tất cả" (ở đây là value = 3)
    const statusSelect = form.querySelector('#status');
    if (statusSelect) {
        statusSelect.value = '3';
    }

    // ✅ (Tùy chọn) gửi lại form để load dữ liệu mặc định
    // form.submit(); // Bỏ comment nếu muốn reload danh sách gốc
}