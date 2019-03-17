; #FUNCTION# ====================================================================================================================
; Name ..........: FriendlyChallenge
; Description ...:
; Syntax ........: FriendlyChallenge()
; Parameters ....:
; Return values .:
; Author ........: Samkie (11 July, 2017)
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Global $chkEnableFriendlyChallenge, $ichkEnableFriendlyChallenge, $chkOnlyOnRequest, $ichkOnlyOnRequest, $txtKeywordForRequest, $stxtKeywordForRequest, $txtFriendlyChallengeCoolDownTime, $itxtFriendlyChallengeCoolDownTime, $txtChallengeText, $stxtChallengeText
Global $g_ahChkFriendlyChallengehours[24] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
Global $g_hChkFriendlyChallengehoursE1 = 0, $g_hChkFriendlyChallengehoursE2 = 0
Global $g_hGrpRequestCC = 0, $g_hLblFriendlyChallengehoursAM = 0, $g_hLblFriendlyChallengehoursPM = 0
Global $g_ahLblFriendlyChallengehoursE = 0
GLobal $g_hLblFriendlyChallengehours[12] = [0,0,0,0,0,0,0,0,0,0,0,0]
Global $g_abFriendlyChallengehours[24] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

Global $chkFriendlyChallengeBase[6], $ichkFriendlyChallengeBase[6]
Global $iTimeForLastShareFriendlyChallenge = 0

