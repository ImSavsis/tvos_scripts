-- TVOS SCRIPTS V18 | Obfuscated for Almaz
local _0x5F2A = game; local _0x11A2 = _0x5F2A:GetService("\80\108\97\121\101\114\115"); local _0x99B1 = _0x5F2A:GetService("\82\117\110\83\101\114\118\105\99\101"); local _0xCC33 = _0x5F2A:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
local _0xCAM = workspace.CurrentCamera; local _0xLP = _0x11A2.LocalPlayer; local _0xACT = true; local _0xOBJ = {}; local _0xCON = {}; local _0xAIM = false
local _0xCFG = {V = {E = true, B = true, N = true, H = true, S = true, TC = true, C = Color3.fromRGB(170, 0, 255), T = 2, TS = 16, HU = 0.75}, A = {E = true, K = Enum.UserInputType.MouseButton2, LP = "\72\101\97\100", F = 300}, M = {F = false, N = false, FS = 60, W = false, TK = Enum.KeyCode.E, BO = -5}}

local function _0xNEW(t, ...) 
    local _0xR = Drawing.new(t)
    if t == "\76\105\110\101" then _0xR.Thickness = 2 elseif t == "\84\101\120\116" then _0xR.Center = true; _0xR.Outline = true end
    return _0xR
end

local _0xCL1 = _0xNEW("\76\105\110\101"); local _0xCL2 = _0xNEW("\76\105\110\101")

local function _0xGET()
    local _0xCLO, _0xSD = nil, _0xCFG.A.F; local _0xMP = _0xCC33:GetMouseLocation()
    for _, p in pairs(_0x11A2:GetPlayers()) do
        if p ~= _0xLP and p.Character and p.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") then
            if _0xCFG.V.TC and p.Team == _0xLP.Team then continue end
            local _0xH = p.Character:FindFirstChild("\72\117\109\97\110\111\105\100")
            if _0xH and _0xH.Health > 0 then
                local _0xP = p.Character:FindFirstChild(_0xCFG.A.LP) or p.Character.HumanoidRootPart
                local _0xV3, _0xVIS = _0xCAM:WorldToViewportPoint(_0xP.Position)
                if _0xVIS then
                    local _0xDIST = (Vector2.new(_0xV3.X, _0xV3.Y) - _0xMP).Magnitude
                    if _0xDIST < _0xSD then _0xCLO = p; _0xSD = _0xDIST end
                end
            end
        end
    end
    return _0xCLO
end

local function _0xDRAW(p)
    local _0xCN = _0x99B1.RenderStepped:Connect(function()
        if not _0xACT then return end
        if not _0xOBJ[p.Name] then
            _0xOBJ[p.Name] = {b = _0xNEW("\83\113\117\97\114\101"), n = _0xNEW("\84\101\120\116"), h = _0xNEW("\76\105\110\101"), s = {h = _0xNEW("\76\105\110\101"), t1 = _0xNEW("\76\105\110\101"), t2 = _0xNEW("\76\105\110\101"), l1 = _0xNEW("\76\105\110\101"), l2 = _0xNEW("\76\105\110\101")}}
        end
        local _0xD = _0xOBJ[p.Name]; local _0xCHR = p.Character; local _0xHUM = _0xCHR and _0xCHR:FindFirstChild("\72\117\109\97\110\111\105\100")
        local _0xHRP = _0xCHR and _0xCHR:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
        local _0xSHO = _0xCFG.V.E and (not _0xCFG.V.TC or p.Team ~= _0xLP.Team)
        if not _0xCHR or not _0xHUM or _0xHUM.Health <= 0 or not _0xHRP or not _0xSHO then
            _0xD.b.Visible = false; _0xD.n.Visible = false; _0xD.h.Visible = false
            for _, v in pairs(_0xD.s) do v.Visible = false end; return
        end
        local _0xHD = _0xCHR:FindFirstChild("\72\101\97\100")
        local _0xPS, _0xV = _0xCAM:WorldToViewportPoint(_0xHRP.Position)
        if _0xV and _0xHD then
            local _0xHP = _0xCAM:WorldToViewportPoint(_0xHD.Position)
            local _0xLP2 = _0xCAM:WorldToViewportPoint(_0xHRP.Position - Vector3.new(0, 3.5, 0))
            local _0xYH = math.abs(_0xHP.Y - _0xLP2.Y); local _0xXW = _0xYH / 2
            _0xD.b.Size = Vector2.new(_0xXW, _0xYH); _0xD.b.Position = Vector2.new(_0xHP.X - _0xXW/2, _0xHP.Y); _0xD.b.Visible = _0xCFG.V.B; _0xD.b.Color = _0xCFG.V.C
            _0xD.n.Text = p.Name; _0xD.n.Position = Vector2.new(_0xHP.X, _0xHP.Y - (_0xCFG.V.TS + 2)); _0xD.n.Visible = _0xCFG.V.N; _0xD.n.Size = _0xCFG.V.TS
            if _0xCFG.V.H then
                local _0xRAT = _0xHUM.Health / _0xHUM.MaxHealth
                _0xD.h.From = Vector2.new(_0xHP.X - _0xXW/2 - 5, _0xLP2.Y); _0xD.h.To = Vector2.new(_0xHP.X - _0xXW/2 - 5, _0xHP.Y + (_0xYH * (1 - _0xRAT))); _0xD.h.Visible = true; _0xD.h.Color = Color3.fromRGB(0,255,0)
            else _0xD.h.Visible = false end
        end
    end)
    table.insert(_0xCON, _0xCN)
end

-- GUI & Loops (Simplified for Obfuscation)
local _0xSG = Instance.new("\83\99\114\101\101\110\71\117\105", game.CoreGui)
local _0xM = Instance.new("\70\114\97\109\101", _0xSG); _0xM.Size = UDim2.new(0, 240, 0, 520); _0xM.BackgroundColor3 = Color3.fromRGB(15, 10, 20); _0xM.Draggable = true; _0xM.Active = true

_0x99B1.RenderStepped:Connect(function()
    if not _0xACT then return end
    if _0xCFG.Crosshair.Enabled then
        local _0xCTR = _0xCAM.ViewportSize / 2
        _0xCL1.Visible = true; _0xCL1.From = Vector2.new(_0xCTR.X - 10, _0xCTR.Y); _0xCL1.To = Vector2.new(_0xCTR.X + 10, _0xCTR.Y)
        _0xCL2.Visible = true; _0xCL2.From = Vector2.new(_0xCTR.X, _0xCTR.Y - 10); _0xCL2.To = Vector2.new(_0xCTR.X, _0xCTR.Y + 10)
    else _0xCL1.Visible = false; _0xCL2.Visible = false end
    if _0xAIM and _0xCFG.A.E then
        local _0xT = _0xGET()
        if _0xT and _0xT.Character and _0xT.Character:FindFirstChild(_0xCFG.A.LP) then
            _0xCAM.CFrame = CFrame.new(_0xCAM.CFrame.Position, _0xT.Character[_0xCFG.A.LP].Position)
        end
    end
end)

for _, p in pairs(_0x11A2:GetPlayers()) do if p ~= _0xLP then _0xDRAW(p) end end
table.insert(_0xCON, _0x11A2.PlayerAdded:Connect(function(p) _0xDRAW(p) end))
_0xCC33.InputBegan:Connect(function(i, g) if not g and i.UserInputType == _0xCFG.A.K then _0xAIM = true end end)
_0xCC33.InputEnded:Connect(function(i) if i.UserInputType == _0xCFG.A.K then _0xAIM = false end end)
