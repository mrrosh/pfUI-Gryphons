pfUI:RegisterModule("Gryphons", "vanilla:tbc", function ()
  pfUI.gui.dropdowns.Gryphons_selectleft = {
  "None:" .. T["None"],
    "Griffon:" .. T["Griffon"],
    "Shagu:" .. T["Shagu"],
    "Diablo1:" .. T["Diablo1"],
    "Diablo2:" .. T["Diablo2"],
    "Diablo3:" .. T["Diablo3"],
    "Diablo4:" .. T["Diablo4"],
    "Gargoyle:" .. T["Gargoyle"],
    "Gargoyle2:" .. T["Gargoyle2"],
    "Onyxia:" .. T["Onyxia"],
  "Murloc1:" .. T["Murloc1"],
  "Murloc2:" .. T["Murloc2"],
    "Holy:" .. T["Holy"],
  "Bear:" .. T["Bear"],
  "Cat:" .. T["Cat"],
  "Dead:" .. T["Dead"],
  "Frost:" .. T["Frost"],
  "Metamorph:" .. T["Metamorph"],
  "Fire:" .. T["Fire"],
  "Storm:" .. T["Storm"],
  "Unholy:" .. T["Unholy"],
  "Simple:" .. T["Simple"],
  "Water:" .. T["Water"]
  }
  
  pfUI.gui.dropdowns.Gryphons_selectright = {
  "None:" .. T["None"],
    "Griffon:" .. T["Griffon"],
    "Shagu:" .. T["Shagu"],
    "Diablo1:" .. T["Diablo1"],
    "Diablo2:" .. T["Diablo2"],
    "Diablo3:" .. T["Diablo3"],
    "Diablo4:" .. T["Diablo4"],
    "Gargoyle:" .. T["Gargoyle"],
    "Gargoyle2:" .. T["Gargoyle2"],
    "Onyxia:" .. T["Onyxia"],
  "Murloc1:" .. T["Murloc1"],
  "Murloc2:" .. T["Murloc2"],
    "Holy:" .. T["Holy"],
  "Bear:" .. T["Bear"],
  "Cat:" .. T["Cat"],
  "Dead:" .. T["Dead"],
  "Frost:" .. T["Frost"],
  "Metamorph:" .. T["Metamorph"],
  "Fire:" .. T["Fire"],
  "Storm:" .. T["Storm"],
  "Unholy:" .. T["Unholy"],
  "Simple:" .. T["Simple"],
  "Water:" .. T["Water"]
  }
  
  pfUI.gui.dropdowns.Gryphons_selectrighttop = {
  "None:" .. T["None"],
    "Griffon:" .. T["Griffon"],
    "Shagu:" .. T["Shagu"],
    "Diablo1:" .. T["Diablo1"],
    "Diablo2:" .. T["Diablo2"],
    "Diablo3:" .. T["Diablo3"],
    "Diablo4:" .. T["Diablo4"],
    "Gargoyle:" .. T["Gargoyle"],
    "Gargoyle2:" .. T["Gargoyle2"],
    "Onyxia:" .. T["Onyxia"],
  "Murloc1:" .. T["Murloc1"],
  "Murloc2:" .. T["Murloc2"],
    "Holy:" .. T["Holy"],
  "Bear:" .. T["Bear"],
  "Cat:" .. T["Cat"],
  "Dead:" .. T["Dead"],
  "Frost:" .. T["Frost"],
  "Metamorph:" .. T["Metamorph"],
  "Fire:" .. T["Fire"],
  "Storm:" .. T["Storm"],
  "Unholy:" .. T["Unholy"],
  "Simple:" .. T["Simple"],
  "Water:" .. T["Water"]
  }

  -- detect current addon path
  local addonpath
  local tocs = { "", "-master", "-tbc", "-wotlk" }
  for _, name in pairs(tocs) do
    local current = string.format("pfUI-Gryphons%s", name)
    local _, title = GetAddOnInfo(current)
    if title then
      addonpath = "Interface\\AddOns\\" .. current
      break
    end
  end

  if pfUI.gui.CreateGUIEntry then -- new pfUI
    pfUI.gui.CreateGUIEntry(T["Thirdparty"], T["Gryphons"], function()
     pfUI.gui.CreateConfig(nil, T["Left Side"], nil, nil, "header")
     pfUI.gui.CreateConfig(nil, T["Select left gryphon"], C.Gryphons, "selectleft", "dropdown", pfUI.gui.dropdowns.Gryphons_selectleft)
     pfUI.gui.CreateConfig(nil, T["Size"], C.Gryphons, "img_size")
     pfUI.gui.CreateConfig(nil, T["Horizontal Offset"], C.Gryphons, "h_off")
     pfUI.gui.CreateConfig(nil, T["Vertical Offset"], C.Gryphons, "v_off")
     pfUI.gui.CreateConfig(nil, T["Pick Color"], C.Gryphons, "left_color", "color")
    
    
    
     pfUI.gui.CreateConfig(nil, T["Right side"], nil, nil, "header")
     pfUI.gui.CreateConfig(nil, T["Select right gryphon"], C.Gryphons, "selectright", "dropdown", pfUI.gui.dropdowns.Gryphons_selectright)
     pfUI.gui.CreateConfig(nil, T["Size"], C.Gryphons, "img_size1")
     pfUI.gui.CreateConfig(nil, T["Horizontal Offset"], C.Gryphons, "h_off1")
     pfUI.gui.CreateConfig(nil, T["Vertical Offset"], C.Gryphons, "v_off1")
     pfUI.gui.CreateConfig(nil, T["Pick Color"], C.Gryphons, "right_color", "color")
   
     pfUI.gui.CreateConfig(nil, T["Right side top"], nil, nil, "header")
     pfUI.gui.CreateConfig(nil, T["Select right gryphon"], C.Gryphons, "selectrighttop", "dropdown", pfUI.gui.dropdowns.Gryphons_selectrighttop)
     pfUI.gui.CreateConfig(nil, T["Size"], C.Gryphons, "img_size2")
     pfUI.gui.CreateConfig(nil, T["Horizontal Offset"], C.Gryphons, "h_off2")
     pfUI.gui.CreateConfig(nil, T["Vertical Offset"], C.Gryphons, "v_off2")
     pfUI.gui.CreateConfig(nil, T["Pick Color"], C.Gryphons, "righttop_color", "color")
   
    end)
  else -- old pfUI
    pfUI.gui.tabs.thirdparty.tabs.Gryphons = pfUI.gui.tabs.thirdparty.tabs:CreateTabChild("Gryphons", true)
    pfUI.gui.tabs.thirdparty.tabs.Gryphons:SetScript("OnShow", function()
      if not this.setup then
        local CreateConfig = pfUI.gui.CreateConfig
        local update = pfUI.gui.update
        this.setup = true
      end
    end)
  end
  pfUI:UpdateConfig("Gryphons",       nil,         "header")
  pfUI:UpdateConfig("Gryphons",       nil,         "selectleft",   "Griffon")
  pfUI:UpdateConfig("Gryphons",       nil,         "selectright",   "Griffon")
  pfUI:UpdateConfig("Gryphons",       nil,         "selectrighttop",   "None")
  pfUI:UpdateConfig("Gryphons",       nil,         "img_size",   "100")
  pfUI:UpdateConfig("Gryphons",       nil,         "h_off",   "-75")
  pfUI:UpdateConfig("Gryphons",       nil,         "v_off",   "-1")
  pfUI:UpdateConfig("Gryphons",       nil,         "img_size1",   "100")
  pfUI:UpdateConfig("Gryphons",       nil,         "h_off1",   "75")
  pfUI:UpdateConfig("Gryphons",       nil,         "v_off1",   "-1")
  pfUI:UpdateConfig("Gryphons",       nil,         "img_size2",   "100")
  pfUI:UpdateConfig("Gryphons",       nil,         "h_off2",   "75")
  pfUI:UpdateConfig("Gryphons",       nil,         "v_off2",   "-1")
  pfUI:UpdateConfig("Gryphons",       nil,         "left_color",   "1,1,1")
  pfUI:UpdateConfig("Gryphons",       nil,         "right_color",   "1,1,1")
  pfUI:UpdateConfig("Gryphons",       nil,         "righttop_color",   "1,1,1")



----------------
-- Left  side --
----------------

if C.Gryphons.selectleft == "Default" then

local r,g,b,a = GetStringColor(C.Gryphons.left_color)
local hoff = C.Gryphons.h_off
local voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
local t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "None" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Hide()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Griffon" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Shagu" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\shagu.blp")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Diablo1" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo1")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Diablo2" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo1_roth")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Diablo3" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo2")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Diablo4" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo2_roth")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Gargoyle" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\garg1")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Gargoyle2" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\garg2")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Onyxia" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\onyxia")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Murloc1" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\murloc")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Murloc2" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("HIGH")
f:SetWidth(size)
f:SetHeight(size)
t = f:CreateTexture(nil,"HIGH")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\murloc2")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Holy" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_holy")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Bear" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_bear")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Cat" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_cat")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Dead" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_dead")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Frost" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_frost")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Metamorph" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_metamorph")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Fire" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_shaman_fire")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Storm" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_shaman_storm")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Unholy" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadow_unholy")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Simple" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadowcombat")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

elseif C.Gryphons.selectleft == "Water" then
r,g,b,a = GetStringColor(C.Gryphons.left_color)
size = C.Gryphons.img_size
hoff = C.Gryphons.h_off
voff = C.Gryphons.v_off
f = CreateFrame("Frame",nil,pfActionBarMain)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(size+156)
f:SetHeight(size+28)
t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\AddOns\\pfUI-gryphons\\leftshadowswim")
t:SetVertexColor(r,g,b,a)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
f:Show()
f:SetParent(pfActionBarMain)

end

----------------
-- Right side --
----------------

if C.Gryphons.selectright == "Default" then

local q,w,e,z = GetStringColor(C.Gryphons.right_color)
local size1 = C.Gryphons.img_size1
local hoff1 = C.Gryphons.h_off1
local voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon1")
t:SetVertexColor(r,g,b,a)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "None" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon1")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Hide()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Griffon" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon1")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Shagu" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\shagu1.blp")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Diablo1" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo11")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Diablo2" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo11_roth")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Diablo3" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo22")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Diablo4" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo22_roth")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Gargoyle" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\garg11")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Gargoyle2" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\garg22")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Onyxia" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\onyxia1")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Murloc1" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\murloc1")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Murloc2" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size1)
fr:SetHeight(size1)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\murloc22")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Holy" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_holy")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Bear" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_bear")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Cat" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_cat")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Dead" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_dead")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Frost" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_frost")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Metamorph" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_metamorph")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Fire" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_shaman_fire")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Storm" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_shaman_storm")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Unholy" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_unholy")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Simple" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadowcombat")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

