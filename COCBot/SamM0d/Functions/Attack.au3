#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Boldina(Boludoz)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
	
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
			
		If $g_iSliderLB <> 0 Then 
			$g_iSliderLB = Number($g_iSliderLB)
			Else
			$g_iSliderLB = 1
		EndIf

		GUICtrlSetData($g_hSliderDB, $g_iSliderDB)
		$g_iSliderDB = GUICtrlRead($g_hSliderDB)

		If $g_iSliderDB <> 0 Then 
			$g_iSliderDB = Number($g_iSliderDB)
			Else
			$g_iSliderDB = 1
		EndIf

		SetDebugLog($g_hSliderLB & ", " & $g_hSliderDB & ", " & $g_iMultWaitCVS)

If GUICtrlRead($g_hRadioCVSwait1) = $GUI_CHECKED Then
		GUICtrlSetState($g_hRadioCVSwait2, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait3, $GUI_UNCHECKED)
		$g_iMultWaitCVS = 0
	ElseIf GUICtrlRead($g_hRadioCVSwait2) = $GUI_CHECKED Then
		GUICtrlSetState($g_hRadioCVSwait1, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait3, $GUI_UNCHECKED)
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
		$g_iMultWaitCVS = 1
	Else
		GUICtrlSetState($g_hRadioCVSwait1, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait2, $GUI_UNCHECKED)
		GUICtrlSetState($g_hRadioCVSwait3, $GUI_CHECKED)
		$g_iMultWaitCVS = 1
	EndIf
	
	Local $speedText
	GUICtrlSetData($lbltxtSelectedSpeedDB, $g_iSliderDB & "x" & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))
	GUICtrlSetData($lbltxtSelectedSpeedAB, $g_iSliderLB & "x" & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))
	GUICtrlSetData($lbltxtSelectedSpeedWaitCVS, $g_iMultWaitCVS & "x" & " " &  GetTranslatedFileIni("sam m0d", "speed", "speed"))

EndFunc   ;==>AttackGUICheckboxControl