-- TVOS V18 Shield
--  Obfuscated by TVOS Obfuscator v2.3
-- ds: https://discord.gg/NN54zKjdm8
-- web: https://typeflow.ru
-- github: https://github.com/ImSavsis            
-- raw: https://raw.githubusercontent.com/ImSavsis/tvos_scripts/refs/heads/main   
local _iI1l = {
    ["\103\101\116\115\101\114\118\105\93\101"] = game.GetService,
    ["\110\101\119"] = Drawing.new
}

local _S = {
    P = _iI1l["\103\101\116\115\101\114\118\105\93\101"](game, "\80\108\97\121\101\114\115"),
    R = _iI1l["\103\101\116\115\101\114\118\105\93\101"](game, "\82\117\110\83\101\114\118\105\93\101"),
    U = _iI1l["\103\101\116\115\101\114\118\105\93\101"](game, "\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101"),
    C = workspace.CurrentCamera,
    LP = _iI1l["\103\101\116\115\101\114\118\105\93\101"](game, "\80\108\97\121\101\114\115").LocalPlayer
}

local _O = {
    V = {E = true, B = true, N = true, H = true, S = true, TC = true, CL = Color3.fromRGB(170, 0, 255), T = 2, TS = 16, HU = 0.75},
    A = {E = true, K = Enum.UserInputType.MouseButton2, LP = "\72\101\97\100", F = 300},
    X = {E = false, S = 10, T = 2, CL = Color3.fromRGB(0, 255, 0)},
    M = {F = false, N = false, FS = 60, W = false, TK = Enum.KeyCode.E, BO = -5},
    AA = {E = false, S = 300000}
}

local _G = {ACT = true, OBJ = {}, CON = {}, AIR = false}

local function _D1(c, t)
    local o = _iI1l["\110\101\119"]("\76\105\110\101")
    o.Color, o.Thickness, o.Visible = c or Color3.new(1,1,1), t or 2, false
    return o
end
local function _D2(tx, c, s)
    local o = _iI1l["\110\101\119"]("\84\101\120\116")
    o.Text, o.Color, o.Size, o.Center, o.Outline, o.Visible = tx or "", c or Color3.new(1,1,1), s or 16, true, true, false
    return o
end
local function _D3(c, t)
    local o = _iI1l["\110\101\119"]("\83\113\117\97\114\101")
    o.Color, o.Thickness, o.Filled, o.Visible = c or Color3.new(1,1,1), t or 2, false, false
    return o
end

local _xL1, _xL2 = _D1(_O.X.CL, _O.X.T), _D1(_O.X.CL, _O.X.T)

local function _GP()
    local c, sd = nil, _O.A.F
    local mp = _S.U:GetMouseLocation()
    for _, p in pairs(_S.P:GetPlayers()) do
        if p ~= _S.LP and p.Character and p.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") then
            if _O.V.TC and p.Team == _S.LP.Team then continue end
            local h = p.Character:FindFirstChild("\72\117\109\97\110\111\105\100")
            if h and h.Health > 0 then
                local pt = p.Character:FindFirstChild(_O.A.LP) or p.Character.HumanoidRootPart
                local ps, v = _S.C:WorldToViewportPoint(pt.Position)
                if v then
                    local d = (Vector2.new(ps.X, ps.Y) - mp).Magnitude
                    if d < sd then c, sd = p, d end
                end
            end
        end
    end
    return c
end

