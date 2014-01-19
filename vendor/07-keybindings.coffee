setTimeout bind_keyboard, 500
keypress.sequence_combo "left down right n", -> document.querySelector('.ibuki').className = 'ibuki neckbreaker'
keypress.sequence_combo "right n", -> document.querySelector('.ibuki').className = 'ibuki standing'