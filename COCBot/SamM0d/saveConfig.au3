; #FUNCTION# ====================================================================================================================
; Name ..........: saveConfig.au3
; Description ...:
; Syntax ........:
; Parameters ....:
; Return values .:
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
;Chat IA
$g_sIAVar = _ArrayToString($g_aIAVar)
_Ini_Add("ChatIA", "String", $g_sIAVar)
;Local $g_sIAVar = _ArrayToString($g_aIAVar, "|", -1, -1, "#")
;_Ini_Add("ChatIA", "String", $g_sIAVar)

; AtkLog Color
_Ini_Add("AttackColorLog", "Enable", (GUICtrlRead($g_hChkColorfulAttackLog) = $GUI_CHECKED ? True : False ))

; Machine Date
_Ini_Add("MachineBB", "Date", $g_sMachineTime)

; First Run
_Ini_Add("Backup", "FirstRun", $g_bFirstRun)

; Backup check
_Ini_Add("Backup", "BackupControl", $g_bBackup)

; Multi Finger (LunaEclipse)
_Ini_Add("MultiFinger", "Select", _GUICtrlComboBox_GetCurSel($cmbDBMultiFinger))

; bot log
_Ini_Add("BotLogLineLimit", "Enable", (GUICtrlRead($chkBotLogLineLimit) = $GUI_CHECKED ? 1 : 0 ))
_Ini_Add("BotLogLineLimit", "LimitValue", GUICtrlRead($txtLogLineLimit))

; use Skip Build
_Ini_Add("EnableSkipBuild", "Enable", (GUICtrlRead($g_hEnableSkipBuild) = $GUI_CHECKED ? True : False ))

; donate only when troop pre train ready
_Ini_Add("EnableDonateWhenReady", "Enable", (GUICtrlRead($chkEnableDonateWhenReady) = $GUI_CHECKED ? 1 : 0 ))

; Enable Donate Hours
_Ini_Add("chkEnableDonateHours", "Enable", (GUICtrlRead($chkEnableDonateHours) = $GUI_CHECKED ? 1 : 0 ))

; stop bot when low battery
_Ini_Add("EnableStopBotWhenLowBattery", "Enable", (GUICtrlRead($chkEnableStopBotWhenLowBattery) = $GUI_CHECKED ? 1 : 0 ))

;~ ; Pause Tray Tip
;~ _Ini_Add("DisablePauseTrayTip", "Enable", (GUICtrlRead($chkDisablePauseTrayTip) = $GUI_CHECKED ? 1 : 0 ))

; prevent over donate
_Ini_Add("PreventOverDonate", "Enable", (GUICtrlRead($chkEnableLimitDonateUnit) = $GUI_CHECKED ? 1 : 0 ))
_Ini_Add("PreventOverDonate", "LimitValue", GUICtrlRead($txtLimitDonateUnit))

; max logout time
_Ini_Add("LogoutLimit", "Enable", (GUICtrlRead($chkEnableLogoutLimit) = $GUI_CHECKED ? 1 : 0 ))
_Ini_Add("LogoutLimit", "LimitValue", GUICtrlRead($txtLogoutLimitTime))

