; #Variables# ====================================================================================================================
; Name ..........: Image Search Directories
; Description ...: Gobal Strings holding Path to Images used for builder base image search
; Syntax ........: $g_sImgxxx = @ScriptDir & "\imgxml\BuildersBase\xxx\"
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

#Region Builder Base
Global $g_sImgCollectRessourcesBB = @ScriptDir & "\imgxml\Resources\BuildersBase\Collect\"
Global $g_sImgBoatBB = @ScriptDir & "\imgxml\Boat\BoatBuilderBase_0_89.xml"
Global $g_sImgZoomOutDirBB = @ScriptDir & "\imgxml\village\BuilderBase\"
Global $g_sImgStartCTBoost = @ScriptDir & "\imgxml\Resources\BuildersBase\ClockTower\ClockTowerAvailable*.xml"
;Global $g_sImgCleanBBYard = @ScriptDir & "\imgxml\Resources\ObstaclesBB"
Global $g_sImgIsOnBB = @ScriptDir & "\imgxml\village\Page\BuilderBase*"
Global $g_sImgStarLaboratory = @ScriptDir & "\imgxml\Resources\BuildersBase\StarLaboratory"
Global $g_sImgStarLabElex = @ScriptDir & "\imgxml\Resources\BuildersBase\StarLabElex\StarLabElex*"
#EndRegion

#Region Clean Yard
Global Const $g_sBundleCleanYardBB = @ScriptDir & "\imgxml\Resources\ObstaclesBB\"
Global Const $g_aBundleCleanYardBBParms[3] = [0, "0,50,860,594", False] ; RC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
#EndRegion Clean Yard


#Region Builder Base
;Global Const $g_sBundleCollectResourcesBB = @ScriptDir & "\imgxml\BuildersBase\Bundles\Collect\CollectResources\"

Global Const $g_sImgZoomoutBoatBB = @ScriptDir & "\imgxml\BuildersBase\ZoomOut\"
;Global $g_sImgBoatBB = @ScriptDir & "\imgxml\Boat\BoatBuilderBase_0_89.xml"

;Global Const $g_sImgCollectRessourcesBB = @ScriptDir & "\imgxml\BuildersBase\Collect"
;Global Const $g_sImgZoomOutDirBB = @ScriptDir & "\imgxml\village\BuilderBase\" ;Backslash '\' at the end of path is important
;Global Const $g_sImgStartCTBoost = @ScriptDir & "\imgxml\BuildersBase\ClockTower\ClockTowerAvailable\"
Global Const $g_sImgPathIsCTBoosted = @ScriptDir & "\imgxml\BuildersBase\ClockTowerBoosted"
Global Const $g_sImgAvailableAttacks = @ScriptDir & "\imgxml\BuildersBase\AvailableAttacks"
#EndRegion Builder Base


#Region Image Search Standard Parms
Global Const $g_aXMLToForceAreaParms[3] = [1000, "0,0,860,644", True] ; RC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
Global Const $g_aXMLNotToForceAreaParms[3] = [1000, "0,0,860,644", False] ; RC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
Global Const $g_aXMLToForceBuilderBaseParms[3] = [1, "0,50,860,594", True] ; RC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
Global Const $g_aXMLNotToForceBuilderBaseParms[3] = [1, "0,50,860,594", False] ; RC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
#EndRegion Image Search Standard Parms

#Region Auto Upgrade Builder Base
Global $g_sImgAutoUpgradeGold = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\Gold"
Global $g_sImgAutoUpgradeElixir = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\Elixir"
Global $g_sImgAutoUpgradeWindow = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\Window"
Global $g_sImgAutoUpgradeNew = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\New"
Global $g_sImgAutoUpgradeNoRes = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\NoResources"
Global $g_sImgAutoUpgradeBtnElixir = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\ButtonUpg\Elixir"
Global $g_sImgAutoUpgradeBtnGold = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\ButtonUpg\Gold"
Global $g_sImgAutoUpgradeBtnDir = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\Upgrade"
Global $g_sImgAutoUpgradeZero = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\NewBuildings\Shop"
Global $g_sImgAutoUpgradeClock = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\NewBuildings\Clock"
Global $g_sImgAutoUpgradeInfo = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\NewBuildings\Slot"
Global $g_sImgAutoUpgradeNewBldgYes = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\NewBuildings\Yes"
Global $g_sImgAutoUpgradeNewBldgNo = @ScriptDir & "\imgxml\Resources\BuildersBase\AutoUpgrade\NewBuildings\No"
#EndRegion

