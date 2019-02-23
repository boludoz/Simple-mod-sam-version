; #Variables# ====================================================================================================================
; Name ..........: Screen Position Variables
; Description ...: Global variables for commonly used X|Y positions, screen check color, and tolerance
; Syntax ........: $aXXXXX[Y]  : XXXX is name of point or item being checked, Y = 2 for position only, or 4 when color/tolerance value included
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================


;;;;;;;;;;;;;;;;;;;;;;;; New resolution ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; GENERIC
;
Global Const $aAway[2] = [550, 20] ; Away click [RC]

; BUILDER BASE MAIN
Global Const $aBuildersDigitsBuilderBase[2] = [414, 21] ; Main Screen on Builders Base Free/Total Builders [RC]
Global Const $aIsOnBuilderBase[4] = [839, 18, 0xFFFF4d, 10] ; Check the Gold Coin from resources , is a square not round [RC]

;Builder Base Walls
Global $aWallUpgrade[4] = [521, 580 + $g_iMidOffsetY, 0x7B412B, 20] ; Upgrade Button main screen
Global $aWallUpgradeOK[4] = [483, 496 + $g_iMidOffsetY, 0xFFDC15, 20] ; Ok Button on main screen

; MAIN VILLAGE
;
Global Const $aCenterEnemyVillageClickDrag = [65, 468] ; Scroll village using this location in the water [RC]
Global Const $aCenterHomeVillageClickDrag = [270, 575] ; Scroll village using this location in the water [RC]

Global Const $aIsMain[4] = [278, 9, 0x77BDE0, 20] ; Main Screen, Builder Info Icon [RC]
Global Const $aIsMainGrayed[4] = [278, 9, 0x3C5F70, 15] ; Main Screen, Builder Info Icon grayed [RC]

Global Const $aTrophies[2] = [69, 84] ; Main Screen, Trophies [RC]

Global $aIsDarkElixirFull[4] = [708, 132, 0x270D33, 10] ; Main Screen DE Resource bar is full
Global $aIsGoldFull[4] = [660, 32, 0xE7C00D, 10] ; Main Screen Gold Resource bar is Full
Global $aIsElixirFull[4] = [660, 82, 0xC027C0, 10] ; Main Screen Elixir Resource bar is Full

Global $aVillageHasDarkElixir[4] = [837, 134, 0x3D2D3D, 10] ; Main Page, Base has dark elixir storage

Global $aRecievedTroops[4] = [149, 185, 0xFFFFFF, 5] ; Y of You have recieved blabla from xx!

; SHIELD
Global $aNoShield[4] = [448, 20, 0x43484B, 15] ; Main Screen, charcoal pixel center of shield when no shield is present
Global $aHaveShield[4] = [455, 19, 0xF0F8FB, 15] ; Main Screen, Silver pixel top center of shield
Global $aHavePerGuard[4] = [455, 19, 0x10100D, 15] ; Main Screen, black pixel in sword outline top center of shield
Global $aShieldInfoButton[4] = [431, 10, 0x75BDE4, 15] ; Main Screen, Blue pixel upper part of "i"
Global $aIsShieldInfo[4] = [645, 195 + $g_iMidOffsetYNew, 0xED1115, 20] ; Main Screen, Shield Info window, red pixel right of X [RC]

; PROMAC HERE! CHECKING THE REMAIN VARS TOMORROW

; ATTACK
;inattackscreen
Global $NextBtn[4] = [780, 546 + $g_iBottomOffsetY, 0xD34300, 20] ;  Next Button
Global $a12OrMoreSlots[4] = [16, 648, 0x4583B9, 25] ; Attackbar Check if 12+ Slots exist
Global $aDoubRowAttackBar[4] = [68, 486, 0xFC5D64, 20]
Global $aTroopIsDeployed[4] = [0, 0, 0x404040, 20] ; Attackbar Remain Check X and Y are Dummies
Global Const $aIsAttackPage[4] = [56, 548 + $g_iBottomOffsetY, 0xcf0d0e, 20] ; red button "end battle" 860x780

Global $aAttackButton[2] = [60, 614 + $g_iBottomOffsetY] ; Attack Button, Main Screen
Global $aAttackButtonRND[4] = [20, 540, 100, 610] ; RC DONE ; Attack Button, Main Screen, RND  Screen 860x732
Global $aFindMatchButton[4] = [170, 475, 0xFFBF43, 10] ; RC Done ; Find Multiplayer Match Button, Attack Screen 860x644 without shield
Global $aFindMatchButton2[4] = [170, 475, 0xE75D0D, 10] ; RC Done ; Find Multiplayer Match Button, Attack Screen 860x644 with shield
Global $aFindMatchButtonRND[4] = [150, 450, 300, 500] ; RC Done ; Find Multiplayer Match Button, Both Shield or without shield Screen 860x732

Global $NextBtn[4] = [780, 546 + $g_iBottomOffsetY, 0xD34300, 20] ;  Next Button
Global $NextBtnRND[4] = [710, 460, 830, 520] ; RC Done ; Next Button

Global $aSurrenderButton[4] = [70, 545 + $g_iBottomOffsetY, 0xC00000, 40] ; Surrender Button, Attack Screen
Global $aConfirmSurrender[4] = [500, 415 + $g_iMidOffsetY, 0x60AC10, 20] ; Confirm Surrender Button, Attack Screen, green color on button?
Global $aCancelFight[4] = [822, 48, 0xD80408, 20] ; Cancel Fight Scene
Global $aCancelFight2[4] = [830, 59, 0xD80408, 20] ; Cancel Fight Scene 2nd pixel

Global $aEndFightSceneBtn[4] = [429, 519 + $g_iMidOffsetY, 0xB8E35F, 20] ; Victory or defeat scene buton = green edge
Global $aEndFightSceneAvl[4] = [241, 223 + $g_iMidOffsetYNew, 0xFFF090, 20] ; Victory or defeat scene left side ribbon = light gold
Global $aReturnHomeButton[4] = [376, 567 + $g_iMidOffsetY, 0x60AC10, 20] ; Return Home Button, End Battle Screen

