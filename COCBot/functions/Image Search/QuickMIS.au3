; #FUNCTION# ====================================================================================================================
; Name ..........: QuickMIS
; Description ...: A function to easily use ImgLoc, without headache :P !!!
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: Demen (STOP FOR WAR OCR) / BLD
; Remarks .......: This file is part of MyBotRun. Copyright 2017
;                  MyBotRun is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......: ---
;================================================================================================================================
Func QuickMIS($ValueReturned, $directory, $Left = 0, $Top = 0, $Right = $g_iGAME_WIDTH, $Bottom = $g_iGAME_HEIGHT, $bNeedCapture = True, $Debug = False, $OcrDecode = 3, $OcrSpace = 12) ; EDITED By FENIX MOD
	;If ($ValueReturned <> "BC1") And ($ValueReturned <> "CX") And ($ValueReturned <> "N1") And ($ValueReturned <> "NX") And ($ValueReturned <> "Q1") And ($ValueReturned <> "QX") And ($ValueReturned <> "NxCx") And ($ValueReturned <> "N1Cx1") And ($ValueReturned <> "OCR") Then ; EDITED By FENIX MOD
	;	SetLog("Bad parameters during QuickMIS call for MultiSearch...", $COLOR_RED)
	;	Return
	;EndIf
	If $bNeedCapture Then _CaptureRegion2($Left, $Top, $Right, $Bottom)
	Local $Res = DllCallMyBot("SearchMultipleTilesBetweenLevels", "handle", $g_hHBitmap2, "str", $directory, "str", "FV", "Int", 0, "str", "FV", "Int", 0, "Int", 1000)
	If @error Then _logErrorDLLCall($g_sLibMyBotPath, @error)
	If $g_bDebugImageSave Then DebugImageSave("QuickMIS_" & $ValueReturned, False)

	If IsArray($Res) Then
		;If $Debug Then _ArrayDisplay($Res)
		If $g_bDebugSetlog Then SetDebugLog("DLL Call succeeded " & $Res[0], $COLOR_PURPLE)

		If $Res[0] = "" Or $Res[0] = "0" Then
			If $g_bDebugSetlog Then SetDebugLog("No Button found")
			Switch $ValueReturned
				Case "BC1"
					Return False
				Case "CX"
					Return -1
				Case "N1"
					Return "none"
				Case "NX"
					Return "none"
				Case "Q1"
					Return 0
				Case "QX"
					Return 0
				Case "N1Cx1"
					Return 0
				Case "NxCx"
					Return 0
				Case "OCR" 
					Return "none"
			EndSwitch

		ElseIf StringInStr($Res[0], "-1") <> 0 Then
			SetLog("DLL Error", $COLOR_RED)

		Else
			Switch $ValueReturned

				Case "BC1" ; coordinates of first/one image found + boolean value

					Local $Result = "", $Name = ""
					Local $KeyValue = StringSplit($Res[0], "|", $STR_NOCOUNT)
					For $i = 0 To UBound($KeyValue) - 1
						Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
						If UBound(decodeSingleCoord($DLLRes[0])) > 1 Then $Result &= $DLLRes[0] & "|"
					Next
					If StringRight($Result, 1) = "|" Then $Result = StringLeft($Result, (StringLen($Result) - 1))
					Local $aCords = decodeMultipleCoords($Result, 60, 10, 1)
					If UBound($aCords) = 0 Then Return False ; should never happen, but it did...
					Local $aCord = $aCords[0] ; sorted by Y
					If UBound($aCord) < 2 Then Return False ; should never happen, but anyway...
					$g_iQuickMISX = $aCord[0]
					$g_iQuickMISY = $aCord[1]
					$g_iQuickMISWOffSetX = $aCord[0] + $Left ;Update X with offset of Left
					$g_iQuickMISWOffSetY = $aCord[1] + $Top ;Update Y with offset of Top

					$Name = RetrieveImglocProperty($KeyValue[0], "objectname")

					If $g_bDebugSetlog Or $Debug Then
						SetDebugLog($ValueReturned & " Found: " & $Result & ", using " & $g_iQuickMISX & "," & $g_iQuickMISY, $COLOR_PURPLE)
						If $g_bDebugImageSave Then DebugQuickMIS($Left, $Top, "BC1_detected[" & $Name & "_" & $g_iQuickMISWOffSetX & "x" & $g_iQuickMISWOffSetY & "]")
					EndIf

					Return True

				Case "CX" ; coordinates of each image found - eg: $Array[0] = [X1, Y1] ; $Array[1] = [X2, Y2]

					Local $Result = ""
					Local $KeyValue = StringSplit($Res[0], "|", $STR_NOCOUNT)
					For $i = 0 To UBound($KeyValue) - 1
						Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
						If UBound(decodeSingleCoord($DLLRes[0])) > 1 Then $Result &= $DLLRes[0] & "|"
					Next
					If StringRight($Result, 1) = "|" Then $Result = StringLeft($Result, (StringLen($Result) - 1))
					If $g_bDebugSetlog Then SetDebugLog($ValueReturned & " Found: " & $Result, $COLOR_PURPLE)
					Local $CoordsInArray = StringSplit($Result, "|", $STR_NOCOUNT)
					Return $CoordsInArray

				Case "N1" ; name of first file found

					Local $MultiImageSearchResult = StringSplit($Res[0], "|")
					Local $FilenameFound = StringSplit($MultiImageSearchResult[1], "_")
					Return $FilenameFound[1]

				Case "NX" ; names of all files found

					Local $AllFilenamesFound = ""
					Local $MultiImageSearchResult = StringSplit($Res[0], "|")
					For $i = 1 To $MultiImageSearchResult[0]
						Local $FilenameFound = StringSplit($MultiImageSearchResult[$i], "_")
						$AllFilenamesFound &= $FilenameFound[1] & "|"
					Next
					If StringRight($AllFilenamesFound, 1) = "|" Then $AllFilenamesFound = StringLeft($AllFilenamesFound, (StringLen($AllFilenamesFound) - 1))
					Return $AllFilenamesFound

				Case "Q1" ; quantity of first/one tiles found

					Local $Result = ""
					Local $KeyValue = StringSplit($Res[0], "|", $STR_NOCOUNT)
					For $i = 0 To UBound($KeyValue) - 1
						Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "totalobjects")
						$Result &= $DLLRes[0] & "|"
					Next
					If StringRight($Result, 1) = "|" Then $Result = StringLeft($Result, (StringLen($Result) - 1))
					If $g_bDebugSetlog Then SetDebugLog($ValueReturned & " Found: " & $Result, $COLOR_PURPLE)
					Local $QuantityInArray = StringSplit($Result, "|", $STR_NOCOUNT)
					Return $QuantityInArray[0]

				Case "QX" ; quantity of files found

					Local $MultiImageSearchResult = StringSplit($Res[0], "|", $STR_NOCOUNT)
					Return UBound($MultiImageSearchResult)

				Case "N1Cx1" ;Name of first File Found And it's 1st Cords Array[2] -> Array[0] = Name , Array[1] = [X, Y]

					Local $NameAndCords[2]
					Local $Result = "", $Name = ""
					Local $KeyValue = StringSplit($Res[0], "|", $STR_NOCOUNT)
					For $i = 0 To UBound($KeyValue) - 1
						Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
						If UBound(decodeSingleCoord($DLLRes[0])) > 1 Then $Result &= $DLLRes[0] & "|"
					Next
					If StringRight($Result, 1) = "|" Then $Result = StringLeft($Result, (StringLen($Result) - 1))
					Local $aCords = decodeMultipleCoords($Result, 60, 10, 1)
					If UBound($aCords) = 0 Then Return 0 ; should never happen, but it did...
					Local $aCord = $aCords[0]
					If UBound($aCord) < 2 Then Return 0 ; should never happen, but anyway...
					$aCord[0] = $aCord[0] + $Left
					$aCord[1] = $aCord[1] + $Top

					$Name = RetrieveImglocProperty($KeyValue[0], "objectname")

					$NameAndCords[0] = $Name
					$NameAndCords[1] = $aCord

					If $g_bDebugSetlog Or $Debug Then
						SetDebugLog($ValueReturned & " Found: " & $Name & ", using " & $aCord[0] & "," & $aCord[1], $COLOR_PURPLE)
					EndIf

					Return $NameAndCords

				Case "NxCx" ; Array[x][2]  , Array[x][0] = Name , Array[x][1] = is an Array with Coordinates
					Local $KeyValue = StringSplit($Res[0], "|", $STR_NOCOUNT)
					Local $Name = ""
					Local $aPositions, $aCoords, $aCord, $level
					SetDebugLog("Detected : " & UBound($KeyValue) & " tiles")
					Local $AllFilenamesFound[UBound($KeyValue)][3]
					For $i = 0 To UBound($KeyValue) - 1
						$Name = RetrieveImglocProperty($KeyValue[$i], "objectname")
						$aPositions = RetrieveImglocProperty($KeyValue[$i], "objectpoints")
						$level = RetrieveImglocProperty($KeyValue[$i], "objectlevel")
						SetDebugLog("Name: " & $Name)
						$aCoords = decodeMultipleCoords($aPositions, 20, 0, 0) ; dedup coords by x on 50 pixel ;
						SetDebugLog("How many $aCoords: " & UBound($aCoords))
						$AllFilenamesFound[$i][0] = $Name
						$AllFilenamesFound[$i][1] = $aCoords
						$AllFilenamesFound[$i][2] = $level
					Next
					Return $AllFilenamesFound
				Case "OCR" ; Names of all files found, put together as a string in accordance with their coordinates left - right

					Local $sOCRString = ""
					Local $aResults[1][2] = [[-1, ""]] ; X_Coord & Name

					Local $KeyValue = StringSplit($Res[0], "|", $STR_NOCOUNT)
					For $i = 0 To UBound($KeyValue) - 1
						Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
						Local $Name = RetrieveImglocProperty($KeyValue[$i], "objectname")

						Local $aCoords = StringSplit($DLLRes[0], "|", $STR_NOCOUNT)

						For $j = 0 To UBound($aCoords) - 1 ; In case found 1 char multiple times, $j > 0
							Local $aXY = StringSplit($aCoords[$j], ",", $STR_NOCOUNT)
							ReDim $aResults[UBound($aResults) + 1][2]
							$aResults[UBound($aResults) - 2][0] = Number($aXY[0])
							$aResults[UBound($aResults) - 2][1] = $Name
						Next
					Next

					_ArrayDelete($aResults, UBound($aResults) - 1)
					_ArraySort($aResults)

					For $i = 0 To UBound($aResults) - 1
						SetDebugLog($i & ". $Name = " & $aResults[$i][1] & ", Coord = " & $aResults[$i][0])
						If $i >= 1 Then
							If $aResults[$i][1] = $aResults[$i - 1][1] And Abs($aResults[$i][0] - $aResults[$i - 1][0]) <= $OcrDecode Then ContinueLoop
							If Abs($aResults[$i][0] - $aResults[$i - 1][0]) > $OcrSpace Then $sOCRString &= " "
						EndIf
						$sOCRString &= $aResults[$i][1]
					Next
					SetDebugLog("QuickMIS " & $ValueReturned & ", $sOCRString: " & $sOCRString)

					Return $sOCRString
				Case Else
					SetLog("Bad parameters during QuickMIS call for MultiSearch...", $COLOR_RED)
					Return
			EndSwitch
		EndIf
	EndIf
