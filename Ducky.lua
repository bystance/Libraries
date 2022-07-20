local VapeUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bystance/Libraries/main/Vape.lua"))()
local Window = VapeUI:Window("ducky reach", Color3.fromRGB(249, 214, 46), Enum.KeyCode.RightControl) -- Try insert in the future?

local Tab = Window:Tab("Tab 1")
Tab:Button("Button", function(Input)
    VapeUI:Notification("Notification", "Hello!", "Hi!")
end)

Tab:Toggle("Toggle Reach", false, function(Input)
    print(Input)
    if Input then
        VapeUI:Notification("Notification", "Reach has been enabled!", "Alright!")
    else
        VapeUI:Notification("Notification", "Reach has been enabled!", "Alright!")
    end
end)

Tab:Toggle("Toggle Visualizer", false, function(Input)
    print(Input)
    if Input then
        VapeUI:Notification("Notification", "Visualizer has been enabled!", "Alright!")
    else
        VapeUI:Notification("Notification", "Visualizer has been disabled!", "Alright!")
    end
end)

Tab:Colorpicker("Colorpicker", Color3.fromRGB(249, 214, 46), function(Input)
    print(Input)
end)

Tab:Textbox("Radius", true, function(Text)
    print(Text)
end)
