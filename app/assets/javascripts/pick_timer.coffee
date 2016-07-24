startTimer = (duration, display) ->
  start = Date.now()
  diff = undefined
  minutes = undefined
  seconds = undefined

  timer = ->
    diff = duration - ((Date.now() - start) / 1000 | 0)
    minutes = diff / 60 | 0
    seconds = diff % 60 | 0
    minutes = if minutes < 10 then '0' + minutes else minutes
    seconds = if seconds < 10 then '0' + seconds else seconds
    display.textContent = minutes + ':' + seconds
    if diff <= 0
      start = Date.now() + 1000

  timer()
  setInterval timer, 1000

window.onload = ->
  ninetySeconds = 90
  display = document.querySelector('#time')
  startTimer ninetySeconds, display
