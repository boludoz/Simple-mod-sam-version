
; #FUNCTION# ====================================================================================================================
; Name ..........: CloseCoC
; Description ...: Kill then restart CoC
; Syntax ........: CloseCoC($ReOpenCoC = False)
; Parameters ....:
; Return values .: None
; Author ........: The Master (06-2015)
; Modified ......: cosote (12-2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func CloseCoC($ReOpenCoC = False, $bCheckRunState = True)
	FuncEnter(CloseCoC)
	$g_bSkipFirstZoomout = False
	ResumeAndroid()
	If $bCheckRunState And Not $g_bRunState Then Return FuncReturn()

	Local $Adb = ""
	If $ReOpenCoC Then
		SetLog("Please wait for CoC restart......", $COLOR_ERROR) ; Let user know we need time...
	Else
		SetLog("Closing CoC......", $COLOR_ERROR) ; Let user know what we do...
	EndIf
	WinGetAndroidHandle()
	If $bCheckRunState And Not $g_bRunState Then Return FuncReturn()

    ; samm0d - check game client close
	For $j = 0 To 20
		If _Sleep(300) Then Return
		AndroidAdbSendShellCommand("am force-stop " & $g_sAndroidGamePackage, Default, Default, False)
		If GetAndroidProcessPID(Default, False) = 0 Then ExitLoop
        If $g_iSamM0dDebug Then SetLog("Waiting game client close..." & $j, $COLOR_INFO)
		If $j > 20 Then SetLog("Failed to close game client.", $COLOR_ERROR)
    Next
	

	ResetAndroidProcess()
	;_Sleep($DELAYCLOSEOPEN3000) 
	_Sleep(300) ; fast
	; end samm0d
	If $bCheckRunState And Not $g_bRunState Then Return FuncReturn()
	If $ReOpenCoC Then
		OpenCoC()
		$g_bRestart = True
	EndIf
	FuncReturn()
EndFunc   ;==>CloseCoC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; #FUNCTION# ====================================================================================================================
; Name ..........: OpenCoC
; Description ...: Open Clash of clans
; Syntax ........: OpenCoC()
; Parameters ....:
; Return values .: None
; Author ........: The Master (2015)
; Modified ......: cosote (Dec 2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func OpenCoC()
	FuncEnter(OpenCoC)
	ResumeAndroid()
	If Not $g_bRunState Then Return FuncReturn()

	Local $RunApp = "", $iCount = 0
	WinGetAndroidHandle()
	;AndroidHomeButton()
	If _Sleep($DELAYCLOSEOPEN500) Then Return FuncReturn()
	If Not $g_bRunState Then Return FuncReturn()
	If Not StartAndroidCoC() Then Return FuncReturn()
	While _CheckPixel($aIsMain, True) = False ; Wait for MainScreen
		$iCount += 1
		If _Sleep($DELAYCLOSEOPEN500) Then Return FuncReturn()
		If checkObstacles() Then $iCount += 1
		If $iCount > 250 Then ExitLoop ; samm0d bld
		If Not $g_bRunState Then ExitLoop
	    Sleep(100) ; CPU Strees out - samm0d bld
	WEnd
	; samm0d bld
    ; Let's Rearm and check tombs
    ;$g_abNotNeedAllTime[0] = True
    $g_abNotNeedAllTime[1] = True
	FuncReturn()
EndFunc   ;==>OpenCoC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; #FUNCTION# ====================================================================================================================
; Name ..........: WaitnOpenCoC
; Description ...: Waits for specified time before restarting Coc
; Syntax ........: WaitnOpenCoC($iWaitTime)
; Parameters ....: $iWaitTime           - Time to wait in milliseconds.
;				   $bFullRestart        - Optional boolean flag if function needs to clean up mis windows after opening CoC
;                  $bSuspendComputer    - Optional boolean to put computer into sleep and resume again
; Return values .: None
; Author ........: KnowJack (Aug 2015)
; Modified ......: TheMaster (2015), cosote (Dec 2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func WaitnOpenCoC($iWaitTime, $bFullRestart = False, $bSuspendComputer = False, $bLockBotSlot = False)
	FuncEnter(WaitnOpenCoC)
	Return FuncReturn(_WaitnOpenCoC($iWaitTime, $bFullRestart, $bSuspendComputer, $bLockBotSlot))
EndFunc   ;==>WaitnOpenCoC

Func _WaitnOpenCoC($iWaitTime, $bFullRestart = False, $bSuspendComputer = False, $bLockBotSlot = False)
	ResumeAndroid()
	If Not $g_bRunState Then Return

	Local $RunApp = ""
	Local $sWaitTime = ""
	Local $iMin, $iSec, $iHour, $iWaitSec
	WinGetAndroidHandle()
	;AndroidHomeButton()
	$iWaitSec = Round($iWaitTime / 1000)
	$iHour = Floor(Floor($iWaitSec / 60) / 60)
	$iMin = Floor(Mod(Floor($iWaitSec / 60), 60))
	$iSec = Floor(Mod($iWaitSec, 60))
	If $iHour > 0 Then $sWaitTime &= $iHour & " hours "
	If $iMin > 0 Then $sWaitTime &= $iMin & " minutes "
	If $iSec > 0 Then $sWaitTime &= $iSec & " seconds "
	SetLog("Waiting " & $sWaitTime & "before starting CoC", $COLOR_SUCCESS)
	ReduceBotMemory()
	Local $hTimer = __TimerInit()
	If $bSuspendComputer Then SuspendComputer($iWaitTime)
	If _SleepStatus($iWaitTime, True, True, True, $hTimer) Then Return False ; Wait for server to see log off

	If $bLockBotSlot = True Then
		LockBotSlot(True)
	EndIf
	If Not $g_bRunState Then Return

	If Not StartAndroidCoC() Then Return
	If Not $g_bRunState Then Return

	If $g_bDebugSetlog Then SetDebugLog("CoC Restarted, Waiting for completion", $COLOR_DEBUG)

	If $bFullRestart Then
		checkMainScreen() ; Use checkMainScreen to restart CoC, and waitMainScreen to handle Take A Break wait, or other errors.
		$g_bRestart = True
	Else
		waitMainScreen()
	EndIf

EndFunc   ;==>_WaitnOpenCoC

; #FUNCTION# ====================================================================================================================
; Name ..........: PoliteCloseCoC
; Description ...: Send Home button now (more realist and simple)
; Syntax ........: PoliteCloseCoC([$sSource = "Unknown_"])
; Parameters ....: $sSource             - [optional] a string value. Default is "Unknown_".
; Return values .: None
; Author ........: MonkeyHunter (05-2016), MMHK (11-2016)
; Modified ......: Boludoz (10/2/2019)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func PoliteCloseCoC($sSource = "Unknown_", $bPoliteCloseCoC = $g_bPoliteCloseCoC)
	$g_bSkipFirstZoomout = False
	#cs
	If $bPoliteCloseCoC Then
		; polite close
		If $g_sAndroidGameDistributor = $g_sGoogle Then
            checkObstacles()
            AndroidBackButton()
            ; samm0d
            If _Wait4Pixel(465,445,0x6CBB1F,10,2000,100,"PoliteCloseCoC") = True Then
                PureClick(514, 427, 1, 50, "#0117") ; Click Okay Button
            Else
                SetLog("Can not find Okay button to exit CoC, Forcefully Closing CoC", $COLOR_ERROR)
                If $g_bDebugImageSave Then DebugImageSave($sSource)
                CloseCoC()
            EndIf
			Local $i = 0 ; Reset Loop counter
			While 1
				checkObstacles()
				AndroidBackButton()
				If _Sleep($DELAYCLOSEOPEN1000) Then Return ; wait for window to open
				If ClickOkay("ExitOkay_" & $sSource, True) = True Then ExitLoop ; Confirm okay to exit
				If $i > 10 Then
					SetLog("Can not find Okay button to exit CoC, Forcefully Closing CoC", $COLOR_ERROR)
					If $g_bDebugImageSave Then DebugImageSave($sSource)
					CloseCoC()
					ExitLoop
				EndIf
				$i += 1
				If Not $g_bRunState Then ExitLoop
			WEnd
		Else
			Local $btnExit
			Local $i = 0 ; Reset Loop counter
			While 1
				checkObstacles()
				AndroidBackButton()
				If _Sleep($DELAYCLOSEOPEN1000) Then Return ; wait for window to open
				Switch $g_sAndroidGameDistributor
					Case "Kunlun", "Huawei", "Kaopu", "Microvirt", "Yeshen", "Qihoo", "Baidu", "OPPO", "Anzhi", "Lenovo", "Aiyouxi"
						$btnExit = FindExitButton($g_sAndroidGameDistributor)
						If IsArray($btnExit) Then
							Click($btnExit[0], $btnExit[1])
							ExitLoop
						EndIf
					Case "9game"
						If _Sleep($DELAYCLOSEOPEN2000) Then Return ; wait more
						$btnExit = FindExitButton($g_sAndroidGameDistributor)
						If IsArray($btnExit) Then
							Click($btnExit[0] + 71, $btnExit[1] + 64) ; click offsets for the transparent window
							If $g_bDebugSetlog Then SetDebugLog($g_sAndroidGameDistributor & " Click offset X|Y = 71|64", $COLOR_DEBUG)
							ExitLoop
						EndIf
					Case "VIVO", "Xiaomi"
						$btnExit = FindExitButton($g_sAndroidGameDistributor)
						If IsArray($btnExit) Then
							Click($btnExit[0], $btnExit[1], 2, $DELAYCLOSEOPEN3000) ; has to click twice slowly
							ExitLoop
						EndIf
					Case "Guopan"
						$btnExit = FindExitButton($g_sAndroidGameDistributor)
						If IsArray($btnExit) Then
							Click($btnExit[0], $btnExit[1])
						EndIf
						If _Sleep($DELAYCLOSEOPEN2000) Then Return ; wait for second window
						$btnExit = FindExitButton("Kunlun")
						If IsArray($btnExit) Then
							Click($btnExit[0], $btnExit[1])
							ExitLoop
						EndIf
					Case "Wandoujia/Downjoy", "Haimawan", "Leshi", "Tencent"
						ContinueCase
					Case Else
						SetLog("Polite Close Unsupported - " & $g_sAndroidGameDistributor & ", Forcefully Closing CoC", $COLOR_ERROR)
						If $g_bDebugImageSave Then DebugImageSave($sSource)
						CloseCoC()
						ExitLoop
				EndSwitch
				If $i > 10 Then
					SetLog("Can not find exit button: " & $g_sAndroidGameDistributor & ", Forcefully Closing CoC", $COLOR_ERROR)
					If $g_bDebugImageSave Then DebugImageSave($sSource)
					CloseCoC()
					ExitLoop
				EndIf
				$i += 1
				If Not $g_bRunState Then ExitLoop
			WEnd
		EndIf
	Else		; force-kill Game
		CloseCoC()
	EndIf

#ce
	If $bPoliteCloseCoC Then
	; samm0d - Realist and universal
	Local $iResult = -1
	Local $iResultString = -1
	
	AndroidHomeButton()
	Setlog("Closing the game like a barbarian.", $COLOR_YELLOW) 

	For $i = 0 To 20		
		$iResult = _AndroidAdbSendShellCommand("dumpsys window windows | grep -E 'mCurrentFocus'", Default)
		If $g_bDebugAndroid Then Setlog($iResult, $COLOR_YELLOW)
			$iResultString = StringInStr($iResult, $g_sAndroidGamePackage)
			If $iResultString = 0 Then 
				ExitLoop
			Else
				AndroidHomeButton()
				If $g_bDebugAndroid Then SetDebugLog("Used Adb to press home button", $COLOR_INFO)
			EndIf
			Sleep(150)
		Next
	EndIf
	
	If $g_bDebugImageSave Then DebugImageSave($sSource)
	
	; force-kill Game
	CloseCoC()

#cs - CloseCoC Do it
    ; samm0d - check game client close
	For $j = 0 To 20
		AndroidAdbSendShellCommand("am force-stop " & $g_sAndroidGamePackage, Default, Default, False)
		If GetAndroidProcessPID(Default, False) = 0 Then ExitLoop
        If $g_iSamM0dDebug Then SetLog("Waiting game client close..." & $j, $COLOR_INFO)
		If _Sleep(300) Then Return
    Next
	If $j > 20 Then SetLog("Failed to close game client.", $COLOR_ERROR)
#ce

	ResetAndroidProcess()
	ReduceBotMemory()
	
	If $i > 20 Then 
			Setlog("Send Home button - FAIL", $COLOR_ERROR)
			Return False
		Else
			Setlog("Send Home button - OK", $COLOR_GREEN)
			Return True
	EndIf

	If _Sleep($DELAYCLOSEOPEN1000) Then Return ; wait for window to close
	
EndFunc   ;==>PoliteCloseCoC
