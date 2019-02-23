; #FUNCTION# ====================================================================================================================
; Name ..........: BuilderBaseMain.au3
; Description ...: Builder Base Main Loop
; Syntax ........: runBuilderBase()
; Parameters ....:
; Return values .: None
; Author ........: ProMac (03-2018)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as Mybot and ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func TestrunBuilderBase()
	SetDebugLog("** TestrunBuilderBase START**", $COLOR_DEBUG)
	Local $Status = $g_bRunState
	$g_bRunState = True
	runBuilderBase(False)
	$g_bRunState = $Status
	SetDebugLog("** TestrunBuilderBase END**", $COLOR_DEBUG)
EndFunc   ;==>TestrunBuilderBase

Func runBuilderBase($Test = False)

	If Not $g_bRunState Then Return

	ClickP($aAway, 3, 400, "#0000") ;Click Away

	; Check IF is Necessary run the Builder Base IDLE loop

	If Not $g_bChkBuilderAttack And Not $g_bChkCollectBuilderBase And Not $g_bChkStartClockTowerBoost And Not $g_iChkBBSuggestedUpgrades And Not $g_bChkCleanBBYard Then
	#cs
	If $g_bChkPlayBBOnly Then
			SetLog("Play Only Builder Base Check Is On But BB Option's(Collect,Attack etc) Unchecked", $COLOR_ERROR)
			SetLog("Please Check BB Options From Builder Base Tab", $COLOR_INFO)
			$g_bRunState = False ;Stop The Bot
			btnStop()
		EndIf
	#ce
		Return
	EndIf

	If Not isOnBuilderBase() Then SwitchBetweenBases()

	SetLog("Builder Base Idle Starts", $COLOR_INFO)

	If _Sleep(2000) Then Return

	If $g_bRestart = True Then Return
	; If checkObstacles() Then SetLog("Window clean required, but no problem for MyBot!", $COLOR_INFO)

	; Collect resources
	If ($g_iCmbBoostBarracks = 0 Or $g_bFirstStart) Then CollectBuilderBase()
	If $g_bRestart = True Then Return

	; Builder base Report - Get The number of available attacks
	BuilderBaseReport()
	If $g_bRestart = True Then Return

	; Upgrade Troops
	If $g_bRestart = True Then Return
	If ($g_iCmbBoostBarracks = 0 Or $g_bFirstStart) Then BuilderBaseUpgradeTroops()
	Local $boosted = False
	; Fill/check Army Camps only If is necessary attack
	If $g_bRestart = True Then Return
	If $g_iAvailableAttacksBB > 0 Or Not $g_bChkBBStopAt3 Then CheckArmyBuilderBase()
	; Just a loop to benefit from Clock Tower Boost
	For $i = 0 To 10
		; Zoomout
		If $g_bRestart = True Then Return
		If Not $g_bRunState Then Return

		If Not BuilderBaseZoomOut() Then Return

		If checkObstacles(True) Then
			SetLog("Window clean required, but no problem for MyBot!", $COLOR_INFO)
			ExitLoop
		EndIf

		; Attack
		If $g_bRestart = True Then Return
		If Not $g_bRunState Then Return

		BuilderBaseAttack($Test)
		If Not $g_bRunState Then Return

		; Zoomout
		If $g_bRestart = True Then Return
		If Not BuilderBaseZoomOut() Then Return
		If Not $g_bRunState Then Return


		; Clock Tower Boost
		If $g_bRestart = True Then Return
		If Not $g_bRunState Then Return

		If Not $boosted Then $boosted = StartClockTowerBoost()
		; Get Benfit of Boost and clean all yard
		If $g_bRestart = True Then Return

		CleanYardBB()
		; BH Walls Upgrade
		If $g_bRestart = True Then Return
		If Not $g_bRunState Then Return
		WallsUpgradeBB()

		; Auto Upgrade just when you don't need more defenses to win battles
		If $g_bRestart = True Then Return
		If ($g_iCmbBoostBarracks = 0 Or $g_bFirstStart) And $g_iAvailableAttacksBB = 0 Then SuggestedUpgradeBuildings()

		If Not $boosted Then ExitLoop
		If $boosted Then
			If $g_bRestart = True Then Return
			If $g_iAvailableAttacksBB = 0 And $g_bChkBBStopAt3 Then ExitLoop
		EndIf
		If $g_bRestart = True Then Return
		If Not $g_bRunState Then Return

		BuilderBaseReport()
	Next

;	If Not $g_bChkPlayBBOnly Then
		; switch back to normal village
		If isOnBuilderBase() Then SwitchBetweenBases()
;	EndIf

	_Sleep($DELAYRUNBOT3)

	SetLog("Builder Base Idle Ends", $COLOR_INFO)

	If ProfileSwitchAccountEnabled() Then Return

;	If $g_bChkPlayBBOnly Then _Sleep($DELAYRUNBOT1 * 15) ;Add 15 Sec Delay Before Starting Again In BB Only
EndFunc   ;==>runBuilderBase


Func NewImageDetection()

	Local $Status = $g_bRunState
	$g_bRunState = True

	SetLog("FirstTestNewImageDetection STARTS", $COLOR_DEBUG)


	Local $AllResults[0][3]
	Local $hStarttime = _Timer_Init()

	Local $a_Array = _ImageSearchXMLBoludoz($g_sImgCollectRessourcesBB, $g_aXMLToForceAreaParms[0], $g_aXMLToForceAreaParms[1], $g_aXMLToForceAreaParms[2], $g_bDebugBBattack)

	; Example to PNG
	;
	; Local $PNGPath = @ScriptDir & "\imgxml\BuildersBase\Bundles\CollectElixir_1_75_15.png"
	;
	; DllCallMyBot("MyBotSearchPNG", "handle", $g_hHBitmap2, "str", $PNGPath, "Int", $Quantity2Match, "str", $Area2Search, "bool", False, "bool", $g_bDebugBBattack)


	$g_bRunState = $Status

	SetLog("FirstTestNewImageDetection ENDS", $COLOR_DEBUG)
EndFunc   ;==>NewImageDetection
