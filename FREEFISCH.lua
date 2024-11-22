local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function twDDOrIgUxHVYAXvMCIWQu(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


local library = loadstring(game:HttpGet(twDDOrIgUxHVYAXvMCIWQu('TySGTpRvUChDgpijmqNwBLHArDIxOTCTRaSPXZlBTkmPHNfAVUlfaMUaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1R1cnRsZS1CcmFuZC9UdXJ0bGUtTGliL21haW4vc291cmNlLmx1YQ==')))()

local window = library:Window(twDDOrIgUxHVYAXvMCIWQu('XKVZugGuWkPDxhUtDbhiBRDAlpGlWiEPwHDgsUzihellOjeiULWTPMIU1RBUldJTiBGSVNDSA=='))

window:Button(twDDOrIgUxHVYAXvMCIWQu('gNRClSGPtRptLwVpqoEuFXKlIsQjAVdWYxxwgEomcpMmpmssAaNMEeHRW5hYmxlIEF1dG8gRmFybQ=='), function()
 local Players = game:GetService(twDDOrIgUxHVYAXvMCIWQu('DoePQFoFahObVcFSIvZHXKpYQNbQqmwMsDYyFmZPwJCLtKBswHXOFxFUGxheWVycw=='))
local CoreGui = game:GetService(twDDOrIgUxHVYAXvMCIWQu('NYmSxqQbvSJruqkFFFdXZgZnigNghuUejGHWeJverkwhxzrxMirIgGqU3RhcnRlckd1aQ=='))
local GuiService = game:GetService(twDDOrIgUxHVYAXvMCIWQu('tiNfuSoYfVzgCUUbIlEXtAaQSGvCHCNmfJViHcLdDlCgDwFjUFSsYyUR3VpU2VydmljZQ=='))
local ReplicatedStorage = game:GetService(twDDOrIgUxHVYAXvMCIWQu('OWPaOvCFkWvcoAPoNoEsecAfbOeuLuxMbBgIjZEByMSQcUJHbYErKcDUmVwbGljYXRlZFN0b3JhZ2U='))
local ContextActionService = game:GetService(twDDOrIgUxHVYAXvMCIWQu('NPZdDdKvYPOXoOWDvbTamiKCEGbvRHzrhwykEtvAKTQPwTetcUFfmoHQ29udGV4dEFjdGlvblNlcnZpY2U='))
local VirtualInputManager = game:GetService(twDDOrIgUxHVYAXvMCIWQu('IneNmobicFsGxgMfcAUOxTqEFwlIcyEYKYSGRBalwUUaYFAlgspoSiRVmlydHVhbElucHV0TWFuYWdlcg=='))
local UserInputService = game:GetService(twDDOrIgUxHVYAXvMCIWQu('elnkvuleoxPoYKaBgbfQfkUzRxNhSSndQkkqztSvEEeBZFAvcSFdYcEVXNlcklucHV0U2VydmljZQ=='))

local LocalPlayer = Players.LocalPlayer

local Enabled = false
local Rod = false
local Casted = false
local Progress = false
local Finished = false

local LoopPosition

local Keybind = Enum.KeyCode.X

function ShowNotification(String)
    CoreGui:SetCore(twDDOrIgUxHVYAXvMCIWQu('PUqPSVyfIOtAlfXTGjXlIsSzRuBumrWWKDHYMYFTvHjrDLUCwDdagtvU2VuZE5vdGlmaWNhdGlvbg=='), {
        Title = twDDOrIgUxHVYAXvMCIWQu('mQfbQSGfNifMwYdsvZbjRDNOWnaKhPrSKGYBtDvRizCgcBskgoltEJqQXV0byBGYXJt'),
        Text = String,
        Duration = 1
    })
end

function ToggleFarm(Name, State, Input)
    if State == Enum.UserInputState.Begin then
        Enabled = not Enabled
    
        if Enabled then
            LoopPosition = LocalPlayer.Character.HumanoidRootPart.Position
        else
            Finished = false
            Progress = false
            GuiService.SelectedObject = nil
        
            if Rod then
                Rod.events.reset:FireServer()
            end
        end
    
        ShowNotification(`Status: {Enabled}`)
    end
end

LocalPlayer.Character.ChildAdded:Connect(function(Child)
    if Child:IsA(twDDOrIgUxHVYAXvMCIWQu('oBphiXyvOanlSUanrBTTjrnPoJMeAqnhQQmgOCcFpnkPKatZxulKVJHVG9vbA==')) and Child.Name:lower():find(twDDOrIgUxHVYAXvMCIWQu('SGJEsDczYDRRginyRakdaJcTNSoLZTEkoZpLqJytkSNYnaPARLiHeBIcm9k')) then
        Rod = Child
    end
end)

LocalPlayer.Character.ChildRemoved:Connect(function(Child)
    if Child == Rod then
        Enabled = false
        Finished = false
        Progress = false
        Rod = nil
        GuiService.SelectedObject = nil
    end
end)

LocalPlayer.PlayerGui.DescendantAdded:Connect(function(Descendant)
    if Enabled then
        if Descendant.Name == twDDOrIgUxHVYAXvMCIWQu('IDCFOrMTHLebKCufkacXdtBLGdGZtwTlDKdVphgvIeuYuavtSVSiTTLYnV0dG9u') and Descendant.Parent.Name == twDDOrIgUxHVYAXvMCIWQu('LaFCaJuBMdJhlnLVNXCzIBQQgZSxGNqEACjGquTCOqpzPCrJDzXiLURc2FmZXpvbmU=') then
            task.wait(0.3)
            GuiService.SelectedObject = Descendant
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            task.wait(0.1)
            GuiService.SelectedObject = nil
        elseif Descendant.Name == twDDOrIgUxHVYAXvMCIWQu('SPYEZiqBjrItevJtTRUmnPuMLQXfCtJKiIGSJVDmqFveskZaMPeIOYpcGxheWVyYmFy') and Descendant.Parent.Name == twDDOrIgUxHVYAXvMCIWQu('TJxOQxBnPxurslZKjokvninIWddqVjlRFYhOevHTbvUsEbDIrTEbnyoYmFy') then
            Finished = true
            Descendant:GetPropertyChangedSignal(twDDOrIgUxHVYAXvMCIWQu('GXiYrSTdlBGbdMOqCZRywakcMolaQKPIqElyFZThlzeyjdJMpBJVJNbUG9zaXRpb24=')):Wait()
            ReplicatedStorage.events.reelfinished:FireServer(100, true)
        end
    end
end)

LocalPlayer.PlayerGui.DescendantRemoving:Connect(function(Descendant)
    if Descendant.Name == twDDOrIgUxHVYAXvMCIWQu('cbYdCebRWiOESdZOcziwaTJTAyKihEBKIYgidkqIbWsxmVLWzmQUNJLcmVlbA==') then
        Finished = false
        Progress = false
    end
end)

task.spawn(function()
    while true do
        if Enabled and not Progress then
            if Rod then
                Progress = true
                task.wait(0.5)
                Rod.events.reset:FireServer()
                Rod.events.cast:FireServer(100.5)
            end
        end
 
        task.wait()
    end
end)

task.spawn(function()
    while true do
        if Enabled then
            LocalPlayer.Character.HumanoidRootPart.Position = LoopPosition
        end

        task.wait(0.75)
    end
end)

local NewRod = LocalPlayer.Character:FindFirstChildWhichIsA(twDDOrIgUxHVYAXvMCIWQu('MDXNcXBZbCrxlyUcgdDQybPjdSLIwPbsSatcVrrNMCtKHwZkCuUXlGJVG9vbA=='))

if NewRod and NewRod.Name:lower():find(twDDOrIgUxHVYAXvMCIWQu('OsuLfzQcKKuFlydVcaQVcJQsSutkCsAVuRRourKZVpIrFVMPBMDeQuhcm9k')) then
    Rod = NewRod
end

if not UserInputService.KeyboardEnabled then
    ContextActionService:BindAction(twDDOrIgUxHVYAXvMCIWQu('RCabKtNeMBsYEyNtFVYhHlvYDaIfIRiNaLVhwkWAFiZUCKQhUaiDAWrVG9nZ2xlRmFybQ=='), ToggleFarm, false, Keybind, Enum.UserInputType.Touch)
    ContextActionService:SetTitle(twDDOrIgUxHVYAXvMCIWQu('dneTRBRHHZyGhAZulfkmlsvOMVxTjhjcISdjLpHGpYmQriMdkPNdDUeVG9nZ2xlRmFybQ=='), twDDOrIgUxHVYAXvMCIWQu('lFVSSKXqQfDyxwZvOFKMfHXEkiFWwSFcVqsovQapqetLEJmBrbyvWoEVG9nZ2xlIEZhcm0='))
    ContextActionService:SetPosition(twDDOrIgUxHVYAXvMCIWQu('nNpdlnZWCWGFRqQNXExBcSbpybNouxkXtfJSGLSdkLSrIlfaepDMHSoVG9nZ2xlRmFybQ=='), UDim2.new(0.9, -50, 0.9, -150))
    ShowNotification(twDDOrIgUxHVYAXvMCIWQu('gIasEBgYQBjDxMwdiuiaXfrkeuOTMaAhmWAIvmPLxcxAJfqqIdKYKyoUHJlc3MgdGhlIG9uc2NyZWVuIGJ1dHRvbiB0byBlbmFibGUvZGlzYWJsZQ=='))
else
    ContextActionService:BindAction(twDDOrIgUxHVYAXvMCIWQu('GlGQSxTECMMtzIKhtIBiyWAkceqSAFoWoeSxZdfGfkybpNmPVCtsXwjVG9nZ2xlRmFybQ=='), ToggleFarm, false, Keybind)
    ShowNotification(`Press twDDOrIgUxHVYAXvMCIWQu('IpdgrGyBuaRoWyEQklDphzJkXRwBFByuDSOmfAnrGwWjzKfquqhQpJre0tleWJpbmQuTmFtZX0=') to enable/disable`)
end
end)


window:Label(twDDOrIgUxHVYAXvMCIWQu('nmbzwwZWoDbBbJaULCVCbdUCUVWhgXDGyEMoQfujzzTWNukSuVfPRYOWCAtIOC5gOC4m+C4tOC4gS/guJvguLTguJQ='), Color3.fromRGB(127, 143, 166))
window:Label(twDDOrIgUxHVYAXvMCIWQu('ofliIPYsiRtZBNBOsCKhdfLgPrnCCzppVZjlQtammJqXbbuCqXsUjDCSG9sZCBSb2QgdG8gQXV0byBGYXJt'), Color3.fromRGB(127, 143, 166))



window:Label(twDDOrIgUxHVYAXvMCIWQu('pxhDhMfxqibOnPnBnnTPXbViRDTzHKlwcpgiKLmPPmXXlZqiXpCvCbHU1RBUldJTg=='), Color3.fromRGB(327, 343, 366))    