local function _ESP(p)
    local cn = _S.R.RenderStepped:Connect(function()
        if not _G.ACT then return end
        if not _G.OBJ[p.Name] then
            _G.OBJ[p.Name] = {
                b = _D3(_O.V.CL, _O.V.T),
                n = _D2(p.Name, Color3.new(1,1,1), _O.V.TS),
                h = _D1(Color3.fromRGB(0, 255, 0), 2),
                s = {
                    ht = _D1(_O.V.CL, 1), tl = _D1(_O.V.CL, 1), tr = _D1(_O.V.CL, 1), ll = _D1(_O.V.CL, 1), rl = _D1(_O.V.CL, 1)
                }
            }
        end
        local d = _G.OBJ[p.Name]
        local ch = p.Character
        local hm = ch and ch:FindFirstChild("\72\117\109\97\110\111\105\100")
        local hr = ch and ch:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
        local sh = _O.V.E and (not _O.V.TC or p.Team ~= _S.LP.Team)
        if not ch or not hm or hm.Health <= 0 or not hr or not sh then
            d.b.Visible, d.n.Visible, d.h.Visible = false, false, false
            for _, v in pairs(d.s) do v.Visible = false end return
        end
        local hd = ch:FindFirstChild("\72\101\97\100")
        local ps, vis = _S.C:WorldToViewportPoint(hr.Position)
        if vis and hd then
            local hp = _S.C:WorldToViewportPoint(hd.Position)
            local lp = _S.C:WorldToViewportPoint(hr.Position - Vector3.new(0,3.5,0))
            local hi, wi = math.abs(hp.Y - lp.Y), (math.abs(hp.Y - lp.Y) / 2)
            d.b.Size, d.b.Position, d.b.Visible, d.b.Color = Vector2.new(wi, hi), Vector2.new(hp.X - wi/2, hp.Y), _O.V.B, _O.V.CL
            d.n.Position, d.n.Visible, d.n.Size = Vector2.new(hp.X, hp.Y - (_O.V.TS + 2)), _O.V.N, _O.V.TS
            if _O.V.H then
                local r = hm.Health / hm.MaxHealth
                d.h.From, d.h.To, d.h.Visible = Vector2.new(hp.X - wi/2 - 5, lp.Y), Vector2.new(hp.X - wi/2 - 5, hp.Y + (hi * (1-r))), true
            else d.h.Visible = false end
            if _O.V.S then
                local function _ss(p1, p2, l)
                    local v1, o1 = _S.C:WorldToViewportPoint(p1.Position)
                    local v2, o2 = _S.C:WorldToViewportPoint(p2.Position)
                    if o1 and o2 then
                        l.Visible, l.From, l.To, l.Color = true, Vector2.new(v1.X, v1.Y), Vector2.new(v2.X, v2.Y), _O.V.CL
                    else l.Visible = false end
                end
                local t = ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("Torso")
                local la = ch:FindFirstChild("LeftUpperArm") or ch:FindFirstChild("Left Arm")
                local ra = ch:FindFirstChild("RightUpperArm") or ch:FindFirstChild("Right Arm")
                local ll = ch:FindFirstChild("LeftUpperLeg") or ch:FindFirstChild("Left Leg")
                local rl = ch:FindFirstChild("RightUpperLeg") or ch:FindFirstChild("Right Leg")
                if hd and t and la and ra and ll and rl then
                    _ss(hd, t, d.s.ht); _ss(t, la, d.s.tl); _ss(t, ra, d.s.tr); _ss(t, ll, d.s.ll); _ss(t, rl, d.s.rl)
                end
            else for _, v in pairs(d.s) do v.Visible = false end end
        else
            d.b.Visible, d.n.Visible, d.h.Visible = false, false, false
            for _, v in pairs(d.s) do v.Visible = false end
        end
    end)
    table.insert(_G.CON, cn)
end

for _, p in pairs(_S.P:GetPlayers()) do if p ~= _S.LP then _ESP(p) end end
table.insert(_G.CON, _S.P.PlayerAdded:Connect(function(p) if p ~= _S.LP then _ESP(p) end end))

local _SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
local _M = Instance.new("Frame", _SG)
_M.Size, _M.Position, _M.BackgroundColor3, _M.BorderSizePixel, _M.Active, _M.Draggable = UDim2.new(0, 240, 0, 520), UDim2.new(0.05, 0, 0.2, 0), Color3.fromRGB(15, 10, 20), 2, true, true

local _T = Instance.new("TextLabel", _M)
_T.Size, _T.Text, _T.BackgroundColor3, _T.TextColor3, _T.Font = UDim2.new(1, 0, 0, 35), "TVOS SCRIPTS V18", Color3.fromRGB(30, 0, 60), Color3.new(1,1,1), Enum.Font.GothamBold

