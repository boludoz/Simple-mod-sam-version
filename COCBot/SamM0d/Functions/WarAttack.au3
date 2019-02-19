Func WarAttack()
	; Bld Mod ===========================
	Local $g_aiColorsMyProfilePixel = 0
	Local $aBtnColorsMyProfile[3][3] = [[0xBDE86C, 1, 0], [0x9CBF5F, 0, 1], [0xBDE86C, 2, 0]] 
	Local $aAureolaAldea = 0
	Local $aAttackButton[3][3] = [[0xFFC854, 0, 1], [0xFFC854, 1, 1], [0xFFC854, 2, 1]]
	Local $sAttackButton = 0
	Local $iGAME_WIDTH_Mitad = 0
	Local $bFailControl = True
	
		If $g_bRunState = False Then Return 

		; War Info
		For $i = 0 To 15 - 1
			If QuickMIS("BC1", $directory & "\AttackProcess", 767, 538, 767 + 100, 538 + 100, True) Then
				Click($g_iQuickMISX + 767, $g_iQuickMISY + 538, 1)
				If _Sleep(750) Then Return
				$bFailControl = False
				ExitLoop
			EndIf
		Next
		
		If $g_bRunState = False Or $bFailControl = True Then Return 
		
		$bFailControl = True
		
		; My Team
		For $i = 0 To 15 - 1
			Click(516, 61, 1)
			If _Sleep(750) Then Return
				If _ColorCheck(_GetPixelColor(516, 61, True), "EFEFEB", 20) Then 
					If _Sleep(750) Then Return
					$bFailControl = False
					ExitLoop
				EndIf
		Next
		
		If $g_bRunState = False and $bFailControl = True Then Return 
		
		$bFailControl = True
		
		; Drag
		For $i = 0 To 60 - 1
			$g_aiColorsMyProfilePixel = _MultiPixelSearch(450, 161, 845, 673, -1, 1, Hex(0xBDE86C, 6), $aBtnColorsMyProfile, 20)
			If IsArray($g_aiColorsMyProfilePixel) Then
				Click($g_aiColorsMyProfilePixel[0], $g_aiColorsMyProfilePixel[1] + 5, 1)
				If _Sleep(750) Then Return
				$bFailControl = False
				ExitLoop
				Else 
				ClickDrag(345, 665 - Random(75,100) + $g_iMidOffsetY, 345, 440 - Random(75,100) + $g_iMidOffsetY, Random(50,2000))
				If _Sleep(1750) Then Return
			EndIf
		Next
		
		If $g_bRunState = False Or $bFailControl = True Then Return 
		
		$bFailControl = True
		
		; ViewOnMap
		For $i = 0 To 15 - 1
			If QuickMIS("BC1", $directory & "\ViewOnMap", 415, 165, 600, 730, True) Then
				Click($g_iQuickMISX + 415, $g_iQuickMISY + 165, 1)
				If _Sleep(1750) Then Return
				$bFailControl = False
				ExitLoop
			EndIf
		Next
		
		If $g_bRunState = False Or $bFailControl = True Then Return 
		
		$bFailControl = True
		For $i = 0 To 15 - 1
			$aAureolaAldea = MultiPSimple(144, 141, 409, 477, 0xE0C898)
			Sleep(1)
			If Not $aAureolaAldea[0] = 0 Then 
				$bFailControl = False
				ExitLoop
			EndIf
		Next
		
		$iGAME_WIDTH_Mitad = Abs($g_iGAME_WIDTH / 2 - $aAureolaAldea[0]) + $g_iGAME_WIDTH / 2
		
		Click($iGAME_WIDTH_Mitad, $aAureolaAldea[1] - 50, 1)
		If _Sleep(750) Then Return
		
		If $g_bRunState = False Or $bFailControl = True Then Return 
		
		$bFailControl = True
		
		Local $bCanAttack = False
		Local $iMaxSearch = 0
		Local $g_bRadioAttackControlReturn = False
		Local $g_bRadioAttackControlUp = False
		Local $g_bRadioAttackControlDown = True

		;Loop start END
		For $ii 0 To $iMaxSearch - 1 ; VAR
			For $i = 0 To 15 - 1                                            
				$aAureolaAldea = MultiPSimple(260, 631, 270, 640, 0xFFDC48) 
				Sleep(1)                                                    
				If Not $aAureolaAldea[0] = 0 Then                           
					$bCanAttack = True                                      
					ExitLoop                                              
				EndIf                                                       
			Next
			
			If _Sleep(750) Then Return
			
			; IF + or -
			;FFBD51 Color next or back
			If $bCanAttack = False Then
				Switch True
					Case $g_bRadioAttackControlReturn ; Back to village
						Return
					Case $g_bRadioAttackControlUp
							$aAureolaAldea = MultiPSimple(187, 612, 218, 629 0xFFBD51)  
							Sleep(150)                                                     
							If $aAureolaAldea[0] = 0 Then 
								Click($aAureolaAldea[0], $aAureolaAldea[1], 1)
								Else 
								Return
							EndIf                                                        
					Case $g_bRadioAttackControlDown
							$aAureolaAldea = MultiPSimple(650, 612, 684, 631, 0xFFBD51)  
							Sleep(150)                                                     
							If $aAureolaAldea[0] = 0 Then 
								Click($aAureolaAldea[0], $aAureolaAldea[1], 1)
								Else 
								Return
							EndIf                                                        
				EndSwitch
			EndIf
		Next
		;Loop down END
		
		If $g_bRunState = False Or $bCanAttack = False Then Return 
		
		$bFailControl = True                                                
		
		;Orange Attack
		For $i = 0 To 3 - 1
			If QuickMIS("BC1", $directory & "\Attack", 431, 580, 572, 646, True) Then
				Click($g_iQuickMISX + 431, $g_iQuickMISY + 580, 1)
				If _Sleep(750) Then Return
				$bFailControl = False
				ExitLoop
			EndIf
		Next
		

		;Optional attack Warning                                            
		If $g_bRunState = False Or $bFailControl = True Then Return         
		                                                                    
		$bFailControl = True                                                
		For $i = 0 To 15 - 1                                                
			$aAureolaAldea = MultiPSimple(248, 261, 599, 469, 0xDFF887)     
			Sleep(1)                                                        
			If Not $aAureolaAldea[0] = 0 Then  
			Click($aAureolaAldea[0], $aAureolaAldea[1], 1)
				$bFailControl = False                                       
				ExitLoop                                                    
			EndIf
		Next

		;True attack                                                        
		If $g_bRunState = False Or $bFailControl = True Then Return         
		                                                                    
		$bFailControl = True                                                
		For $i = 0 To 15 - 1                                                
			$aAureolaAldea = MultiPSimple(446, 400, 575, 450, 0xDDF783, 30)     
			Sleep(1)                                                        
			If Not $aAureolaAldea[0] = 0 Then                         
				Click($aAureolaAldea[0], $aAureolaAldea[1], 1)
				$bFailControl = False                                       
				ExitLoop                                                    
			EndIf
		Next
		
		If $g_bRunState = False Or $bFailControl = True Then Return 

		AttackNowWar()
	; ===================================
