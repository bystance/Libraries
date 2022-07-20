local VapeUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bystance/Libraries/main/Vape.lua"))()
local Window = VapeUI:Window("ducky reach", Color3.fromRGB(249, 214, 46), Enum.KeyCode.Insert)

local Tab = Window:Tab("Tab 1")
Tab:Button("Button", function()
    VapeUI:Notification("Notification", "Hello!", "Hi!")
end)