Func SetupFriendlyChallengeGUI($x, $y)
	Local $xStart = $x
	Local $yStart = $y
	GUICtrlCreateGroup(GetTranslatedFileIni("sam m0d","Friendly Challenge", "Friend Challenge"), $x , $y, 430, 400)
	$x += 10
	$y += 20
	$chkEnableFriendlyChallenge = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Enable Friendly Challenge", "Enable Friendly Challenge"), $x , $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkEnableFriendlyChallenge")
	$y += 30

	GUICtrlCreateLabel(GetTranslatedFileIni("sam m0d", "Please select which base to share", "Please select which base to share for Friendly Challenge"), $x, $y,205,40)
	$y += 30
	$chkFriendlyChallengeBase[0] = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Base 1", "Village Base 1"), $x , $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkFriendlyChallengeBase")
	$y += 20
	$chkFriendlyChallengeBase[1] = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Base 2", "Village Base 2"), $x , $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkFriendlyChallengeBase")
	$y += 20
	$chkFriendlyChallengeBase[2] = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Base 3", "Village Base 3"), $x , $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkFriendlyChallengeBase")
	$x += 100
	$y -= 40
	$chkFriendlyChallengeBase[3] = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Base 4", "War Base 1"), $x , $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkFriendlyChallengeBase")
	$y += 20
	$chkFriendlyChallengeBase[4] = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Base 5", "War Base 2"), $x , $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkFriendlyChallengeBase")
	$y += 20
	$chkFriendlyChallengeBase[5] = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Base 6", "War Base 3"), $x , $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkFriendlyChallengeBase")

	$x = $xStart + 220
	$y = $yStart + 40

	$chkOnlyOnRequest = GUICtrlCreateCheckbox(GetTranslatedFileIni("sam m0d", "Only share up on chat request", "Only share up on chat request, Please enter keyword to below:"), $x , $y, 205, 40, $BS_MULTILINE)
	GUICtrlSetOnEvent(-1, "chkOnlyOnRequest")
	$y += 40
	$txtKeywordForRequest = GUICtrlCreateEdit("", $x, $y, 205, 60, BitOR($ES_WANTRETURN, $ES_CENTER, $ES_AUTOVSCROLL))
	GUICtrlSetOnEvent(-1, "txtKeywordForRequest")

	$x = $xStart + 10
	$y = $yStart + 160

	GUICtrlCreateLabel(GetTranslatedFileIni("sam m0d", "Challenge text", "Challenge text (If more that a line will random select)"), $x, $y)
	$y += 20
	$txtChallengeText = GUICtrlCreateEdit("", $x, $y, 300, 60, BitOR($ES_WANTRETURN, $ES_CENTER, $ES_AUTOVSCROLL))
	GUICtrlSetOnEvent(-1, "txtChallengeText")


	$y += 80
	GUICtrlCreateLabel(GetTranslatedFileIni("sam m0d", "Cool down share", "After each share, cool down how many minutes to share again? :"), $x, $y)
	$x += 220
	$y -= 2
	$txtFriendlyChallengeCoolDownTime = GUICtrlCreateInput("5", $x + 94, $y, 30, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetOnEvent(-1, "txtFriendlyChallengeCoolDownTime")
	$x -= 220

		$y += 30
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", "Only during these hours of each day"), $x, $y, 300, 20, $BS_MULTILINE)
		$y += 20
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Hour",  "Hour") & ":", $x , $y, -1, 15)
		Local $sTxtTip = GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", -1)
		_GUICtrlSetTip(-1, $sTxtTip)
		$g_hLblFriendlyChallengehours[0] =  GUICtrlCreateLabel(" 0", $x + 30, $y, 13, 15)
		$g_hLblFriendlyChallengehours[1] = GUICtrlCreateLabel(" 1", $x + 45, $y, 13, 15)
		$g_hLblFriendlyChallengehours[2] = GUICtrlCreateLabel(" 2", $x + 60, $y, 13, 15)
		$g_hLblFriendlyChallengehours[3] = GUICtrlCreateLabel(" 3", $x + 75, $y, 13, 15)
		$g_hLblFriendlyChallengehours[4] = GUICtrlCreateLabel(" 4", $x + 90, $y, 13, 15)
		$g_hLblFriendlyChallengehours[5] = GUICtrlCreateLabel(" 5", $x + 105, $y, 13, 15)
		$g_hLblFriendlyChallengehours[6] = GUICtrlCreateLabel(" 6", $x + 120, $y, 13, 15)
		$g_hLblFriendlyChallengehours[7] = GUICtrlCreateLabel(" 7", $x + 135, $y, 13, 15)
		$g_hLblFriendlyChallengehours[8] = GUICtrlCreateLabel(" 8", $x + 150, $y, 13, 15)
		$g_hLblFriendlyChallengehours[9] = GUICtrlCreateLabel(" 9", $x + 165, $y, 13, 15)
		$g_hLblFriendlyChallengehours[10] = GUICtrlCreateLabel("10", $x + 180, $y, 13, 15)
		$g_hLblFriendlyChallengehours[11] = GUICtrlCreateLabel("11", $x + 195, $y, 13, 15)
		$g_ahLblFriendlyChallengehoursE = GUICtrlCreateLabel("X", $x + 213, $y+2, 11, 11)

		$y += 15
		$g_ahChkFriendlyChallengehours[0] = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[1] = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[2] = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[3] = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[4] = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[5] = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[6] = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[7] = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[8] = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[9] = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[10] = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[11] = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_hChkFriendlyChallengehoursE1 = GUICtrlCreateCheckbox("", $x + 211, $y+1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
		   GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnGoldStar, 0)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", "This button will clear or set the entire row of boxes"))
		   GUICtrlSetOnEvent(-1, "chkFriendlyChallengehoursE1")
		$g_hLblFriendlyChallengehoursAM = GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "AM", "AM"), $x + 5, $y)

		$y += 15
		$g_ahChkFriendlyChallengehours[12] = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[13] = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[14] = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[15] = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[16] = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[17] = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[18] = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[19] = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[20] = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[21] = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[22] = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_ahChkFriendlyChallengehours[23] = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
		GUICtrlSetOnEvent(-1, "ChkFriendlyChallengehours")
		$g_hChkFriendlyChallengehoursE2 = GUICtrlCreateCheckbox("", $x + 211, $y+1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
		   GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnGoldStar, 0)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", -1))
		   GUICtrlSetOnEvent(-1, "chkFriendlyChallengehoursE2")
		$g_hLblFriendlyChallengehoursPM = GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "PM", "PM"), $x + 5, $y)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc

Func ChkFriendlyChallengehours()
	For $i = 0 to 23
		$g_abFriendlyChallengehours[$i] = (GUICtrlRead($g_ahChkFriendlyChallengehours[$i]) = $GUI_CHECKED ? 1: 0)
	Next
EndFunc

Func chkFriendlyChallengehoursE1()
	If GUICtrlRead($g_hChkFriendlyChallengehoursE1) = $GUI_CHECKED And GUICtrlRead($g_ahChkFriendlyChallengehours[0]) = $GUI_CHECKED Then
		For $i = 0 To 11
			GUICtrlSetState($g_ahChkFriendlyChallengehours[$i], $GUI_UNCHECKED)
		Next
	Else
		For $i = 0 To 11
			GUICtrlSetState($g_ahChkFriendlyChallengehours[$i], $GUI_CHECKED)
		Next
	EndIf
	Sleep(300)
	GUICtrlSetState($g_hChkFriendlyChallengehoursE1, $GUI_UNCHECKED)
	ChkFriendlyChallengehours()
EndFunc   ;==>chkFriendlyChallengehoursE1

