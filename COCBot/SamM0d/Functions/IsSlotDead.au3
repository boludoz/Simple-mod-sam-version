; #FUNCTION# ====================================================================================================================
; Name ..........: IsSlotDead
; Description ...: If Is Slot Dead Return True
; Syntax ........: IsSlotDead($iSlotNumber)
; Parameters ....: $iSlotNumber               - an unknown value.
; Return values .: None
; Author ........: Boludoz (8/3/2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: IsSlotDead(1)
; ===============================================================================================================================
Func IsSlotDead($iSlotNumber, $bIndex = False)
	Local $aSlotPosition = ($bIndex) ? (GetSlotPosition($iSlotNumber)) : ($iSlotNumber)
	Local $aSearchOpp[3][3] = [[0x656565, 1, 1], [0x656565, 2, 1], [0x656565, 3, 1]]
	Local $aSearchOpp_2[3][3] = [[0x000000, 1, 0], [0x505050, 0, 1], [0x515151, 1, 1]]
	Local $aSearchOpp_3[3][3] = [[0x5B5B5B, 1, 1], [0x5B5B5B, 2, 1], [0x5B5B5B, 3, 1]]
	
	For $i = 0 To 3 
		If _MultiPixelSearch($aSlotPosition[0] - 25, $aSlotPosition[1] -20 , $aSlotPosition[0], $aSlotPosition[1], -2, 1, Hex(0x000000, 6), $aSearchOpp, 25) <> 0 Then Return True ; Normal Slot
		If _MultiPixelSearch($aSlotPosition[0] - 25, $aSlotPosition[1] -20 , $aSlotPosition[0], $aSlotPosition[1], -2, 1, Hex(0x000000, 6), $aSearchOpp_2, 25) <> 0 Then Return True ; King/Big Slot		
		If _MultiPixelSearch($aSlotPosition[0] - 25, $aSlotPosition[1] -20 , $aSlotPosition[0], $aSlotPosition[1], -2, 1, Hex(0x000000, 6), $aSearchOpp_3, 25) <> 0 Then Return True ; Spell		
		Sleep(10)
	Next
	
	Return False
EndFunc   ;==>IsSlotDead

; ClickPDrop : takes an array[2] (or array[4]) as a parameter [x,y], prevent Click in switch 
Func ClickPDrop($point, $howMuch = 1, $speed = 0, $debugtxt = "")
		Local $iX = Abs(Number($point[0]) - Random(-4, 4, 1)), $iY = Abs(Number($g_iGAME_HEIGHT) - Random(52, 86, 1))
        If $g_bDebugClick Then SetLog("ClickPDrop " & $point[0] & "," & $iY & "," & $howMuch & "," & $speed & " " & $debugtxt, $COLOR_YELLOW, "Verdana", "7.5", 0)
		Click($iX, $iY, $howMuch, $speed, $debugtxt)
EndFunc   ;==>ClickPDrop

Func CheckIfSiegeDroppedTheTroops($hSleepTimer, $iSlotNumber, ByRef $bIsDeadByRef)
	If $bIsDeadByRef = True Then Return True
	
	If IsSlotDead($iSlotNumber) Then
		SetDebugLog("Siege Got Destroyed After " & Round(__TimerDiff($hSleepTimer)) & "ms", $COLOR_SUCCESS)
		$bIsDeadByRef = True
		Return True
	EndIf
	
	Return False
EndFunc   ;==>CheckIfSiegeDroppedTheTroops

Func MoDspell($S)

		If _Sleep(10) Then Return
		If $g_bRestart = True Then Return

		If $g_iTHi <= 15 Or $g_iTHside = 0 Or $g_iTHside = 2 Then
			Switch $g_iTHside
				Case 0
					MoDspellDpl($S, 114 + $g_iTHi * 16 + Ceiling(-2 * 16), 359 - $g_iTHi * 12 + Ceiling(-2 * 12))
				Case 1
					MoDspellDpl($S, 117 + $g_iTHi * 16 + Ceiling(-2 * 16), 268 + $g_iTHi * 12 - Floor(-2 * 12))
				Case 2
					MoDspellDpl($S, 743 - $g_iTHi * 16 - Floor(-2 * 16), 358 - $g_iTHi * 12 + Ceiling(-2 * 12))
				Case 3
					MoDspellDpl($S, 742 - $g_iTHi * 16 - Floor(-2 * 16), 268 + $g_iTHi * 12 - Floor(-2 * 12))
			EndSwitch
		EndIf

		If $g_iTHi > 15 And ($g_iTHside = 1 Or $g_iTHside = 3) Then
			MoDspellDpl($S, $g_iTHx, $g_iTHy)
			Else
			MoDspellDpl($S, $g_iTHx + 313, $g_iTHy)
		EndIf

EndFunc   ;==>MoDspell

Func MoDspellDpl($THSpell, $x, $y)

	Local $Spell = -1
	Local $name = ""

	If _Sleep(10) Then Return
	If $g_bRestart = True Then Return

	For $i = 0 To UBound($g_avAttackTroops) - 1
		If $g_avAttackTroops[$i][0] = $THSpell Then
			$Spell = $i
			$name = GetTroopName($THSpell)
		EndIf
	Next

	If $Spell > -1 Then
		SetLog("Dropping remain Spell " & $name, $COLOR_SUCCESS)
		SelectDropTroop($Spell)
		If _Sleep($DELAYATTCKTHGRID1) Then Return
		If IsAttackPage() Then Click($x, $y, 1, 0, "#0029")
	Else
		If $g_bDebugSetlog Then SetDebugLog("No " & $name & " Found")
	EndIf

EndFunc   ;==>MoDspellDpl

Func resetCloudSearchParms()
	$g_iTotalCloudSearchTime = 0
	$g_iTotalSearchTime = 0
EndFunc   ;==>resetCloudSearchParms
