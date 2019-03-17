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
Func IsSlotDead($iSlotNumber)
	Local $aSlotPosition = GetSlotPosition($iSlotNumber)
	Local $aSearchOpp[3][3] = [[0x000000, 1, 0], [0x4A4A4A, 0, 1], [0x4A4A4A, 1, 1]]
	Local $aSearchOpp_2[3][3] = [[0x000000, 1, 0], [0x505050, 0, 1], [0x515151, 1, 1]]
	
	For $i = 0 To 1 
		If _MultiPixelSearch($aSlotPosition[0] - 25, $aSlotPosition[1] -20 , $aSlotPosition[0], $aSlotPosition[1], -2, 1, Hex(0x000000, 6), $aSearchOpp, 25) = 0 Then Return True ; Normal Slot
		Sleep(50)
		If _MultiPixelSearch($aSlotPosition[0] - 25, $aSlotPosition[1] -20 , $aSlotPosition[0], $aSlotPosition[1], -2, 1, Hex(0x000000, 6), $aSearchOpp_2, 25) = 0 Then Return True ; King/Big Slot
	Next
	
	Return False
EndFunc   ;==>IsSlotDead

Func CheckIfSiegeDroppedTheTroops(ByRef $bIsDeadByRef, $command, $hSleepTimer, $iSlotNumber)
	If $bIsDeadByRef = True Then Return True
	If $command = "WFSTD" Then
		If IsSlotDead($iSlotNumber) Then
			SetDebugLog("Siege Got Destroyed After " & Round(__TimerDiff($hSleepTimer)) & "ms", $COLOR_SUCCESS)
			$bIsDeadByRef = True
			Return True
		EndIf
	EndIf
	Return False
EndFunc   ;==>CheckIfSiegeDroppedTheTroops
