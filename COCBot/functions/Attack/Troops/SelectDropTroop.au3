
; #FUNCTION# ====================================================================================================================
; Name ..........: SelectDropTroop
; Description ...:
; Syntax ........: SelectDropTroop($iTroopIndex)
; Parameters ....: $iTroopIndex : Index of any Troop from Barbarian to Siege Machines
; Return values .: None
; Author ........:
; Modified ......: Fliegerfaust (12/2018) / CUSTOM SIMPLE MOD (BLD)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func SelectDropTroop($iSlotIndex, $iClicks = 1, $iDelay = 0, $bCheckAttackPage = True)
	If $bCheckAttackPage = False Then 
		ClickP(GetSlotPosition($iSlotIndex), $iClicks, $iDelay, "#0111")
	Else
		If IsAttackPage() = True Then ClickP(GetSlotPosition($iSlotIndex), $iClicks, $iDelay, "#0111")
	EndIf
EndFunc   ;==>SelectDropTroop

Func GetSlotPosition($iSlotIndex, $bOCRPosition = False)
	Local $aiReturnPosition[2] = [0, 0]

	If $iSlotIndex < 0 Or $iSlotIndex + 1 > UBound($g_avAttackTroops, 1) Then Return $aiReturnPosition ;Invalid Slot Index returns Click Position X: 0 And Y:0

	If $bOCRPosition = False Then
		$aiReturnPosition[0] = $g_avAttackTroops[$iSlotIndex][2]
		$aiReturnPosition[1] = $g_avAttackTroops[$iSlotIndex][3]
	Else
		$aiReturnPosition[0] = $g_avAttackTroops[$iSlotIndex][4]
		$aiReturnPosition[1] = $g_avAttackTroops[$iSlotIndex][5]
	EndIf
	Return $aiReturnPosition
EndFunc   ;==>GetSlotPosition