ready = ->
  $(document).on "click", "#keyword", ->
    @select()

$(document).ready(ready)
$(document).on("page:load", ready)
