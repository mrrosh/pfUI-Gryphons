pfUI:RegisterModule("Gryphons", "vanilla:tbc", function ()
  pfUI.gui.dropdowns.Gryphons_selectleft = {
	"Default:" .. T["Default"],
	"None:" .. T["None"],
    "Lion:" .. T["Lion"],
    "Shagu:" .. T["Shagu"],
    "Diablo1:" .. T["Diablo1"],
    "Diablo2:" .. T["Diablo2"],
    "Diablo3:" .. T["Diablo3"],
    "Diablo4:" .. T["Diablo4"],
    "Gargoyle1:" .. T["Gargoyle"],
    "Gargoyle2:" .. T["Gargoyle2"],
    "Onyxia:" .. T["Onyxia"],
    "Murloc1:" .. T["Murloc1"],
	"Murloc2:" .. T["Murloc2"],
	"Bear:" .. T["Bear"],
	"Cat:" .. T["Cat"],
	"Dead:" .. T["Dead"],
	"Frost:" .. T["Frost"],
	"Metamorph:" .. T["Metamorph"],
	"Fire:" .. T["Fire"],
	"Storm:" .. T["Storm"],
	"Holy:" .. T["Holy"],
	"Unholy:" .. T["Unholy"],
	"Simple:" .. T["Simple"],
	"Water:" .. T["Water"]
  }
  
  pfUI.gui.dropdowns.Gryphons_selectright = {
    "Default:" .. T["Default"],
	"None:" .. T["None"],
    "Lion:" .. T["Lion"],
    "Shagu:" .. T["Shagu"],
    "Diablo1:" .. T["Diablo1"],
    "Diablo2:" .. T["Diablo2"],
    "Diablo3:" .. T["Diablo3"],
    "Diablo4:" .. T["Diablo4"],
    "Gargoyle1:" .. T["Gargoyle"],
    "Gargoyle2:" .. T["Gargoyle2"],
    "Onyxia:" .. T["Onyxia"],
	"Murloc1:" .. T["Murloc1"],
	"Murloc2:" .. T["Murloc2"],
	"Bear:" .. T["Bear"],
	"Cat:" .. T["Cat"],
	"Dead:" .. T["Dead"],
	"Frost:" .. T["Frost"],
	"Metamorph:" .. T["Metamorph"],
	"Fire:" .. T["Fire"],
	"Storm:" .. T["Storm"],
	"Holy:" .. T["Holy"],
	"Unholy:" .. T["Unholy"],
	"Simple:" .. T["Simple"],
	"Water:" .. T["Water"]
  }
  
  pfUI.gui.dropdowns.Gryphons_selectrighttop = {
	"Default:" .. T["Default"],
	"None:" .. T["None"],
    "Lion:" .. T["Lion"],
    "Shagu:" .. T["Shagu"],
    "Diablo1:" .. T["Diablo1"],
    "Diablo2:" .. T["Diablo2"],
    "Diablo3:" .. T["Diablo3"],
    "Diablo4:" .. T["Diablo4"],
    "Gargoyle1:" .. T["Gargoyle"],
    "Gargoyle2:" .. T["Gargoyle2"],
    "Onyxia:" .. T["Onyxia"],
	"Murloc1:" .. T["Murloc1"],
	"Murloc2:" .. T["Murloc2"],
	"Bear:" .. T["Bear"],
	"Cat:" .. T["Cat"],
	"Dead:" .. T["Dead"],
	"Frost:" .. T["Frost"],
	"Metamorph:" .. T["Metamorph"],
	"Fire:" .. T["Fire"],
	"Storm:" .. T["Storm"],
	"Holy:" .. T["Holy"],
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
  pfUI:UpdateConfig("Gryphons",       nil,         "selectleft",   "Default")
  pfUI:UpdateConfig("Gryphons",       nil,         "selectright",   "Default")
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

local function AddLeftGriphon(texture)
  local r,g,b,a = GetStringColor(C.Gryphons.left_color)
  local hoff = C.Gryphons.h_off
  local voff = C.Gryphons.v_off
  local size = C.Gryphons.img_size

  -- create griphon frame
  local f = CreateFrame("Frame",nil,pfActionBarMain)
  f:SetFrameStrata("HIGH")
  f:SetWidth(size)
  f:SetHeight(size)

  -- create griphon texture
  local t = f:CreateTexture(nil,"HIGH")
  t:SetTexture(texture)
  t:SetVertexColor(r,g,b,a)
  t:SetAllPoints(f)
  f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff,voff)
  f:Show()
  f:SetParent(pfActionBarMain)
  f.texture = t
  
  return f
end

local function AddLeftGriphonExtended(texture)
  local r,g,b,a = GetStringColor(C.Gryphons.left_color)
  local hoff = C.Gryphons.h_off
  local voff = C.Gryphons.v_off
  local size = C.Gryphons.img_size

  -- create griphon frame
  local f = CreateFrame("Frame",nil,pfActionBarMain)
  f:SetFrameStrata("BACKGROUND")
  f:SetWidth(size+156)
  f:SetHeight(size+28)

  -- create griphon texture
  local t = f:CreateTexture(nil,"BACKGROUND")
  t:SetTexture(texture)
  t:SetVertexColor(r,g,b,a)
  t:SetAllPoints(f)
  f:SetPoint("BOTTOMLEFT", pfActionBarMain,"BOTTOMLEFT", hoff-175,voff)
  f:Show()
  f:SetParent(pfActionBarMain)
  f.texture = t
  
  return f
end


if C.Gryphons.selectleft == "Default" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\griffon")
elseif C.Gryphons.selectleft == "None" then
  AddLeftGriphon(nil)
elseif C.Gryphons.selectleft == "Lion" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion")
elseif C.Gryphons.selectleft == "Shagu" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\shagu")
elseif C.Gryphons.selectleft == "Diablo1" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo1")
elseif C.Gryphons.selectleft == "Diablo2" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo2")
elseif C.Gryphons.selectleft == "Diablo3" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo3")
elseif C.Gryphons.selectleft == "Diablo4" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo4")
elseif C.Gryphons.selectleft == "Gargoyle1" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle1")
elseif C.Gryphons.selectleft == "Gargoyle2" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle2")
elseif C.Gryphons.selectleft == "Onyxia" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\onyxia")
elseif C.Gryphons.selectleft == "Murloc1" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\murloc1")
elseif C.Gryphons.selectleft == "Murloc2" then
  AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\murloc2")
elseif C.Gryphons.selectleft == "Bear" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_bear")
elseif C.Gryphons.selectleft == "Cat" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_cat")
elseif C.Gryphons.selectleft == "Dead" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_dead")
elseif C.Gryphons.selectleft == "Frost" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_frost")
elseif C.Gryphons.selectleft == "Metamorph" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_metamorph")
elseif C.Gryphons.selectleft == "Fire" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_shaman_fire")
elseif C.Gryphons.selectleft == "Storm" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_shaman_storm")
elseif C.Gryphons.selectleft == "Holy" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_holy")
elseif C.Gryphons.selectleft == "Unholy" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_unholy")
elseif C.Gryphons.selectleft == "Simple" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadowcombat")  
elseif C.Gryphons.selectleft == "Water" then
  AddLeftGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadowswim")
end

----------------
-- Right side --
----------------


local function AddRightGriphon(texture)
  local r1,g1,b1,a1 = GetStringColor(C.Gryphons.right_color)
  local hoff1 = C.Gryphons.h_off1
  local voff1 = C.Gryphons.v_off1
  local size1 = C.Gryphons.img_size1

  -- create griphon frame
  local fr = CreateFrame("Frame",nil,pfActionBarMain)
  fr:SetFrameStrata("HIGH")
  fr:SetWidth(size1)
  fr:SetHeight(size1)

  -- create griphon texture
  local tr = fr:CreateTexture(nil,"HIGH")
  tr:SetTexture(texture)
  tr:SetVertexColor(r1,g1,b1,a1)
  tr:SetAllPoints(fr)
  fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1,voff1)
  fr:Show()
  fr:SetParent(pfActionBarMain)
  fr.texture = tr
  
  return fr