EndFunc   ;==>WarAttack

Func AttackNowWar()
	Setlog("Begin Live Base Attack TEST")
	$g_iMatchMode = $LB
	$g_aiAttackAlgorithm[$LB] = 1
	$g_sAttackScrScriptName[$LB] = GuiCtrlRead($g_hCmbScriptNameAB)

	ForceCaptureRegion()
	_CaptureRegion2()

	Setlog("Check ZoomOut...", $COLOR_INFO)
	If CheckZoomOut2("VillageSearch", False, False) = False Then
		$i = 0
		Local $bMeasured
		Do
			$i += 1
			If _Sleep($DELAYPREPARESEARCH2) Then Return ; wait 500 ms
			ForceCaptureRegion()
			_CaptureRegion2()
			$bMeasured = CheckZoomOutWar("VillageSearch", True, False)
		Until $bMeasured = True Or $i >= 2
		If $bMeasured = False Then
			SetLog("CheckZoomOut failed!", $COLOR_ERROR)
			Return ; exit func
		EndIf
	EndIf

	ResetTHsearch()
	_ObjDeleteKey($g_oBldgAttackInfo, "")

	PrepareAttack($g_iMatchMode)
	Attack()
	SetLog("Check Heroes Health and waiting battle for end.", $COLOR_INFO)
	While IsAttackPage() And ($g_bCheckKingPower Or $g_bCheckQueenPower Or $g_bCheckWardenPower)
		CheckHeroesHealth()
		If _Sleep(500) Then Return
	WEnd

	Setlog("End War ATTACK")
EndFunc ; ==>AttackNowLB