#Region Auto Upgrade Builder Base

Global Const $g_sXMLAutoUpgradeShop = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\Shop"
Global Const $g_sXMLAutoUpgradeClock = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\Clock"
Global Const $g_sXMLAutoUpgradeInfoIcon = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\InfoIcon"
Global Const $g_sXMLAutoUpgradeWhiteZeros = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\WhiteZeros"
Global Const $g_sXMLAutoUpgradeNewBldgYes = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\Yes"
Global Const $g_sXMLAutoUpgradeNewBldgNo = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\No"

;Global Const $g_sImgAutoUpgradeElixir = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\Elixir"
;Global Const $g_sImgAutoUpgradeGold = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\Gold\"
;Global Const $g_sImgAutoUpgradeNew = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\New\"
;Global Const $g_sImgAutoUpgradeNoRes = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NoResources\"
;Global Const $g_sImgAutoUpgradeBtnElixir = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\ButtonUpg\Elixir\"
;Global Const $g_sImgAutoUpgradeBtnGold = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\ButtonUpg\Gold\"
;Global Const $g_sImgAutoUpgradeBtnDir = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\Upgrade\"

;;;;;;;;;;;;;;;;;;;;;NOT USED DIR;;;;;;;;;;;;;;;;;;;;;
;Global Const $g_sImgAutoUpgradeWindow = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\Window\"
;Global Const $g_sImgAutoUpgradeZero = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\Shop\"
;Global Const $g_sImgAutoUpgradeClock = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\Clock\"
;Global Const $g_sImgAutoUpgradeInfo = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\Slot\"
;Global Const $g_sImgAutoUpgradeNewBldgYes = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\Yes\"
;Global Const $g_sImgAutoUpgradeNewBldgNo = @ScriptDir & "\imgxml\BuildersBase\AutoUpgrade\NewBuildings\No\"
;;;;;;;;;;;;;;;;;;;;;NOT USED DIR;;;;;;;;;;;;;;;;;;;;;
#EndRegion Auto Upgrade Builder Base


#Region Troops Upgrade Builder Base
Global Const $g_sXMLTroopsUpgradeMachine = @ScriptDir & "\imgxml\BuildersBase\TroopsUpgrade\Machine"

Global Const $g_sImgTroopsUpgradeLab = @ScriptDir & "\imgxml\BuildersBase\TroopsUpgrade\Laboratory"
Global Const $g_sImgTroopsUpgradeButton = @ScriptDir & "\imgxml\BuildersBase\TroopsUpgrade\Buttons"
Global Const $g_sImgTroopsUpgradeLabWindow = @ScriptDir & "\imgxml\BuildersBase\TroopsUpgrade\Window"
Global Const $g_sImgTroopsUpgradeElixir = @ScriptDir & "\imgxml\BuildersBase\TroopsUpgrade\AvailableElixir"
Global Const $g_sImgTroopsUpgradeAvaiTroops = @ScriptDir & "\imgxml\BuildersBase\TroopsUpgrade\AvailableTroops"

;;;;;;;;;;;;;;;;;;;;;NOT USED DIR;;;;;;;;;;;;;;;;;;;;;
Global Const $g_sImgTroopsUpgradeTroops = @ScriptDir & "\imgxml\BuildersBase\TroopsUpgrade\Troops"
;;;;;;;;;;;;;;;;;;;;;NOT USED DIR;;;;;;;;;;;;;;;;;;;;;
#EndRegion Troops Upgrade Builder Base

