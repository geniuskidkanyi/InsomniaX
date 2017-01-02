handleVisiblityChange = ->
    $strike = $(".strike")
    if $strike.length > 0
        chatgroup_id = $("[data-behavior='messages']").data("chatgroup-id")
        App.last_read.update(chatgroup_id)
        $strike.remove()

$(document).on "turbolinks:load", ->
    $(document).on "click", handleVisiblityChange

    $("#new_message").on "keypress", (e) ->
        if e && e.keyCode == 13
            e.preventDefault()
            $(this).submit()

    $("#new_message").on "submit", (e) ->
        e.preventDefault()

        chatgroup_id = $("[data-behavior='messages']").data("chatgroup-id")
        body = $("#message_body")

        App.chatgroups.send_message(chatgroup_id, body.val())

        body.val("")
