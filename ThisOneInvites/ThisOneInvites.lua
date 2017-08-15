-- namespace table that will hold all data and functions
ThisOneInvites = {}
ThisOneInvites.name = "ThisOneInvites"
ThisOneInvites.activatorText = ""

function ThisOneInvites:Initialize()
  d("This One Invites 0.3 is loaded ...")
end

function ThisOneInvites.OnAddOnLoaded(event, addonName)
  ThisOneInvites:Initialize()
end

function ThisOneInvites.help()
  d("To start auto inviting, type /toion [string] in your chat where [string] is what you want the activatorText to be. For example: /toion x")
  d("To shut off inviting, type /toioff")
end

function ThisOneInvites.listen(activatorText)
  if activatorText == nil or activatorText == '' then
    d("It looks like you wanted to start auto inviting. You need to specify a string as well like this: /toion x")
  else
    d("This One Invites lisening is now turned on and listening for text: " .. activatorText)
    ThisOneInvites.activatorText = activatorText
    EVENT_MANAGER:RegisterForEvent(ThisOneInvites.name, EVENT_CHAT_MESSAGE_CHANNEL, ThisOneInvites.callback)
  end
end

function ThisOneInvites.quit()
    d("This One Invites listening is now turned off.")
    EVENT_MANAGER:UnregisterForEvent(ThisOneInvites.name, EVENT_CHAT_MESSAGE_CHANNEL)
end


ThisOneInvites.callback = function(_, messageType, from, message)
  name = from:gsub("%^.+", "")
  d("Checking message " .. string.lower(message) .. " from: " .. name .. " msg type " .. messageType )
end

EVENT_MANAGER:RegisterForEvent(ThisOneInvites.name, EVENT_PLAYER_ACTIVATED, ThisOneInvites.OnAddOnLoaded)
SLASH_COMMANDS["/toi"] = ThisOneInvites.help
SLASH_COMMANDS["/toion"] = ThisOneInvites.listen
SLASH_COMMANDS["/toioff"] = ThisOneInvites.quit
