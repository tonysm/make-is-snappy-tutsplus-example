Makeitsnapp = {}

Makeitsnapp.autoSelectSearch = ->
  window.onload = ->
    keyword = document.getElementById 'keyword'
    keyword.onclick = ->
      @select()


Makeitsnapp.autoSelectSearch()
