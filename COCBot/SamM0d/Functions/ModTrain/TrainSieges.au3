; #FUNCTION# ====================================================================================================================
; Name ..........: Train Sieges
; Description ...: 
; Syntax ........: 
; Parameters ....: 
;
; Return values .: None
; Author ........: BOLUDOZ (18/1/2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func TrainSiegesM($iCapacity = 0, $bOpenSiegeArmy = True, $ForceDoubleTrain = False)
Local $aOcrSg[2] = [63, 545]
If Int(GuiCtrlRead($g_hTxtTotalCountSiege)) = 0 Then Return
If $iCapacity[0] = $iCapacity[1] and $ForceDoubleTrain = False Then Return
Setlog("Training SG", $COLOR_YELLOW)
If Not IsArray($iCapacity) Then
	Return
 Else
EndIf

If $bOpenSiegeArmy = True Then Click(604, 132)

Local $iMySiegesSize

	For $i = 0 To UBound($MySieges) - 1
		$iMySiegesSize = Int(GUICtrlRead(Eval("txtNum" & $MySieges[$i][0] & "Siege"))) * $MySieges[$i][2]
		SiegeClick(110 + ($MySieges[$i][1] - 1) * 175,545, $iMySiegesSize)
		;Setlog("- Training " & $iTimes & " " & $MySieges[$i][0] & " Siege/s." , $COLOR_YELLOW)
	Next

EndFunc

Func SiegeClick($x, $y, $iTimes = 0, $iSpeed = 500)
If $iTimes = 0 Then Return
	For $i = 0 To $iTimes -1
		Click(Random($x-50,$x+50), Random($y-50,$y+50))
		If _Sleep(Random(200,$iSpeed)) Then Return
	Next
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: Train Sieges Capacity
; Description ...: 
; Syntax ........: 
; Parameters ....: 
;
; Return values .: None
; Author ........: BOLUDOZ (18/1/2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func CapacitySieges()
	; Get CC Siege Capacities
	Local $aGetSiegeCap
	Local $sSiegeInfo = getArmyCampCap(761, 163, True) ; OCR read Siege built and total
	If $g_bDebugSetlogTrain Then SetLog("OCR $sSiegeInfo = " & $sSiegeInfo, $COLOR_DEBUG)
	Local $aGetSiegeCap = StringSplit($sSiegeInfo, "#", $STR_NOCOUNT) ; split the built Siege number from the total Siege number
	
	If Ubound($aGetSiegeCap) = 2 Then
		If Number($aGetSiegeCap[0]) = 0 then 
			Return 0
		Else
			Return $aGetSiegeCap
		EndIf
	Else
		Return 0
	EndIf
EndFunc