Global $aAtkHasDarkElixir[4] = [31, 144, 0x282020, 10] ; Attack Page, Check for DE icon
Global $aIsAtkDarkElixirFull[4] = [743, 92, 0x270D33, 10] ; Attack Screen DE Resource bar is full
Global $aNoCloudsAttack[4] = [25, 606 + $g_iBottomOffsetYNew, 0xCD0D0D, 15] ; RC Done ; Attack Screen: No More Clouds


; ATTACK REPORT
Global Const $aAtkRprtDECheck[4] = [459, 372 + $g_iMidOffsetY, 0x433350, 20]
Global Const $aAtkRprtTrophyCheck[4] = [327, 189 + $g_iMidOffsetY, 0x3B321C, 30]
Global Const $aAtkRprtDECheck2[4] = [678, 418 + $g_iMidOffsetY, 0x030000, 30]
Global $aWonOneStar[4] = [714, 538 + $g_iBottomOffsetY, 0xC0C8C0, 20] ; Center of 1st Star for winning attack on enemy
Global $aWonTwoStar[4] = [739, 538 + $g_iBottomOffsetY, 0xC0C8C0, 20] ; Center of 2nd Star for winning attack on enemy
Global $aWonThreeStar[4] = [763, 538 + $g_iBottomOffsetY, 0xC0C8C0, 20] ; Center of 3rd Star for winning attack on enemy

; attack report... stars won
Global $aWonOneStarAtkRprt[4] = [325, 180 + $g_iMidOffsetY, 0xC8CaC4, 30] ; Center of 1st Star reached attacked village
Global $aWonTwoStarAtkRprt[4] = [398, 180 + $g_iMidOffsetY, 0xD0D6D0, 30] ; Center of 2nd Star reached attacked village
Global $aWonThreeStarAtkRprt[4] = [534, 180 + $g_iMidOffsetY, 0xC8CAC7, 30] ; Center of 3rd Star reached attacked village
; pixel color: location information								BS 850MB (Reg GFX), BS 500MB (Med GFX) : location


; HEROES
; Check healthy color RGB ( 220,255,19~27) ; the king and queen haves the same Y , but warden is a little lower ...
; King Crown ; background pixel not at green bar
Global $aKingHealth = [-1, 569 + $g_iBottomOffsetY, 0x00D500, 15] ; Attack Screen, Check King's Health, X coordinate is dynamic, not used from array   ;  -> with slot compensation 0xbfb29e
; Queen purple between crown ; background pixel not at green bar
Global $aQueenHealth = [-1, 569 + $g_iBottomOffsetY, 0x00D500, 15] ; Attack Screen, Check Queen's Health, X coordinate is dynamic, not used from array  ;  -> with slot compensation 0xe08227
; Warden hair ; background pixel not at green bar
Global $aWardenHealth = [-1, 569 + $g_iBottomOffsetY, 0x00D500, 15] ; Attack Screen, Check Warden's Health, X coordinate is dynamic, not used from array  ;  -> with slot compensation 0xe08227
;Machine Ability Pixel Is different with Machine Level ;e.g With 7 $MachineSlot[2] = (7*72)-25 = 479 And Pixel It Contains 479x633 -> E7CE93 Or AE9A88
Local $aMachineAbilityPixels[3] = [0xAE9A88, 0xE7CE93, 0xCEB385]
Local $aMachineDeadPixels[3] = [0x4E4E4E, 0x676767, 0x5B5B5B]


; DONATE
Global $aRequestTroopsAO[2] = [807, 574 + $g_iMidOffsetY] ; RC Done ; Button Request Troops in Army Overview
Global Const $aOpenChatTab[4] = [19, 335 + $g_iMidOffsetY, 0xE88D27, 20]
Global Const $aCloseChat[4] = [331, 330 + $g_iMidOffsetY, 0xF0951D, 20] ; duplicate with $aChatTab above, need to rename and fix all code to use one?
Global Const $aChatDonateBtnColors[4][4] = [[0x0d0d0d, 0, -4, 20], [0xdaf582, 10, 0, 20], [0xcdef75, 10, 5, 20], [0xFFFFFF, 23, 9, 10]]
Global $aPerkBtn[4] = [95, 243 + $g_iMidOffsetY, 0x7cd8e8, 10] ; Clan Info Page, Perk Button (blue); 800x780

Global $aChatTab[4] = [331, 325 + $g_iMidOffsetY, 0xF0951D, 20] ; Chat Window Open, Main Screen
Global $aChatTab2[4] = [331, 330 + $g_iMidOffsetY, 0xF0951D, 20] ; Chat Window Open, Main Screen
Global $aChatTab3[4] = [331, 335 + $g_iMidOffsetY, 0xF0951D, 20] ; Chat Window Open, Main Screen
Global $aOpenChat[2] = [19, 349 + $g_iMidOffsetY] ; Open Chat Windows, Main Screen
Global $aClanTab[2] = [189, 24] ; Clan Tab, Chat Window, Main Screen
Global $aClanInfo[2] = [282, 55] ; Clan Info Icon

; REQUEST
Global $aCancRequestCCBtn[4] = [340, 250, 0xdd5525, 20] ; RC Done ;  Red button Cancel in window request CC
Global $aSendRequestCCBtn[2] = [524, 250] ; Green button Send in window request CC
Global $atxtRequestCCBtn[2] = [430, 140] ; textbox in window request CC

;Switch Account
Global $aButtonSetting[4] = [820, 495, 0xFFFFFF, 10] ; RC Done ; Setting button, Main Screen
;SuperCell ID
Global $aButtonConnectedSCID[4] = [570, 514 + $g_iMidOffsetY, 0x6EB730, 20] ; Setting creen, Supercell ID Connected button
Global $aButtonLogOutSCID[4] = [700, 285 + $g_iMidOffsetY, 0x308AFB, 20] ; Supercell ID, Log Out button
Global $aButtonConfirmSCID[4] = [460, 410 + $g_iMidOffsetY, 0x328AFB, 20] ; Supercell ID, Confirm button
Global $aCloseTabSCID[4] = [765, 80] ; RC Done ; Button Close Supercell ID tab

