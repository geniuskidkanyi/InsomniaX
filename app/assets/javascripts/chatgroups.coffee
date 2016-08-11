$(document).on "turbolinks:load", ->
  $("#{new_message}").on "keypress", (e) ->
    consolde.log e.KeyCode
