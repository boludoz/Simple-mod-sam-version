; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig.au3
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
;Chat IA
IniReadS($g_sIAVar, $g_sProfileConfigPath, "ChatIA", "String", '0|0|0|0|0', Default)
$g_aIAVar = StringSplit($g_sIAVar, "|", $STR_NOCOUNT)

;IniReadS($g_sIAVar, $g_sProfileConfigPath, "ChatIA", "String", '0|0#1|0#2|0#3|0#4|0', Default)
;Local $aIAVarTmp = StringRegExp($g_sIAVar, '[^\#\|]+', 3)
;Local $iLoop = 0
;   For $i = 0 To UBound($g_aIAVar) -1
;	  For $j = 0 To UBound($g_aIAVar,2) -1
;	  $g_aIAVar[$i][$j] = $aIAVarTmp[$iLoop]
;	  $iLoop += 1
;	  Next
;   Next

; AtkLog Color
IniReadS($g_bColorfulAttackLog, $g_sProfileConfigPath, "AttackColorLog", "Enable", True, "Bool")

; Machine Date
IniReadS($g_bFirstRun, $g_sProfileConfigPath, "MachineBB", "Date", '1000/01/01 00:00:00', Default)

; First Run
IniReadS($g_bFirstRun, $g_sProfileConfigPath, "Backup", "FirstRun", "False", "Bool")

; Backup check
IniReadS($g_bBackup, $g_sProfileConfigPath, "Backup", "BackupControl", "False", "Bool")

Global $iMultiFingerStyle = 0

; Multi Finger (LunaEclipse)
IniReadS($iMultiFingerStyle, $g_sProfileConfigPath, "MultiFinger", "Select", "1")

; bot log
IniReadS($ichkBotLogLineLimit, $g_sProfileConfigPath, "BotLogLineLimit", "Enable", "0", "Int")
IniReadS($itxtLogLineLimit, $g_sProfileConfigPath, "BotLogLineLimit", "LimitValue", "200","Int")

; use Enable Skip Build
IniReadS($g_bEnableSkipBuild, $g_sProfileConfigPath, "EnableSkipBuild", "Enable", "False", "Bool")

; donate only when troop pre train ready
IniReadS($ichkEnableDonateWhenReady, $g_sProfileConfigPath, "EnableDonateWhenReady", "Enable", "0", "Int")

; Enable Donate Hours
IniReadS($ichkEnableDonateHours, $g_sProfileConfigPath, "chkEnableDonateHours", "Enable", "0", "Int")

; stop bot when low battery
IniReadS($ichkEnableStopBotWhenLowBattery, $g_sProfileConfigPath, "EnableStopBotWhenLowBattery", "Enable", "0", "Int")

; prevent over donate
IniReadS($ichkEnableLimitDonateUnit, $g_sProfileConfigPath, "PreventOverDonate", "Enable", "0", "Int")
IniReadS($itxtLimitDonateUnit, $g_sProfileConfigPath, "PreventOverDonate", "LimitValue", "8","Int")

; max logout time
IniReadS($ichkEnableLogoutLimit, $g_sProfileConfigPath, "LogoutLimit", "Enable", "0", "Int")
IniReadS($itxtLogoutLimitTime, $g_sProfileConfigPath, "LogoutLimit", "LimitValue", "240","Int")

; Unit Wave Factor
IniReadS($ichkUnitFactor, $g_sProfileConfigPath, "SetSleep", "EnableUnitFactor", "1", "Int")
IniReadS($itxtUnitFactor, $g_sProfileConfigPath, "SetSleep", "UnitFactor", "10","Int")
IniReadS($ichkWaveFactor, $g_sProfileConfigPath, "SetSleep", "EnableWaveFactor", "1", "Int")
IniReadS($itxtWaveFactor, $g_sProfileConfigPath, "SetSleep", "WaveFactor", "100","Int")