end

local function AddRightGriphonExtended(texture)
  local r1,g1,b1,a1 = GetStringColor(C.Gryphons.right_color)
  local hoff1 = C.Gryphons.h_off1
  local voff1 = C.Gryphons.v_off1
  local size1 = C.Gryphons.img_size1

  -- create griphon frame
  local fr = CreateFrame("Frame",nil,pfActionBarMain)
  fr:SetFrameStrata("BACKGROUND")
  fr:SetWidth(size1+156)
  fr:SetHeight(size1+28)

  -- create griphon texture
  local tr = fr:CreateTexture(nil,"BACKGROUND")
  tr:SetTexture(texture)
  tr:SetVertexColor(r1,g1,b1,a1)
  tr:SetAllPoints(fr)
  fr:SetPoint("BOTTOMRIGHT", pfActionBarMain,"BOTTOMRIGHT", hoff1+175,voff1)
  fr:Show()
  fr:SetParent(pfActionBarMain)
  fr.texture = tr
  
  return fr
end

if C.Gryphons.selectright == "Default" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\griffon1")
elseif C.Gryphons.selectright == "None" then
  AddRightGriphon(nil)
elseif C.Gryphons.selectright == "Lion" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion1")
elseif C.Gryphons.selectright == "Shagu" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\shagu1")
elseif C.Gryphons.selectright == "Diablo1" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo11")
elseif C.Gryphons.selectright == "Diablo2" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo22")
elseif C.Gryphons.selectright == "Diablo3" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo33")
elseif C.Gryphons.selectright == "Diablo4" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo44")
elseif C.Gryphons.selectright == "Gargoyle1" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle11")
elseif C.Gryphons.selectright == "Gargoyle2" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle22")
elseif C.Gryphons.selectright == "Onyxia" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\onyxia1")
elseif C.Gryphons.selectright == "Murloc1" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\murloc11")
elseif C.Gryphons.selectright == "Murloc2" then
  AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\murloc22")
