App.chatgroups = App.cable.subscriptions.create "ChatgroupsChannel",
  connected: ->

  disconnected: ->



  received: (data) ->
    active_chatgroup = $("[data-behavior='messages'][data-chatgroup-id='#{data.chatgroup_id}']")
    if active_chatgroup.length > 0

      if document.hidden
        if $(".strike").length == 0
          active_chatgroup.append("<div class='strike'><span>Unread Messages</span></div>")

        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body})

      else
        App.last_read.update(data.chatgroup_id)

      # Insert the message
      active_chatgroup.append(data.message)

    else
      $("[data-behavior='chatgroup-link'][data-chatgroup-id='#{data.chatgroup_id}']").css("font-weight", "bold")


  send_message:  (chatgroup_id, message) ->
    @perform "send_message", {chatgroup_id: chatgroup_id, body: message}
