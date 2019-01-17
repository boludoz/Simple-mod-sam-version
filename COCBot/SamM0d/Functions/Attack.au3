#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Boldina(Boludoz)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
	
;Ignore
;If IniRead($s, "", "", "False") = "True" Then $g_b = True
;$g_iGroup1 
;$g_iSliderLB
;$g_iSliderDB
;$g_iLabel1 
;$g_iLabel2 
;$g_iGroup2 
;$g_bRadioCVSspeed1 
;$g_bRadioCVSwait2 
;$g_bRadioCVSwait3 
;$g_iSliderWaitCVS
;$g_iLabel3 
; SliderWaitCVS
; SliderLB
; SliderDB
#include <Process.au3>
#include <Array.au3>
#include <WinAPIEx.au3>

Local $sIniFile = $g_sProfilePath & "\profile.ini"

Func AttackRead()
If IniRead($sIniFile, "AttackCVS", "RadioCVSwait1", "False") = "True" Then $g_bRadioCVSwait1 = True
If IniRead($sIniFile, "AttackCVS", "RadioCVSwait2", "False") = "True" Then $g_bRadioCVSwait2 = True
If IniRead($sIniFile, "AttackCVS", "RadioCVSwait3", "False") = "True" Then $g_bRadioCVSwait3 = True
$g_iSliderWaitCVS = IniRead($sIniFile, "AttackCVS", "SliderWaitCVS", "0")
$g_iSliderDB = IniRead($sIniFile, "AttackCVS", "SliderDB", "0")
$g_iSliderLB = IniRead($sIniFile, "AttackCVS", "SliderLB", "0")
EndFunc   ;==>AttackReadMessages

Func AttackGUICheckbox()


	$g_iSliderDB = GUICtrlRead($g_hSliderDB)
	$g_iSliderLB = GUICtrlRead($g_hSliderLB)
	$g_iSliderWaitCVS = GUICtrlRead($g_hSliderWaitCVS)

	$g_bRadioCVSwait1 = GUICtrlRead($g_hRadioCVSwait1) = $GUI_CHECKED
	$g_bRadioCVSwait2 = GUICtrlRead($g_hRadioCVSwait2) = $GUI_CHECKED
	$g_bRadioCVSwait3 = GUICtrlRead($g_hRadioCVSwait3) = $GUI_CHECKED
	
	IniWrite($sIniFile, "AttackCVS", "SliderLB", $g_iSliderLB)
	IniWrite($sIniFile, "AttackCVS", "SliderDB", $g_iSliderDB)
	IniWrite($sIniFile, "AttackCVS", "SliderWaitCVS", $g_iSliderWaitCVS)

	IniWrite($sIniFile, "AttackCVS", "RadioCVSwait1", $g_bRadioCVSwait1)
	IniWrite($sIniFile, "AttackCVS", "RadioCVSwait2", $g_bRadioCVSwait2)
	IniWrite($sIniFile, "AttackCVS", "RadioCVSwait3", $g_bRadioCVSwait3)
	
	AttackGUICheckboxControl()

EndFunc   ;==>AttackGUICheckbox

Func AttackGUICheckboxControl()
		GUICtrlSetData($g_hSliderLB, $g_iSliderLB)
		$g_iSliderLB = GUICtrlRead($g_hSliderLB)
		$g_iSlider[1] = $g_iSliderLB

		GUICtrlSetData($g_hSliderDB, $g_iSliderDB)
		$g_iSliderDB = GUICtrlRead($g_hSliderDB)
		$g_iSlider[0] = $g_iSliderDB
	
	
	For $i = 0 To UBound($g_iSlider) - 1
			If $g_iSlider[$i] > 0 Then $g_iSlider[$i] += 1
			If $g_iSlider[$i] < 0 Then $g_iSlider[$i] -= 0.1
			If $g_iSlider[$i] = 0 Then $g_iSlider[$i] = .1
			$g_iSlider[$i] = Number(StringReplace($g_iSlider[$i], "-", "."))	
			If $g_iSlider[$i] <= 1 Then $g_iSlider[$i] -= 1
			If $g_iSlider[$i] < 0 Then $g_iSlider[$i] *= -1

		Next
		SetDebugLog($g_iSlider[0] & ", " & $g_iSlider[1] & ", " & $g_iMultWaitCVS)
		;sldSelectedSpeedDB($g_iSlider[0])
		;sldSelectedSpeedAB($g_iSlider[1])
		;sldMultWaitCVSpeed($g_iMultWaitCVS)

