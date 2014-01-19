app.controller('slidesCtrl', [
  '$scope'
  ($scope) ->

    $scope.tabs = [
      { template: '/partials/1.html', title: 'Yo !' }
      { template: '/partials/2.html', title: '/me' }
      { template: '/partials/3.html', title: '/couchDB' }
      { template: '/partials/4.html', title: '/angularUI' }
      { template: '/partials/5.html', title: '/_design /views /lists' }
    ]

    # This is Bad !
    # This is not the angular way, I wanted to use quickly the really nice keypress js lib
    # I hope I'll have enougth time to make a directive (and remove jquery dependencie from keypress ;)
    show = -> document.querySelector('.keyboard-container').hidden = false
    hide = -> document.querySelector('.keyboard-container').hidden = true
    current = -1;
    toggleActive = (index) -> $('.panel-title a')[index].click()
    prev = -> toggleActive(--current)
    next = -> toggleActive(++current)
    keypress.combo "alt up", show
    keypress.combo "alt down", hide
    keypress.combo "ctrl up", prev
    keypress.combo "ctrl down", next

    # WTF
    setKey = (num) -> keypress.combo "alt #{num}", (-> setActive(num))
    setKey(num) for num in [0..9]

])
