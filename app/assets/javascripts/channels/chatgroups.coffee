App.chatgroups = App.cable.subscriptions.create "ChatgroupsChannel",
  connected: ->

  disconnected: ->



  received: (data) ->
    active_chatgroup = $("[data-behavior='messages'][data-chatgroup-id='#{data.chatgroup_id}']")
    if active_chatgroup.length > 0
        active_chatgroup.append(data.message)
    else
      $("[data-behavior='chatgroup-link'][data-chatgroup-id='#{data.chatgroup_id}']").css("color", "red")