Func chkFriendlyChallengehoursE2()
	If GUICtrlRead($g_hChkFriendlyChallengehoursE2) = $GUI_CHECKED And GUICtrlRead($g_ahChkFriendlyChallengehours[12]) = $GUI_CHECKED Then
		For $i = 12 To 23
			GUICtrlSetState($g_ahChkFriendlyChallengehours[$i], $GUI_UNCHECKED)
		Next
	Else
		For $i = 12 To 23
			GUICtrlSetState($g_ahChkFriendlyChallengehours[$i], $GUI_CHECKED)
		Next
	EndIf
	Sleep(300)
	GUICtrlSetState($g_hChkFriendlyChallengehoursE2, $GUI_UNCHECKED)
	ChkFriendlyChallengehours()
EndFunc   ;==>chkFriendlyChallengehoursE2

Func chkEnableFriendlyChallenge()
	$ichkEnableFriendlyChallenge = (GUICtrlRead($chkEnableFriendlyChallenge) = $GUI_CHECKED ? 1: 0)
EndFunc

Func chkOnlyOnRequest()
	$ichkOnlyOnRequest = (GUICtrlRead($chkOnlyOnRequest) = $GUI_CHECKED ? 1: 0)
EndFunc

Func chkFriendlyChallengeBase()
	For $i = 0 to 5
		$ichkFriendlyChallengeBase[$i] = (GUICtrlRead($chkFriendlyChallengeBase[$i]) = $GUI_CHECKED ? 1: 0)
	Next
EndFunc

Func txtKeywordForRequest()
	$stxtKeywordForRequest = GUICtrlRead($txtKeywordForRequest)
EndFunc

Func txtChallengeText()
	Local $sInputText = StringReplace(GUICtrlRead($txtChallengeText), @CRLF, "|")
	Local $iCount = 0
	Local $bUpdateDateFlag = False
	While 1
		If StringRight($sInputText,1) = "|" Then
			$sInputText = StringLeft($sInputText, StringLen($sInputText) - 1)
			$bUpdateDateFlag = True
		Else
			If $bUpdateDateFlag Then GUICtrlSetData($txtChallengeText, StringReplace($sInputText, "|", @CRLF))
			ExitLoop
		EndIf
		$iCount += 1
		If $iCount > 10 Then ExitLoop
	WEnd
	$stxtChallengeText = StringReplace($sInputText, "|", @CRLF)
EndFunc

Func txtFriendlyChallengeCoolDownTime()
	$itxtFriendlyChallengeCoolDownTime = Int(GUICtrlRead($txtFriendlyChallengeCoolDownTime))
	$iTimeForLastShareFriendlyChallenge = 0
EndFunc

