setTimeout bind_keyboard, 500

keypress.sequence_combo "left down right n", -> document.querySelector('.ibuki').className = 'ibuki neckbreaker'
keypress.sequence_combo "right n", -> document.querySelector('.ibuki').className = 'ibuki standing'

show = -> document.querySelector('.keyboard-container').hidden = false
hide = -> document.querySelector('.keyboard-container').hidden = true

keypress.combo "alt up", show
keypress.combo "alt down", hide