;~ ; SmartZap from ChaCalGyn (LunaEclipse) - DEMEN
;~ IniReadS($ichkUseSamM0dZap, $g_sProfileConfigPath, "SamM0dZap", "SamM0dZap", "1","Int")
;~ IniReadS($ichkSmartZapDB, $g_sProfileConfigPath, "SmartZap", "ZapDBOnly", "1","Int")
;~ IniReadS($ichkSmartZapSaveHeroes, $g_sProfileConfigPath, "SmartZap", "THSnipeSaveHeroes", "1","Int")
;~ IniReadS($itxtMinDE, $g_sProfileConfigPath, "SmartZap", "MinDE", "400","Int")
;~
;~ ; samm0d zap
;~ IniReadS($ichkSmartZapRnd, $g_sProfileConfigPath, "SamM0dZap", "UseSmartZapRnd", "1","Int")
;~ IniReadS($ichkDrillExistBeforeZap, $g_sProfileConfigPath, "SamM0dZap", "CheckDrillBeforeZap", "1","Int")
;~ IniReadS($itxtMinDEGetFromDrill, $g_sProfileConfigPath, "SamM0dZap", "MinDEGetFromDrill", "100","Int")
;~ IniReadS($ichkPreventTripleZap, $g_sProfileConfigPath, "SamM0dZap", "PreventTripleZap", "1","Int")

; Check Collectors Outside - Added by TheRevenor
IniReadS($ichkDBMeetCollOutside, $g_sProfileConfigPath, "search", "DBMeetCollOutside", "0","Int")
IniReadS($ichkDBCollectorsNearRedline, $g_sProfileConfigPath, "search", "DBCollectorsNearRedline", "0","Int")
IniReadS($icmbRedlineTiles, $g_sProfileConfigPath, "search", "RedlineTiles", "1", "Int")
IniReadS($iDBMinCollOutsidePercent, $g_sProfileConfigPath, "search", "DBMinCollOutsidePercent", "50", "Int")
IniReadS($ichkSkipCollectorCheckIF, $g_sProfileConfigPath, "search", "SkipCollectorCheckIF", "0", "Int")
IniReadS($itxtSkipCollectorGold, $g_sProfileConfigPath, "search", "SkipCollectorGold", "500000", "Int")
IniReadS($itxtSkipCollectorElixir, $g_sProfileConfigPath, "search", "SkipCollectorElixir", "500000", "Int")
IniReadS($itxtSkipCollectorDark, $g_sProfileConfigPath, "search", "SkipCollectorDark", "3000", "Int")
IniReadS($ichkSkipCollectorCheckIFTHLevel, $g_sProfileConfigPath, "search", "SkipCollectorCheckIFTHLevel", "0", "Int")
IniReadS($itxtIFTHLevel, $g_sProfileConfigPath, "search", "IFTHLevel", "7", "Int")

; drop cc first
IniReadS($ichkDropCCFirst, $g_sProfileConfigPath, "CCFirst", "Enable", "0", "Int")

; Check League For DeadBase
IniReadS($iChkNoLeague[$DB], $g_sProfileConfigPath, "search", "DBNoLeague", "0", "Int")
IniReadS($iChkNoLeague[$LB], $g_sProfileConfigPath, "search", "ABNoLeague", "0", "Int")

; HLFClick By Samkie
IniReadS($ichkEnableHLFClick, $g_sProfileConfigPath, "HLFClick", "EnableHLFClick", "0", "Int")
IniReadS($isldHLFClickDelayTime, $g_sProfileConfigPath, "HLFClick", "HLFClickDelayTime", "500", "Int")
IniReadS($EnableHMLSetLog, $g_sProfileConfigPath, "HLFClick", "EnableHLFClickSetlog", "0", "Int")

; samm0d ocr
IniReadS($ichkEnableCustomOCR4CCRequest, $g_sProfileConfigPath, "GetMyOcr", "EnableCustomOCR4CCRequest", "0", "Int")

; auto dock
IniReadS($ichkAutoDock, $g_sProfileConfigPath, "AutoDock", "Enable", "0", "Int")
IniReadS($g_bChkAutoHideEmulator, $g_sProfileConfigPath, "AutoHideEmulator", "Enable", False, "Bool")
IniReadS($g_bChkAutoMinimizeBot, $g_sProfileConfigPath, "AutoMinimizeBot", "Enable", False, "Bool")

