getgenv().FoundAnti = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Event = ReplicatedStorage:FindFirstChild("Exploit")
local ScriptContext = game:GetService("ScriptContext")
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local colors = {255,166,0}
local ID = game.PlaceId

while not Players.LocalPlayer or not Players.LocalPlayer:FindFirstChild("PlayerGui") do task.wait(1) end
task.wait(1)

local AntiStrings = {
	ublubble = "ublubble",
	instinct = "INSTINCT",
	watchdog = "Watchdog Anti Exploit",
	null = "Null.Anti",
	stora = "Stora Anti",
	sebsi = "Sebsi Anti Cheat",
}

local WATCHDOGNAMES = {
	"Client",
	"DonateScript",
	"LeaderboardListener",
	"GuiManager",
	"Remotes",
	"Combat",
	"anti lag",
	"PlayerModule",
	"ChatScript",
	"lIllIIlllIlIlIllIIlIlIllIlIIllIIl",
	"ublubble",
	"stor.anti",
	"LocalScript",
}

local IgnoreNames = {
	"BaseCamera",
	"BaseCharacterController",
	"BaseOcclusion",
	"CameraInput",
	"CameraModule",
	"CameraToggleStateController",
	"CameraUI",
	"CameraUtils",
	"ChannelsTab",
	"ChatBar",
	"ChatChannel",
	"ChatMain",
	"ChatWindow",
	"ClassicCamera",
	"ClickToMoveController",
	"ClickToMoveDisplay",
	"CommandProcessor",
	"ControlModule",
	"CurveUtil",
	"DynamicThumbstick",
	"Gamepad",
	"Invisicam",
	"Keyboard",
	"LegacyCamera",
	"MessageLabelCreator",
	"MessageLogDisplay",
	"MessageSender",
	"MouseLockController",
	"ObjectPool",
	"OrbitalCamera",
	"PlayerModule",
	"Popper",
	"Poppercam",
	"TouchJump",
	"TouchThumbstick",
	"TransparencyController",
	"VRBaseCamera",
	"VRCamera",
	"VRVehicleCamera",
	"VehicleCamera",
	"VehicleCameraCore",
	"VehicleController",
	"ZoomController",
}

local Places = {
	["8606678736"] = AntiStrings.instinct,
	["5171824516"] = AntiStrings.ublubble,
	["5365215822"] = AntiStrings.stora,
	["6726855294"] = AntiStrings.ublubble,
	["8258969190"] = AntiStrings.watchdog,
	["7916128436"] = AntiStrings.watchdog,
}

local function Notify(Anticheat)
	printconsole(("[AC Identifier] This game uses %s"):format(Anticheat),unpack(colors))
  getgenv().FoundAnti = Anticheat
end

if Places[tostring(ID)] then
	return Notify(Places[tostring(ID)])
end

if Event then
	return Notify(AntiStrings.ublubble)
end
for i,v in pairs(getnilinstances()) do
	if v:IsA("ModuleScript") then
		if tostring(v) == "Encrypt" then
			return Notify(AntiStrings.ublubble)
		end
	end
end

if ReplicatedStorage:FindFirstChild("AC") or ReplicatedStorage:FindFirstChild("Remotes") then
	local AC = (ReplicatedStorage:FindFirstChild("AC") and ReplicatedStorage:FindFirstChild("AC") or ReplicatedStorage:FindFirstChild("Remotes"))
	local Children = AC:GetChildren()
	if #Children > 100 then
		local nil_instances = getnilinstances()
		if not AC:FindFirstChildOfClass("RemoteFunction") then
			for i,v in pairs(nil_instances) do
				if v:IsA("ModuleScript") then
					if not table.find(IgnoreNames,v.Name) then
						return Notify(AntiStrings.instinct)
					end
				end
			end
		end
		for i,v in pairs(nil_instances) do
			if v:IsA("LocalScript") and table.find(WATCHDOGNAMES,tostring(v)) then
				return Notify(AntiStrings.watchdog)
			end
		end
	elseif #Children == 2 then
		local connections = getconnections(ScriptContext.Error)
		for i,v in pairs(connections) do
			if v.Function then
				local info = getinfo(v.Function)
				if info.source:find("Base") then
					return Notify(AntiStrings.null)
				end
			end
		end
		if AC:FindFirstChild("RemoteEvent") and AC:FindFirstChild("RemoteFunction") then
			return Notify(AntiStrings.null)
		end
	end
else
	if #LocalizationService:GetChildren() > 1 then
		if LocalizationService:FindFirstChildOfClass("RemoteEvent") and LocalizationService:FindFirstChild("SAC") then
			return Notify(AntiStrings.sebsi)
		end
	elseif ReplicatedStorage:FindFirstChild("Settings") then
		local Settings = ReplicatedStorage:FindFirstChild("Settings")
		if Settings:IsA("ModuleScript") then
			local a = require(Settings)
			if a and type(a) == "table" and rawget(a,"checkWorkspace") then
				return Notify(AntiStrings.stora)
			end
		end
	end
end

Notify("no anticheat or an unidentified anticheat")
