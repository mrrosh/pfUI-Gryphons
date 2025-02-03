pfUI:RegisterModule("Gryphons","vanilla:tbc",function()
  -- Ensure defaults exist (for fresh characters)
  if not C.Gryphons then C.Gryphons = {} end
  C.Gryphons.selectleft = C.Gryphons.selectleft or "GryphonHD3"
  C.Gryphons.img_size   = C.Gryphons.img_size   or "60"
  C.Gryphons.h_off      = C.Gryphons.h_off      or "-50"
  C.Gryphons.v_off      = C.Gryphons.v_off      or "-5"
  C.Gryphons.color      = C.Gryphons.color      or "1,1,1"

  -- Dropdown definition for selecting the endcap texture
  pfUI.gui.dropdowns.Gryphons_selectleft = {
    "None:"..T["None"],
    "Default:"..T["Default Gryphon"],
    "GryphonHD3:"..T["Alliance Gryphon"],
    "GryphonHD4:"..T["Horde Gryphon"],
    "GryphonHD5:"..T["Gold Alliance Gryphon"],
    "GryphonHD6:"..T["Goldend Horde Gryphon"],
    "Lion:"..T["Lion"],
    "Lion2:"..T["Winged Lion"],
    "Lion3:"..T["Golden Winged Lion"],
    "Turtle:"..T["Turtle"],
    "Turtle2:"..T["Golden Turtle"],
    "Skull:"..T["Skull"],
    "Skull2:"..T["Golden Skull"],
    "Leaf:"..T["Green Leaf"],
    "Diablo1:"..T["Diablo1"],
    "Diablo2:"..T["Diablo2"],
    "Diablo3:"..T["Diablo3"],
    "Diablo4:"..T["Diablo4"]
  }

  local addonpath
  for _, s in pairs({"","-master","-tbc","-wotlk"}) do 
    local n = string.format("pfUI-Gryphons%s", s)
    local _, t = GetAddOnInfo(n)
    if t then 
      addonpath = "Interface\\AddOns\\" .. n 
      break 
    end 
  end

  local current = { left = nil, right = nil }

  local function AddFrame(parent, texture, color, size, hoff, voff, ext, anchor, relanchor, offX, offY)
    local r, g, b, a = GetStringColor(color)
    local strata = ext and "BACKGROUND" or "HIGH"
    local f = CreateFrame("Frame", nil, parent)
    f:SetFrameStrata(strata)
    local tex = f:CreateTexture(nil, strata)
    tex:SetTexture(texture)
    tex:SetVertexColor(r, g, b, a)
    tex:SetAllPoints(f)
    f.texture = tex
    if ext then
      f:SetWidth(size + 156)
      f:SetHeight(size + 28)
      f:SetPoint(anchor, parent, relanchor, hoff + offX, voff + offY)
      f:SetFrameLevel(0)
    else
      f:SetWidth(size)
      f:SetHeight(size)
      f:SetPoint(anchor, parent, relanchor, hoff, voff)
    end
    f:Show()
    return f
  end

  local function AddLeftGriphon(tex, ext)
    return AddFrame(pfActionBarMain, tex, C.Gryphons.color, C.Gryphons.img_size, tonumber(C.Gryphons.h_off) or 0, C.Gryphons.v_off, ext, "BOTTOMLEFT", "BOTTOMLEFT", ext and -175 or 0, 0)
  end

  local function AddRightGriphon(tex, ext)
    -- Reverse the horizontal offset by multiplying by -1.
    local rightHOff = -(tonumber(C.Gryphons.h_off) or 0)
    return AddFrame(pfActionBarMain, tex, C.Gryphons.color, C.Gryphons.img_size, rightHOff, C.Gryphons.v_off, ext, "BOTTOMRIGHT", "BOTTOMRIGHT", 0, 0)
  end

  local function GetLeftTexture(selection)
    if selection == "None" then
      return nil
    elseif selection == "Default" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\griffon"
    elseif selection == "Skull" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\skull"
    elseif selection == "Skull2" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\skullg"
    elseif selection == "Skull3" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\Skull2Left"
    elseif selection == "Leaf" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\LeafLeft"
    elseif selection == "Lion" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\lion"
    elseif selection == "Lion2" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\lion2"
    elseif selection == "Lion3" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\lion3"
    elseif selection == "Diablo1" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo1"
    elseif selection == "Diablo2" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo2"
    elseif selection == "Diablo3" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo3"
    elseif selection == "Diablo4" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo4"
    elseif selection == "Turtle" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\turtle"
    elseif selection == "Turtle2" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\turtleg"
    elseif selection == "Gargoyle1" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle1"
    elseif selection == "Gargoyle2" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle2"
    elseif selection == "Onyxia" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\onyxia"
    elseif selection == "GryphonHD3" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD2Left"
    elseif selection == "GryphonHD4" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD3Left"
    elseif selection == "GryphonHD5" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD2LeftGold"
    elseif selection == "GryphonHD6" then
      return "Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD3LeftGold"
    end
  end

  pfUI.gui.UpdaterFunctions["Gryphons"] = function()
    if current.left then current.left:Hide() end
    if current.right then current.right:Hide() end

    local leftTex = GetLeftTexture(C.Gryphons.selectleft)
    current.left = AddLeftGriphon(leftTex, false)

    if leftTex then
      current.right = AddRightGriphon(leftTex, false)
      -- Mirror the right texture horizontally.
      current.right.texture:SetTexCoord(1, 0, 0, 1)
    else
      current.right = AddRightGriphon(nil, false)
    end
  end

  if pfUI.gui.CreateGUIEntry then
    pfUI.gui.CreateGUIEntry(T["Thirdparty"], T["Gryphons"], function()
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Endcap Settings"], nil, nil, "header")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Select endcap texture"], C.Gryphons, "selectleft", "dropdown", pfUI.gui.dropdowns.Gryphons_selectleft)
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Size"], C.Gryphons, "img_size")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Horizontal Offset"], C.Gryphons, "h_off")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Vertical Offset"], C.Gryphons, "v_off")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Pick Color"], C.Gryphons, "color", "color")
    end)
  else
    pfUI.gui.tabs.thirdparty.tabs.Gryphons = pfUI.gui.tabs.thirdparty.tabs:CreateTabChild("Gryphons", true)
    pfUI.gui.tabs.thirdparty.tabs.Gryphons:SetScript("OnShow", function() if not this.setup then this.setup = true end end)
  end

  pfUI.gui.UpdaterFunctions["Gryphons"]() -- update on load
end)
