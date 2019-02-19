; #FUNCTION# ====================================================================================================================
; Name ..........: _Wait4Pixel
; Description ...:
; Author ........: Samkie
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; Samkie Method
Func _Wait4Pixel($x, $y, $sColor, $iColorVariation, $iWait = 1000, $sMsglog = Default, $iDelay = 100)
    Local $hTimer = __TimerInit()
    Local $iMaxCount = Int($iWait / $iDelay)
    Local $aTemp[4] = [$x, $y, $sColor, $iColorVariation]
    For $i = 1 To $iMaxCount
        ;ForceCaptureRegion()
        If _CheckPixel($aTemp, $g_bCapturePixel, Default, $sMsglog) Then Return True
        If _Sleep($iDelay) Then Return False
        If __TimerDiff($hTimer) >= $iWait Then ExitLoop
    Next
    Return False
EndFunc   ;==>_Wait4Pixel

; Samkie Method
Func _Wait4PixelGone($x, $y, $sColor, $iColorVariation, $iWait = 1000, $sMsglog = Default, $iDelay = 100)
    Local $hTimer = __TimerInit()
    Local $iMaxCount = Int($iWait / $iDelay)
    Local $aTemp[4] = [$x, $y, $sColor, $iColorVariation]
    For $i = 1 To $iMaxCount
        ;ForceCaptureRegion()
        If Not _CheckPixel($aTemp, $g_bCapturePixel, Default, $sMsglog) Then Return True
        If _Sleep($iDelay) Then Return False
        If __TimerDiff($hTimer) >= $iWait Then ExitLoop
    Next
    Return False
EndFunc   ;==>_Wait4PixelGone

; Samkie Method
Func _CheckColorPixel($x, $y, $sColor, $iColorVariation, $bFCapture = True, $sMsglog = Default)
	Local $hPixelColor = _GetPixelColor($x, $y, $bFCapture)
	Local $bFound = _ColorCheck($hPixelColor, Hex($sColor,6), Int($iColorVariation))
	Local $COLORMSG =($bFound = True ? $COLOR_BLUE : $COLOR_RED)
	
	If $sMsglog <> Default And IsString($sMsglog) And $g_bDebugSetlog Then
		Local $String = $sMsglog & " - Ori Color: " & Hex($sColor,6) & " at X,Y: " & $x & "," & $y & " Found: " & $hPixelColor
		SetLog($String, $COLORMSG)
	EndIf
	
	Return $bFound
EndFunc
