pfUI:RegisterModule("Gryphons","vanilla:tbc",function()
  -- Ensure defaults exist (for fresh characters)
  if not C.Gryphons then C.Gryphons = {} end
  C.Gryphons.selectleft     = C.Gryphons.selectleft     or "GryphonHD3"
  C.Gryphons.selectright    = C.Gryphons.selectright    or "GryphonHD3"
  C.Gryphons.selectlefttop  = C.Gryphons.selectlefttop  or "None"
  C.Gryphons.selectrighttop = C.Gryphons.selectrighttop or "None"
  C.Gryphons.img_size       = C.Gryphons.img_size       or "60"
  C.Gryphons.h_off          = C.Gryphons.h_off          or "-50"
  C.Gryphons.v_off          = C.Gryphons.v_off          or "-5"
  C.Gryphons.img_size1      = C.Gryphons.img_size1      or "60"
  C.Gryphons.h_off1         = C.Gryphons.h_off1         or "50"
  C.Gryphons.v_off1         = C.Gryphons.v_off1         or "-5"
  C.Gryphons.img_sizelt     = C.Gryphons.img_sizelt     or "90"
  C.Gryphons.h_offlt        = C.Gryphons.h_offlt        or "-70"
  C.Gryphons.v_offlt        = C.Gryphons.v_offlt        or "-35"
  C.Gryphons.img_sizert     = C.Gryphons.img_sizert     or "90"
  C.Gryphons.h_offrt        = C.Gryphons.h_offrt        or "70"
  C.Gryphons.v_offrt        = C.Gryphons.v_offrt        or "-35"
  C.Gryphons.left_color     = C.Gryphons.left_color     or "1,1,1"
  C.Gryphons.right_color    = C.Gryphons.right_color    or "1,1,1"
  C.Gryphons.lefttop_color  = C.Gryphons.lefttop_color  or "1,1,1"
  C.Gryphons.righttop_color = C.Gryphons.righttop_color or "1,1,1"

  -- Dropdown definitions
  pfUI.gui.dropdowns.Gryphons_selectleft = {
    "None:"..T["None"],"Default:"..T["Default Gryphon"],"GryphonHD3:"..T["Alliance Gryphon"],
    "GryphonHD4:"..T["Horde Gryphon"],"GryphonHD5:"..T["Gold Alliance Gryphon"],"GryphonHD6:"..T["Goldend Horde Gryphon"],
    "Lion:"..T["Lion"],"Lion2:"..T["Winged Lion"],"Lion3:"..T["Golden Winged Lion"],
    "Turtle:"..T["Turtle"],"Turtle2:"..T["Golden Turtle"],"Skull:"..T["Skull"],
    "Skull2:"..T["Golden Skull"],"Leaf:"..T["Green Leaf"],"Diablo1:"..T["Diablo1"],
    "Diablo2:"..T["Diablo2"],"Diablo3:"..T["Diablo3"],"Diablo4:"..T["Diablo4"]
  }
  pfUI.gui.dropdowns.Gryphons_selectright = pfUI.gui.dropdowns.Gryphons_selectleft
  pfUI.gui.dropdowns.Gryphons_selectlefttop = {
    "None:"..T["None"],"Bear:"..T["Bear"],"Cat:"..T["Cat"],"Dead:"..T["Dead"],
    "Frost:"..T["Frost"],"Metamorph:"..T["Metamorph"],"Fire:"..T["Fire"],
    "Storm:"..T["Storm"],"Holy:"..T["Holy"],"Unholy:"..T["Unholy"],
    "Simple:"..T["Simple"],"Water:"..T["Water"]
  }
  pfUI.gui.dropdowns.Gryphons_selectrighttop = pfUI.gui.dropdowns.Gryphons_selectlefttop

  local addonpath; for _,s in pairs({"","-master","-tbc","-wotlk"}) do local n=string.format("pfUI-Gryphons%s",s); local _,t=GetAddOnInfo(n); if t then addonpath="Interface\\AddOns\\"..n; break end end

  local current = { left = nil, right = nil, lefttop = nil, righttop = nil }
  local function AddFrame(parent, texture, color, size, hoff, voff, ext, anchor, relanchor, offX, offY)
    local r,g,b,a = GetStringColor(color)
    local strata = ext and "BACKGROUND" or "HIGH"
    local f = CreateFrame("Frame",nil,parent)
    f:SetFrameStrata(strata)
    local tex = f:CreateTexture(nil,strata)
    tex:SetTexture(texture)
    tex:SetVertexColor(r,g,b,a)
    tex:SetAllPoints(f)
    f.texture = tex
    if ext then f:SetWidth(size+156); f:SetHeight(size+28); f:SetPoint(anchor,parent,relanchor,hoff+offX,voff+offY); f:SetFrameLevel(0)
    else f:SetWidth(size); f:SetHeight(size); f:SetPoint(anchor,parent,relanchor,hoff,voff) end
    f:Show() return f
  end
  local function AddLeftGriphon(tex,ext) return AddFrame(pfActionBarMain,tex,C.Gryphons.left_color,C.Gryphons.img_size,C.Gryphons.h_off,C.Gryphons.v_off,ext,"BOTTOMLEFT","BOTTOMLEFT",ext and -175 or 0,0) end
  local function AddRightGriphon(tex,ext) return AddFrame(pfActionBarMain,tex,C.Gryphons.right_color,C.Gryphons.img_size1,C.Gryphons.h_off1,C.Gryphons.v_off1,ext,"BOTTOMRIGHT","BOTTOMRIGHT",ext and 175 or 0,0) end
  local function AddLeftTopGriphon(tex,ext) return AddFrame(pfActionBarTop,tex,C.Gryphons.lefttop_color,C.Gryphons.img_sizelt,C.Gryphons.h_offlt,C.Gryphons.v_offlt,ext,"BOTTOMLEFT","BOTTOMLEFT",ext and -175 or 0,0) end
  local function AddRightTopGriphon(tex,ext) return AddFrame(pfActionBarTop,tex,C.Gryphons.righttop_color,C.Gryphons.img_sizert,C.Gryphons.h_offrt,C.Gryphons.v_offrt,ext,"BOTTOMRIGHT","BOTTOMRIGHT",ext and 175 or 0,0) end

  pfUI.gui.UpdaterFunctions["Gryphons"] = function()
    if current.left then current.left:Hide() end
    if current.right then current.right:Hide() end
    if current.lefttop then current.lefttop:Hide() end
    if current.righttop then current.righttop:Hide() end
    if C.Gryphons.selectleft=="Default" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\griffon")
    elseif C.Gryphons.selectleft=="None" then current.left = AddLeftGriphon(nil)
    elseif C.Gryphons.selectleft=="Skull" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\skull")
    elseif C.Gryphons.selectleft=="Skull2" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\skullg")
    elseif C.Gryphons.selectleft=="Skull3" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\Skull2Left")
    elseif C.Gryphons.selectleft=="Leaf" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\LeafLeft")
    elseif C.Gryphons.selectleft=="Lion" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion")
    elseif C.Gryphons.selectleft=="Lion2" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion2")
    elseif C.Gryphons.selectleft=="Lion3" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion3")
    elseif C.Gryphons.selectleft=="Diablo1" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo1")
    elseif C.Gryphons.selectleft=="Diablo2" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo2")
    elseif C.Gryphons.selectleft=="Diablo3" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo3")
    elseif C.Gryphons.selectleft=="Diablo4" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo4")
    elseif C.Gryphons.selectleft=="Turtle" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\turtle")
    elseif C.Gryphons.selectleft=="Turtle2" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\turtleg")
    elseif C.Gryphons.selectleft=="Gargoyle1" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle1")
    elseif C.Gryphons.selectleft=="Gargoyle2" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle2")
    elseif C.Gryphons.selectleft=="Onyxia" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\onyxia")
    elseif C.Gryphons.selectleft=="GryphonHD3" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD2Left")
    elseif C.Gryphons.selectleft=="GryphonHD4" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD3Left")
    elseif C.Gryphons.selectleft=="GryphonHD5" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD2LeftGold")
    elseif C.Gryphons.selectleft=="GryphonHD6" then current.left = AddLeftGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD3LeftGold") end

    if C.Gryphons.selectright=="Default" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\griffon1")
    elseif C.Gryphons.selectright=="None" then current.right = AddRightGriphon(nil)
    elseif C.Gryphons.selectright=="Skull" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\skull1")
    elseif C.Gryphons.selectright=="Skull2" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\skullg1")
    elseif C.Gryphons.selectright=="Skull3" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\Skull2Right")
    elseif C.Gryphons.selectright=="Leaf" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\LeafRight")
    elseif C.Gryphons.selectright=="Lion" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion1")
    elseif C.Gryphons.selectright=="Lion2" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion22")
    elseif C.Gryphons.selectright=="Lion3" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\lion33")
    elseif C.Gryphons.selectright=="Diablo1" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo11")
    elseif C.Gryphons.selectright=="Diablo2" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo22")
    elseif C.Gryphons.selectright=="Diablo3" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo33")
    elseif C.Gryphons.selectright=="Diablo4" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\diablo44")
    elseif C.Gryphons.selectright=="Turtle" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\turtle1")
    elseif C.Gryphons.selectright=="Turtle2" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\turtleg1")
    elseif C.Gryphons.selectright=="Gargoyle1" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle11")
    elseif C.Gryphons.selectright=="Gargoyle2" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\gargoyle22")
    elseif C.Gryphons.selectright=="Onyxia" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\onyxia1")
    elseif C.Gryphons.selectright=="GryphonHD3" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD2Right")
    elseif C.Gryphons.selectright=="GryphonHD4" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD3Right")
    elseif C.Gryphons.selectright=="GryphonHD5" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD2RightGold")
    elseif C.Gryphons.selectright=="GryphonHD6" then current.right = AddRightGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\GryphonHD3RightGold") end

    if C.Gryphons.selectlefttop=="None" then current.lefttop = AddLeftTopGriphon(nil)
    elseif C.Gryphons.selectlefttop=="Bear" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_bear",true)
    elseif C.Gryphons.selectlefttop=="Cat" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_cat",true)
    elseif C.Gryphons.selectlefttop=="Dead" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_dead",true)
    elseif C.Gryphons.selectlefttop=="Frost" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_frost",true)
    elseif C.Gryphons.selectlefttop=="Metamorph" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_metamorph",true)
    elseif C.Gryphons.selectlefttop=="Fire" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_shaman_fire",true)
    elseif C.Gryphons.selectlefttop=="Storm" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_shaman_storm",true)
    elseif C.Gryphons.selectlefttop=="Holy" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_holy",true)
    elseif C.Gryphons.selectlefttop=="Unholy" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadow_unholy",true)
    elseif C.Gryphons.selectlefttop=="Simple" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadowcombat",true)
    elseif C.Gryphons.selectlefttop=="Water" then current.lefttop = AddLeftTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\leftshadowswim",true) end

    if C.Gryphons.selectrighttop=="None" then current.righttop = AddRightTopGriphon(nil)
    elseif C.Gryphons.selectrighttop=="Bear" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_bear",true)
    elseif C.Gryphons.selectrighttop=="Cat" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_cat",true)
    elseif C.Gryphons.selectrighttop=="Dead" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_dead",true)
    elseif C.Gryphons.selectrighttop=="Frost" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_frost",true)
    elseif C.Gryphons.selectrighttop=="Metamorph" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_metamorph",true)
    elseif C.Gryphons.selectrighttop=="Fire" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_shaman_fire",true)
    elseif C.Gryphons.selectrighttop=="Storm" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_shaman_storm",true)
    elseif C.Gryphons.selectrighttop=="Holy" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_holy",true)
    elseif C.Gryphons.selectrighttop=="Unholy" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadow_unholy",true)
    elseif C.Gryphons.selectrighttop=="Simple" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadowcombat",true)
    elseif C.Gryphons.selectrighttop=="Water" then current.righttop = AddRightTopGriphon("Interface\\AddOns\\pfUI-gryphons\\artwork\\rightshadowswim",true) end
  end

  if pfUI.gui.CreateGUIEntry then
    pfUI.gui.CreateGUIEntry(T["Thirdparty"],T["Gryphons"],function()
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Left Side"],nil,nil,"header")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Select left gryphon"],C.Gryphons,"selectleft","dropdown",pfUI.gui.dropdowns.Gryphons_selectleft)
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Size"],C.Gryphons,"img_size")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Horizontal Offset"],C.Gryphons,"h_off")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Vertical Offset"],C.Gryphons,"v_off")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Pick Color"],C.Gryphons,"left_color","color")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Right side"],nil,nil,"header")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Select right gryphon"],C.Gryphons,"selectright","dropdown",pfUI.gui.dropdowns.Gryphons_selectright)
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Size"],C.Gryphons,"img_size1")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Horizontal Offset"],C.Gryphons,"h_off1")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Vertical Offset"],C.Gryphons,"v_off1")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Pick Color"],C.Gryphons,"right_color","color")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Left side top"],nil,nil,"header")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Select left gryphon"],C.Gryphons,"selectlefttop","dropdown",pfUI.gui.dropdowns.Gryphons_selectlefttop)
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Size"],C.Gryphons,"img_sizelt")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Horizontal Offset"],C.Gryphons,"h_offlt")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Vertical Offset"],C.Gryphons,"v_offlt")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Pick Color"],C.Gryphons,"lefttop_color","color")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Right side top"],nil,nil,"header")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Select right gryphon"],C.Gryphons,"selectrighttop","dropdown",pfUI.gui.dropdowns.Gryphons_selectrighttop)
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Size"],C.Gryphons,"img_sizert")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Horizontal Offset"],C.Gryphons,"h_offrt")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Vertical Offset"],C.Gryphons,"v_offrt")
      pfUI.gui.CreateConfig(pfUI.gui.UpdaterFunctions["Gryphons"],T["Pick Color"],C.Gryphons,"righttop_color","color")
    end)
  else
    pfUI.gui.tabs.thirdparty.tabs.Gryphons = pfUI.gui.tabs.thirdparty.tabs:CreateTabChild("Gryphons", true)
    pfUI.gui.tabs.thirdparty.tabs.Gryphons:SetScript("OnShow", function() if not this.setup then this.setup = true end end)
  end
  pfUI.gui.UpdaterFunctions["Gryphons"]() -- update on load
end)
