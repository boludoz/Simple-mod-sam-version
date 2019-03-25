; #FUNCTION# ====================================================================================================================
; Name ..........: MBR Functions
; Description ...: This file Includes several files in the current script.
; Syntax ........: #include
; Parameters ....: None
; Return values .: None
; Author ........: Boludoz
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func CustomModLoop()
		; samm0d
		If $g_iSamM0dDebug = 1 And $g_bRestart Then SetLog("Continue loop with restart", $COLOR_DEBUG)
		If $ichkAutoDock = 1 Then
			If $g_bAndroidEmbedded = False Then
				btnEmbed()
			EndIf
		Else
			; samm0d - auto hide emulator
			If $g_bChkAutoHideEmulator Then
				If $g_bFlagHideEmulator = False Then
					If $g_bIsHidden = False Then
						btnHide()
						$g_bFlagHideEmulator = True
					EndIf
				EndIf
			EndIf
		EndIf

		;Check for debug wait command
		If FileExists(@ScriptDir & "\EnableMBRDebug.txt") Then
			While (FileReadLine(@ScriptDir & "\EnableMBRDebug.txt") = "wait")
				If _SleepStatus(15000) = True Then Return "Return"
			WEnd
		EndIf

		;Restart bot after these seconds
		If $b_iAutoRestartDelay > 0 And __TimerDiff($g_hBotLaunchTime) > $b_iAutoRestartDelay * 1000 Then
			If RestartBot(False) = True Then Return "Return"
		EndIf

		$g_bRestart = False
		$g_bFullArmy = False
		$bJustMakeDonate = False
		$bDonateAwayFlag = False
		$tempDisableBrewSpell = False
		$tempDisableTrain = False
		$bAvoidSwitch = False
		$g_iCommandStop = -1

		; samm0d switch
		If $ichkEnableMySwitch Then
			If $g_iSamM0dDebug = 1 Then SetLog("$bAvoidSwitch: " & $bAvoidSwitch)
			$bUpdateStats = True
			If $g_bIsClientSyncError = False And $g_bIsSearchLimit = False And ($g_bQuickAttack = False) Then
				DoSwitchAcc()
				If $g_bRestart = True Then Return "ContinueLoop"

				If _Sleep($DELAYRUNBOT1) Then Return "Return"
			    If NOT BitAND($g_bChkPlayBBOnly, IsOnBuilderBaseEz()) Then checkMainScreen()
				If $g_bRestart = True Then Return "ContinueLoop"

				If $ichkProfileImage = 1 Then ; check with image is that village load correctly
					If $bAvoidSwitch = False And $bChangeNextAcc = True Then
						If checkProfileCorrect() = True Then
							SetLog("Profile match with village.png, profile loaded correctly.", $COLOR_INFO)
							$iCheckAccProfileError = 0
							;$bProfileImageChecked = True
						Else
							SetLog("Profile not match with village.png, profile load failed.", $COLOR_ERROR)
							$iCheckAccProfileError += 1
							If $iCheckAccProfileError > 2 Then
								$iCheckAccProfileError = 0
								DoVillageLoadFailed()
							EndIf
							$iCurActiveAcc = -1
							ClickP($aAway,1,0)
							If _Sleep(1000) Then Return "Return"
							Return "ContinueLoop"
						EndIf
					EndIf
				EndIf
				If $g_iTownHallLevel = 0 And not $g_bEnableSkipBuild Then BotDetectFirstTime()
			Else
				If _Sleep($DELAYRUNBOT1) Then Return "Return"
			    If NOT BitAND($g_bChkPlayBBOnly, IsOnBuilderBaseEz()) Then checkMainScreen()
				If $g_bRestart = True Then Return "ContinueLoop"
			EndIf
			$iDoPerformAfterSwitch = True
		Else
			If _Sleep($DELAYRUNBOT1) Then Return "Return"
			If NOT BitAND($g_bChkPlayBBOnly, IsOnBuilderBaseEz()) Then checkMainScreen()
			If $g_bRestart = True Then Return "ContinueLoop"
		EndIf

		If $g_bChkPlayBBOnly Then
			SetLog("Let's Play Builder Base Only", $COLOR_INFO)
			runBuilderBase()
			$iDoPerformAfterSwitch = True
			DoSwitchAcc()
			If ProfileSwitchAccountEnabled() Then checkSwitchAcc() ; Forced to switch
			Return "ContinueLoop"
		EndIf
EndFunc   ;==>CustomSwitch
