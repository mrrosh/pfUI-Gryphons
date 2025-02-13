pfUI:RegisterModule("Gryphons","vanilla:tbc",function()
  -- Ensure defaults exist (for fresh characters)
  if not C.Gryphons then C.Gryphons = {} end
    C.Gryphons.selectleft = C.Gryphons.selectleft     or "GryphonHD3"      -- Default gryphon texture
    C.Gryphons.img_size   = C.Gryphons.img_size       or "60"              -- Default size
    C.Gryphons.selectleft   = C.Gryphons.selectleft   or "GryphonHD3"      -- Default image
    C.Gryphons.h_off      = C.Gryphons.h_off          or "-50"             -- Default horizontal offset
    C.Gryphons.v_off      = C.Gryphons.v_off          or "-5"              -- Default vertical offset
    C.Gryphons.color      = C.Gryphons.color          or "1,1,1"           -- Default color

  -- Add default positions for left and right endcaps
    C.Gryphons.selectleft_position = C.Gryphons.selectleft_position or "Left"  -- Default position for left endcap
    C.Gryphons.selectright_position = C.Gryphons.selectright_position or "Right" -- Default position for right endcap


  -- Dropdown definition for selecting the endcap texture
  pfUI.gui.dropdowns.Gryphons_selectleft = {
    "None:"..T["None"],
    "Default:"..T["Default Gryphon"],
    "GryphonHD3:"..T["Alliance Gryphon"],
    "GryphonHD4:"..T["Horde Gryphon"],
    "GryphonHD5:"..T["Gold Alliance Gryphon"],
    "GryphonHD6:"..T["Gold Horde Gryphon"],
    "Lion:"..T["Lion"],
    "Lion2:"..T["Winged Lion"],
    "Lion3:"..T["Gold Winged Lion"],
    "Turtle:"..T["Turtle"],
    "Turtle2:"..T["Gold Turtle"],
    "Skull:"..T["Skull"],
    "Skull2:"..T["Gold Skull"],
    "Leaf:"..T["Green Leaf"],
    "Diablo1:"..T["Diablo1"],
    "Diablo2:"..T["Diablo2"],
    "Diablo3:"..T["Diablo3"],
    "Diablo4:"..T["Diablo4"]
  }
  
  -- Dropdown definition for selecting left endcap position
  pfUI.gui.dropdowns.Gryphons_selectleft_position = {
    "Main:"..T["Main"],
    "Top:"..T["Top"],
    "Left:"..T["Left"],
    "Right:"..T["Right"],
    "Vertical:"..T["Vertical"],
  }

  -- Dropdown definition for selecting right endcap position
  pfUI.gui.dropdowns.Gryphons_selectright_position = {
    "Main:"..T["Main"],
    "Top:"..T["Top"],
    "Left:"..T["Left"],
    "Right:"..T["Right"],
    "Vertical:"..T["Vertical"],
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

local function GetActionBarPosition(position)
    if position == "Main" then
        return pfActionBarMain
    elseif position == "Top" then
        return pfActionBarTop
    elseif position == "Left" then
        return pfActionBarLeft
    elseif position == "Right" then
        return pfActionBarRight
    elseif position == "Vertical Actionbar" then
        return pfActionBarVertical
    end
end

-- Modify AddFrame function to accept the bar positions
local function AddFrame(parent, texture, color, size, hoff, voff, ext, anchor, relanchor, offX, offY, actionBarPosition)
    local r, g, b, a = GetStringColor(color)
    local strata = ext and "BACKGROUND" or "HIGH"
    local f = CreateFrame("Frame", nil, actionBarPosition)  -- Use dynamic actionBarPosition here
    f:SetFrameStrata(strata)
    local tex = f:CreateTexture(nil, strata)
    tex:SetTexture(texture)
    tex:SetVertexColor(r, g, b, a)
    tex:SetAllPoints(f)
    f.texture = tex
    if ext then
        f:SetWidth(size + 156)
        f:SetHeight(size + 28)
        f:SetPoint(anchor, actionBarPosition, relanchor, hoff + offX, voff + offY)
        f:SetFrameLevel(0)
    else
        f:SetWidth(size)
        f:SetHeight(size)
        f:SetPoint(anchor, actionBarPosition, relanchor, hoff, voff)
    end
    f:Show()
    return f
end

-- Modify position handling when adding the endcaps
  local function AddLeftGriphon(tex, ext)
    local position = GetActionBarPosition(C.Gryphons.selectleft_position)  -- Get selected position for left endcap
    return AddFrame(position, tex, C.Gryphons.color, C.Gryphons.img_size, tonumber(C.Gryphons.h_off) or 0, C.Gryphons.v_off, ext, "BOTTOMLEFT", "BOTTOMLEFT", ext and -175 or 0, 0, position)
  end

  local function AddRightGriphon(tex, ext)
    local position = GetActionBarPosition(C.Gryphons.selectright_position)  -- Get selected position for right endcap
    -- Reverse the horizontal offset by multiplying by -1.
    local rightHOff = -(tonumber(C.Gryphons.h_off) or 0)
    return AddFrame(position, tex, C.Gryphons.color, C.Gryphons.img_size, rightHOff, C.Gryphons.v_off, ext, "BOTTOMRIGHT", "BOTTOMRIGHT", 0, 0, position)
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
    -- Create a section for Gryphons under the Thirdparty category
    pfUI.gui.CreateGUIEntry(T["Thirdparty"], T["Gryphons"], function()
        
        -- Add a header for the Gryphons section
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Endcap Settings"], nil, nil, "header")
		
        -- Dropdown for selecting the endcap image
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Select gryphon image"], C.Gryphons, "selectleft", "dropdown", pfUI.gui.dropdowns.Gryphons_selectleft)
        
        -- Dropdown for selecting the left endcap position
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Select Left Endcap Position"], C.Gryphons, "selectleft_position", "dropdown", pfUI.gui.dropdowns.Gryphons_selectleft_position)
        
        -- Dropdown for selecting the right endcap position
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Select Right Endcap Position"], C.Gryphons, "selectright_position", "dropdown", pfUI.gui.dropdowns.Gryphons_selectright_position)
        
        -- Add options for size, horizontal and vertical offsets
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Size"], C.Gryphons, "img_size")
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Horizontal Offset"], C.Gryphons, "h_off")
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Vertical Offset"], C.Gryphons, "v_off")
        
        -- Add a color picker for endcap color
        pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"], T["Pick Color"], C.Gryphons, "color", "color")
    end)
  else
    -- Fallback if the GUI creation fails, used to create the tab without dropdowns
    pfUI.gui.tabs.thirdparty.tabs.Gryphons = pfUI.gui.tabs.thirdparty.tabs:CreateTabChild("Gryphons", true)
    pfUI.gui.tabs.thirdparty.tabs.Gryphons:SetScript("OnShow", function() if not this.setup then this.setup = true end end)
  end

  -- Update the Gryphons configuration on load
    pfUI.gui.UpdaterFunctions["Gryphons"]() 

end)
