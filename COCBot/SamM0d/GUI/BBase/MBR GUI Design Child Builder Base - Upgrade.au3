; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "Train Army" tab under the "Builder Base" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Fahid.Mahmood (2018)
; Remarks .......: This file is part of MultiBot, previously known as Mybot and ClashGameBot. Copyright 2015-2018
;                  MultiBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
#include-once

;Global $g_hChkPlacingNewBuildings = 0, $g_hChkBBSuggestedUpgrades = 0, $g_hChkBBSuggestedUpgradesIgnoreGold = 0, $g_hChkBBSuggestedUpgradesIgnoreElixir, $g_hChkBBSuggestedUpgradesIgnoreHall = 0
Global $g_hChkUpgradeTroops = 0, $g_hChkUpgradeMachine = 0
Global $g_hDebugBBattack = 0, $g_hLblBBNextUpgrade = 0, $g_hCmbBBLaboratory = 0, $g_hPicBBLabUpgrade = ""
Global $g_hChkBBUpgradeWalls = 0, $g_hLblBBWallLevelInfo = 0, $g_hLblBBWallNumberInfo = 0, $g_hCmbBBWallLevel = 0, $g_hPicBBWallUpgrade = "", $g_hTxtBBWallNumber = 0

Global $g_sTxtSLNames = GetTranslatedFileIni("MBR Global GUI Design", "Any", "Any") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtRagedBarbarian", "Raged Barbarian") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtSneakyArcher", "Sneaky Archer") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtBoxerGiant", "Boxer Giant") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtBetaMinion", "Beta Minion") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtBomber", "Bomber") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtBabyDragon", "Baby Dragon") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtCannonCart", "Cannon Cart") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtNightWitch", "Night Witch") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtDropShip", "Drop Ship") & "|" & _
				   GetTranslatedFileIni("MBR Global GUI Design Names Builderbase Troops", "TxtSuperPekka", "Super Pekka")