; TRAIN
Global $aArmyTrainButton[2] = [40, 525 + $g_iBottomOffsetY] ; Main Screen, Army Train Button
Global $aArmyTrainButtonRND[4] = [20, 495, 55, 515] ; RC Done ; Main Screen, Army Train Button, RND  Screen 860x732
Global $aArmyCampSize[2] = [110, 136 + $g_iMidOffsetY] ; Training Window, Overview screen, Current Size/Total Size
Global $aSiegeMachineSize[2] = [755, 136 + $g_iMidOffsetY] ; Training Window, Overview screen, Current Number/Total Number
Global $aArmySpellSize[2] = [99, 284 + $g_iMidOffsetY] ; Training Window Overviewscreen, current number/total capacity
Global $g_aArmyCCSpellSize[2] = [473, 469 + $g_iMidOffsetYNew]  ; RC Done ; Training Window, Overview Screen, Current CC Spell number/total cc spell capacity
Global $aArmyCCRemainTime[2] = [782, 552 + $g_iMidOffsetY] ; RC Done ; Training Window Overviewscreen, Minutes & Seconds remaining till can request again
Global $aIsCampNotFull[4] = [149, 150 + $g_iMidOffsetY, 0x761714, 20] ; Training Window, Overview screen Red pixel in Exclamation mark with camp is not full
Global $aIsCampFull[4] = [128, 151 + $g_iMidOffsetY, 0xFFFFFF, 10] ; Training Window, Overview screen White pixel in check mark with camp IS full (can not test for Green, as it has trees under it!)
Global $aBarrackFull[4] = [388, 154 + $g_iMidOffsetY, 0xE84D50, 20] ; Training Window, Barracks Screen, Red pixel in Exclamation mark with Barrack is full
Global $aBuildersDigits[2] = [324, 21] ; Main Screen, Free/Total Builders
Global $aIsTabOpen[4] = [0, 145 + $g_iMidOffsetYNew, 0xEAEAE3, 25] ; RC Done ;Check if specific Tab is opened, X Coordinate is a dummy

Global $aArmyOverviewTest[4] = [150, 554 + $g_iMidOffsetY, 0xBC2BD1, 20] ; Color purple of army overview  bottom left

Global $aGreenArrowTrainTroops[2] = [310, 127 + $g_iMidOffsetYNew] ; RC Done
Global $aGreenArrowBrewSpells[2] = [467, 127 + $g_iMidOffsetYNew] ; RC Done

Global $aTrainBarb[4] = [-1, -1, -1, -1]
Global $aTrainArch[4] = [-1, -1, -1, -1]
Global $aTrainGiant[4] = [-1, -1, -1, -1]
Global $aTrainGobl[4] = [-1, -1, -1, -1]
Global $aTrainWall[4] = [-1, -1, -1, -1]
Global $aTrainBall[4] = [-1, -1, -1, -1]
Global $aTrainWiza[4] = [-1, -1, -1, -1]
Global $aTrainHeal[4] = [-1, -1, -1, -1]
Global $aTrainDrag[4] = [-1, -1, -1, -1]
Global $aTrainPekk[4] = [-1, -1, -1, -1]
Global $aTrainBabyD[4] = [-1, -1, -1, -1]
Global $aTrainMine[4] = [-1, -1, -1, -1]
Global $aTrainEDrag[4] = [-1, -1, -1, -1]
Global $aTrainMini[4] = [-1, -1, -1, -1]
Global $aTrainHogs[4] = [-1, -1, -1, -1]
Global $aTrainValk[4] = [-1, -1, -1, -1]
Global $aTrainGole[4] = [-1, -1, -1, -1]
Global $aTrainWitc[4] = [-1, -1, -1, -1]
Global $aTrainLava[4] = [-1, -1, -1, -1]
Global $aTrainBowl[4] = [-1, -1, -1, -1]
Global $aTrainIceG[4] = [-1, -1, -1, -1]
Global $aTrainLSpell[4] = [-1, -1, -1, -1]
Global $aTrainHSpell[4] = [-1, -1, -1, -1]
Global $aTrainRSpell[4] = [-1, -1, -1, -1]
Global $aTrainJSpell[4] = [-1, -1, -1, -1]
Global $aTrainFSpell[4] = [-1, -1, -1, -1]
Global $aTrainCSpell[4] = [-1, -1, -1, -1]
Global $aTrainPSpell[4] = [-1, -1, -1, -1]
Global $aTrainESpell[4] = [-1, -1, -1, -1]
Global $aTrainHaSpell[4] = [-1, -1, -1, -1]
Global $aTrainSkSpell[4] = [-1, -1, -1, -1]
Global $aTrainBaSpell[4] = [-1, -1, -1, -1]

Global $aTrainArmy[$eArmyCount] = [$aTrainBarb, $aTrainArch, $aTrainGiant, $aTrainGobl, $aTrainWall, $aTrainBall, $aTrainWiza, $aTrainHeal, $aTrainDrag, $aTrainPekk, $aTrainBabyD, $aTrainMine, $aTrainEDrag, _
		$aTrainMini, $aTrainHogs, $aTrainValk, $aTrainGole, $aTrainWitc, $aTrainLava, $aTrainBowl, $aTrainIceG, 0, 0, 0, 0, $aTrainLSpell, $aTrainHSpell, $aTrainRSpell, $aTrainJSpell, $aTrainFSpell, $aTrainCSpell, _
		$aTrainPSpell, $aTrainESpell, $aTrainHaSpell, $aTrainSkSpell, $aTrainBaSpell]

; #Variables# ====================================================================================================================
; Name ..........: Screen Position Variables
; Description ...: Global variables for commonly used X|Y positions, screen check color, and tolerance
; Syntax ........: $aXXXXX[Y]  : XXXX is name of point or item being checked, Y = 2 for position only, or 4 when color/tolerance value included
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;;;;;;;;;;;;;;;;;;;;;;;; OLD 860x732 resolution ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ERRORS PAGES
Global $aIsReloadError[4] = [457, 301 + $g_iMidOffsetY, 0x33B5E5, 10] ; Pixel Search Check point For All Reload Button errors, except break ending
Global $aBottomRightClient[4] = [850, 675 + $g_iBottomOffsetY, 0x000000, 0] ; BottomRightClient: Tolerance not needed
Global $aIsConnectLost[4] = [255, 271 + $g_iMidOffsetY, 0x33B5E5, 20] ; COC message : 'Connection Lost' network error or annother device
Global $aIsCheckOOS[4] = [223, 272 + $g_iMidOffsetY, 0x33B5E5, 20] ; COC message : 'Connection Lost' network error or annother device
Global $aIsMaintenance[4] = [350, 273 + $g_iMidOffsetY, 0x33B5E5, 20] ; COC message : 'Anyone there?'
Global $aReloadButton[4] = [443, 408 + $g_iMidOffsetY, 0x282828, 10] ; Reload Coc Button after Out of Sync, 860x780
Global $aReloadButton51[4] = [205, 390 + $g_iMidOffsetY, 0x434545, 10] ; Reload Coc Button after PBT Android 5.1 [$g_iAndroidVersionAPI = $g_iAndroidLollipop]
Global $aReloadButton71[4] = [205, 390 + $g_iMidOffsetY, 0x434545, 10] ; Reload Coc Button after PBT Android 7.1 [$g_iAndroidVersionAPI = $g_iAndroidNougat]
Global $aIsAttackShield[4] = [250, 415 + $g_iMidOffsetY, 0xE8E8E0, 10] ; Attack window, white shield verification window

