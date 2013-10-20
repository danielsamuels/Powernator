Powernator = LibStub("AceAddon-3.0"):NewAddon("Powernator", "AceConsole-3.0")
local Media = LibStub("LibSharedMedia-3.0")

local _
local AceGUI = LibStub("AceGUI-3.0")
local options = {
    name = "Powernator",
    handler = Powernator,
    type = 'group',
    args = {
        enabled = {
            type = 'toggle',
            name = 'Enabled',
            desc = 'Enable or disable the addon.',
            set = function(self, value) Powernator.db.profile.enabled = value end,
            get = function() return Powernator.db.profile.enabled end,
        },
        font = {
            type = 'select',
            dialogControl = 'LSM30_Font',
            name = 'Font',
            values = Media:HashTable("font"),
            set = function(self, value) Powernator.db.profile.font = value end,
            get = function() return Powernator.db.profile.font end,
        }
    }
}

-- Make the frame.
-- local frame = CreateFrame("Frame", nil, UIParent)
-- frame:SetSize(106, 47)
-- frame:SetPoint("CENTER", UIParent)
-- frame:SetBackdrop({
--     bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
--     edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12,
--     insets = { left = 3, right = 3, top = 3, bottom = 3, },
-- })

-- frame.bar1 = CreateFrame("StatusBar", nil, frame)
-- frame.bar1:SetPoint("TOPLEFT", 3, -3)
-- frame.bar1:SetPoint("TOPRIGHT", -3, -3)
-- frame.bar1:SetHeight(20)
-- frame.bar1:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
-- frame.bar1:GetStatusBarTexture():SetHorizTile(false)
-- frame.bar1:GetStatusBarTexture():SetVertTile(false)

-- frame.bar2 = CreateFrame("StatusBar", nil, frame)
-- frame.bar2:SetPoint("TOPLEFT", frame.bar1, "BOTTOMLEFT", 0, -1)
-- frame.bar2:SetPoint("TOPRIGHT", frame.bar1, "BOTTOMRIGHT", 0, -1)
-- frame.bar2:SetHeight(20)
-- frame.bar2:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
-- frame.bar2:GetStatusBarTexture():SetHorizTile(false)
-- frame.bar2:GetStatusBarTexture():SetVertTile(false)




function Powernator:OnInitialize()
    -- Register the slash command and options.
    LibStub("AceConfig-3.0"):RegisterOptionsTable("Powernator", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Powernator", "Powernator")
    self:RegisterChatCommand("pn", "HandleChatCommand")

    -- Load the user profile.
    self.db = LibStub("AceDB-3.0"):New("PowernatorDB", defaults, "Default")
    db = self.db.profile
end

function Powernator:OnEnable()
    Powernator:Print("Powernator enabled.")
end

function Powernator:OnDisable()
    Powernator:Print("Powernator disabled.")
end

function Powernator:HandleChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("pn", "Powernator", input)
    end
end