local _CT = Instance.new("ScrollingFrame", _M)
_CT.Position, _CT.Size, _CT.BackgroundTransparency, _CT.CanvasSize, _CT.ScrollBarThickness = UDim2.new(0,0,0,40), UDim2.new(1,0,1,-40), 1, UDim2.new(0,0,3.5,0), 4
Instance.new("UIListLayout", _CT).HorizontalAlignment = "Center"

local function _MAA(s)
    local ch = _S.LP.Character
    local hr = ch and ch:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
    if not hr then return end
    local ex = hr:FindFirstChild("\84\86\79\83\95\65\65")
    if s then
        if not ex then
            local av = Instance.new("\66\111\100\121\65\110\103\117\108\97\114\86\101\108\111\99\105\116\121", hr)
            av.Name, av.MaxTorque, av.AngularVelocity = "\84\86\79\83\95\65\65", Vector3.new(0, math.huge, 0), Vector3.new(0, _O.AA.S, 0)
        end
    elseif ex then ex:Destroy() end
end

local function _AT(t, tbl, v)
    local b = Instance.new("TextButton", _CT)
    b.Size, b.Text, b.TextColor3 = UDim2.new(0.9, 0, 0, 30), t, Color3.new(1,1,1)
    b.BackgroundColor3 = tbl[v] and _O.V.CL or Color3.fromRGB(40, 40, 40)
    b.MouseButton1Click:Connect(function() 
        tbl[v] = not tbl[v] 
        b.BackgroundColor3 = tbl[v] and _O.V.CL or Color3.fromRGB(40, 40, 40)
        if t == "Wallbang" then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj:IsDescendantOf(_S.LP.Character) and not _S.P:GetPlayerFromCharacter(obj.Parent) then
                    obj.CanQuery = not tbl[v]
                end
            end
        elseif t == "Anti-Aim" then _MAA(tbl[v]) end
    end)
end

local function _AS(t, min, max, tbl, v)
    local c = Instance.new("Frame", _CT); c.Size, c.BackgroundTransparency = UDim2.new(0.9, 0, 0, 45), 1
    local l = Instance.new("TextLabel", c); l.Size, l.Text, l.TextColor3, l.BackgroundTransparency = UDim2.new(1, 0, 0, 20), t .. ": " .. tbl[v], Color3.new(1,1,1), 1
    local sb = Instance.new("Frame", c); sb.Size, sb.Position, sb.BackgroundColor3 = UDim2.new(1, 0, 0, 8), UDim2.new(0, 0, 0, 25), Color3.fromRGB(50, 50, 50)
    local st = Instance.new("TextButton", sb); st.Size, st.BackgroundColor3, st.Text = UDim2.new(0, 10, 1, 0), _O.V.CL, ""
    st.MouseButton1Down:Connect(function()
        local mv; mv = _S.R.RenderStepped:Connect(function()
            local r = math.clamp((_S.U:GetMouseLocation().X - sb.AbsolutePosition.X) / sb.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + (r * (max - min)))
            tbl[v] = val; l.Text = t .. ": " .. val; st.Position = UDim2.new(r, -5, 0, 0)
            if t == "ESP Color" then _O.V.CL = Color3.fromHSV(val/100, 1, 1); _M.BorderColor3 = _O.V.CL end
        end)
        _S.U.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then mv:Disconnect() end end)
    end)
end

_AT("ESP Enabled", _O.V, "E"); _AT("ESP Boxes", _O.V, "B"); _AT("ESP Skeleton", _O.V, "S"); _AT("Team Check", _O.V, "TC")
_AT("Crosshair", _O.X, "E"); _AT("AimLock (RMB)", _O.A, "E"); _AT("Anti-Aim", _O.AA, "E")
_AT("Noclip", _O.M, "N"); _AT("Wallbang", _O.M, "W"); _AT("Fly Mode", _O.M, "F")
_AS("ESP Color", 0, 100, _O.V, "HU"); _AS("ESP Text Size", 10, 30, _O.V, "TS"); _AS("Fly Speed", 20, 300, _O.M, "FS")