; WINDOWS
Global $aMessageButton[2] = [38, 143] ; Main Screen, Message Button
Global $aIsGemWindow1[4] = [573, 256 + $g_iMidOffsetY, 0xEB1316, 20] ; Main Screen, pixel left of Red X to close gem window
Global $aIsGemWindow2[4] = [577, 266 + $g_iMidOffsetY, 0xCC2025, 20] ; Main Screen, pixel below Red X to close gem window
Global $aIsGemWindow3[4] = [586, 266 + $g_iMidOffsetY, 0xCC2025, 20] ; Main Screen, pixel below Red X to close gem window
Global $aIsGemWindow4[4] = [595, 266 + $g_iMidOffsetY, 0xCC2025, 20] ; Main Screen, pixel below Red X to close gem window

Global $g_aShopWindowOpen[4] = [804, 54, 0xC00508, 15] ; Red pixel in lower right corner of RED X to close shop window
Global $aTreasuryWindow[4] = [689, 138 + $g_iMidOffsetY, 0xFF8D95, 20] ; Redish pixel above X to close treasury window
Global $aAttackForTreasury[4] = [88, 619 + $g_iMidOffsetY, 0xF0EBE8, 5] ; Red pixel below X to close treasury window

Global $aLootCartBtn[2] = [430, 640 + $g_iBottomOffsetY] ; Main Screen Loot Cart button
Global $aCleanYard[4] = [418, 587 + $g_iBottomOffsetY, 0xE1DEBE, 20] ; Main Screen Clean Resources - Trees , Mushrooms etc
Global $aIsTrainPgChk1[4] = [813, 80 + $g_iMidOffsetY, 0xFF8D95, 10] ; Main Screen, Train page open - left upper corner of x button
Global $aIsTrainPgChk2[4] = [762, 328 + $g_iMidOffsetY, 0xF18439, 10] ; Main Screen, Train page open - Dark Orange in left arrow
Global $aRtnHomeCloud1[4] = [56, 592 + $g_iBottomOffsetY, 0x0A223F, 15] ; Cloud Screen, during search, blue pixel in left eye
Global $aRtnHomeCloud2[4] = [72, 592 + $g_iBottomOffsetY, 0x103F7E, 15] ; Cloud Screen, during search, blue pixel in right eye
Global $aDetectLang[2] = [16, 634 + $g_iBottomOffsetY] ; Detect Language, bottom left Attack button must read "Attack"


; PROFILE
Global Const $aProfileReport[4] = [619, 344, 0x4E4D79, 20] ; Dark Purple of Profile Page when no Attacks were made
Global $aCheckTopProfile[4] = [200, 166, 0x868CAC, 5]
Global $aCheckTopProfile2[4] = [220, 355, 0x4E4D79, 5]

;returnhome
Global Const $aRtnHomeCheck1[4] = [363, 548 + $g_iMidOffsetY, 0x78C11C, 20]
Global Const $aRtnHomeCheck2[4] = [497, 548 + $g_iMidOffsetY, 0x79C326, 20]

;ReplayShare
Global Const $aAttackLogPage[4] = [775, 125 + $g_iMidOffsetYNew, 0xEB1115, 40] ; RC Done ;red on X Button of Attack Log Page
Global Const $aAttackLogAttackTab[4] = [437, 114 + $g_iMidOffsetYNew, 0xF0F4F0, 30] ; White on Attack Log Tab  (Tab Name) [RC]
Global Const $aBlueShareReplayButton[4] = [500, 156 + $g_iMidOffsetY, 0x70D4E8, 30] ; Blue Share Replay Button
Global Const $aGrayShareReplayButton[4] = [500, 156 + $g_iMidOffsetY, 0xBBBBBB, 30] ; Gray Share Replay Button

;Google Play
Global $aButtonConnected[4] = [534, 380 + $g_iMidOffsetY, 0xC5EB6D, 20] ; Setting screen, Connected button
Global $aButtonDisconnected[4] = [534, 380 + $g_iMidOffsetY, 0xFE6D72, 20] ; Setting screen, Disconnected button
Global $aListAccount[4] = [635, 210 + $g_iMidOffsetY, 0xFFFFFF, 10] ; Accounts list google, White
Global $aButtonVillageLoad[4] = [515, 411 + $g_iMidOffsetY, 0x6EBD1F, 20] ; Load button, Green
Global $aTextBox[4] = [320, 190, 0xFFFFFF, 10] ; RC Done ; Text box, White
Global $aButtonVillageOkay[4] = [500, 200, 0x81CA2D, 20] ; RC Done ; Okay button, Green


;Change Language To English
Global $aButtonLanguage[4] = [210, 375 + $g_iMidOffsetY, 0xD0E978, 20]
Global $aListLanguage[4] = [110, 90 + $g_iMidOffsetY, 0xFFFFFF, 10]
Global $aEnglishLanguage[4] = [420, 140 + $g_iMidOffsetY, 0xD7D5C7, 20]
Global $aLanguageOkay[4] = [510, 420 + $g_iMidOffsetY, 0x6FBD1F, 20]