Func MultiPSimple($iX, $iY, $iX2, $iY2, $Hex, $iTolerance = 10) ; returns true if the last chat was not by you, false otherwise
	_CaptureRegion($iX, $iY, $iX2, $iY2)
	Local $aReturn[2] = [0, 0]
	
	For $y = $iY To $iY2 - 1
		For $x = $iX To $iX2 - 1
			If _ColorCheck(Hex(_GDIPlus_BitmapGetPixel($g_hBitmap, $x, $y), 6), Hex($Hex, 6), $iTolerance) Then 
			$aReturn[0] = $iX + $x
			$aReturn[1] = $iY + $y
			ExitLoop
			EndIf
		Next
	Next
	
	Return $aReturn
EndFunc   ;==>MultiPSimple

Func AttackNowWar()
	Setlog("War Attack", $COLOR_RED)
	
	$g_iMatchMode = $DB
	$g_aiAttackAlgorithm[$DB] = 1
	$g_sAttackScrScriptName[$DB] = GuiCtrlRead($g_hCmbScriptNameDB)

	$g_aiAttackUseHeroes[$g_iMatchMode] = True
	
	$g_aiAttackUseHeroes[$g_iMatchMode] = True
	
	$g_aiAttackUseHeroes[$g_iMatchMode] = True
	
	$g_abAttackUseLightSpell[$g_iMatchMode] = True
	$g_abAttackUseHealSpell[$g_iMatchMode] = True
	$g_abAttackUseRageSpell[$g_iMatchMode] = True 
	$g_abAttackUseJumpSpell[$g_iMatchMode] = True 
	$g_abAttackUseFreezeSpell[$g_iMatchMode] = True
	$g_abAttackUseCloneSpell[$g_iMatchMode] = True 
	$g_abAttackUsePoisonSpell[$g_iMatchMode] = True
	$g_abAttackUseEarthquakeSpell[$g_iMatchMode] = True
	$g_abAttackUseHasteSpell[$g_iMatchMode] = True 
	$g_abAttackUseSkeletonSpell[$g_iMatchMode] = True 
	$g_abAttackUseBatSpell[$g_iMatchMode] = True 

	Local $currentRunState = $g_bRunState
	$g_bRunState = True

	ForceCaptureRegion()
	_CaptureRegion2()

	Setlog("Check ZoomOut...", $COLOR_INFO)
	If CheckZoomOut2("VillageSearch", False, False) = False Then
		$i = 0
		Local $bMeasured
		Do
			$i += 1
			If _Sleep($DELAYPREPARESEARCH2) Then Return ; wait 500 ms
			ForceCaptureRegion()
			_CaptureRegion2()
			$bMeasured = CheckZoomOutWar("VillageSearch", True, False)
		Until $bMeasured = True Or $i >= 2
		If $bMeasured = False Then
			SetLog("CheckZoomOut failed!", $COLOR_ERROR)
			Return ; exit func
		EndIf
	EndIf

	ResetTHsearch()
	_ObjDeleteKey($g_oBldgAttackInfo, "")

	FindTownhall(True)

	PrepareAttack($g_iMatchMode)
	Attack()
	SetLog("Check Heroes Health and waiting battle for end.", $COLOR_INFO)
	While IsAttackPage() And ($g_bCheckKingPower Or $g_bCheckQueenPower Or $g_bCheckWardenPower)
		CheckHeroesHealth()
		If _Sleep(500) Then Return
	WEnd
	Setlog("End Dead Base Attack TEST")
	$g_bRunState = $currentRunState
	ApplyConfig_600_29_DB("Save")
EndFunc ;==>AttackNowDB

Func CheckZoomOutWar($sSource = "CheckZoomOut", $bCheckOnly = False, $bForecCapture = True)
	If $bForecCapture = True Then
		_CaptureRegion2()
	EndIf
	
	ZoomOut()
	
	Local $aVillageResult = SearchZoomOutWar(False, True, $sSource, False)
	If IsArray($aVillageResult) = 0 Or $aVillageResult[0] = "" Then
		; not zoomed out, Return
		If $bCheckOnly = False Then
			SetLog("Not Zoomed Out! try to zoom out...", $COLOR_ERROR)
			ZoomOut()
		EndIf
		Return False
	EndIf
EndFunc   ;==>CheckZoomOut2

Func SearchZoomOutWar()
	Local $aResult = ["zoomout:stoneNox-124-480-63,25963776642856_0_95.xml", 18, -16, 0, 0] ; expected dummy value
	Return $aResult
EndFunc   ;==>CheckZoomOut2