local _UL = Instance.new("TextButton", _CT)
_UL.Size, _UL.Text, _UL.BackgroundColor3, _UL.TextColor3 = UDim2.new(0.9, 0, 0, 35), "UNLOAD", Color3.fromRGB(150, 0, 0), Color3.new(1,1,1)
_UL.MouseButton1Click:Connect(function()
    _G.ACT = false; _MAA(false); _SG:Destroy(); _xL1:Remove(); _xL2:Remove()
    for _, o in pairs(_G.OBJ) do o.b:Remove(); o.n:Remove(); o.h:Remove(); for _, s in pairs(o.s) do s:Remove() end end
    for _, cn in pairs(_G.CON) do cn:Disconnect() end
end)

local _loop = _S.R.RenderStepped:Connect(function()
    if not _G.ACT then return end
    if _O.X.E then
        local ct = _S.C.ViewportSize / 2
        _xL1.Visible, _xL1.From, _xL1.To = true, Vector2.new(ct.X - _O.X.S, ct.Y), Vector2.new(ct.X + _O.X.S, ct.Y)
        _xL2.Visible, _xL2.From, _xL2.To = true, Vector2.new(ct.X, ct.Y - _O.X.S), Vector2.new(ct.X, ct.Y + _O.X.S)
    else _xL1.Visible, _xL2.Visible = false, false end
    if _G.AIR and _O.A.E then
        local t = _GP()
        if t and t.Character and t.Character:FindFirstChild(_O.A.LP) then
            _S.C.CFrame = CFrame.new(_S.C.CFrame.Position, t.Character[_O.A.LP].Position)
        end
    end
    if _O.M.F and _S.LP.Character then
        local hr = _S.LP.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
        if hr then
            local bv = hr:FindFirstChild("\84\118\111\115\70\108\121") or Instance.new("\66\111\100\121\86\101\108\111\99\105\116\121", hr)
            bv.MaxForce, bv.Name = Vector3.new(1e6,1e6,1e6), "\84\118\111\115\70\108\121"
            local d = Vector3.new(0,0,0)
            if _S.U:IsKeyDown(Enum.KeyCode.W) then d += _S.C.CFrame.LookVector end
            if _S.U:IsKeyDown(Enum.KeyCode.S) then d -= _S.C.CFrame.LookVector end
            if _S.U:IsKeyDown(Enum.KeyCode.A) then d -= _S.C.CFrame.RightVector end
            if _S.U:IsKeyDown(Enum.KeyCode.D) then d += _S.C.CFrame.RightVector end
            bv.Velocity = d * _O.M.FS
            _S.LP.Character.Humanoid.PlatformStand = true
        end
    elseif _S.LP.Character and _S.LP.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") then
        local bv = _S.LP.Character.HumanoidRootPart:FindFirstChild("\84\118\111\115\70\108\121")
        if bv then bv:Destroy() end
        _S.LP.Character.Humanoid.PlatformStand = false
    end
    if _O.AA.E then _MAA(true) end
end)
table.insert(_G.CON, _loop)

local _nc = _S.R.Stepped:Connect(function()
    if _O.M.N and _S.LP.Character then
        for _, p in pairs(_S.LP.Character:GetDescendants()) do if p:IsA("\66\97\115\101\80\97\114\116") then p.CanCollide = false end end
    end
end)
table.insert(_G.CON, _nc)

table.insert(_G.CON, _S.U.InputBegan:Connect(function(i, g)
    if not g and (i.KeyCode == Enum.KeyCode.Home or i.KeyCode == Enum.KeyCode.Insert) then _M.Visible = not _M.Visible end
    if i.UserInputType == _O.A.K then _G.AIR = true end
    if not g and i.KeyCode == _O.M.TK then
        local t = _GP()
        if t and t.Character and t.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") and _S.LP.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") then
            _S.LP.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -_O.M.BO)
        end
    end
end))
table.insert(_G.CON, _S.U.InputEnded:Connect(function(i) if i.UserInputType == _O.A.K then _G.AIR = false end end))