#CS
; #Variables# ====================================================================================================================
; Name ..........: Screen Position Variables
; Description ...: Global variables for commonly used X|Y positions, screen check color, and tolerance
; Syntax ........: $aXXXXX[Y]  : XXXX is name of point or item being checked, Y = 2 for position only, or 4 when color/tolerance value included
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
;                                 x    y     color  tolerance
Global $aCenterEnemyVillageClickDrag = [65, 545] ; Scroll village using this location in the water
Global $aCenterHomeVillageClickDrag = [430, 650] ; Scroll village using this location in the water
Global $aIsReloadError[4] = [457, 301 + $g_iMidOffsetY, 0x33B5E5, 10] ; Pixel Search Check point For All Reload Button errors, except break ending
Global $aIsMain[4] = [278, 9, 0x77BDE0, 20] ; Main Screen, Builder Info Icon
Global $aIsMainGrayed[4] = [278, 9, 0x3C5F70, 15] ; Main Screen, Builder Info Icon grayed

Global $aIsOnBuilderBase[4] = [838, 18, 0xffff46, 10] ; Check the Gold Coin from resources , is a square not round

Global $aIsConnectLost[4] = [255, 271 + $g_iMidOffsetY, 0x33B5E5, 20] ; COC message : 'Connection Lost' network error or annother device
Global $aIsCheckOOS[4] = [223, 272 + $g_iMidOffsetY, 0x33B5E5, 20] ; COC message : 'Connection Lost' network error or annother device
Global $aIsMaintenance[4] = [350, 273 + $g_iMidOffsetY, 0x33B5E5, 20] ; COC message : 'Anyone there?'
Global $aReloadButton[4] = [443, 408 + $g_iMidOffsetY, 0x282828, 10] ; Reload Coc Button after Out of Sync, 860x780
Global $aAttackButton[2] = [60, 614 + $g_iBottomOffsetY] ; Attack Button, Main Screen
Global $aFindMatchButton[4] = [195, 480 + $g_iBottomOffsetY, 0xFFBF43, 10] ; Find Multiplayer Match Button, Attack Screen 860x780 without shield
Global $aFindMatchButton2[4] = [195, 480 + $g_iBottomOffsetY, 0xE75D0D, 10] ; Find Multiplayer Match Button, Attack Screen 860x780 with shield
Global $aIsAttackShield[4] = [250, 415 + $g_iMidOffsetY, 0xE8E8E0, 10] ; Attack window, white shield verification window
Global $aAway[2] = [175, 10] ; Away click, moved from 1,1 to prevent scroll window from top, moved from 0,10 to 175,32 to prevent structure click or 175,10 to just fix MEmu 2.x opening and closing toolbar
;Global $aRemoveShldButton[4] = [470, 18, 0xA80408, 10] ; Legacy - Main Screen, Red pixel lower part of Minus sign to remove shield, used to validate latest COC installed
Global $aNoShield[4] = [448, 20, 0x43484B, 15] ; Main Screen, charcoal pixel center of shield when no shield is present
Global $aHaveShield[4] = [455, 19, 0xF0F8FB, 15] ; Main Screen, Silver pixel top center of shield
Global $aHavePerGuard[4] = [455, 19, 0x10100D, 15] ; Main Screen, black pixel in sword outline top center of shield
Global $aShieldInfoButton[4] = [431, 10, 0x75BDE4, 15] ; Main Screen, Blue pixel upper part of "i"
Global $aIsShieldInfo[4] = [645, 195, 0xED1115, 20] ; Main Screen, Shield Info window, red pixel right of X
Global $aSurrenderButton[4] = [70, 545 + $g_iBottomOffsetY, 0xC00000, 40] ; Surrender Button, Attack Screen
Global $aConfirmSurrender[4] = [500, 415 + $g_iMidOffsetY, 0x60AC10, 20] ; Confirm Surrender Button, Attack Screen, green color on button?
Global $aCancelFight[4] = [822, 48, 0xD80408, 20] ; Cancel Fight Scene
Global $aCancelFight2[4] = [830, 59, 0xD80408, 20] ; Cancel Fight Scene 2nd pixel
Global $aEndFightSceneBtn[4] = [429, 519 + $g_iMidOffsetY, 0xB8E35F, 20] ; Victory or defeat scene buton = green edge
Global $aEndFightSceneAvl[4] = [241, 196 + $g_iMidOffsetY, 0xFFF090, 20] ; Victory or defeat scene left side ribbon = light gold
Global $aReturnHomeButton[4] = [376, 567 + $g_iMidOffsetY, 0x60AC10, 20] ; Return Home Button, End Battle Screen
Global $aChatTab[4] = [331, 325 + $g_iMidOffsetY, 0xF0951D, 20] ; Chat Window Open, Main Screen
Global $aChatTab2[4] = [331, 330 + $g_iMidOffsetY, 0xF0951D, 20] ; Chat Window Open, Main Screen
Global $aChatTab3[4] = [331, 335 + $g_iMidOffsetY, 0xF0951D, 20] ; Chat Window Open, Main Screen
Global $aOpenChat[2] = [19, 349 + $g_iMidOffsetY] ; Open Chat Windows, Main Screen
Global $aClanTab[2] = [189, 24] ; Clan Tab, Chat Window, Main Screen
Global $aClanInfo[2] = [282, 55] ; Clan Info Icon
Global $aArmyCampSize[2] = [110, 136 + $g_iMidOffsetY] ; Training Window, Overview screen, Current Size/Total Size
Global $aSiegeMachineSize[2] = [755, 136 + $g_iMidOffsetY] ; Training Window, Overview screen, Current Number/Total Number
Global $aArmySpellSize[2] = [99, 284 + $g_iMidOffsetY] ; Training Window Overviewscreen, current number/total capacity
Global $g_aArmyCCSpellSize[2] = [473, 438 + $g_iMidOffsetY] ; Training Window, Overview Screen, Current CC Spell number/total cc spell capacity
Global $aArmyCCRemainTime[2] = [782, 552 + $g_iMidOffsetY] ; Training Window Overviewscreen, Minutes & Seconds remaining till can request again
Global $aIsCampNotFull[4] = [149, 150 + $g_iMidOffsetY, 0x761714, 20] ; Training Window, Overview screen Red pixel in Exclamation mark with camp is not full
Global $aIsCampFull[4] = [128, 151 + $g_iMidOffsetY, 0xFFFFFF, 10] ; Training Window, Overview screen White pixel in check mark with camp IS full (can not test for Green, as it has trees under it!)
Global $aBarrackFull[4] = [388, 154 + $g_iMidOffsetY, 0xE84D50, 20] ; Training Window, Barracks Screen, Red pixel in Exclamation mark with Barrack is full
Global $aBuildersDigits[2] = [324, 21] ; Main Screen, Free/Total Builders
Global $aBuildersDigitsBuilderBase[2] = [414, 21] ; Main Screen on Builders Base Free/Total Builders
Global $aLanguageCheck1[4] = [326, 8, 0xF9FAF9, 20] ; Main Screen Test Language for word 'Builders'
Global $aLanguageCheck2[4] = [329, 9, 0x060706, 20] ; Main Screen Test Language for word 'Builders'
Global $aLanguageCheck3[4] = [348, 12, 0x040403, 20] ; Main Screen Test Language for word 'Builders'
Global $aLanguageCheck4[4] = [354, 11, 0x090908, 20] ; Main Screen Test Language for word 'Builders'
Global $aTrophies[2] = [69, 84] ; Main Screen, Trophies
Global $aNoCloudsAttack[4] = [25, 606, 0xCD0D0D, 15] ; Attack Screen: No More Clouds
Global $aMessageButton[2] = [38, 143] ; Main Screen, Message Button
Global $aArmyTrainButton[2] = [40, 525 + $g_iBottomOffsetY] ; Main Screen, Army Train Button
Global $aWonOneStar[4] = [714, 538 + $g_iBottomOffsetY, 0xC0C8C0, 20] ; Center of 1st Star for winning attack on enemy
Global $aWonTwoStar[4] = [739, 538 + $g_iBottomOffsetY, 0xC0C8C0, 20] ; Center of 2nd Star for winning attack on enemy
Global $aWonThreeStar[4] = [763, 538 + $g_iBottomOffsetY, 0xC0C8C0, 20] ; Center of 3rd Star for winning attack on enemy
Global $aArmyOverviewTest[4] = [150, 554 + $g_iMidOffsetY, 0xBC2BD1, 20] ; Color purple of army overview  bottom left
Global $aCancRequestCCBtn[4] = [340, 250, 0xCC4010, 20] ; Red button Cancel in window request CC
Global $aSendRequestCCBtn[2] = [524, 250] ; Green button Send in window request CC
Global $atxtRequestCCBtn[2] = [430, 140] ; textbox in window request CC
Global $aIsAtkDarkElixirFull[4] = [743, 62 + $g_iMidOffsetY, 0x270D33, 10] ; Attack Screen DE Resource bar is full
Global $aIsDarkElixirFull[4] = [708, 102 + $g_iMidOffsetY, 0x270D33, 10] ; Main Screen DE Resource bar is full
Global $aIsGoldFull[4] = [659, 2 + $g_iMidOffsetY, 0xE7C00D, 10] ; Main Screen Gold Resource bar is Full
Global $aIsElixirFull[4] = [659, 52 + $g_iMidOffsetY, 0xC027C0, 10] ; Main Screen Elixir Resource bar is Full
Global $aConfirmCoCExit[2] = [515, 410 + $g_iMidOffsetY] ; CoC Confirm Exit button (no color for button as it matches grass)
Global $aPerkBtn[4] = [95, 243 + $g_iMidOffsetY, 0x7cd8e8, 10] ; Clan Info Page, Perk Button (blue); 800x780
Global $aIsGemWindow1[4] = [573, 256 + $g_iMidOffsetY, 0xEB1316, 20] ; Main Screen, pixel left of Red X to close gem window
Global $aIsGemWindow2[4] = [577, 266 + $g_iMidOffsetY, 0xCC2025, 20] ; Main Screen, pixel below Red X to close gem window
Global $aIsGemWindow3[4] = [586, 266 + $g_iMidOffsetY, 0xCC2025, 20] ; Main Screen, pixel below Red X to close gem window
Global $aIsGemWindow4[4] = [595, 266 + $g_iMidOffsetY, 0xCC2025, 20] ; Main Screen, pixel below Red X to close gem window
Global $aLootCartBtn[2] = [430, 640 + $g_iBottomOffsetY] ; Main Screen Loot Cart button
Global $aCleanYard[4] = [418, 587 + $g_iBottomOffsetY, 0xE1DEBE, 20] ; Main Screen Clean Resources - Trees , Mushrooms etc
Global $aIsTrainPgChk1[4] = [813, 80 + $g_iMidOffsetY, 0xFF8D95, 10] ; Main Screen, Train page open - left upper corner of x button
Global $aIsTrainPgChk2[4] = [762, 328 + $g_iMidOffsetY, 0xF18439, 10] ; Main Screen, Train page open - Dark Orange in left arrow
Global $aRtnHomeCloud1[4] = [56, 592 + $g_iBottomOffsetY, 0x0A223F, 15] ; Cloud Screen, during search, blue pixel in left eye
Global $aRtnHomeCloud2[4] = [72, 592 + $g_iBottomOffsetY, 0x103F7E, 15] ; Cloud Screen, during search, blue pixel in right eye
Global $aDetectLang[2] = [16, 634 + $g_iBottomOffsetY] ; Detect Language, bottom left Attack button must read "Attack"
Global $aGreenArrowTrainTroops[2] = [310, 127]
Global $aGreenArrowBrewSpells[2] = [467, 127]
Global $g_aShopWindowOpen[4] = [804, 54, 0xC00508, 15] ; Red pixel in lower right corner of RED X to close shop window
Global $aTreasuryWindow[4] = [689, 138 + $g_iMidOffsetY, 0xFF8D95, 20] ; Redish pixel above X to close treasury window
Global $aAttackForTreasury[4] = [88, 619 + $g_iMidOffsetY, 0xF0EBE8, 5] ; Red pixel below X to close treasury window
Global $aAtkHasDarkElixir[4]  = [ 31, 144, 0x282020, 10] ; Attack Page, Check for DE icon
Global $aVillageHasDarkElixir[4] = [837, 134, 0x3D2D3D, 10] ; Main Page, Base has dark elixir storage

