
; #FUNCTION# ====================================================================================================================
; Name ..........: SelectDropTroop
; Description ...:
; Syntax ........: SelectDropTroop($iTroopIndex)
; Parameters ....: $iTroopIndex : Index of any Troop from Barbarian to Siege Machines
; Return values .: None
; Author ........:
; Modified ......: Fliegerfaust (12/2018) / CUSTOM SIMPLE MOD (BLD)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func SelectDropTroop($iSlotIndex, $iClicks = 1, $iDelay = 0, $bCheckAttackPage = True)
	# Samm0d - DROP PLUS / START
	Local $aSlotPos = GetSlotPosition($iSlotIndex)
	If BitOr(BitAND(IsAttackPage() = True, IsSlotDead($aSlotPos, True) = False), (not $bCheckAttackPage)) Then (ClickPDrop($aSlotPos, $iClicks, $iDelay, "#0111"))
	# Samm0d - DROP PLUS / END
EndFunc   ;==>SelectDropTroop

;Samm0d
Func GetSlotPosition($iSlotIndex, $bOCRPosition = False)
	Local $aiReturnPosition[2] = [0, 0]

    If $iSlotIndex < 0 Or $iSlotIndex > UBound($g_avAttackTroops, 1) - 1 Then 
        SetDebugLog("GetSlotPosition(" & $iSlotIndex & ", " & $bOCRPosition & "): Invalid slot index: " & $iSlotIndex)
        Return $aiReturnPosition ;Invalid Slot Index returns Click Position X: 0 And Y:0
    EndIf 

	If $bOCRPosition = False Then
		$aiReturnPosition[0] = $g_avAttackTroops[$iSlotIndex][2]
		$aiReturnPosition[1] = $g_avAttackTroops[$iSlotIndex][3]
	Else
		$aiReturnPosition[0] = $g_avAttackTroops[$iSlotIndex][4]
		$aiReturnPosition[1] = $g_avAttackTroops[$iSlotIndex][5]
	EndIf
	Return $aiReturnPosition
EndFunc   ;==>GetSlotPosition
