Powernator = LibStub("AceAddon-3.0"):NewAddon("Powernator", 'AceConsole-3.0')

function Powernator:OnInitialize()
    Powernator:Print("Powernator initialized.")
end

function Powernator:OnEnable()
    Powernator:Print("Powernator enabled.")
end

function Powernator:OnDisable()
    Powernator:Print("Powernator disabled.")
end