Global $aCheckTopProfile[4] = [200, 166, 0x868CAC, 5]
Global $aCheckTopProfile2[4] = [220, 355, 0x4E4D79, 5]

Global $aIsTabOpen[4] = [0, 145, 0xEAEAE3, 25];Check if specific Tab is opened, X Coordinate is a dummy

Global $aRecievedTroops[4] = [200 ,215 ,0xFFFFFF, 20] ; Y of You have recieved blabla from xx!

; King Health Bar, check at the middle of the bar, index 4 is x-offset added to middle of health bar
Global $aKingHealth = [-1, 569 + $g_iBottomOffsetY, 0x00D500, 15, 13]
; Queen Health Bar, check at the middle of the bar, index 4 is x-offset added to middle of health bar
Global $aQueenHealth = [-1, 569 + $g_iBottomOffsetY, 0x00D500, 15, 8]
; Warden Health Bar, check at the middle of the bar, index 4 is x-offset added to middle of health bar
Global $aWardenHealth = [-1, 569 + $g_iBottomOffsetY, 0x00D500, 15, 3]

; attack report... stars won
Global $aWonOneStarAtkRprt[4] = [325, 180 + $g_iMidOffsetY, 0xC8CaC4, 30] ; Center of 1st Star reached attacked village
Global $aWonTwoStarAtkRprt[4] = [398, 180 + $g_iMidOffsetY, 0xD0D6D0, 30] ; Center of 2nd Star reached attacked village
Global $aWonThreeStarAtkRprt[4] = [534, 180 + $g_iMidOffsetY, 0xC8CAC7, 30] ; Center of 3rd Star reached attacked village
; pixel color: location information								BS 850MB (Reg GFX), BS 500MB (Med GFX) : location

