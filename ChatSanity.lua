--- Author: Mcpallynuts (US-Illidan)
--- License: Public Domain
--- Created: 2015.07.11
--- Version: 1.0

--- Based on BlockChinese

local events = {
	"CHAT_MSG_SAY",
	"CHAT_MSG_YELL",
	"CHAT_MSG_CHANNEL",
	"CHAT_MSG_TEXT_EMOTE",
	"CHAT_MSG_WHISPER",
	--"CHAT_MSG_GUILD",
	--"CHAT_MSG_PARTY",
	--"CHAT_MSG_PARTY_LEADER",
	--"CHAT_MSG_RAID",
	--"CHAT_MSG_RAID_LEADER",
	--"CHAT_MSG_INSTANCE_CHAT",
	--"CHAT_MSG_INSTANCE_CHAT_LEADER",
}

local recents = {}

local function filter(self, event, msg, sender, ...)
    if strfind(msg, "[\227-\237]") then
        return true
    end
    if string.match(msg, "{%a+}") then
        return true
    end
    if string.match(msg, "{%a%a?%d+}") then
        return true
    end
    data = sender .. msg
    if recents[data] == nil then
        recents[data] = time()
    else
        return true
    end
    now = time()
    for k, v in pairs(recents) do
        if now - v > 300 then
            recents[k] = nil
        end
    end
    return false
end

for _, v in pairs(events) do
    ChatFrame_AddMessageEventFilter(v, filter)
end
