; #FUNCTION# ====================================================================================================================
; Name ..........: OCRbypass / Auto Update camps v.0.7m $Exclusive edition | Sam0d $ (#ID135-)
; Description ...: ByPass camps. capacity auto update
; Author ........: Boludoz (25/6/2018)
; Modified ......: Boludoz (1/7/2018) / (3/8/2018)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: getArmyCapacityOnTrainTroops(48, 160), _getArmyCapacityOnTrainTroops(48, 160)
; ===============================================================================================================================

Func _getArmyCapacityOnTrainTroops($x_start, $y_start) ;  -> Gets quantity of troops in army Window

    Local $aTempResult[3] = [0, 0, 0]
	Local $aResult[3] = [0, 0, 0]
	$aResult[0] = getOcrAndCapture("coc-NewCapacity", $x_start, $y_start, 67, 14, True)

	Local $dbg = 0
    If $dbg = 1 Then Setlog("DBG ON GET ARMY")

	If StringInStr($aResult[0], "#") Then
		Local $aTempResult = StringSplit($aResult[0], "#", $STR_NOCOUNT)
		$aResult[1] = Number($aTempResult[0])
		$aResult[2] = Number($aTempResult[1])
		$aResult[2] = $aResult[2] / 2
			; Spell
			If $aResult[2] <= 11 Then
				GUICtrlSetData($g_hTxtTotalCountSpell, $aResult[2])
				$g_iTotalSpellValue = $aResult[2]
				; Army
				ElseIf $aResult[2] >= 15 Then
				GUICtrlSetData($g_hTxtTotalCampForced, $aResult[2])
				$g_iTotalCampForcedValue = $aResult[2]

				If $dbg = 1 Then Setlog($aResult[0])
				If $dbg = 1 Then Setlog($g_iTotalSpellValue)
				If $dbg = 1 Then Setlog($g_iTotalCampForcedValue)

				UpdateTroopSize()
			EndIf
	Else
		SetLog("DEBUG | ERROR on GetCurrentArmy", $COLOR_ERROR)
	EndIf

	Return $aResult[0]
EndFunc   ;==>_getArmyCapacityOnTrainTroops

Func UpdSam($aInput)
	Local $dbg = 0
    If $dbg = 1 Then Setlog("DBG ON GET ARMY")
	
    Local $aTempResult[4] = [0, 0, 0]
	Local $iResult
	If StringInStr($aInput, "#") Then
		Local $aTempResult = StringSplit($aInput, "#", $STR_NOCOUNT)
		If Not isArray($aTempResult) then Return
		$iResult = Number($aTempResult[1])

			; Spell
			If $iResult <= 11 Then
				GUICtrlSetData($g_hTxtTotalCountSpell, $iResult)
				$g_iTotalSpellValue = $iResult
				$g_iMySpellsSize = $iResult
				GUICtrlSetData($txtTotalCountSpell2, $g_iTotalSpellValue)

				; Army
				ElseIf $iResult >= 15 Then
				GUICtrlSetData($g_hTxtTotalCampForced, $iResult)
				$g_iTotalCampForcedValue = $iResult

				If $dbg = 1 Then Setlog($iResult)
				If $dbg = 1 Then Setlog($g_iTotalSpellValue)
				If $dbg = 1 Then Setlog($g_iTotalCampForcedValue)
				UpdateTroopSize()
			EndIf
	Else
		SetLog("DEBUG | ERROR on GetCurrentArmy", $COLOR_ERROR)
	EndIf
EndFunc

; INFO ! ======================
	;		; full & forced Total Camp values
	;		$g_iTrainArmyFullTroopPct = Int(GUICtrlRead($g_hTxtFullTroop))
	;		$g_bTotalCampForced = (GUICtrlRead($g_hChkTotalCampForced) = $GUI_CHECKED)
	;		$g_iTotalCampForcedValue = Int(GUICtrlRead($g_hTxtTotalCampForced))
	;		; spell capacity and forced flag
	;		$g_iTotalSpellValue = GUICtrlRead($g_hTxtTotalCountSpell)
	;		$g_bForceBrewSpells = (GUICtrlRead($g_hChkForceBrewBeforeAttack) = $GUI_CHECKED)
; ============