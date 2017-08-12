-- namespace table that will hold all data and functions
ThisOneInvites = {}
ThisOneInvites.name = "ThisOneInvites"

function ThisOneInvites:Initialize()
  d("This One Invites 0.1 is loaded ...")
end

function ThisOneInvites.OnAddOnLoaded(event, addonName)
  ThisOneInvites:Initialize()
end

EVENT_MANAGER:RegisterForEvent(ThisOneInvites.name, EVENT_PLAYER_ACTIVATED, ThisOneInvites.OnAddOnLoaded)