elseif C.Gryphons.selectright == "Bear" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_bear")
elseif C.Gryphons.selectright == "Cat" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_cat")
elseif C.Gryphons.selectright == "Dead" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_dead")
elseif C.Gryphons.selectright == "Frost" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_frost")
elseif C.Gryphons.selectright == "Metamorph" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_metamorph")
elseif C.Gryphons.selectright == "Fire" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_shaman_fire")
elseif C.Gryphons.selectright == "Storm" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_shaman_storm")
elseif C.Gryphons.selectright == "Holy" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_holy")
elseif C.Gryphons.selectright == "Unholy" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_unholy")
elseif C.Gryphons.selectright == "Simple" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadowcombat")  
elseif C.Gryphons.selectright == "Water" then
  AddRightGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadowswim")
end


----------------
-- Right side top --
----------------

local function AddRightTopGriphon(texture)
  local r2,g2,b2,a2 = GetStringColor(C.Gryphons.righttop_color)
  local hoff2 = C.Gryphons.h_off2
  local voff2 = C.Gryphons.v_off2
  local size2 = C.Gryphons.img_size2

  -- create griphon frame
  local frt = CreateFrame("Frame",nil,pfActionBarMain)
  frt:SetFrameStrata("HIGH")
  frt:SetWidth(size2)
  frt:SetHeight(size2)

  -- create griphon texture
  local trt = frt:CreateTexture(nil,"HIGH")
  trt:SetTexture(texture)
  trt:SetVertexColor(r2,g2,b2,a2)
  trt:SetAllPoints(frt)
  frt:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2,voff2)
  frt:Show()
  frt:SetParent(pfActionBarTop)
  frt.texture = trt
  
  return frt
end

local function AddRightTopGriphonExtended(texture)
  local r2,g2,b2,a2 = GetStringColor(C.Gryphons.righttop_color)
  local hoff2 = C.Gryphons.h_off2
  local voff2 = C.Gryphons.v_off2
  local size2 = C.Gryphons.img_size2

  -- create griphon frame
  local frt = CreateFrame("Frame",nil,pfActionBarMain)
  frt:SetFrameStrata("BACKGROUND")
  frt:SetWidth(size2+156)
  frt:SetHeight(size2+28)

  -- create griphon texture
  local trt = frt:CreateTexture(nil,"BACKGROUND")
  trt:SetTexture(texture)
  trt:SetVertexColor(r2,g2,b2,a2)
  trt:SetAllPoints(frt)
  frt:SetPoint("BOTTOMRIGHT", pfActionBarTop,"BOTTOMRIGHT", hoff2+175,voff2)
  frt:Show()
  frt:SetParent(pfActionBarTop)
  frt.texture = trt
  
  return frt
end

if C.Gryphons.selectrighttop == "Default" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\griffon1")
elseif C.Gryphons.selectrighttop == "None" then
  AddRightTopGriphon(nil)
elseif C.Gryphons.selectrighttop == "Lion" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion1")
elseif C.Gryphons.selectrighttop == "Shagu" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\shagu1")
elseif C.Gryphons.selectrighttop == "Diablo1" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo11")
elseif C.Gryphons.selectrighttop == "Diablo2" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo22")
elseif C.Gryphons.selectrighttop == "Diablo3" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo33")
elseif C.Gryphons.selectrighttop == "Diablo4" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo44")
elseif C.Gryphons.selectrighttop == "Gargoyle1" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle11")
elseif C.Gryphons.selectrighttop == "Gargoyle2" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle22")
elseif C.Gryphons.selectrighttop == "Onyxia" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\onyxia1")
elseif C.Gryphons.selectrighttop == "Murloc1" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\murloc11")
elseif C.Gryphons.selectrighttop == "Murloc2" then
  AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\murloc22")
elseif C.Gryphons.selectrighttop == "Bear" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_bear")
elseif C.Gryphons.selectrighttop == "Cat" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_cat")
elseif C.Gryphons.selectrighttop == "Dead" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_dead")
elseif C.Gryphons.selectrighttop == "Frost" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_frost")
elseif C.Gryphons.selectrighttop == "Metamorph" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_metamorph")
elseif C.Gryphons.selectrighttop == "Fire" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_shaman_fire")
elseif C.Gryphons.selectrighttop == "Storm" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_shaman_storm")
elseif C.Gryphons.selectrighttop == "Holy" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_holy")
elseif C.Gryphons.selectrighttop == "Unholy" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_unholy")
elseif C.Gryphons.selectrighttop == "Simple" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadowcombat")  
elseif C.Gryphons.selectrighttop == "Water" then
  AddRightTopGriphonExtended("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadowswim")
end

    end)