; CSV Deployment Speed Mod
IniReadS($isldSelectedCSVSpeed[$DB], $g_sProfileConfigPath, "attack", "CSVSpeedDB", 3)
IniReadS($isldSelectedCSVSpeed[$LB], $g_sProfileConfigPath, "attack", "CSVSpeedAB", 3)
IniReadS($isldSelectedSpeedWaitCVS, $g_sProfileConfigPath, "attack", "SpeedWaitCVS", 3)

; check 4 cc
IniReadS($ichkCheck4CC, $g_sProfileConfigPath, "Check4CC", "Enable", "0", "Int")
IniReadS($itxtCheck4CCWaitTime, $g_sProfileConfigPath, "Check4CC", "WaitTime", "7", "Int")
; global delay increse
IniReadS($ichkIncreaseGlobalDelay, $g_sProfileConfigPath, "GlobalDelay", "Enable", "0", "Int")
IniReadS($itxtIncreaseGlobalDelay, $g_sProfileConfigPath, "GlobalDelay", "DelayPercentage", "10", "Int")

;stick to train page
IniReadS($itxtStickToTrainWindow, $g_sProfileConfigPath, "StickToTrainPage", "Minutes", "2","Int")

; My Troops
$ichkModTrain = 1
;IniReadS($ichkModTrain, $g_sProfileConfigPath, "MyTroops", "EnableModTrain", "1","Int")
IniReadS($ichkMyTroopsOrder, $g_sProfileConfigPath, "MyTroops", "Order", "0","Int")
IniReadS($ichkEnableDeleteExcessTroops, $g_sProfileConfigPath, "MyTroops", "DeleteExcess", "0","Int")
IniReadS($ichkForcePreTrainTroops, $g_sProfileConfigPath, "MyTroops", "ForcePreTrainTroop", "0","Int")
IniReadS($itxtForcePreTrainStrength, $g_sProfileConfigPath, "MyTroops", "ForcePreTrainStrength", "95","Int")
IniReadS($icmbMyQuickTrain, $g_sProfileConfigPath, "MyTroops", "TrainCombo", "0", "Int")
IniReadS($icmbTroopSetting, $g_sProfileConfigPath, "MyTroops", "Composition", "0", "Int")

IniReadS($ichkDisablePretrainTroops, $g_sProfileConfigPath, "MyTroops", "NoPreTrain", "0", "Int")

Local $sTextTroops
Local $sTextTroopsString
Local $sGiants
For $j = 0 To 2
	For $i = 0 To UBound($MyTroops) - 1
		$sTextTroopsString = IniRead($g_sProfileConfigPath, "MyTroops", $MyTroops[$i][0]&$j, 2 <> $i ? 0 : 16 &"|"&$i + 1)
		If Not StringInStr($sTextTroopsString, "|") = 0 Then
		$sTextTroops = StringSplit($sTextTroopsString, "|", $STR_NOCOUNT)
			$MyTroopsSetting[$j][$i][0] = Int($sTextTroops[0])
			$MyTroopsSetting[$j][$i][1] = Int($sTextTroops[1])
			Else
			$MyTroopsSetting[$j][$i][0] = Int($sTextTroopsString)
			$MyTroopsSetting[$j][$i][1] = $i + 1
		Endif
	Next
Next

For $i = 0 To UBound($MyTroops) - 1
	$MyTroops[$i][3] =  $MyTroopsSetting[$icmbTroopSetting][$i][0]
	$MyTroops[$i][1] =  $MyTroopsSetting[$icmbTroopSetting][$i][1]
Next

; Spells
IniReadS($ichkMySpellsOrder, $g_sProfileConfigPath, "MySpells", "Order", "0","Int")
IniReadS($ichkEnableDeleteExcessSpells, $g_sProfileConfigPath, "MySpells", "DeleteExcess", "0","Int")
IniReadS($ichkForcePreBrewSpell, $g_sProfileConfigPath, "MySpells", "ForcePreBrewSpell", "0","Int")

Local $sTextSpells
Local $sTextSpellsString