Global $NextBtn[4] = [780, 546 + $g_iBottomOffsetY, 0xD34300, 20] ;  Next Button
Global $a12OrMoreSlots[4] = [16, 648, 0x4583B9, 25] ; Attackbar Check if 12+ Slots exist
Global $aDoubRowAttackBar[4] = [68, 486, 0xFC5D64, 20]
Global $aTroopIsDeployed[4] = [0, 0, 0x404040, 20] ; Attackbar Remain Check X and Y are Dummies
Global Const $aIsAttackPage[4] = [56, 548 + $g_iBottomOffsetY, 0xcf0d0e, 20] ; red button "end battle" 860x780

; 1 - Dark Gray : Castle filled/No Castle | 2 - Light Green : Available or Already made | 3 - White : Available or Castle filled/No Castle
Global $aRequestTroopsAO[6] = [761, 592, 0x565656, 0x71BA2F, 0xFFFFFE, 25] ; Button Request Troops in Army Overview  (x,y, Gray - Full/No Castle, Green - Available or Already, White - Available or Full)

Global Const $aOpenChatTab[4] = [19, 335 + $g_iMidOffsetY, 0xE88D27, 20]
Global Const $aCloseChat[4] = [331, 330 + $g_iMidOffsetY, 0xF0951D, 20] ; duplicate with $aChatTab above, need to rename and fix all code to use one?
Global Const $aChatDonateBtnColors[4][4] = [[0x0d0d0d, 0, -4, 20], [0xdaf582, 10, 0, 20], [0xcdef75, 10, 5, 20], [0xFFFFFF, 24, 9, 10]]

;attackreport
Global Const $aAtkRprtDECheck[4] = [459, 372 + $g_iMidOffsetY, 0x433350, 20]
Global Const $aAtkRprtTrophyCheck[4] = [327, 189 + $g_iMidOffsetY, 0x3B321C, 30]
Global Const $aAtkRprtDECheck2[4] = [678, 418 + $g_iMidOffsetY, 0x030000, 30]

;returnhome
Global Const $aRtnHomeCheck1[4] = [363, 548 + $g_iMidOffsetY, 0x78C11C, 20]
Global Const $aRtnHomeCheck2[4] = [497, 548 + $g_iMidOffsetY, 0x79C326, 20]
;Global Const $aRtnHomeCheck3[4]      = [ 284,  28, 0x41B1CD, 20]

Global Const $aSearchLimit[6] = [19, 565, 104, 580, 0xD9DDCF, 10] ; (kaganus) no idea what this is for

;CheckImageType (Normal, Snow, etc)
Global Const $aImageTypeN1[4] = [237, 161, 0xD5A849, 30] ; Sand on Forest Edge 'Lane' 860x780
Global Const $aImageTypeN2[4] = [205, 180, 0x86A533, 30] ; Grass on Forest Edge 'Lane' 860x780
Global Const $aImageTypeS1[4] = [237, 161, 0xFEFDFD, 30] ; Snow on Forest Edge 'Lane' 860x780
Global Const $aImageTypeS2[4] = [205, 180, 0xFEFEFE, 30] ; Snow on Forest Edge 'Lane' 860x780

;ReplayShare
Global Const $aAttackLogPage[4] = [775, 125, 0xEB1115, 40] ;red on X Button of Attack Log Page
Global Const $aAttackLogAttackTab[4] = [437, 114, 0xF0F4F0, 30] ; White on Attack Log Tab  (Tab Name)
Global Const $aBlueShareReplayButton[4] = [500, 156 + $g_iMidOffsetY, 0x70D4E8, 30] ; Blue Share Replay Button
Global Const $aGrayShareReplayButton[4] = [500, 156 + $g_iMidOffsetY, 0xBBBBBB, 30] ; Gray Share Replay Button

Global Const $aProfileReport[4] = [619, 344, 0x4E4D79, 20] ; Dark Purple of Profile Page when no Attacks were made

Global $aArmyTrainButtonRND[4] = [20, 540 + $g_iMidOffsetY, 55, 570 + $g_iMidOffsetY] ; Main Screen, Army Train Button, RND  Screen 860x732
Global $aAttackButtonRND[4] = [20, 610 + $g_iMidOffsetY, 100, 670 + $g_iMidOffsetY] ; Attack Button, Main Screen, RND  Screen 860x732
Global $aFindMatchButtonRND[4] = [200, 510 + $g_iMidOffsetY, 300, 530 + $g_iMidOffsetY] ; Find Multiplayer Match Button, Both Shield or without shield Screen 860x732
Global $NextBtnRND[4] = [710, 530 + $g_iMidOffsetY, 830, 570 + $g_iMidOffsetY] ;  Next Button