Func FriendlyChallenge()
	If $ichkEnableFriendlyChallenge = 0 Then Return

	Local $hour = StringSplit(_NowTime(4), ":", $STR_NOCOUNT)
	If $g_abFriendlyChallengehours[$hour[0]] = 0 Then
		SetLog("Friendly Challenge not planned, Skipped..", $COLOR_INFO)
		Return ; exit func if no planned donate checkmarks
	EndIf

	Local $aBaseForShare[1]
	Local $iCount4Share = 0
	For $i = 0 to 5
		If $ichkFriendlyChallengeBase[$i] = 1 Then
			ReDim $aBaseForShare[$iCount4Share + 1]
			$aBaseForShare[$iCount4Share] = $i
			$iCount4Share += 1
		EndIf
	Next
	If $iCount4Share = 0 Then
		SetLog("No base to share for friend challenge, please check your setting.", $COLOR_ERROR)
		Return
	EndIf

	;SetLog("$iDateCalc: " & $iDateCalc)
	If $iTimeForLastShareFriendlyChallenge <> 0 Then
		Local $iDateCalc = _DateDiff('s', $iTimeForLastShareFriendlyChallenge, _NowCalc())
		If $iDateCalc < $itxtFriendlyChallengeCoolDownTime * 60 Then
			SetLog("Waiting for cool down, time left: " & ($itxtFriendlyChallengeCoolDownTime * 60) - $iDateCalc & " seconds.", $COLOR_INFO)
			Return
		EndIf
	EndIf

	ClickP($aAway, 1, 0, "#0167") ;Click Away
	Setlog("Checking Friendly Challenge at Clan Chat", $COLOR_INFO)
	
	ForceCaptureRegion()
	
	If _CheckColorPixel($aButtonClanWindowOpen[4], $aButtonClanWindowOpen[5], $aButtonClanWindowOpen[6], $aButtonClanWindowOpen[7], $g_bCapturePixel, "aButtonClanWindowOpen") Then
		Click($aButtonClanWindowOpen[0], $aButtonClanWindowOpen[1], 1, 0, "#0168")
		If _Wait4Pixel($aButtonClanWindowClose[4], $aButtonClanWindowClose[5], $aButtonClanWindowClose[6], $aButtonClanWindowClose[7], 1500) = False Then
			SetLog("Clan Chat Did Not Open - Abandon Friendly Challenge")
			AndroidPageError("FriendlyChallenge")
			Return False
		EndIf
	EndIf
	
	Local $iLoopCount = 0
	Local $iCount = 0
	
	While 1
		;If Clan tab is selected.
		ForceCaptureRegion()
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(189, 24, False), Hex(0x706C50, 6), 20) Then ; color med gray
			ExitLoop
		EndIf
		;If Global tab is selected.
		If _ColorCheck(_GetPixelColor(189, 24, False), Hex(0x383828, 6), 20) Then ; Darker gray
			ClickP($aClanTab, 1, 0, "#0169") ; clicking clan tab
		EndIf
		;counter for time approx 3 sec max allowed for tab to open
		$iLoopCount += 1
		If $iLoopCount >= 5 Then ; allows for up to a sleep of 3000
			SetLog("Cannot switch to Clan Chat Tab - Abandon Friendly Challenge")
			AndroidPageError("FriendlyChallenge")
			ClostChatTab()
			Return False
		EndIf
		If _Sleep($DELAYDONATECC1) Then Return ; delay Allow 15x
	WEnd
	
	Local $bDoFriendlyChallenge = False
	
	If $ichkOnlyOnRequest = 1 Then ;1
		Local $ClanString, $iBaseForShare, $ret
		
			If ReadChatIA($ClanString, $stxtKeywordForRequest, False) = True Then ;2
				$ret = StringRegExp($ClanString, '\d+', 1)
				$bDoFriendlyChallenge = True
			
					If IsArray($ret) Then ;3
						$iBaseForShare = $aBaseForShare[Random(0,UBound($aBaseForShare)-1,1)]
				
							For $k = 0 To UBound($aBaseForShare) - 1
								If $aBaseForShare[$k] = Int($ret[0] - 1) Then ;4
									$iBaseForShare = Int($ret[0] - 1)
									SetLog("User request challenge base: " & $iBaseForShare + 1, $COLOR_INFO)
								EndIf ;4
							Next
					EndIf ;3
			EndIf ;2
			Else
			$bDoFriendlyChallenge = True
	EndIf ;1
	
	Local $bIsBtnStartOk = False

	If $bDoFriendlyChallenge Then
		SetLog("Prepare for select base: " & $iBaseForShare + 1, $COLOR_INFO)
		If _Wait4PixelFake($aButtonFriendlyChallenge[4], $aButtonFriendlyChallenge[5], $aButtonFriendlyChallenge[6], $aButtonFriendlyChallenge[7], 1500, 150, "$aButtonFriendlyChallenge") Then
			Click($aButtonFriendlyChallenge[4], $aButtonFriendlyChallenge[5], 1, 0, "#BtnFC")
			If _Wait4PixelFake($aButtonFCChangeLayout[4], $aButtonFCChangeLayout[5], $aButtonFCChangeLayout[6], $aButtonFCChangeLayout[7], 1500, 150, "$aButtonFCChangeLayout") Then
				Click($aButtonFCChangeLayout[4], $aButtonFCChangeLayout[5], 1, 0, "#BtnFCCL")
				If _Wait4PixelFake($aButtonFCBack[4], $aButtonFCBack[5], $aButtonFCBack[6], $aButtonFCBack[7], 1500, 150, "$aButtonFCBack") Then
					If CheckNeedSwipeFriendlyChallengeBase($iBaseForShare) Then
						If _Wait4PixelFake($aButtonFCStart[4], $aButtonFCStart[5], $aButtonFCStart[6], $aButtonFCStart[7], 1500, 150, "$aButtonFCStart") Then
							If $stxtChallengeText <> "" Then
								Click(Random(440,620,1),Random(165,185,1))
								If _Sleep(100) Then Return False
								Local $asText = StringSplit($stxtChallengeText, @CRLF, BitOR($STR_ENTIRESPLIT,$STR_NOCOUNT))
								If IsArray($asText) Then
									Local $sText4Send = $asText[Random(0,UBound($asText)-1,1)]
									SetLog("Send text: " & $sText4Send, $COLOR_DEBUG)
									If $g_bChkBackgroundMode = False And $g_bNoFocusTampering = False Then ControlFocus($g_hAndroidWindow, "", "")
									If SendText($sText4Send) = 0 Then
										Setlog(" challenge text entry failed!", $COLOR_ERROR)
									EndIf
								EndIf
								If _Sleep(200) Then Return
							EndIf
							If _Wait4PixelFake($aButtonFCStart[4], $aButtonFCStart[5], $aButtonFCStart[6], $aButtonFCStart[7], 1500, 200, "$aButtonFCStart") Then $bIsBtnStartOk = True
							If _Sleep(200) Then Return

							If $bIsBtnStartOk = True Then
								Click($aButtonFCStart[4], $aButtonFCStart[5], 1, 0, "#BtnFCStart")
								SetLog("Friendly Challenge Shared.", $COLOR_INFO)
								$iTimeForLastShareFriendlyChallenge = _NowCalc()
								ClostChatTab()
								Return True
							EndIf
						Else
							SetLog("Cannot find friendly challenge start button. Maybe the base cannot be select.", $COLOR_RED)
							$ichkFriendlyChallengeBase[$iBaseForShare] = 0
							GUICtrlSetState($chkFriendlyChallengeBase[$iBaseForShare], $GUI_UNCHECKED)
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	ClostChatTab()
	Return False