Func CreateUpgradeBuilderBaseSubTab()
	Local $x = 15, $y = 45
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "Group_01", "Buildings Upgrades"), $x - 10, $y - 20, $g_iSizeWGrpTab2, 95)

		; _GUICtrlCreatePic($g_sIcnMBisland, $x , $y , 64, 64)
		_GUICtrlCreateIcon($g_sLibBBIconPath, $eIcnBB, $x , $y + 5, 48, 48)
		$g_hChkBBSuggestedUpgrades = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkBBSuggestedUpgrades", "Suggested Upgrades"), $x + 70, $y + 20, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgrades")
		$g_hChkBBSuggestedUpgradesIgnoreGold = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkBBSuggestedUpgradesIgnore_01", "Ignore Gold values"), $x + 200, $y - 5, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesGold")
		$g_hChkBBSuggestedUpgradesIgnoreElixir = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkBBSuggestedUpgradesIgnore_02", "Ignore Elixir values"), $x + 200, $y + 20, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesElixir")
		$g_hChkBBSuggestedUpgradesIgnoreHall = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkBBSuggestedUpgradesIgnore_03", "Ignore Builder Hall"), $x + 315, $y - 5, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesGold")
		$g_hChkPlacingNewBuildings = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkPlacingNewBuildings", "Build 'New' tagged buildings"), $x + 200, $y + 47, -1, -1)
			GUICtrlSetOnEvent(-1, "chkPlacingNewBuildings")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 15
	$y = 45 + 100
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "Group_02", "Troops Upgrade"), $x - 10, $y - 20, $g_iSizeWGrpTab2, 130)
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnStarLaboratory, $x , $y - 3, 48, 48)
		_GUICtrlCreateIcon($g_sLibBBIconPath, $eIcnMachine, $x , $y + 50, 48, 48)
		$g_hChkAutoStarLabUpgrades = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Upgrade_Laboratory", "ChkAutoStarLabUpgrades", "Auto Star Laboratory Upgrades"), $x + 80, $y + 5, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Upgrade_Laboratory", "ChkAutoStarLabUpgrades_Info_01", "Check box to enable automatically starting Upgrades in star laboratory"))
			GUICtrlSetOnEvent(-1, "chkStarLab")
		$g_hLblNextSLUpgrade  = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "hLblBBNextUpgrade", "Next one") & ":", $x + 80, $y + 38, 50, -1)
			GUICtrlSetState(--1, $GUI_DISABLE)
		$g_hCmbStarLaboratory = GUICtrlCreateCombo("", $x + 135, $y + 35, 100, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL, $WS_VSCROLL))
			GUICtrlSetData(-1, $g_sTxtSLNames, GetTranslatedFileIni("MBR Global GUI Design", "Any", "Any"))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "CmbBBLaboratory_Info_01", "Select the troop type to upgrade with this pull down menu") & @CRLF & _
							   GetTranslatedFileIni("MMBR GUI Design Child Builder Base - Upgrade", "CmbBBLaboratory_Info_02", "The troop icon will appear on the right."))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbStarLab")
		; Red button, will show on upgrade in progress. Temp unhide here and in Func ChkLab() if GUI needs editing.
		$g_hBtnResetStarLabUpgradeTime = GUICtrlCreateButton("", $x + 120 + 172, $y + 36, 18, 18, BitOR($BS_PUSHLIKE,$BS_DEFPUSHBUTTON))
			GUICtrlSetBkColor(-1, $COLOR_ERROR)
			;_GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnRedLight)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Upgrade_Laboratory", "BtnResetLabUpgradeTime_Info_01", "Visible Red button means that laboratory upgrade in process") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Village - Upgrade_Laboratory", "BtnResetLabUpgradeTime_Info_02", "This will automatically disappear when near time for upgrade to be completed.") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Village - Upgrade_Laboratory", "BtnResetLabUpgradeTime_Info_03", "If upgrade has been manually finished with gems before normal end time,") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Village - Upgrade_Laboratory", "BtnResetLabUpgradeTime_Info_04", "Click red button to reset internal upgrade timer BEFORE STARTING NEW UPGRADE") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Village - Upgrade_Laboratory", "BtnResetLabUpgradeTime_Info_05", "Caution - Unnecessary timer reset will force constant checks for lab status"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetState(-1, $GUI_HIDE) ; comment this line out to edit GUI
			GUICtrlSetOnEvent(-1, "ResetStarLabUpgradeTime")
		$g_hPicStarLabUpgrade = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, $x + 330, $y, 64, 64)
			GUICtrlSetState(-1, $GUI_HIDE)

	;	$g_hChkUpgradeMachine = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkUpgradeMachine", "Upgrades Machine"), $x + 70, $y + 68, -1, -1)
	;		_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkUpgradeMachine_Info_01", "Prioritize the Machine upgrades if 'Any' was selected."))
    ;
		$g_hPicBBLabUpgrade = _GUICtrlCreateIcon($g_sLibBBIconPath, 11, $x + 330, $y, 64, 64)
			GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	#cs
	$x = 15
	$y = 45 + 100 + 135
	
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "Group_03", "Upgrade Walls"), $x - 10, $y - 20, $g_iSizeWGrpTab2, 130)
		_GUICtrlCreateIcon($g_sLibBBIconPath, $eIcnBBWallInfo, $x , $y + 20, 48, 48)
		$g_hChkBBUpgradeWalls = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "ChkBBUpgradeWalls", "Upgrade Walls"), $x + 70, $y + 10, -1, -1)
			GUICtrlSetOnEvent(-1, "ChkBBWalls")
		$g_hLblBBWallLevelInfo = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "hLblBBWallLevelInfo", "Wall Level") & ":", $x + 80, $y + 38, 60, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hCmbBBWallLevel = GUICtrlCreateCombo("", $x + 135, $y + 35, 100, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL, $WS_VSCROLL))
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8", GetTranslatedFileIni("MBR Global GUI Design", "Level1", "1"))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "CmbBBWallLevel_Info_01", "Select the wall level to upgrade with this pull down menu") & @CRLF & _
							   GetTranslatedFileIni("MMBR GUI Design Child Builder Base - Upgrade", "CmbBBWallLevel_Info_02", "The wall icon will appear below."))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbBBWall")
		$g_hLblBBWallNumberInfo = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Upgrade", "hLblBBWallNumberInfo", "Nº") & ":", $x + 320, $y + 68, 20, -1)
			GUICtrlSetState(-1, $GUI_HIDE)
		$g_hTxtBBWallNumber = GUICtrlCreateInput("0", $x + 350, $y + 68, 40, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetState(-1, $GUI_HIDE)

		$g_hPicBBWallUpgrade = _GUICtrlCreateIcon($g_sLibBBIconPath, 11, $x + 330, $y, 64, 64)
			GUICtrlSetState(-1, $GUI_HIDE)
			
	GUICtrlCreateGroup("", -99, -99, 1, 1)
#ce

EndFunc   ;==>CreateMiscBuilderBaseSubTab