If GUICtrlRead($g_hRadioCVSwait1) = $GUI_CHECKED Then
		GUICtrlSetState($g_hRadioCVSwait2, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait3, $GUI_UNCHECKED)
		;GUICtrlSetState($g_hSliderWaitCVS, $GUI_HIDE)
		$g_iMultWaitCVS = 0
	ElseIf GUICtrlRead($g_hRadioCVSwait2) = $GUI_CHECKED Then
		GUICtrlSetState($g_hRadioCVSwait1, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait3, $GUI_UNCHECKED)
		;GUICtrlSetState($g_hSliderWaitCVS, $GUI_SHOW)
		
		GUICtrlSetData($g_hSliderWaitCVS, $g_iSliderWaitCVS)	
		$g_iSliderWaitCVS = GUICtrlRead($g_hSliderWaitCVS)
			$g_iMultWaitCVS = $g_iSliderWaitCVS
			If $g_iMultWaitCVS > 0 Then $g_iMultWaitCVS += 1
			If $g_iMultWaitCVS < 0 Then $g_iMultWaitCVS -= 0.1
			If $g_iMultWaitCVS = 0 Then $g_iMultWaitCVS = .1
			$g_iMultWaitCVS = Number(StringReplace($g_iMultWaitCVS, "-", "."))	
			If $g_iMultWaitCVS <= 1 Then $g_iMultWaitCVS -= 1
			If $g_iMultWaitCVS < 0 Then $g_iMultWaitCVS *= -1

	ElseIf GUICtrlRead($g_hRadioCVSwait3) = $GUI_CHECKED Then
		GUICtrlSetState($g_hRadioCVSwait1, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait2, $GUI_UNCHECKED)
		;GUICtrlSetState($g_hSliderWaitCVS, $GUI_HIDE)
		$g_iMultWaitCVS = 1
	Else
		GUICtrlSetState($g_hRadioCVSwait1, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait2, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait3, $GUI_CHECKED)
		;GUICtrlSetState($g_hSliderWaitCVS, $GUI_HIDE)
		$g_iMultWaitCVS = 1
	EndIf
	
	;For $i = 0 To UBound($g_iSlider) - 1
	;GUICtrlSetState($g_iSlider[$i], $GUI_SHOW)
	;Next
	
	Local $speedText
	GUICtrlSetData($lbltxtSelectedSpeedDB, $g_iSlider[0] & "x" & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))
	GUICtrlSetData($lbltxtSelectedSpeedAB, $g_iSlider[1] & "x" & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))
	GUICtrlSetData($lbltxtSelectedSpeedWaitCVS, $g_iMultWaitCVS & "x" & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))

EndFunc   ;==>AttackGUICheckboxControl

#CS
; CSV Deployment Speed Mod
Func sldSelectedSpeedDB($iSlider = 0.9)
	$isldSelectedCSVSpeed[$DB] = $iSlider
	Local $speedText = $iSlider & "x";
	;IF $isldSelectedCSVSpeed[$DB] = 0.9 Then $speedText = GetTranslatedFileIni("sam m0d", "Normal", "Normal")
	GUICtrlSetData($lbltxtSelectedSpeedDB, $speedText & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))
EndFunc   ;==>sldSelectedSpeedDB

Func sldSelectedSpeedAB($iSlider = 0.9)
	$isldSelectedCSVSpeed[$LB] = $iSlider
	Local $speedText = $iSlider & "x";
	;IF $isldSelectedCSVSpeed[$LB] = 0.9 Then $speedText = GetTranslatedFileIni("sam m0d", "Normal", "Normal")
	GUICtrlSetData($lbltxtSelectedSpeedAB, $speedText & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))
EndFunc

Func sldMultWaitCVSpeed($iSlider = 0.9)
	$isldSelectedSpeedWaitCVS = $iSlider
	Local $speedText = $iSlider & "x";
	;IF $isldSelectedSpeedWaitCVS = 0.9 Then $speedText = GetTranslatedFileIni("sam m0d", "Normal", "Normal")
	GUICtrlSetData($lbltxtSelectedSpeedWaitCVS, $speedText & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))
EndFunc
#CE
;Func ChatbotGUICheckboxDisable()
;	For $i = $g_hChkGlobalChat To $g_hEditGeneric ; Save state of all controls on tabs
;		GUICtrlSetState($i, $GUI_DISABLE)
;	Next
;EndFunc   ;==>ChatbotGUICheckboxDisable
;Func ChatbotGUICheckboxEnable()
;	For $i = $g_hChkGlobalChat To $g_hEditGeneric ; Save state of all controls on tabs
;		GUICtrlSetState($i, $GUI_ENABLE)
;	Next
;	ChatbotGUICheckboxControl()
;EndFunc   ;==>ChatbotGUICheckboxEnable