#Region Check Army Builder Base
Global Const $aArmyTrainButtonBB[4] = [46, 572, 0xE5A439, 10] ; DESRC Done - OKKK
Global Const $g_sImgPathFillArmyCampsWindow = @ScriptDir & "\imgxml\BuildersBase\FillArmyCamps\Window" 
Global Const $g_aBundlePathCamps[3] = [1000, "40, 187, 820, 400", True] ; DESRC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea ; - OKKK
Global Const $g_sImgPathCamps = @ScriptDir & "\imgxml\BuildersBase\Bundles\Camps\"
Global Const $g_sImgPathTroopsTrain = @ScriptDir & "\imgxml\BuildersBase\FillArmyCamps\TroopsTrain"
#EndRegion Check Army Builder Base

#Region Builder Base Attack
;Global Const $g_sXMLOpponentVillageVisible = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\OpponentVillage\"
;Global Const $g_aXMLOpponentVillageVisibleParms[3] = [1000, "650,0,200,70", True] ; [0] Quantity2Match [1] Area2Search [2] ForceArea
Global $g_aOpponentVillageVisible[1][3] = [[0xFED5D4, 0, 1]] ; more ez ; samm0d

Global Const $g_sBundleAttackBarBB = @ScriptDir & "\imgxml\BuildersBase\Bundles\AttackBar"
Global Const $g_sBundleBuilderHall = @ScriptDir & "\imgxml\BuildersBase\Bundles\BuilderHall"
Global Const $g_sBundleDeployPointsBB = @ScriptDir & "\imgxml\BuildersBase\Bundles\DeployPoints"

Global Const $g_aBundleDeployPointsBBParms[3] = [0, "0,0,860,629", True] ; DESRC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
Global Const $g_aBundleBuilderHallParms[3] = [1, "0,0,860,629", True] ; DESRC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
Global Const $g_aBundleAttackBarBBParms[3] = [1000, "0, 657, 801, 694", True] ; DESRC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea
Global Const $g_aBundleAttackBarSwitchBBParms[3] = [1000, "0, 696, 801, 722", False] ; DESRC Done ; [0] Quantity2Match [1] Area2Search [2] ForceArea

Global Const $g_sImgOpponentBuildingsBB = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\Buildings\"

Global Const $g_sImgAttackBtnBB = @ScriptDir & "\imgxml\BuildersBase\Attack\AttackBtn\"
Global Const $g_sImgVersusWindow = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\Window\"
Global Const $g_sImgFullArmyBB = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\ArmyStatus\Full\"
Global Const $g_sImgHeroStatusRec = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\ArmyStatus\Hero\Recovering\"
Global Const $g_sImgHeroStatusUpg = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\ArmyStatus\Hero\Upgrading\"
Global Const $g_sImgHeroStatusMachine = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\ArmyStatus\Hero\Battle Machine\"
;Global Const $g_sImgFindBtnBB = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\FindNowbtn\"
Global Const $g_sImgCloudSearch = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\Clouds\"

; Report Window : Victory | Draw | Defeat
Global Const $g_sImgReportWaitBB = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\Report\Waiting"
Global Const $g_sImgReportFinishedBB = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\Report\Replay"
Global Const $g_sImgReportResultBB = @ScriptDir & "\imgxml\BuildersBase\Attack\VersusBattle\Report\Result"
#EndRegion Builder Base Attack

#Region Builder Base Walls Upgrade
Global Const $g_sBundleWallsBB = @ScriptDir & "\imgxml\BuildersBase\Bundles\Walls\BBWall.DocBundle"
Global Const $g_aBundleWallsBBParms[3] = [0, "0,50,860,594", False] ; [0] Quantity2Match [1] Area2Search [2] ForceArea
#EndRegion Builder Base Walls Upgrade

;Machine Ability Pixel Is different with Machine Level ;e.g With 7 $MachineSlot[2] = (7*72)-25 = 479 And Pixel It Contains 479x633 -> E7CE93 Or AE9A88
Local $aMachineAbilityPixels[3] = [0xAE9A88, 0xE7CE93, 0xCEB385]
Local $aMachineDeadPixels[3] = [0x4E4E4E, 0x676767, 0x5B5B5B]