For $j = 0 To 2
	For $i = 0 To UBound($MySpells) - 1
	 $sTextSpellsString = IniRead($g_sProfileConfigPath, "MySpells", $MySpells[$i][0]&$j, "0|"&$i + 1&"|0")
	If Not StringInStr($sTextSpellsString, "|") = 0 Then
	$sTextSpells = StringSplit($sTextSpellsString, "|", $STR_NOCOUNT)
		$MySpellSetting[$j][$i][0] = Int($sTextSpells[0])
		$MySpellSetting[$j][$i][1] = Int($sTextSpells[1])
		$MySpellSetting[$j][$i][2] = Int($sTextSpells[2])
		Else
		$MySpellSetting[$j][$i][0] = Int($sTextSpellsString)
		$MySpellSetting[$j][$i][1] = $i + 1
		$MySpellSetting[$j][$i][2] = 0
		Endif
	Next
Next

$g_bDoPrebrewspell = 0
For $i = 0 To UBound($MySpells) - 1
	Assign("ichkPre" & $MySpells[$i][0],  $MySpellSetting[$icmbTroopSetting][$i][2])
	$g_bDoPrebrewspell = BitOR($g_bDoPrebrewspell, $MySpellSetting[$icmbTroopSetting][$i][2])
	$MySpells[$i][3] =  $MySpellSetting[$icmbTroopSetting][$i][0]
	$MySpells[$i][1] =  $MySpellSetting[$icmbTroopSetting][$i][1]
Next

; Sieges
IniReadS($ichkMySiegesSiegeOrder, $g_sProfileConfigPath, "MySieges", "SiegeOrder", "0","Int")
IniReadS($ichkEnableDeleteExcessSieges, $g_sProfileConfigPath, "MySieges", "DeleteExcess", "0","Int")
IniReadS($ichkForcePreSiegeBrewSiege, $g_sProfileConfigPath, "MySieges", "ForcePreSiegeBrewSiege", "0","Int")
IniReadS($txtTotalCountSiege, $g_sProfileConfigPath, "MySieges", "TotalCountSiege", "0","Int")

Local $sTextSieges
Local $sTextSiegesString

For $j = 0 To 2
	For $i = 0 To UBound($MySieges) - 1
	 $sTextSiegesString = IniRead($g_sProfileConfigPath, "MySieges", $MySieges[$i][0]&$j, "0|"&$i + 1&"|0")
	If Not StringInStr($sTextSiegesString, "|") = 0 Then
	$sTextSieges = StringSplit($sTextSiegesString, "|", $STR_NOCOUNT)
		$MySiegeSetting[$j][$i][0] = Int($sTextSieges[0])
		$MySiegeSetting[$j][$i][1] = Int($sTextSieges[1])
		$MySiegeSetting[$j][$i][2] = Int($sTextSieges[2])
		Else
		$MySiegeSetting[$j][$i][0] = Int($sTextSiegesString)
		$MySiegeSetting[$j][$i][1] = $i + 1
		$MySiegeSetting[$j][$i][2] = 0
		Endif
	Next
Next

$g_bDoPreSiegebrewSiege = 0
For $i = 0 To UBound($MySieges) - 1
	Assign("ichkPreSiege" & $MySieges[$i][0],  $MySiegeSetting[$icmbTroopSetting][$i][2])
	$g_bDoPreSiegebrewSiege = BitOR($g_bDoPreSiegebrewSiege, $MySiegeSetting[$icmbTroopSetting][$i][2])
	$MySieges[$i][3] =  $MySiegeSetting[$icmbTroopSetting][$i][0]
	$MySieges[$i][1] =  $MySiegeSetting[$icmbTroopSetting][$i][1]
Next

; Friendly Challenge
$g_abFriendlyChallengehours = StringSplit(IniRead($g_sProfileConfigPath, "FriendlyChallenge", "FriendlyChallengePlannedRequestHours", "1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"), "|", $STR_NOCOUNT)
$ichkFriendlyChallengeBase = StringSplit(IniRead($g_sProfileConfigPath, "FriendlyChallenge", "FriendlyChallengeBaseForShare", "0|0|0|0|0|0"), "|", $STR_NOCOUNT)
IniReadS($ichkEnableFriendlyChallenge, $g_sProfileConfigPath, "FriendlyChallenge", "FriendlyChallengeEnable", "0", "Int")
IniReadS($ichkOnlyOnRequest, $g_sProfileConfigPath, "FriendlyChallenge", "FriendlyChallengeEnableOnlyOnRequest", "0", "Int")
$stxtKeywordForRequest = StringReplace(IniRead($g_sProfileConfigPath, "FriendlyChallenge", "FriendlyChallengeKeyword", "friendly|challenge"), "|", @CRLF)
$stxtChallengeText = StringReplace(IniRead($g_sProfileConfigPath, "FriendlyChallenge", "FriendlyChallengeText", ""), "|", @CRLF)
IniReadS($itxtFriendlyChallengeCoolDownTime, $g_sProfileConfigPath, "FriendlyChallenge", "FriendlyChallengeCoolDownTime", "5", "Int")