elseif C.Gryphons.selectright == "Water" then
q,w,e,z = GetStringColor(C.Gryphons.right_color)
size1 = C.Gryphons.img_size1
hoff1 = C.Gryphons.h_off1
voff1 = C.Gryphons.v_off1
fr = CreateFrame("Frame",nil,pfActionBarMain)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size1+156)
fr:SetHeight(size1+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadowswim")
tr:SetVertexColor(q,w,e,z)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
fr:Show()
fr:SetParent(pfActionBarMain)

end

----------------
-- Right side top --
----------------

if C.Gryphons.selectrighttop == "Default" then

local c,v,b,n = GetStringColor(C.Gryphons.right_color)
local size2 = C.Gryphons.img_size2
local hoff2 = C.Gryphons.h_off2
local voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon1")
t:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "None" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon1")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Hide()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Griffon" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\griffon1")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Shagu" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\shagu1.blp")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Diablo1" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo11")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Diablo2" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo11_roth")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Diablo3" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo22")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Diablo4" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\diablo22_roth")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Gargoyle" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\garg11")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Gargoyle2" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\garg22")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Onyxia" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\onyxia1")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Murloc1" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\murloc1")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Murloc2" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("HIGH")
fr:SetWidth(size2)
fr:SetHeight(size2)
tr = fr:CreateTexture(nil,"HIGH")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\murloc22")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Holy" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_holy")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Bear" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_bear")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Cat" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_cat")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Dead" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_dead")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Frost" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_frost")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Metamorph" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_metamorph")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Fire" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_shaman_fire")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Storm" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_shaman_storm")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Unholy" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadow_unholy")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Simple" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadowcombat")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

elseif C.Gryphons.selectrighttop == "Water" then
c,v,b,n = GetStringColor(C.Gryphons.right_color)
size2 = C.Gryphons.img_size2
hoff2 = C.Gryphons.h_off2
voff2 = C.Gryphons.v_off2
fr = CreateFrame("Frame",nil,pfActionBarTop)
fr:SetFrameStrata("BACKGROUND")
fr:SetWidth(size2+156)
fr:SetHeight(size2+28)
tr = fr:CreateTexture(nil,"BACKGROUND")
tr:SetTexture("Interface\\AddOns\\pfUI-gryphons\\rightshadowswim")
tr:SetVertexColor(c,v,b,n)
tr:SetAllPoints(fr)
fr.texture = tr
fr:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
fr:Show()
fr:SetParent(pfActionBarTop)

end

    end)