EndFunc

Func _Wait4PixelFake($x, $y, $sColor, $iColorVariation, $iWait = 1000, $sMsglog = Default, $iDelay = 100)
	If _Sleep($iWait) Then Return False
	Return True
EndFunc 

Func CheckNeedSwipeFriendlyChallengeBase($iBaseSlot)
	If _Sleep(100) Then Return False
;~ 	Local $iCount2 = 0
;~ 	While IsQueueBlockByMsg($iCount2) ; 检查游戏上的讯息，是否有挡着训练界面， 最多30秒
;~ 		If _Sleep(1000) Then ExitLoop
;~ 		$iCount2 += 1
;~ 		If $iCount2 >= 30 Then
;~ 			ExitLoop
;~ 		EndIf
;~ 	WEnd

	; check need swipe
	Local $iSwipeNum = 2
	Local $iCount = 0
	If $iBaseSlot > $iSwipeNum Then
		$iCount = 0
		While Not _ColorCheck(_GetPixelColor(712, 295, True), Hex(0XD3D3CB, 6), 10)
			ClickDrag(700,250,150,250,250)
			If _sleep(250) Then Return False
			$iCount += 1
			If $iCount > 3 Then Return False
		WEnd
		$iBaseSlot -= 3
		Click(Random(200 + ($iBaseSlot * 184), 230 + ($iBaseSlot * 184), 1) , Random(220,270,1))
	Else
		$iCount = 0
		While Not _ColorCheck(_GetPixelColor(146, 295, True), Hex(0XD3D3CB, 6), 10)
			ClickDrag(155,250,705,250,250)
			If _sleep(250) Then Return False
			$iCount += 1
			If $iCount > 3 Then Return False
		WEnd
		Click(Random(200 + ($iBaseSlot * 184), 230 + ($iBaseSlot * 184), 1) , Random(220,270,1))
	EndIf
	Return True
EndFunc

Func ClostChatTab()
	Local $i = 0
	While 1
		If _Sleep(250) Then Return
		ForceCaptureRegion()
		_CaptureRegion()
		Select
			Case _CheckColorPixel($aCloseChat[0], $aCloseChat[1], $aCloseChat[2], $aCloseChat[3], False, "aCloseChat")
				Click($aCloseChat[0], $aCloseChat[1], 1, 0, "#0173") ;Clicks chat thing
			Case _CheckColorPixel($aOpenChatTab[0], $aOpenChatTab[1], $aOpenChatTab[2], $aOpenChatTab[3], False, "aOpenChatTab")
				ExitLoop
			Case _CheckColorPixel($aButtonFCClose[4], $aButtonFCClose[5], $aButtonFCClose[6], $aButtonFCClose[7], False, "aButtonFCClose")
				Click($aButtonFCClose[0], $aButtonFCClose[1], 1, 0, "#BtnFCClose") ;Clicks chat thing
			Case _CheckColorPixel($aButtonFCBack[4], $aButtonFCBack[5], $aButtonFCBack[6], $aButtonFCBack[7], False, "aButtonFCBack")
				AndroidBackButton()
			Case Else
				ClickP($aAway, 1, 0, "#0167") ;Click Away
				$i += 1
				If $i > 30 Then
					SetLog("Error finding Clan Tab to close...", $COLOR_ERROR)
					AndroidPageError("FriendlyChallenge")
					ExitLoop
				EndIf
		EndSelect
	WEnd
	If _Sleep(100) Then Return
EndFunc

