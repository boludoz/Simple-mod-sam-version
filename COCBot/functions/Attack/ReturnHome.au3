; #FUNCTION# ====================================================================================================================
; Name ..........: ReturnHome
; Description ...: Returns home when in battle, will take screenshot and check for gold/elixir change unless specified not to.
; Syntax ........: ReturnHome([$TakeSS = 1[, $GoldChangeCheck = True]])
; Parameters ....: $TakeSS              - [optional] flag for saving a snapshot of the winning loot. Default is 1.
;                  $GoldChangeCheck     - [optional] an unknown value. Default is True.
; Return values .: None
; Author ........:
; Modified ......: KnowJack (07-2015), MonkeyHunter (01-2016), CodeSlinger69 (01-2017), MonkeyHunter (03-2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func ReturnHome($TakeSS = 1, $GoldChangeCheck = True) ;Return main screen
	If $g_bDebugSetlog Then SetDebugLog("ReturnHome function... (from matchmode=" & $g_iMatchMode & " - " & $g_asModeText[$g_iMatchMode] & ")", $COLOR_DEBUG)
	Local $counter = 0
	Local $hBitmap_Scaled
	Local $i, $j
			
	If $g_bDESideDisableOther And $g_iMatchMode = $LB And $g_aiAttackStdDropSides[$LB] = 4 And $g_bDESideEndEnable And ($g_bDropQueen Or $g_bDropKing) Then
		SaveandDisableEBO()
		SetLog("Disabling Normal End Battle Options", $COLOR_SUCCESS)
	EndIf
	
	; Spawn Event Troops
    Local $iSpecialColor[4][3] = [[0xFFFDFF, 1, 0], [0xFFFDFF, 2, 0], [0xCADEF2, 0, 1], [0xCADEF2, 1, 1]]
    Local $iSpecialPixel
        
    For $clickss = 0 to 300
        $iSpecialPixel = _MultiPixelSearch(23, 632, 834, 658, 1, 1, Hex(0xFFFDFF, 6), $iSpecialColor, 15)
        If $iSpecialPixel = 0 Then ExitLoop
        SetLog("Dropping event troops" & ": " & $iSpecialPixel[0] & "/" &  $iSpecialPixel[1])
        PureClick($iSpecialPixel[0], $iSpecialPixel[1], 1, 10, "#0000")
        AttackClick(608, 168, 1, SetSleep(0), 0, "#0000")
    Next

	If $GoldChangeCheck Then
		If Not (IsReturnHomeBattlePage(True, False)) Then ; if already in return home battle page do not wait and try to activate Hero Ability and close battle
			SetLog("Checking if the battle has finished", $COLOR_INFO)
			While GoldElixirChangeEBO()
				If _Sleep($DELAYRETURNHOME1) Then Return
			WEnd

            ; samm0d
            If $ichkUseSamM0dZap = 1 Then
                If IsAttackPage() Then SamM0dZap()
            Else
                If IsAttackPage() Then smartZap(); Check to see if we should zap the DE Drills
            EndIf

			;If Heroes were not activated: Hero Ability activation before End of Battle to restore health
			If ($g_bCheckKingPower Or $g_bCheckQueenPower Or $g_bCheckWardenPower) Then
				;_CaptureRegion()
				If _ColorCheck(_GetPixelColor($aRtnHomeCheck1[0], $aRtnHomeCheck1[1], True), Hex($aRtnHomeCheck1[2], 6), $aRtnHomeCheck1[3]) = False And _ColorCheck(_GetPixelColor($aRtnHomeCheck2[0], $aRtnHomeCheck2[1], True), Hex($aRtnHomeCheck2[2], 6), $aRtnHomeCheck2[3]) = False Then ; If not already at Return Homescreen
					If $g_bCheckKingPower Then
						SetLog("Activating King's power to restore some health before EndBattle", $COLOR_INFO)
						If IsAttackPage() Then SelectDropTroop($g_iKingSlot) ;If King was not activated: Boost King before EndBattle to restore some health
					EndIf
					If $g_bCheckQueenPower Then
						SetLog("Activating Queen's power to restore some health before EndBattle", $COLOR_INFO)
						If IsAttackPage() Then SelectDropTroop($g_iQueenSlot) ;If Queen was not activated: Boost Queen before EndBattle to restore some health
					EndIf
					If $g_bCheckWardenPower Then
						SetLog("Activating Warden's power to restore some health before EndBattle", $COLOR_INFO)
						If IsAttackPage() Then SelectDropTroop($g_iWardenSlot) ;If Queen was not activated: Boost Queen before EndBattle to restore some health
					EndIf
				EndIf
			EndIf
		Else
			If $g_bDebugSetlog Then SetDebugLog("Battle already over", $COLOR_DEBUG)
		EndIf
	EndIf

	If $g_bDESideDisableOther And $g_iMatchMode = $LB And $g_aiAttackStdDropSides[$LB] = 4 And $g_bDESideEndEnable And ($g_bDropQueen Or $g_bDropKing) Then
		RevertEBO()
	EndIf

	; Reset hero variables
	$g_bCheckKingPower = False
	$g_bCheckQueenPower = False
	$g_bCheckWardenPower = False
	$g_bDropKing = False
	$g_bDropQueen = False
	$g_bDropWarden = False
	$g_aHeroesTimerActivation[$eHeroBarbarianKing] = 0
	$g_aHeroesTimerActivation[$eHeroArcherQueen] = 0
	$g_aHeroesTimerActivation[$eHeroGrandWarden] = 0

	; Reset building info used to attack base
	_ObjDeleteKey($g_oBldgAttackInfo, "") ; Remove all Keys from dictionary

	If $g_abAttackTypeEnable[$TS] = 1 And $g_iMatchMode = $TS Then $g_bFirstStart = True ;reset barracks upon return when TH sniping w/custom army

	SetLog("Returning Home", $COLOR_INFO)
	If $g_bRunState = False Then Return

    TrayTip($g_sBotTitle, "", BitOR($TIP_ICONASTERISK, $TIP_NOSOUND)) ; clear village search match found message

    ; ---- CLICK SURRENDER BUTTON ----
    ; samm0d - waiting for return home button appear
    $i = 0 ; Reset Loop counter
    While IsReturnHomeBattlePage(True, False) = False ; dynamic wait loop for surrender button to appear
        If ReturnHomeMainPage() Then Return
        If IsAttackPage() Then
			If $g_bDebugSetlog Then SetDebugLog("Wait for surrender button to appear #" & $i)
            If _Wait4Pixel($aSurrenderButton[0], $aSurrenderButton[1], $aSurrenderButton[2], $aSurrenderButton[3], 3000) = False Then
                ;SetLog("surrender or end battle button not found.")
                Return
			EndIf
            ClickP($aSurrenderButton, 1, 0, "#0099") ;Click Surrender
            If _Wait4Pixel(470, 410, 0xE0F78B, 40, 3000) = False Then
                ;SetLog("Okay button not found.")
                Return
            EndIf
            Click(Random(487,543,1),Random(415,445,1), 1, 0, "#SurrenderOkay") ;Click Surrender
        EndIf
        $i += 1
        If $i > 25 Then
            CheckAndroidReboot(False)
            Return ; if end battle or surrender button are not found in 5*(200)ms + 10*(200)ms or 3 seconds, then give up.
        EndIf
        If _Sleep($DELAYRETURNHOME5) Then Return
    WEnd

	;If CheckAndroidReboot() Then Return

	If $GoldChangeCheck Then
        ; samm0d
        AttackReport()
        If _Sleep(200) Then Return ; setlog and pause response
    EndIf

	If $TakeSS = 1 And $GoldChangeCheck Then
		SetLog("Taking snapshot of your loot", $COLOR_SUCCESS)
		Local $Date = @YEAR & "-" & @MON & "-" & @MDAY
		Local $Time = @HOUR & "." & @MIN
		_CaptureRegion()
		$hBitmap_Scaled = _GDIPlus_ImageResize($g_hBitmap, _GDIPlus_ImageGetWidth($g_hBitmap) / 2, _GDIPlus_ImageGetHeight($g_hBitmap) / 2) ;resize image
		; screenshot filename according with new options around filenames
		If $g_bScreenshotLootInfo Then
			$g_sLootFileName = $Date & "_" & $Time & " G" & $g_iStatsLastAttack[$eLootGold] & " E" & $g_iStatsLastAttack[$eLootElixir] & " DE" & _
					$g_iStatsLastAttack[$eLootDarkElixir] & " T" & $g_iStatsLastAttack[$eLootTrophy] & " S" & StringFormat("%3s", $g_iSearchCount) & ".jpg"
		Else
			$g_sLootFileName = $Date & "_" & $Time & ".jpg"
		EndIf
		_GDIPlus_ImageSaveToFile($hBitmap_Scaled, $g_sProfileLootsPath & $g_sLootFileName)
		_GDIPlus_ImageDispose($hBitmap_Scaled)
	EndIf

	;push images if requested..
	If $GoldChangeCheck Then PushMsg("LastRaid")

    ; samm0d
    If IsReturnHomeBattlePage(True) Then ClickP($aReturnHomeButton, 1, 0, "#0101") ;Click Return Home Button
;~
;~     $i = 0 ; Reset Loop counter
;~     While 1
;~         If $g_bDebugSetlog Then SetDebugLog("Wait for End Fight Scene to appear #" & $i)
;~         If _CheckPixel($aEndFightSceneAvl, $g_bCapturePixel) Then ; check for the gold ribbon in the end of battle data screen
;~             If IsReturnHomeBattlePage() Then ClickP($aReturnHomeButton, 1, 0, "#0101") ;Click Return Home Button
;~             ExitLoop
;~         Else
;~             $i += 1
;~         EndIf
;~         If $i > 10 Then ExitLoop ; if end battle window is not found in 10*200mms or 2 seconds, then give up.
;~         If _Sleep($DELAYRETURNHOME5) Then Return
;~     WEnd
;~     If _Sleep($DELAYRETURNHOME2) Then Return ; short wait for screen to close

	$counter = 0
	While 1
		If $g_bDebugSetlog Then SetDebugLog("Wait for Star Bonus window to appear #" & $counter)
		If _Sleep($DELAYRETURNHOME4) Then Return
		If StarBonus() Then SetLog("Star Bonus window closed chief!", $COLOR_INFO) ; Check for Star Bonus window to fill treasury (2016-01) update
		$g_bFullArmy = False ; forcing check the army
		$g_bIsFullArmywithHeroesAndSpells = False ; forcing check the army
		If ReturnHomeMainPage() Then Return
		$counter += 1
		If $counter >= 50 Or isProblemAffect(True) Then
			SetLog("Cannot return home.", $COLOR_ERROR)
			checkMainScreen()
			Return
		EndIf
	WEnd
EndFunc   ;==>ReturnHome

Func ReturnHomeMainPage()
	If IsMainPage(1) Then
		SetLogCentered(" BOT LOG ", Default, Default, True)
		Return True
	EndIf
	Return False
EndFunc   ;==>ReturnHomeMainPage

Func ReturnfromDropTrophies()

	If $g_bDebugSetlog Then SetDebugLog(" -- ReturnfromDropTrophies -- ")

	For $i = 0 To 5 ; dynamic wait loop for surrender button to appear (if end battle or surrender button are not found in 5*(200)ms + 10*(200)ms or 3 seconds, then give up.)
		If $g_bDebugSetlog Then SetDebugLog("Wait for surrender button to appear #" & $i)
		ClickP($aSurrenderButton, 1, 0, "#0099") ;Click Surrender
		Local $j = 0
		While 1 ; dynamic wait for Okay button
			If $g_bDebugSetlog Then SetDebugLog("Wait for OK button to appear #" & $j)
			If IsEndBattlePage(True) Then
				ClickOkay("SurrenderOkay") ; Click Okay to Confirm surrender
				ExitLoop 2
			Else
				$j += 1
			EndIf
			If $j > 10 Then ExitLoop ; if Okay button not found in 10*(200)ms or 2 seconds, then give up.
			If _Sleep(100) Then Return
			If _CheckPixel($aSurrenderButton, $g_bCapturePixel) Then ;is surrender button is visible?
				ClickP($aSurrenderButton, 1, 0, "#0099") ;Click Surrender
			EndIf
		WEnd
		If _Sleep(100) Then Return
	Next
	
    ; samm0d
    If IsReturnHomeBattlePage(True) Then ClickP($aReturnHomeButton, 1, 0, "#0101") ;Click Return Home Button

;~	   $i = 0 ; Reset Loop counter
;~	   Local $iExitLoop = -1
;~	While 1
;~		If $g_bDebugSetlog Then SetDebugLog("Wait for End Fight Scene to appear #" & $i)
;~		If _CheckPixel($aEndFightSceneAvl, $g_bCapturePixel) Then ; check for the gold ribbon in the end of battle data screen
;~	           If IsReturnHomeBattlePage(True) Then
;~	               ClickP($aReturnHomeButton, 1, 0, "#0101") ;Click Return Home Button
;~	               ; sometimes 1st click is not closing, so check again
;~	               $iExitLoop = $i
;~	           EndIf
;~		Else
;~			$i += 1
;~		EndIf
;~	       If $i > 25 Or ($iExitLoop > -1 And $i > $iExitLoop) Then ExitLoop ; if end battle window is not found in 25*200mms or 5 seconds, then give up.
;~	       If _Sleep($DELAYRETURNHOME5) Then Return
;~	WEnd
    If _Sleep($DELAYRETURNHOME2) Then Return ; short wait for screen to close
	$g_bFullArmy = False ; forcing check the army
	$g_bIsFullArmywithHeroesAndSpells = False ; forcing check the army
	If ReturnHomeMainPage() Then Return
	checkMainScreen()
EndFunc   ;==>ReturnfromDropTrophies