; Unit Wave Factor
_Ini_Add("SetSleep", "EnableUnitFactor", (GUICtrlRead($chkUnitFactor) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("SetSleep", "UnitFactor", GUICtrlRead($txtUnitFactor))
_Ini_Add("SetSleep", "EnableWaveFactor", (GUICtrlRead($chkWaveFactor) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("SetSleep", "WaveFactor", GUICtrlRead($txtWaveFactor))

;~ ; SmartZap Settings from ChaCalGyn (LunaEclipse) - DEMEN
;~ _Ini_Add("SamM0dZap", "SamM0dZap", (GUICtrlRead($chkUseSamM0dZap) = $GUI_CHECKED ? 1 : 0))
;~ _Ini_Add("SmartZap", "ZapDBOnly", (GUICtrlRead($chkSmartZapDB) = $GUI_CHECKED ? 1 : 0))
;~ _Ini_Add("SmartZap", "THSnipeSaveHeroes", (GUICtrlRead($chkSmartZapSaveHeroes) = $GUI_CHECKED ? 1 : 0))
;~ _Ini_Add("SmartZap", "MinDE", GUICtrlRead($txtMinDark2))
;~
;~ ; samm0d zap
;~ _Ini_Add("SamM0dZap", "UseSmartZapRnd", (GUICtrlRead($chkSmartZapRnd) = $GUI_CHECKED ? 1 : 0))
;~ _Ini_Add("SamM0dZap", "CheckDrillBeforeZap", (GUICtrlRead($chkDrillExistBeforeZap) = $GUI_CHECKED ? 1 : 0))
;~ _Ini_Add("SamM0dZap", "PreventTripleZap", (GUICtrlRead($chkPreventTripleZap) = $GUI_CHECKED ? 1 : 0))
;~ _Ini_Add("SamM0dZap", "MinDEGetFromDrill", GUICtrlRead($txtMinDEGetFromDrill))

; Check Collectors Outside
_Ini_Add("search", "DBMeetCollOutside", (GUICtrlRead($chkDBMeetCollOutside) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("search", "DBCollectorsNearRedline", (GUICtrlRead($chkDBCollectorsNearRedline) = $GUI_CHECKED  ? 1 : 0))
_Ini_Add("search", "RedlineTiles", _GUICtrlComboBox_GetCurSel($cmbRedlineTiles))
_Ini_Add("search", "SkipCollectorCheckIF", (GUICtrlRead($chkSkipCollectorCheckIF) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("search", "DBMinCollOutsidePercent", GUICtrlRead($txtDBMinCollOutsidePercent))
_Ini_Add("search", "SkipCollectorGold", GUICtrlRead($txtSkipCollectorGold))
_Ini_Add("search", "SkipCollectorElixir", GUICtrlRead($txtSkipCollectorElixir))
_Ini_Add("search", "SkipCollectorDark", GUICtrlRead($txtSkipCollectorDark))
_Ini_Add("search", "SkipCollectorCheckIFTHLevel", (GUICtrlRead($chkSkipCollectorCheckIFTHLevel) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("search", "IFTHLevel", GUICtrlRead($txtIFTHLevel))

; dropp cc first
_Ini_Add("CCFirst", "Enable", (GUICtrlRead($chkDropCCFirst) = $GUI_CHECKED ? 1 : 0))

; Check League For DeadBase
_Ini_Add("search", "DBNoLeague", (GUICtrlRead($chkDBNoLeague) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("search", "ABNoLeague", (GUICtrlRead($chkABNoLeague) = $GUI_CHECKED ? 1 : 0))

; HLFClick By Samkie
_Ini_Add("HLFClick", "EnableHLFClick", (GUICtrlRead($chkEnableHLFClick) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("HLFClick", "HLFClickDelayTime", GUICtrlRead($sldHLFClickDelayTime))
_Ini_Add("HLFClick", "EnableHLFClickSetlog", (GUICtrlRead($chkEnableHLFClickSetlog) = $GUI_CHECKED ? 1 : 0))

; samm0d ocr
_Ini_Add("GetMyOcr", "EnableCustomOCR4CCRequest", (GUICtrlRead($chkEnableCustomOCR4CCRequest) = $GUI_CHECKED ? 1 : 0))

; auto dock
_Ini_Add("AutoDock", "Enable", (GUICtrlRead($chkAutoDock) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("AutoHideEmulator", "Enable", (GUICtrlRead($chkAutoHideEmulator) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("AutoMinimizeBot", "Enable", (GUICtrlRead($chkAutoMinimizeBot) = $GUI_CHECKED ? 1 : 0))


; CSV Deployment Speed Mod
_Ini_Add("attack", "CSVSpeedDB", $isldSelectedCSVSpeed[$DB])
_Ini_Add("attack", "CSVSpeedAB", $isldSelectedCSVSpeed[$LB])
_Ini_Add("attack", "SpeedWaitCVS", $isldSelectedSpeedWaitCVS)

; check 4 cc
_Ini_Add("Check4CC", "Enable", (GUICtrlRead($chkCheck4CC) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("Check4CC", "WaitTime", GUICtrlRead($txtCheck4CCWaitTime))
; global delay increse
_Ini_Add("GlobalDelay", "Enable", (GUICtrlRead($chkIncreaseGlobalDelay) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("GlobalDelay", "DelayPercentage", GUICtrlRead($txtIncreaseGlobalDelay))

; stick to train page
_Ini_Add("StickToTrainPage", "Minutes", GUICtrlRead($txtStickToTrainWindow))

; My Troops
_Ini_Add("MyTroops", "EnableModTrain", (GUICtrlRead($g_hChkModTrain) = $GUI_CHECKED ? True : False))
_Ini_Add("MyTroops", "ForcePreTrainTroop", (GUICtrlRead($chkForcePreTrainTroops) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("MyTroops", "ForcePreTrainStrength", GUICtrlRead($txtForcePreTrainStrength))
_Ini_Add("MyTroops", "NoPreTrain", (GUICtrlRead($chkDisablePretrainTroops) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("MyTroops", "DeleteExcess", (GUICtrlRead($chkEnableDeleteExcessTroops) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("MyTroops", "Order", (GUICtrlRead($chkMyTroopsOrder) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("MyTroops", "TrainCombo", _GUICtrlComboBox_GetCurSel($cmbMyQuickTrain))

Local $itempcmbTroopSetting = _GUICtrlComboBox_GetCurSel($cmbTroopSetting)

_Ini_Add("MyTroops", "Composition", $itempcmbTroopSetting)
cmbTroopSetting()

For $j = 0 To 2
	For $i = 0 To UBound($MyTroops) - 1
		_Ini_Add("MyTroops", $MyTroops[$i][0] & $j, $MyTroopsSetting[$j][$i][0] & "|" & $MyTroopsSetting[$j][$i][1])
	Next
Next

; Spells
If GUICtrlRead($chkEnableDeleteExcessSpells) = $GUI_CHECKED Then
	_Ini_Add("MySpells", "DeleteExcess", 1)
Else
	_Ini_Add("MySpells", "DeleteExcess", 0)
EndIf

If GUICtrlRead($chkForcePreBrewSpell) = $GUI_CHECKED Then
	_Ini_Add("MySpells", "ForcePreBrewSpell", 1)
Else
	_Ini_Add("MySpells", "ForcePreBrewSpell", 0)
EndIf

If GUICtrlRead($chkMySpellsOrder) = $GUI_CHECKED Then
	_Ini_Add("MySpells", "Order", 1)
Else
	_Ini_Add("MySpells", "Order", 0)
EndIf

For $j = 0 To 2
	For $i = 0 To UBound($MySpells) - 1
		_Ini_Add("MySpells", $MySpells[$i][0] & $j, $MySpellSetting[$j][$i][0] & "|" & $MySpellSetting[$j][$i][1] & "|" & $MySpellSetting[$j][$i][2])
	Next
Next

; Sieges

_Ini_Add("MySieges", "TotalCountSiege", _GUICtrlComboBox_GetCurSel($g_hTxtTotalCountSiege))

If GUICtrlRead($chkEnableDeleteExcessSieges) = $GUI_CHECKED Then
	_Ini_Add("MySieges", "DeleteExcess", 1)
Else
	_Ini_Add("MySieges", "DeleteExcess", 0)
EndIf

If GUICtrlRead($chkForcePreSiegeBrewSiege) = $GUI_CHECKED Then
	_Ini_Add("MySieges", "ForcePreSiegeBrewSiege", 1)
Else
	_Ini_Add("MySieges", "ForcePreSiegeBrewSiege", 0)
EndIf

If GUICtrlRead($chkMySiegesSiegeOrder) = $GUI_CHECKED Then
	_Ini_Add("MySieges", "SiegeOrder", 1)
Else
	_Ini_Add("MySieges", "SiegeOrder", 0)
EndIf
For $j = 0 To 2
	For $i = 0 To UBound($MySieges) - 1
		_Ini_Add("MySieges", $MySieges[$i][0] & $j, $MySiegeSetting[$j][$i][0] & "|" & $MySiegeSetting[$j][$i][1] & "|" & $MySiegeSetting[$j][$i][2])
	Next
Next

; Friendly Challenge
Local $string = ""
For $i = 0 To 23
	$string &= (GUICtrlRead($g_ahChkFriendlyChallengehours[$i]) = $GUI_CHECKED ? 1: 0) & "|"
Next
_Ini_Add("FriendlyChallenge", "FriendlyChallengePlannedRequestHours", $string)
$string = ""
For $i = 0 To 5
	$string &= (GUICtrlRead($chkFriendlyChallengeBase[$i]) = $GUI_CHECKED ? 1: 0) & "|"
Next
_Ini_Add("FriendlyChallenge", "FriendlyChallengeBaseForShare", $string)
_Ini_Add("FriendlyChallenge", "FriendlyChallengeEnable", (GUICtrlRead($chkEnableFriendlyChallenge) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("FriendlyChallenge", "FriendlyChallengeEnableOnlyOnRequest", (GUICtrlRead($chkOnlyOnRequest) = $GUI_CHECKED ? 1 : 0))
_Ini_Add("FriendlyChallenge", "FriendlyChallengeKeyword", StringReplace(GUICtrlRead($txtKeywordForRequest), @CRLF, "|"))
_Ini_Add("FriendlyChallenge", "FriendlyChallengeText", StringReplace(GUICtrlRead($txtChallengeText), @CRLF, "|"))
_Ini_Add("FriendlyChallenge", "FriendlyChallengeCoolDownTime", GUICtrlRead($txtFriendlyChallengeCoolDownTime))

;  Super XP
_Ini_Add("GoblinXP", "EnableSuperXP", $g_bEnableSuperXP ? True : False)
_Ini_Add("GoblinXP", "SkipZoomOutXP", $g_bSkipZoomOutXP ? True : False)
_Ini_Add("GoblinXP", "FastGoblinXP", $g_bFastGoblinXP ? True : False)
_Ini_Add("GoblinXP", "SkipDragToEndXP", $g_bSkipDragToEndXP ? True : False)
_Ini_Add("GoblinXP", "SXTraining", (GUICtrlRead($rbSXTraining) = $GUI_CHECKED ? 1 : 2))
_Ini_Add("GoblinXP", "SXIAttacking", (GUICtrlRead($rbSXTraining) = $GUI_CHECKED ? 2 : 1))
_Ini_Add("GoblinXP", "SXBK", $g_bSXBK)
_Ini_Add("GoblinXP", "SXAQ", $g_bSXAQ)
_Ini_Add("GoblinXP", "SXGW", $g_bSXGW)
_Ini_Add("GoblinXP", "MaxXptoGain", GUICtrlRead($g_hTxtMaxXPtoGain))

; War
_Ini_Add("war preparation", "Enable", $g_bStopForWar ? 1 : 0)
_Ini_Add("war preparation", "Stop Time", $g_iStopTime)
_Ini_Add("war preparation", "Return Time", $g_iReturnTime)
_Ini_Add("war preparation", "Train War Troop", $g_bTrainWarTroop ? 1 : 0)
_Ini_Add("war preparation", "QuickTrain War Troop", $g_bUseQuickTrainWar ? 1 : 0)
_Ini_Add("war preparation", "QuickTrain War Army1", $g_aChkArmyWar[0] ? 1 : 0)
_Ini_Add("war preparation", "QuickTrain War Army2", $g_aChkArmyWar[1] ? 1 : 0)
_Ini_Add("war preparation", "QuickTrain War Army3", $g_aChkArmyWar[2] ? 1 : 0)
For $i = 0 To $eTroopCount - 1
	_Ini_Add("war preparation", $g_asTroopShortNames[$i], $g_aiWarCompTroops[$i])
Next
For $j = 0 To $eSpellCount - 1
	_Ini_Add("war preparation", $g_asSpellShortNames[$j], $g_aiWarCompSpells[$j])
Next
_Ini_Add("war preparation", "RequestCC War", $g_bRequestCCForWar ? 1 : 0)
_Ini_Add("war preparation", "RequestCC War Text", $g_sTxtRequestCCForWar)

; Village mode
;_Ini_Add("general", "FarmVersion", $g_bChkFarmVersion ? 1 : 0)
_Ini_Add("general", "PlayBBOnly", $g_bChkPlayBBOnly ? 1 : 0)

