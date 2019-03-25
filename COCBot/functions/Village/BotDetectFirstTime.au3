; #FUNCTION# ====================================================================================================================
; Name ..........: BotDetectFirstTime
; Description ...: This script detects your builings on the first run
; Author ........: HungLe (04/2015)
; Modified ......: Hervidero (05/2015), HungLe (05/2015), KnowJack(07/2015), Sardo (08/2015), CodeSlinger69 (01/2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Func BotDetectFirstTime()

	If $g_bIsClientSyncError = True Then Return ; if restart after OOS, and User stop/start bot, skip this.

	ClickP($aAway, 1, 0, "#0166") ; Click away
	If _Sleep($DELAYBOTDETECT1) Then Return
	
	If $g_bChkPlayBBOnly = True And IsOnBuilderBaseEz() Then Return

    SetLog("Detecting your Buildings", $COLOR_INFO)

	If (isInsideDiamond($g_aiTownHallPos) = False) Then
		If $g_bChkPlayBBOnly Then Return
        checkMainScreen()
        Collect(False)
		_CaptureRegion2()
		; USES OLD OPENCV DETECTION
		Local $PixelTHHere = GetLocationItem("getLocationTownHall")
		If UBound($PixelTHHere) > 0 Then
			Local $pixel = $PixelTHHere[0]
			$g_aiTownHallPos[0] = $pixel[0]
			$g_aiTownHallPos[1] = $pixel[1]
			If $g_bDebugSetlog Then SetDebugLog("DLLc# Townhall: (" & $g_aiTownHallPos[0] & "," & $g_aiTownHallPos[1] & ")", $COLOR_ERROR)
		EndIf
		If $g_aiTownHallPos[1] = "" Or $g_aiTownHallPos[1] = -1 Then
			imglocTHSearch(True, True) ; search th on myvillage
			$g_aiTownHallPos[0] = $g_iTHx
			$g_aiTownHallPos[1] = $g_iTHy + 5
			If $g_bDebugSetlog Then SetDebugLog("OldDDL Townhall: (" & $g_aiTownHallPos[0] & "," & $g_aiTownHallPos[1] & ")", $COLOR_ERROR)
		EndIf
		SetLog("Townhall: (" & $g_aiTownHallPos[0] & "," & $g_aiTownHallPos[1] & ")", $COLOR_DEBUG)
	EndIf

	If Number($g_iTownHallLevel) < 2 Then
        Local $aTownHallLevel = GetTownHallLevel(True) ; Get the Users TH level
        If IsArray($aTownHallLevel) Then $g_iTownHallLevel = 0 ; Check for error finding TH level, and reset to zero if yes
	EndIf
	If Number($g_iTownHallLevel) > 1 And Number($g_iTownHallLevel) < 6 Then
		SetLog("Warning: TownHall level below 6 NOT RECOMMENDED!", $COLOR_ERROR)
		SetLog("Proceed with caution as errors may occur.", $COLOR_ERROR)
	EndIf
    If $g_iTownHallLevel < 2 Or ($g_aiTownHallPos[1] = "" Or $g_aiTownHallPos[1] = -1) Then LocateTownHall(False, False)

	If $g_bChkPlayBBOnly Then Return

	If _Sleep($DELAYBOTDETECT1) Then Return
	CheckImageType()
	If _Sleep($DELAYBOTDETECT1) Then Return
	
	If $g_bChkPlayBBOnly Then Return
	
	If GUICtrlRead($g_hChkScreenshotHideName) = $GUI_CHECKED Or $g_bScreenshotHideName Then
		If _Sleep($DELAYBOTDETECT3) Then Return
		If $g_aiClanCastlePos[0] = -1 Then
            LocateClanCastle(False)
			SaveConfig()
		EndIf
	EndIf
	
	If $g_bChkPlayBBOnly Then Return

	If _Sleep($DELAYBOTDETECT3) Then Return
	If $g_aiLaboratoryPos[0] = "" Or $g_aiLaboratoryPos[0] = -1 Then
        LocateLab(False)
		SaveConfig()
	EndIf
	
	If $g_bChkPlayBBOnly Then Return

    If (GUICtrlRead($g_hCmbBoostBarbarianKing) > 0) Or $g_bUpgradeKingEnable Then
		If _Sleep($DELAYBOTDETECT3) Then Return
		If $g_aiKingAltarPos[0] = -1 Then
            LocateKingAltar(False)
			SaveConfig()
		EndIf
	EndIf
	
	If $g_bChkPlayBBOnly Then Return
	
	If (GUICtrlRead($g_hCmbBoostArcherQueen) > 0) Or $g_bUpgradeQueenEnable Then
		If _Sleep($DELAYBOTDETECT3) Then Return
		If $g_aiQueenAltarPos[0] = -1 Then
			LocateQueenAltar(False)
			SaveConfig()
		EndIf
	EndIf
	
	If $g_bChkPlayBBOnly Then Return
	
	If Number($g_iTownHallLevel) > 10 And ((GUICtrlRead($g_hCmbBoostWarden) > 0) Or $g_bUpgradeWardenEnable) Then
		If _Sleep($DELAYBOTDETECT3) Then Return
		If $g_aiWardenAltarPos[0] = -1 Then
			LocateWardenAltar(False)
			SaveConfig()
		EndIf
	EndIf

	;Display Level TH in Stats
	GUICtrlSetData($g_hLblTHLevels, "")
	
	If $g_bChkPlayBBOnly Then Return
	
	_GUI_Value_STATE("HIDE", $g_aGroupListTHLevels)
	If $g_bDebugSetlog Then SetDebugLog("Select TH Level:" & Number($g_iTownHallLevel), $COLOR_DEBUG)
	GUICtrlSetState($g_ahPicTHLevels[$g_iTownHallLevel], $GUI_SHOW)
	GUICtrlSetData($g_hLblTHLevels, $g_iTownHallLevel)
EndFunc   ;==>BotDetectFirstTime
