App.chatgroups = App.cable.subscriptions.create "ChatgroupsChannel",
  connected: ->

  disconnected: ->



  received: (data) ->
    active_chatgroup = $("[data-behavior='messages'][data-chatgroup-id='#{data.chatgroup_id}']")
    if active_chatgroup.length > 0
        active_chatgroup.append(data.message)


     if document.hidden && Notification.permission == "granted"
        new Notification(data.username, {body: data.body})

    else
      $("[data-behavior='chatgroup-link'][data-chatgroup-id='#{data.chatgroup_id}']").css("color", "red")

  send_message:  (chatgroup_id, message) ->
    @perform "send_message", {chatgroup_id: chatgroup_id, body: message}