EndFunc   ;==>QuickMIS

Func DebugQuickMIS($x, $y, $DebugText)

	_CaptureRegion2()
	Local $subDirectory = $g_sProfileTempDebugPath & "QuickMIS"
	DirCreate($subDirectory)
	Local $Date = @YEAR & "-" & @MON & "-" & @MDAY
	Local $Time = @HOUR & "." & @MIN & "." & @SEC
	Local $filename = String($Date & "_" & $Time & "_" & $DebugText & "_.png")
	Local $editedImage = _GDIPlus_BitmapCreateFromHBITMAP($g_hHBitmap2)
	Local $hGraphic = _GDIPlus_ImageGetGraphicsContext($editedImage)
	Local $hPenRED = _GDIPlus_PenCreate(0xFFFF0000, 3) ; Create a pencil Color FF0000/RED

	_GDIPlus_GraphicsDrawRect($hGraphic, $g_iQuickMISX - 5 + $x, $g_iQuickMISY - 5 + $y, 10, 10, $hPenRED)

	_GDIPlus_ImageSaveToFile($editedImage, $subDirectory & "\" & $filename)
	_GDIPlus_PenDispose($hPenRED)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_BitmapDispose($editedImage)

EndFunc   ;==>DebugQuickMIS

Func _ImageSearchXMLBoludoz($sTilePath, $Quantity2Match = 0, $saiArea2SearchOri = 0, $bForceArea = True, $DebugLog = False, $checkDuplicatedpoints = False, $Distance2check = 25, $iLevel = 0)

	;#cs - Disabled more fasther
	;If Not IsInt($Quantity2Match) Then $Quantity2Match = 0
	;If Not IsString($Area2Search) Then $Area2Search = "0,0,860,644" ; RC Done
	;If Not IsBool($bForceArea) Then $bForceArea = True
	;If Not IsBool($DebugLog) Then $DebugLog = False
	;#ce
	
	;IsArray($rect) ? $rect : GetRectArray($rect, False)
	
	Local $sArea2Search = $saiArea2SearchOri
	
	If IsInt($sArea2Search) and $sArea2Search = 0 Then 
		Local $iTmpArea[4]
		$iTmpArea[0] = 0
		$iTmpArea[1] = 0
		$iTmpArea[2] = $g_iGAME_WIDTH 
		$iTmpArea[3] = $g_iGAME_HEIGHT
		$sArea2Search = $iTmpArea
	EndIf
	
	If Not IsString($sArea2Search) And IsArray($sArea2Search) And UBound($sArea2Search) = 4 Then 
		$sArea2Search = _ArrayToString($sArea2Search, ",") ; Array Or String support
	EndIf
	Local $Screen = StringSplit($sArea2Search, ",", 2)
		
	_CaptureRegion2($Screen[0], $Screen[1], $Screen[2], $Screen[3])

	Local $aResults = QuickMIS("NxCx", $sTilePath, $Screen[0], $Screen[1], $Screen[2], $Screen[3], True, False)
	Local $aAllResults[0][4], $aCoordinates, $aCoord

	If $aResults = 0 Then Return -1

	For $i = 0 To UBound($aResults) - 1
		If Not $g_bRunState Then Return
		$aCoordinates = Null
		$aCoordinates = $aResults[$i][1]
		For $j = 0 To UBound($aCoordinates) - 1
			$aCoord = Null
			$aCoord = $aCoordinates[$j]
			SetDebugLog(" - " & $aResults[$i][0] & " at (" & $aCoord[0] + $Screen[0] & "," & $aCoord[1] + $Screen[1] & ")")
			ReDim $aAllResults[UBound($aAllResults) + 1][4]
			$aAllResults[UBound($aAllResults) - 1][0] = $aResults[$i][0] ; NAME
			$aAllResults[UBound($aAllResults) - 1][1] = Number($aCoord[0] + $Screen[0]) ; X axis
			$aAllResults[UBound($aAllResults) - 1][2] = Number($aCoord[1] + $Screen[1]) ; Y axis
			$aAllResults[UBound($aAllResults) - 1][3] = Number($aResults[$i][2]) ; Level
		Next
	Next

	; Sort by X axis
	_ArraySort($aAllResults, 0, 0, 0, 1)
	
	If $checkDuplicatedpoints Then
		; Distance in pixels to check if is a duplicated detection , for deploy point will be 5
		Local $D2Check = $Distance2check
		; check if is a double Detection, near in 10px
		Local $Dime = 0
		For $i = 0 To UBound($aAllResults) - 1
			If Not $g_bRunState Then Return
			If $i > UBound($aAllResults) - 1 Then ExitLoop
			Local $LastCoordinate[4] = [$aAllResults[$i][0], $aAllResults[$i][1], $aAllResults[$i][2], $aAllResults[$i][3]]
			SetDebugLog("Coordinate to Check: " & _ArrayToString($LastCoordinate))
			If UBound($aAllResults) > 1 Then
				For $j = 0 To UBound($aAllResults) - 1
					If $j > UBound($aAllResults) - 1 Then ExitLoop
					Local $SingleCoordinate[4] = [$aAllResults[$j][0], $aAllResults[$j][1], $aAllResults[$j][2], $aAllResults[$j][3]]
					If $LastCoordinate[1] <> $SingleCoordinate[1] Or $LastCoordinate[2] <> $SingleCoordinate[2] Then
						If Int($SingleCoordinate[1]) < Int($LastCoordinate[1]) + $D2Check And Int($SingleCoordinate[1]) > Int($LastCoordinate[1]) - $D2Check And _
								Int($SingleCoordinate[2]) < Int($LastCoordinate[2]) + $D2Check And Int($SingleCoordinate[2]) > Int($LastCoordinate[2]) - $D2Check Then
							_ArrayDelete($aAllResults, $j)
						EndIf
					Else
						If $LastCoordinate[1] = $SingleCoordinate[1] And $LastCoordinate[2] = $SingleCoordinate[2] And $LastCoordinate[3] <> $SingleCoordinate[3] Then
							_ArrayDelete($aAllResults, $j)
						EndIf
					EndIf
				Next
			EndIf
		Next
	EndIf
	
	If (UBound($aAllResults) > 0) Then
		If $DebugLog = True Or $g_bDebugSetlog Then SetLog("_ImageSearchXMLBoludoz Return: " & _ArrayToString($aAllResults, "|", -1,-1,"#"), $COLOR_DEBUG)
		Return $aAllResults
	Else
		If $DebugLog = True Or $g_bDebugSetlog Then SetLog("_ImageSearchXMLBoludoz Return: -1", $COLOR_ERROR)
		Return 0
	EndIf

EndFunc   ;==>_ImageSearchXMLBoludoz

; New Method using new Image detetion - ProMac
Func _WaitForCheckXML($pathImage, $SearchZone, $ForceArea = True, $iWait = 10000, $iDelay = 250)
	Local $Timer = __TimerInit()
	Local $DebugWait4XMLImag = ($g_bDebugSetlog Or $g_bDebugImageSave) ? True : False
	For $i = 0 To 600 ; if detection takes 100ms will be >60s + delay's
		If __TimerDiff($Timer) > $iWait Then ExitLoop
		Local $a_Array = _ImageSearchXMLBoludoz($pathImage, 1000, $SearchZone, $ForceArea, $DebugWait4XMLImag)
		If $a_Array <> -1 And IsArray($a_Array) And UBound($a_Array) > 0 And $a_Array[0][0] <> "" Then
			If $DebugWait4XMLImag Then SetDebugLog("_WaitForCheckXML found " & $a_Array[0][0] & " at (" & $a_Array[0][1] & "x" & $a_Array[0][2] & ")")
			Return True
		EndIf
		If _Sleep($iDelay) Then ExitLoop
	Next
	If $DebugWait4XMLImag Then SetDebugLog("_WaitForCheckXML not found at " & $SearchZone, $COLOR_ERROR)
	Return False
EndFunc   ;==>_WaitForCheckXML

; #FUNCTION# ====================================================================================================================
; Name ..........: QuickMIS
; Description ...: A function to easily use ImgLoc, without headache :P !!!
; Syntax ........: ---
; Parameters ....: ---
; Return values .: ---
; Author ........: RoroTiti
; Modified ......: Boludoz ""
; Remarks .......: This file is part of MyBotRun. Copyright 2017
;                  MyBotRun is distributed under the terms of the GNU GPL
; Related .......: ---
; Link ..........: https://www.mybot.run
; Example .......: ---
;================================================================================================================================
#cs
Func QuickMIS($ValueReturned, $directory, $Left = 0, $Top = 0, $Right = $g_iGAME_WIDTH, $Bottom = $g_iGAME_HEIGHT, $bNeedCapture = True, $Debug = False, $OcrDecode = 3, $OcrSpace = 12) ; EDITED By FENIX MOD

	If $bNeedCapture Then _CaptureRegion2($Left, $Top, $Right, $Bottom)
	;Local $aRes = DllCallMyBot("SearchMultipleTilesBetweenLevels", "handle", $g_hHBitmap2, "str", $directory, "str", "FV", "Int", 0, "str", "FV", "Int", 0, "Int", 1000)
	
    Assign("sRes", $Left&","&$Top&","&$Right&","&$Bottom)
    Local $sEvalRes = Eval("sString")

	Local $aRes = DllCallMyBot("SearchMultipleTilesBetweenLevels", "handle", $g_hHBitmap2, "str", $directory, "str", "FV", "Int", 0, "str", $sEvalRes, "Int", 0, "Int", 1000) ; edited by BLD
	If @error Then _logErrorDLLCall($g_sLibMyBotPath, @error)
	If $g_bDebugImageSave Then DebugImageSave("QuickMIS_" & $ValueReturned, False)

	If $g_bDebugSetlog Then SetDebugLog("DLL Call succeeded", $COLOR_PURPLE)
	
	If not IsArray($aRes) Then 
		Return
	ElseIf $aRes[0] = "" Or $aRes[0] = "0" Then
		If $g_bDebugSetlog Then SetDebugLog("No Button found")
			Switch $ValueReturned
				Case "BC1"
					Return False
				Case "CX"
					Return -1
				Case "N1"
					Return "none"
				Case "NX"
					Return "none"
				Case "Q1"
					Return 0
				Case "QX"
					Return 0
				Case "OCR"
					Return "none"
			EndSwitch
	ElseIf StringInStr($aRes[0], "-1") <> 0 Then
		SetLog("DLL Error", $COLOR_RED)
		Return
	EndIf	
		
	Switch $ValueReturned
		Case "BC1" ; coordinates of first/one image found + boolean value

			Local $aResult = "", $Name = ""
			Local $KeyValue = StringSplit($aRes[0], "|", $STR_NOCOUNT)
			For $i = 0 To UBound($KeyValue) - 1
				Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
				If UBound(decodeSingleCoord($DLLRes[0])) > 1 Then $aResult &= $DLLRes[0] & "|"
			Next
			If StringRight($aResult, 1) = "|" Then $aResult = StringLeft($aResult, (StringLen($aResult) - 1))
			Local $aCords = decodeMultipleCoords($aResult, 60, 10, 1)
			If UBound($aCords) = 0 Then Return False ; should never happen, but it did...
			Local $aCord = $aCords[0] ; sorted by Y
			If UBound($aCord) < 2 Then Return False ; should never happen, but anyway...
			$g_iQuickMISX = $aCord[0]
			$g_iQuickMISY = $aCord[1]
			$g_iQuickMISWOffSetX = $aCord[0] + $Left ;Update X with offset of Left
			$g_iQuickMISWOffSetY = $aCord[1] + $Top ;Update Y with offset of Top

			$Name = RetrieveImglocProperty($KeyValue[0], "objectname")

			If $g_bDebugSetlog Or $Debug Then
				SetDebugLog($ValueReturned & " Found: " & $aResult & ", using " & $g_iQuickMISX & "," & $g_iQuickMISY, $COLOR_PURPLE)
				If $g_bDebugImageSave Then DebugQuickMIS($Left, $Top, "BC1_detected[" & $Name & "_" & $g_iQuickMISWOffSetX & "x" & $g_iQuickMISWOffSetY & "]")
			EndIf

			Return True

		Case "CX" ; coordinates of each image found - eg: $Array[0] = [X1, Y1] ; $Array[1] = [X2, Y2]

			Local $aResult = ""
			Local $KeyValue = StringSplit($aRes[0], "|", $STR_NOCOUNT)
			For $i = 0 To UBound($KeyValue) - 1
				Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
				If UBound(decodeSingleCoord($DLLRes[0])) > 1 Then $aResult &= $DLLRes[0] & "|"
			Next
			If StringRight($aResult, 1) = "|" Then $aResult = StringLeft($aResult, (StringLen($aResult) - 1))
			If $g_bDebugSetlog Then SetDebugLog($ValueReturned & " Found: " & $aResult, $COLOR_PURPLE)
			Local $CoordsInArray = StringSplit($aResult, "|", $STR_NOCOUNT)
			Return $CoordsInArray

		Case "N1" ; name of first file found

			Local $MultiImageSearchResult = StringSplit($aRes[0], "|")
			Local $FilenameFound = StringSplit($MultiImageSearchResult[1], "_")
			Return $FilenameFound[1]

		Case "NX" ; names of all files found

			Local $AllFilenamesFound = ""
			Local $MultiImageSearchResult = StringSplit($aRes[0], "|")
			For $i = 1 To $MultiImageSearchResult[0]
				Local $FilenameFound = StringSplit($MultiImageSearchResult[$i], "_")
				$AllFilenamesFound &= $FilenameFound[1] & "|"
			Next
			If StringRight($AllFilenamesFound, 1) = "|" Then $AllFilenamesFound = StringLeft($AllFilenamesFound, (StringLen($AllFilenamesFound) - 1))
			Return $AllFilenamesFound

		Case "Q1" ; quantity of first/one tiles found

			Local $aResult = ""
			Local $KeyValue = StringSplit($aRes[0], "|", $STR_NOCOUNT)
			For $i = 0 To UBound($KeyValue) - 1
				Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "totalobjects")
				$aResult &= $DLLRes[0] & "|"
			Next
			If StringRight($aResult, 1) = "|" Then $aResult = StringLeft($aResult, (StringLen($aResult) - 1))
			If $g_bDebugSetlog Then SetDebugLog($ValueReturned & " Found: " & $aResult, $COLOR_PURPLE)
			Local $QuantityInArray = StringSplit($aResult, "|", $STR_NOCOUNT)
			Return $QuantityInArray[0]

		Case "QX" ; quantity of files found

			Local $MultiImageSearchResult = StringSplit($aRes[0], "|", $STR_NOCOUNT)
			Return UBound($MultiImageSearchResult)

		Case "N1Cx1" ;Name of first File Found And it's 1st Cords Array[2] -> Array[0] = Name , Array[1] = [X, Y]

			Local $NameAndCords[2]
			Local $aResult = "", $Name = ""
			Local $KeyValue = StringSplit($aRes[0], "|", $STR_NOCOUNT)
			For $i = 0 To UBound($KeyValue) - 1
				Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
				If UBound(decodeSingleCoord($DLLRes[0])) > 1 Then $aResult &= $DLLRes[0] & "|"
			Next
			If StringRight($aResult, 1) = "|" Then $aResult = StringLeft($aResult, (StringLen($aResult) - 1))
			Local $aCords = decodeMultipleCoords($aResult, 60, 10, 1)
			If UBound($aCords) = 0 Then Return 0 ; should never happen, but it did...
			Local $aCord = $aCords[0]
			If UBound($aCord) < 2 Then Return 0 ; should never happen, but anyway...
			$aCord[0] = $aCord[0] + $Left
			$aCord[1] = $aCord[1] + $Top

			$Name = RetrieveImglocProperty($KeyValue[0], "objectname")

			$NameAndCords[0] = $Name
			$NameAndCords[1] = $aCord

			If $g_bDebugSetlog Or $Debug Then
				SetDebugLog($ValueReturned & " Found: " & $Name & ", using " & $aCord[0] & "," & $aCord[1], $COLOR_PURPLE)
			EndIf

			Return $NameAndCords

		Case "NxCx" ; Array[x][2]  , Array[x][0] = Name , Array[x][1] = is an Array with Coordinates
			Local $KeyValue = StringSplit($aRes[0], "|", $STR_NOCOUNT)
			Local $Name = ""
			Local $aPositions, $aCoords, $aCord, $level
			SetDebugLog("Detected : " & UBound($KeyValue) & " tiles")
			Local $AllFilenamesFound[UBound($KeyValue)][3]
			For $i = 0 To UBound($KeyValue) - 1
				$Name = RetrieveImglocProperty($KeyValue[$i], "objectname")
				$aPositions = RetrieveImglocProperty($KeyValue[$i], "objectpoints")
				$level = RetrieveImglocProperty($KeyValue[$i], "objectlevel")
				SetDebugLog("Name: " & $Name)
				$aCoords = decodeMultipleCoords($aPositions, 20, 0, 0) ; dedup coords by x on 50 pixel ;
				SetDebugLog("How many $aCoords: " & UBound($aCoords))
				$AllFilenamesFound[$i][0] = $Name
				$AllFilenamesFound[$i][1] = $aCoords
				$AllFilenamesFound[$i][2] = $level
			Next
			Return $AllFilenamesFound
		Case "OCR" ; Names of all files found, put together as a string in accordance with their coordinates left - right

			Local $sOCRString = ""
			Local $aResults[1][2] = [[-1, ""]] ; X_Coord & Name

			Local $KeyValue = StringSplit($aRes[0], "|", $STR_NOCOUNT)
			For $i = 0 To UBound($KeyValue) - 1
				Local $DLLRes = DllCallMyBot("GetProperty", "str", $KeyValue[$i], "str", "objectpoints")
				Local $Name = RetrieveImglocProperty($KeyValue[$i], "objectname")

				Local $aCoords = StringSplit($DLLRes[0], "|", $STR_NOCOUNT)

				For $j = 0 To UBound($aCoords) - 1 ; In case found 1 char multiple times, $j > 0
					Local $aXY = StringSplit($aCoords[$j], ",", $STR_NOCOUNT)
					ReDim $aResults[UBound($aResults) + 1][2]
					$aResults[UBound($aResults) - 2][0] = Number($aXY[0])
					$aResults[UBound($aResults) - 2][1] = $Name
				Next
			Next

			_ArrayDelete($aResults, UBound($aResults) - 1)
			_ArraySort($aResults)

			For $i = 0 To UBound($aResults) - 1
				SetDebugLog($i & ". $Name = " & $aResults[$i][1] & ", Coord = " & $aResults[$i][0])
				If $i >= 1 Then
					If $aResults[$i][1] = $aResults[$i - 1][1] And Abs($aResults[$i][0] - $aResults[$i - 1][0]) <= $OcrDecode Then ContinueLoop
					If Abs($aResults[$i][0] - $aResults[$i - 1][0]) > $OcrSpace Then $sOCRString &= " "
				EndIf
				$sOCRString &= $aResults[$i][1]
			Next
			SetDebugLog("QuickMIS " & $ValueReturned & ", $sOCRString: " & $sOCRString)

			Return $sOCRString
		Case Else
			SetLog("Bad parameters during QuickMIS call for MultiSearch...", $COLOR_RED)
			Return
	EndSwitch