; Super XP
IniReadS($g_bEnableSuperXP, $g_sProfileConfigPath, "GoblinXP", "EnableSuperXP", $g_bEnableSuperXP, "Bool")
IniReadS($g_bSkipZoomOutXP, $g_sProfileConfigPath, "GoblinXP", "SkipZoomOutXP", $g_bSkipZoomOutXP, "Bool")
IniReadS($g_bFastGoblinXP, $g_sProfileConfigPath, "GoblinXP", "FastGoblinXP", $g_bFastGoblinXP, "Bool")
IniReadS($g_bSkipDragToEndXP, $g_sProfileConfigPath, "GoblinXP", "SkipDragToEndXP", $g_bSkipDragToEndXP, "Bool")
IniReadS($g_irbSXTraining, $g_sProfileConfigPath, "GoblinXP", "SXTraining", $g_irbSXTraining, "int")
IniReadS($g_irbSXTraining, $g_sProfileConfigPath, "GoblinXP", "SXIAttacking", $g_irbSXTraining, "int")
IniReadS($g_iTxtMaxXPtoGain, $g_sProfileConfigPath, "GoblinXP", "MaxXptoGain", $g_iTxtMaxXPtoGain, "int")
IniReadS($g_bSXBK, $g_sProfileConfigPath, "GoblinXP", "SXBK", $eHeroNone)
IniReadS($g_bSXAQ, $g_sProfileConfigPath, "GoblinXP", "SXAQ", $eHeroNone)
IniReadS($g_bSXGW, $g_sProfileConfigPath, "GoblinXP", "SXGW", $eHeroNone)

; War
IniReadS($g_bStopForWar, $g_sProfileConfigPath, "war preparation", "Enable", False, "Bool")
IniReadS($g_iStopTime, $g_sProfileConfigPath, "war preparation", "Stop Time", 0, "Int")
IniReadS($g_iReturnTime, $g_sProfileConfigPath, "war preparation", "Return Time", 0, "Int")
IniReadS($g_bTrainWarTroop, $g_sProfileConfigPath, "war preparation", "Train War Troop", False, "Bool")
IniReadS($g_bUseQuickTrainWar, $g_sProfileConfigPath, "war preparation", "QuickTrain War Troop", False, "Bool")
IniReadS($g_aChkArmyWar[0], $g_sProfileConfigPath, "war preparation", "QuickTrain War Army1", False, "Bool")
IniReadS($g_aChkArmyWar[1], $g_sProfileConfigPath, "war preparation", "QuickTrain War Army2", False, "Bool")
IniReadS($g_aChkArmyWar[2], $g_sProfileConfigPath, "war preparation", "QuickTrain War Army3", False, "Bool")

For $i = 0 To $eTroopCount - 1
	IniReadS($g_aiWarCompTroops[$i], $g_sProfileConfigPath, "war preparation", $g_asTroopShortNames[$i], 0, "Int")
Next
For $j = 0 To $eSpellCount - 1
	IniReadS($g_aiWarCompSpells[$j], $g_sProfileConfigPath, "war preparation", $g_asSpellShortNames[$j], 0, "Int")
Next

IniReadS($g_bRequestCCForWar, $g_sProfileConfigPath, "war preparation", "RequestCC War", False, "Bool")
$g_sTxtRequestCCForWar = IniRead($g_sProfileConfigPath, "war preparation", "RequestCC War Text", "War troop please")

; Village mode
;IniReadS($g_bChkFarmVersion, $g_sProfileConfigPath, "general", "FarmVersion", False, "Bool")
IniReadS($g_bChkPlayBBOnly, $g_sProfileConfigPath, "general", "PlayBBOnly", False, "Bool")