;Switch Account
Global $aLoginWithSupercellID[4] = [280, 640 + $g_iMidOffsetY, 0xDCF684, 20] ; Upper green button section "Log in with Supercell ID" 0xB1E25A
Global $aLoginWithSupercellID2[4] = [266, 653 + $g_iMidOffsetY, 0xFFFFFF , 10] ; White Font "Log in with Supercell ID"
Global $aButtonSetting[4] = [820, 550 + $g_iMidOffsetY, 0xFFFFFF, 10] ; Setting button, Main Screen
Global $aIsSettingPage[4] = [753, 75 + $g_iMidOffsetY, 0xFF8F95, 10] ; Main Screen, Setting page open - left upper corner of x button

;Google Play
Global $aButtonConnected[4] = [602, 374 + $g_iMidOffsetY, 0xDAF481, 20] ; Setting screen, Connected button
Global $aButtonDisconnected[4] = [602, 374 + $g_iMidOffsetY, 0xFF7E82, 20] ; Setting screen, Disconnected button
Global $aListAccount[4] = [635, 210 + $g_iMidOffsetY, 0xFFFFFF, 10] ; Accounts list google, White
Global $aButtonVillageLoad[4] = [515, 411 + $g_iMidOffsetY, 0x6EBD1F, 20] ; Load button, Green
Global $aTextBox[4] = [320, 160 + $g_iMidOffsetY, 0xFFFFFF, 10] ; Text box, White
Global $aButtonVillageOkay[4] = [500, 170 + $g_iMidOffsetY, 0x81CA2D, 20] ; Okay button, Green

;SuperCell ID
Global $aButtonConnectedSCID[4] = [453, 513 + $g_iMidOffsetY, 0x72BB2F, 20] ; Setting screen, Supercell ID Connected button
Global $aButtonLogOutSCID[4] = [615,  270 + $g_iMidOffsetY, 0x308AFB, 20] ; Supercell ID, Log Out button
Global $aButtonConfirmSCID[4] = [475, 420 + $g_iMidOffsetY, 0x2C88FA, 20] ; Supercell ID, Confirm button
Global $aListAccountSCID[4] = [490, 185 + $g_iMidOffsetY, 0x000000, 10] ; Supercell ID, Black check in word "ID"
Global $aCloseTabSCID[4] = [732, 145] ; Button Close Supercell ID tab

;Train
Global $aButtonEditArmy[4] = [800, 542, 0xDDF685, 25]
Global $aButtonRemoveTroopsOK1[4] = [778, 563, 0xDAF582, 25]
Global $aButtonRemoveTroopsOK2[4] = [508, 428, 0xFFFFFF, 30]

Global $aTrainBarb[4]  = [-1, -1, -1, -1]
Global $aTrainArch[4]  = [-1, -1, -1, -1]
Global $aTrainGiant[4] = [-1, -1, -1, -1]
Global $aTrainGobl[4]  = [-1, -1, -1, -1]
Global $aTrainWall[4]  = [-1, -1, -1, -1]
Global $aTrainBall[4]  = [-1, -1, -1, -1]
Global $aTrainWiza[4]  = [-1, -1, -1, -1]
Global $aTrainHeal[4]  = [-1, -1, -1, -1]
Global $aTrainDrag[4]  = [-1, -1, -1, -1]
Global $aTrainPekk[4]  = [-1, -1, -1, -1]
Global $aTrainBabyD[4] = [-1, -1, -1, -1]
Global $aTrainMine[4]  = [-1, -1, -1, -1]
Global $aTrainEDrag[4]  = [-1, -1, -1, -1]
Global $aTrainMini[4] = [-1, -1, -1, -1]
Global $aTrainHogs[4] = [-1, -1, -1, -1]
Global $aTrainValk[4] = [-1, -1, -1, -1]
Global $aTrainGole[4] = [-1, -1, -1, -1]
Global $aTrainWitc[4] = [-1, -1, -1, -1]
Global $aTrainLava[4] = [-1, -1, -1, -1]
Global $aTrainBowl[4] = [-1, -1, -1, -1]
Global $aTrainIceG[4] = [-1, -1, -1, -1]
Global $aTrainLSpell[4] = [-1, -1, -1, -1]
Global $aTrainHSpell[4] = [-1, -1, -1, -1]
Global $aTrainRSpell[4] = [-1, -1, -1, -1]
Global $aTrainJSpell[4] = [-1, -1, -1, -1]
Global $aTrainFSpell[4] = [-1, -1, -1, -1]
Global $aTrainCSpell[4] = [-1, -1, -1, -1]
Global $aTrainPSpell[4] = [-1, -1, -1, -1]
Global $aTrainESpell[4] = [-1, -1, -1, -1]
Global $aTrainHaSpell[4] = [-1, -1, -1, -1]
Global $aTrainSkSpell[4] = [-1, -1, -1, -1]
Global $aTrainBtSpell[4] = [-1, -1, -1, -1]
Global $aTrain[4] = [-1, -1, -1, -1]

Global $aTrainArmy[$eArmyCount] = [$aTrainBarb, $aTrainArch, $aTrainGiant, $aTrainGobl, $aTrainWall, $aTrainBall, $aTrainWiza, $aTrainHeal, $aTrainDrag, $aTrainPekk, $aTrainBabyD, $aTrainMine, $aTrainEDrag, _
								   $aTrainMini, $aTrainHogs, $aTrainValk, $aTrainGole, $aTrainWitc, $aTrainLava, $aTrainBowl, $aTrainIceG, 0, 0, 0, 0, $aTrainLSpell, $aTrainHSpell, $aTrainRSpell, $aTrainJSpell, $aTrainFSpell, $aTrainCSpell, _
								   $aTrainPSpell, $aTrainESpell, $aTrainHaSpell, $aTrainSkSpell, $aTrainBtSpell]
;Change Language To English
Global $aButtonLanguage[4] = [210, 375 + $g_iMidOffsetY, 0xD0E978, 20]
Global $aListLanguage[4] = [110, 90 + $g_iMidOffsetY, 0xFFFFFF, 10]
Global $aEnglishLanguage[4] = [420, 140 + $g_iMidOffsetY, 0xD7D5C7, 20]
Global $aLanguageOkay[4] = [510, 420 + $g_iMidOffsetY, 0x6FBD1F, 20]
#CE