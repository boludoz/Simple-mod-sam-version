; #FUNCTION# ====================================================================================================================
; Name ..........: Chatbot Text read (#-23)
; Description ...: This file is all related to READ CHAT IA (Fast) | Samkie based
; Syntax ........:
; Parameters ....: ReadChat()
; Return values .: Last msg
; Author ........: Boludoz/Boldina
; Modified ......: Boludoz (5/7/2018|17/7/2018|5/3/2019)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: ReadChat()
; ===============================================================================================================================

Func ReadChatIA(ByRef $sOCRString, ByRef $sCondition, $bFast = True, $bMyChat = False)
	Local $g_iChatDebug = 0
	Local $aButtonClanWindowOpen[9]   	    = [  8, 355,  28, 410,  16, 400, 0xC55115, 20, "=-= Open Chat Window"] ; main page, clan chat Button
	Local $aButtonClanWindowClose[9]  	    = [321, 355, 342, 410, 330, 400, 0xC55115, 20, "=-= Close Chat Window"] ; main page, clan chat Button
	Local $aButtonClanChatTab[9]    	  	    = [175,  14, 275,  30, 280,  30, 0x706C50, 20, "=-= Switch to Clan Channel"] ; Chat page, ClanChat Tab
	Local $aButtonClanDonateScrollUp[9] 	    = [290, 100, 300, 112, 295, 100, 0xFFFFFF, 10, "=-= Donate Scroll Up"] ; Donate / Chat Page, Scroll up Button
	Local $aButtonClanDonateScrollDown[9] 	= [290, 650, 300, 662, 295, 655, 0xFFFFFF, 10, "=-= Donate Scroll Down"] ; Donate / Chat Page, Scroll Down Button

	Local $bResult = True


		$bResult = False
		ForceCaptureRegion()
		_CaptureRegion2(260,85,272,624)
		Local $aLastResult[1][2]
		Local $sDirectory = $g_sSamM0dImageLocation & "\Chat\"
		Local $returnProps="objectpoints"
		Local $aCoor
		Local $aPropsValues
		Local $aCoorXY
		Local $result
		Local $sReturn = ""

		Local $iMax = 0
		Local $jMax = 0
		Local $i, $j, $k

		Local $hHBitmapDivider = GetHHBitmapArea($g_hHBitmap2,0,0,10,539)

		Local $result = findMultiImage($hHBitmapDivider, $sDirectory ,"FV" ,"FV", 0, 0, 0 , $returnProps)
		If $hHBitmapDivider <> 0 Then GdiDeleteHBitmap($hHBitmapDivider)

		Local $iCount = 0

			If Not IsArray($result) Then Return False

			$iMax = UBound($result) -1
			For $i = 0 To $iMax
				$aPropsValues = $result[$i] ; should be return objectname,objectpoints,objectlevel
				If UBound($aPropsValues) = 1 then
					;~ If $g_iSamM0dDebug = 1 Then SetLog("$aPropsValues[0]: " & $aPropsValues[0], $COLOR_DEBUG)
					$aCoor = StringSplit($aPropsValues[0],"|",$STR_NOCOUNT) ; objectpoints, split by "|" to get multi coor x,y ; same image maybe can detect at different location.
					If IsArray($aCoor) Then
						For $j =  0 to UBound($aCoor) - 1
							$aCoorXY = StringSplit($aCoor[$j],",",$STR_NOCOUNT)
							ReDim $aLastResult[$iCount + 1][2]
							$aLastResult[$iCount][0] = Int($aCoorXY[0])
							$aLastResult[$iCount][1] = Int($aCoorXY[1]) + 82
							$iCount += 1
						Next
					EndIf
				EndIf
			Next
			If $iCount < 1 Then Return False
			_ArraySort($aLastResult, 1, 0, 0, 1) ; rearrange order by coor Y
			$iMax = UBound($aLastResult) -1
			_ArrayDisplay($g_aIAVar)
; ----
			Local $aIAVarTmp = $g_aIAVar
			_ArraySort($aIAVarTmp, 0, 0, 0, 1)
			_CaptureRegion2(0,0,287,732)
			For $i = 0 To $iMax
						$sOCRString = ""
						For $ii = 0 To UBound($aIAVarTmp) -1
						If _Sleep($DELAYDONATECC2) Then ExitLoop
							Switch $ii
								Case 0
									$sOCRString = getChatStringMod(30, $aLastResult[$i][1] + 43, "coc-latinA")
									SetDebugLog("getChatStringMod Latin : " & $sOCRString)
											If StringStripWS($sOCRString, $STR_STRIPALL) <> "" Then
											$g_aIAVar[0] += 1
											ExitLoop 1
										EndIf
								Case 1
									$sOCRString = getChatStringMod(30, $aLastResult[$i][1] + 43, "coc-latin-cyr")
									SetDebugLog("getChatStringMod Cyc : " & $sOCRString)
											If StringStripWS($sOCRString, $STR_STRIPALL) <> "" Then
											$g_aIAVar[1] += 1
											ExitLoop 1
										EndIf
								Case 2
									$sOCRString = getChatStringChineseMod(30, $aLastResult[$i][1] + 43)
									SetDebugLog("getChatStringChineseMod : " & $sOCRString)
											If StringStripWS($sOCRString, $STR_STRIPALL) <> "" Then
											$g_aIAVar[2] += 1
											ExitLoop 1
										EndIf
								Case 3
									$sOCRString = getChatStringKoreanMod(30, $aLastResult[$i][1] + 43)
									SetDebugLog("getChatStringKoreanMod : " & $sOCRString)
											If StringStripWS($sOCRString, $STR_STRIPALL) <> "" Then
											$g_aIAVar[3] += 1
											ExitLoop 1
										EndIf
								Case 4
									$sOCRString = getChatStringPersianMod(30, $aLastResult[$i][1] + 43)
									SetDebugLog("getChatStringPersianMod : " & $sOCRString)
											If StringStripWS($sOCRString, $STR_STRIPALL) <> "" Then
											$g_aIAVar[4] += 1
											ExitLoop 1
										EndIf
							EndSwitch
						Next
				If $sOCRString = "" Or $sOCRString = " " Then
					SetLog("Unable to read Chat!", $COLOR_ERROR)
				Else
					SetLog("Chat : " & $sOCRString, $COLOR_INFO)
					Local $asFCKeyword = StringSplit($sCondition, @CRLF, $STR_ENTIRESPLIT)
					For $j = 1 To UBound($asFCKeyword) - 1
						If StringInStr($sOCRString, $asFCKeyword[$j], 2) Then
							Setlog("Chat : " & $asFCKeyword[$j], $COLOR_SUCCESS)
							$bResult = True
							If $bFast = True Then Return $bResult
						EndIf
					Next
				EndIf
			Next
	Return $bResult
EndFunc

Func getChatStringMod($x_start, $y_start, $language) ; -> Get string chat request - Latin Alphabetic - EN "DonateCC.au3"
	Local $sReturn = ""
		If getOcrAndCapture($language, $x_start, $y_start, 280, 16) <> "" Then
		$sReturn &= $g_sGetOcrMod
			For $i = 1 To 4
				If getOcrAndCapture($language, $x_start, $y_start + ($i*13), 280, 16) <> "" Then
					$sReturn &= " "
					$sReturn &= $g_sGetOcrMod
				Else
				ExitLoop
				EndIf
			Next
		EndIf
	Return $sReturn
EndFunc   ;==>getChatString

Func getChatStringChineseMod($x_start, $y_start) ; -> Get string chat request - Chinese - "DonateCC.au3"
	Local $sReturn = ""
	Local $bUseOcrImgLoc = True

		If getOcrAndCapture("chinese-bundle", $x_start, $y_start, 160, 14, Default, $bUseOcrImgLoc) <> "" Then
		$sReturn &= $g_sGetOcrMod
			For $i = 1 To 4
				If getOcrAndCapture("chinese-bundle", $x_start, $y_start + ($i*13), 160, 14, Default, $bUseOcrImgLoc) <> "" Then
					$sReturn &= " "
					$sReturn &= $g_sGetOcrMod
				Else
				ExitLoop
				EndIf
			Next
		EndIf
	Return $sReturn
EndFunc   ;==>getChatStringChinese

Func getChatStringKoreanMod($x_start, $y_start) ; -> Get string chat request - Korean - "DonateCC.au3"
	Local $sReturn = ""
	Local $bUseOcrImgLoc = True

		If getOcrAndCapture("korean-bundle", $x_start, $y_start, 160, 14, Default, $bUseOcrImgLoc) <> "" Then
		$sReturn &= $g_sGetOcrMod
			For $i = 1 To 4
				If getOcrAndCapture("korean-bundle", $x_start, $y_start + ($i*13), 160, 14, Default, $bUseOcrImgLoc) <> "" Then
					$sReturn &= " "
					$sReturn &= $g_sGetOcrMod
				Else
				ExitLoop
				EndIf
			Next
		EndIf
	Return $sReturn
EndFunc   ;==>getChatStringKorean

Func getChatStringPersianMod($x_start, $y_start) ; -> Get string chat request - Persian - "DonateCC.au3"
	Local $sReturn = ""
	Local $bUseOcrImgLoc = True

		If getOcrAndCapture("persian-bundle", $x_start, $y_start, 240, 20, Default, $bUseOcrImgLoc, True) <> "" Then
		$sReturn &= $g_sGetOcrMod
			For $i = 1 To 4
				If getOcrAndCapture("persian-bundle", $x_start, $y_start + ($i*13), 240, 20, Default, $bUseOcrImgLoc, True) <> "" Then
					$sReturn &= " "
					$sReturn &= $g_sGetOcrMod
				Else
				ExitLoop
				EndIf
			Next
		EndIf

		$sReturn = StringReverse($sReturn)
		$sReturn = StringReplace($sReturn, "A", "ا")
		$sReturn = StringReplace($sReturn, "B", "ب")
		$sReturn = StringReplace($sReturn, "C", "چ")
		$sReturn = StringReplace($sReturn, "D", "د")
		$sReturn = StringReplace($sReturn, "F", "ف")
		$sReturn = StringReplace($sReturn, "G", "گ")
		$sReturn = StringReplace($sReturn, "J", "ج")
		$sReturn = StringReplace($sReturn, "H", "ه")
		$sReturn = StringReplace($sReturn, "R", "ر")
		$sReturn = StringReplace($sReturn, "K", "ک")
		$sReturn = StringReplace($sReturn, "K", "ل")
		$sReturn = StringReplace($sReturn, "M", "م")
		$sReturn = StringReplace($sReturn, "N", "ن")
		$sReturn = StringReplace($sReturn, "P", "پ")
		$sReturn = StringReplace($sReturn, "S", "س")
		$sReturn = StringReplace($sReturn, "T", "ت")
		$sReturn = StringReplace($sReturn, "V", "و")
		$sReturn = StringReplace($sReturn, "Y", "ی")
		$sReturn = StringReplace($sReturn, "L", "ل")
		$sReturn = StringReplace($sReturn, "Z", "ز")
		$sReturn = StringReplace($sReturn, "X", "خ")
		$sReturn = StringReplace($sReturn, "Q", "ق")
		$sReturn = StringReplace($sReturn, ",", ",")
		$sReturn = StringReplace($sReturn, "0", " ")
		$sReturn = StringReplace($sReturn, "1", ".")
		$sReturn = StringReplace($sReturn, "22", "ع")
		$sReturn = StringReplace($sReturn, "44", "ش")
		$sReturn = StringReplace($sReturn, "55", "ح")
		$sReturn = StringReplace($sReturn, "66", "ض")
		$sReturn = StringReplace($sReturn, "77", "ط")
		$sReturn = StringReplace($sReturn, "88", "لا")
		$sReturn = StringReplace($sReturn, "99", "ث")
		$sReturn = StringStripWS($sReturn, 1 + 2)
		Return $sReturn
EndFunc   ;==>getChatStringPersian