EndFunc   ;==>QuickMIS

Func DebugQuickMIS($x, $y, $DebugText)

	_CaptureRegion2()
	Local $subDirectory = $g_sProfileTempDebugPath & "QuickMIS"
	DirCreate($subDirectory)
	Local $Date = @YEAR & "-" & @MON & "-" & @MDAY
	Local $Time = @HOUR & "." & @MIN & "." & @SEC
	Local $filename = String($Date & "_" & $Time & "_" & $DebugText & "_.png")
	Local $editedImage = _GDIPlus_BitmapCreateFromHBITMAP($g_hHBitmap2)
	Local $hGraphic = _GDIPlus_ImageGetGraphicsContext($editedImage)
	Local $hPenRED = _GDIPlus_PenCreate(0xFFFF0000, 3) ; Create a pencil Color FF0000/RED

	_GDIPlus_GraphicsDrawRect($hGraphic, $g_iQuickMISX - 5 + $x, $g_iQuickMISY - 5 + $y, 10, 10, $hPenRED)

	_GDIPlus_ImageSaveToFile($editedImage, $subDirectory & "\" & $filename)
	_GDIPlus_PenDispose($hPenRED)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_BitmapDispose($editedImage)

EndFunc   ;==>DebugQuickMIS

Func _ImageSearchXMLBoludoz($XmlPath, $Quantity2Match = 0, $sArea2Search = "0,0,860,644", $bForceArea = True, $DebugLog = False, $checkDuplicatedpoints = False, $Distance2check = 25, $iMaxLevel = 0)

	;#cs - Disabled more fasther
	;If Not IsInt($Quantity2Match) Then $Quantity2Match = 0
	;If Not IsString($Area2Search) Then $Area2Search = "0,0,860,644" ; RC Done
	;If Not IsBool($bForceArea) Then $bForceArea = True
	;If Not IsBool($DebugLog) Then $DebugLog = False
	;#ce

	Local $aScreen = StringSplit($sArea2Search, ",", 2)
	
	For $iArray = 0 To UBound($aScreen) - 1
		$aScreen[$iArray] = Int($aScreen[$iArray])
	Next

	If $bForceArea Then _CaptureGameScreen($g_hHBitmap2, $aScreen[0], $aScreen[1], $aScreen[2], $aScreen[3])
	Local $hStarttime = _Timer_Init()

	Local $aRes = DllCallMyBot("SearchMultipleTilesBetweenLevels", "handle", $g_hHBitmap2, "str", $XmlPath, "str", "FV", "Int", $Quantity2Match, "str", $sArea2Search, "Int", 0, "Int", $iMaxLevel)
	If @error Then _logErrorDLLCall($g_sLibMyBotPath, @error) 
	
	If not IsArray($aRes) Then 
		If $g_bDebugSetlog Then SetLog("_ImageSearchXMLBoludoz FAIL", $COLOR_RED)
		Return
	ElseIf StringInStr($aRes[0], "-1") <> 0 Then
		SetLog("DLL Error", $COLOR_RED)
		Return
	EndIf	
    ;
	;
	;Local $Name = ""
	;SetDebugLog("Detected : " & UBound($KeyValue) & " tiles")
	
	Local $KeyValue = StringSplit($aRes[0], "|", $STR_NOCOUNT)
	Local $aResults[UBound($KeyValue)][3]
	
	If $DebugLog Then SetLog("Original string: " & $KeyValue[0], $COLOR_DEBUG)
	If $DebugLog Then Setlog("NewImage, Benchmark: " & StringFormat("%.2f", _Timer_Diff($hStarttime)) & "'ms !", $COLOR_DEBUG)

	For $i = 0 To UBound($KeyValue) - 1
		$aResults[$i][0] = DllCall($g_hLibMyBot, "str", "GetProperty", "str", $KeyValue[$i], "str", "objectname")
		$aResults[$i][1] = decodeMultipleCoords(RetrieveImglocProperty($KeyValue[$i], "objectpoints"), 20, 0, 0)
		$aResults[$i][2] = DllCall($g_hLibMyBot, "str", "GetProperty", "str", $KeyValue[$i], "str", "objectlevel")
	Next

	Local $aAllResults[0][4], $aCoordinates, $aCoord
	;#cs
	;For $i = 0 To UBound($aResults) - 1
	;	;If Not $g_bRunState Then Return
	;	$aCoordinates = Null
	;	$aCoordinates = $aResults[$i][1]
	;	For $j = 0 To UBound($aResults[$i][1]) - 1
	;		$aCoord = Null
	;		$aCoord = $aCoordinates[$j]
	;		;SetDebugLog(" - " & $aResults[$i][0] & " at (" & $aCoord[0] + $aScreen[0] & "," & $aCoord[1] + $aScreen[1] & ")")
	;		ReDim $aAllResults[UBound($aAllResults) + 1][4]
	;		$aAllResults[UBound($aAllResults) - 1][0] = $aResults[$i][0] ; NAME
	;		$aAllResults[UBound($aAllResults) - 1][1] = Number($aCoord[1]) ;$aResults[$j][1] + $aScreen[0] ; X axis
	;		$aAllResults[UBound($aAllResults) - 1][2] = Number($aCoord[2]) ;$aResults[$j][1] + $aScreen[1] ; Y axis
	;		$aAllResults[UBound($aAllResults) - 1][3] = Number($aResults[$i][2]) ; Level
	;	Next
	;Next
	;#ce
	For $i = 0 To UBound($aResults) - 1
		;If Not $g_bRunState Then Return
		$aCoordinates = Null
		$aCoordinates = $aResults[$i][1]
		For $j = 0 To UBound($aCoordinates) - 1
			$aCoord = Null
			$aCoord = $aCoordinates[$j]
			;SetDebugLog(" - " & $aResults[$i][0] & " at (" & $aCoord[0] + $aScreen[0] & "," & $aCoord[1] + $aScreen[1] & ")")
			ReDim $aAllResults[UBound($aAllResults) + 1][4]
			$aAllResults[UBound($aAllResults) - 1][0] = $aResults[$i][0] ; NAME
			$aAllResults[UBound($aAllResults) - 1][1] = Number($aCoord[0] + $aScreen[0]) ; X axis
			$aAllResults[UBound($aAllResults) - 1][2] = Number($aCoord[1] + $aScreen[1]) ; Y axis
			$aAllResults[UBound($aAllResults) - 1][3] = $aResults[$i][2] ; Level
		Next
	Next

	; USER LOG
	For $i = 0 To UBound($aAllResults) - 1
		If $DebugLog Then SetLog("Detected " & $aAllResults[$i][0] & " Level " & $aAllResults[$i][3] & " at (" & $aAllResults[$i][1] & "," & $aAllResults[$i][2] & ")", $COLOR_INFO)
	Next

	If ($g_bDebugImageSave Or $DebugLog) And UBound($aAllResults) < 50 Then ; Discard Deploy Points Touch much text on image
		_CaptureRegion2()

		Local $sSubDir = $g_sProfileTempDebugPath & "_ImageSearchXMLBoludoz"

		DirCreate($sSubDir)

		Local $sDate = @YEAR & "-" & @MON & "-" & @MDAY, $sTime = @HOUR & "." & @MIN & "." & @SEC
		Local $sDebugImageName = String($sDate & "_" & $sTime & "_.png")
		Local $hEditedImage = _GDIPlus_BitmapCreateFromHBITMAP($g_hHBitmap2)
		Local $hGraphic = _GDIPlus_ImageGetGraphicsContext($hEditedImage)
		Local $hPenRED = _GDIPlus_PenCreate(0xFFFF0000, 3)

		For $i = 0 To UBound($aAllResults) - 1
			addInfoToDebugImage($hGraphic, $hPenRED, $aAllResults[$i][0] & "_" & $aAllResults[$i][3], $aAllResults[$i][1], $aAllResults[$i][2])
		Next

		_GDIPlus_ImageSaveToFile($hEditedImage, $sSubDir & "\" & $sDebugImageName)
		_GDIPlus_PenDispose($hPenRED)
		_GDIPlus_GraphicsDispose($hGraphic)
		_GDIPlus_BitmapDispose($hEditedImage)
	EndIf

	If $checkDuplicatedpoints And UBound($aAllResults) > 0 Then
		; Sort by X axis
		_ArraySort($aAllResults, 0, 0, 0, 1)

		; Distance in pixels to check if is a duplicated detection , for deploy point will be 5
		Local $D2Check = $Distance2check

		; check if is a double Detection
		Local $Dime = 0
		For $i = 0 To UBound($aAllResults) - 1
			If $i > UBound($aAllResults) - 1 Then ExitLoop
			Local $LastCoordinate[4] = [$aAllResults[$i][0], $aAllResults[$i][1], $aAllResults[$i][2], $aAllResults[$i][3]]
			SetDebugLog("Coordinate to Check: " & _ArrayToString($LastCoordinate))
			If UBound($aAllResults) > 1 Then
				For $j = 0 To UBound($aAllResults) - 1
					If $j > UBound($aAllResults) - 1 Then ExitLoop
					Local $SingleCoordinate[4] = [$aAllResults[$j][0], $aAllResults[$j][1], $aAllResults[$j][2], $aAllResults[$j][3]]
					If $LastCoordinate[1] <> $SingleCoordinate[1] Or $LastCoordinate[2] <> $SingleCoordinate[2] Then
						If Int($SingleCoordinate[1]) < Int($LastCoordinate[1]) + $D2Check And Int($SingleCoordinate[1]) > Int($LastCoordinate[1]) - $D2Check And _
								Int($SingleCoordinate[2]) < Int($LastCoordinate[2]) + $D2Check And Int($SingleCoordinate[2]) > Int($LastCoordinate[2]) - $D2Check Then
							_ArrayDelete($aAllResults, $j)
						EndIf
					Else
						If $LastCoordinate[1] = $SingleCoordinate[1] And $LastCoordinate[2] = $SingleCoordinate[2] And $LastCoordinate[3] <> $SingleCoordinate[3] Then
							_ArrayDelete($aAllResults, $j)
						EndIf
					EndIf
				Next
			EndIf
		Next
	EndIf
	;_ArrayDisplay($aAllResults)
	If (UBound($aAllResults) > 0) Then
		Return $aAllResults
	Else
		Return -1
	EndIf

EndFunc   ;==>BuilderBaseBuildingsDetection
#ce
Func _ImageSearchXMLMyBot($XmlPath, $Quantity2Match = 0, $sArea2Search = "0,0,"&$g_iGAME_WIDTH&","&$g_iGAME_HEIGHT, $bForceArea = True, $DebugLog = False, $checkDuplicatedpoints = False, $Distance2check = 25, $iLevel = 0)
		Return _ImageSearchXMLBoludoz($XmlPath, $Quantity2Match, $sArea2Search, $bForceArea, $DebugLog, $checkDuplicatedpoints, $Distance2check, $iLevel)
EndFunc   ;==>_ImageSearchXMLMyBot

Func _ImageSearchBundlesMyBot($XmlPath, $Quantity2Match = 0, $sArea2Search = "0,0,"&$g_iGAME_WIDTH&","&$g_iGAME_HEIGHT, $bForceArea = True, $DebugLog = False, $checkDuplicatedpoints = False, $Distance2check = 25, $iLevel = 0)
	If Not FileExists($XmlPath) Then
		SetLog("Please verify the Bundle Path! File doesn't exist!", $COLOR_DEBUG)
		Return -1
	EndIf
	
	Return _ImageSearchXMLBoludoz($XmlPath, $Quantity2Match, $sArea2Search, $bForceArea, $DebugLog, $checkDuplicatedpoints, $Distance2check, $iLevel)
EndFunc   ;==>_ImageSearchBundlesMyBot

Func _DebugFailedImageDetection($Text)
	If $g_bDebugImageSave Or $g_bDebugSetlog Then
		_CaptureRegion2()
		Local $sSubDir = $g_sProfileTempDebugPath & "NewImageDetectionFails"
		DirCreate($sSubDir)
		Local $sDate = @YEAR & "-" & @MON & "-" & @MDAY
		Local $sTime = @HOUR & "." & @MIN & "." & @SEC
		Local $sDebugImageName = String($sDate & "_" & $sTime & "__" & $Text & "_.png")
		Local $hEditedImage = _GDIPlus_BitmapCreateFromHBITMAP($g_hHBitmap2)
		_GDIPlus_ImageSaveToFile($hEditedImage, $sSubDir & "\" & $sDebugImageName)
		_GDIPlus_BitmapDispose($hEditedImage)
	EndIf
EndFunc   ;==>_DebugFailedImageDetection
