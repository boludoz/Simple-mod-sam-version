; #FUNCTION# ====================================================================================================================
; Name ..........: DoRevampSpells
; Description ...: Brewing full spells or revamp missing spells with what information get from CheckOnBrewUnit() And CheckAvailableSpellUnit()
;
; Syntax ........: DoRevampSpells()
; Parameters ....: $bDoPreTrain
;
; Return values .: None
; Author ........: Samkie (27 Jun 2017)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func DoRevampSpells($bDoPreTrain = False)
	If _Sleep(500) Then Return
	Local $bReVampFlag = False
	; start brew
	Local $tempSpells[UBound($MySpells)][5]
	$tempSpells	= $MySpells

	If $ichkMySpellsOrder Then
		_ArraySort($tempSpells,0,0,0,1)
	EndIf

	For $i = 0 To UBound($tempSpells) - 1
		If $g_iSamM0dDebug = 1 Then SetLog("$tempSpells[" & $i & "]: " & $tempSpells[$i][0] & " - " & $tempSpells[$i][1])
		; reset variable
		Assign("Dif" & $tempSpells[$i][0] & "Spell",0)
		Assign("Add" & $tempSpells[$i][0] & "Spell",0)
	Next

	If $bDoPreTrain = False Then
		For $i = 0 To UBound($tempSpells) - 1
			Local $tempCurComp = $tempSpells[$i][3]
			Local $tempCur = Eval("Cur" & $tempSpells[$i][0] & "Spell") + Eval("OnT" & $tempSpells[$i][0] & "Spell")
			If $g_iSamM0dDebug = 1 Then SetLog("$tempMySpells: " & $tempCurComp)
			If $g_iSamM0dDebug = 1 Then SetLog("$tempCur: " & $tempCur)
			If $tempCurComp <> $tempCur Then
				Assign("Dif" & $tempSpells[$i][0] & "Spell", $tempCurComp - $tempCur)
			EndIf
		Next
	Else
		For $i = 0 To UBound($tempSpells) - 1
			If Eval("ichkPre" & $tempSpells[$i][0]) = 1 Then
				If $tempSpells[$i][3] <> Eval("OnQ" & $tempSpells[$i][0] & "Spell") Then
					Assign("Dif" & $tempSpells[$i][0] & "Spell", $tempSpells[$i][3] - Eval("OnQ" & $tempSpells[$i][0] & "Spell"))
				EndIf
			EndIf
		Next
	EndIf

	For $i = 0 To UBound($tempSpells) - 1
		If Eval("Dif" & $tempSpells[$i][0] & "Spell") > 0 Then
			If $g_iSamM0dDebug = 1 Then SetLog("Some spells haven't train: " & $tempSpells[$i][0])
			If $g_iSamM0dDebug = 1 Then SetLog("Setting Qty Of " & $tempSpells[$i][0] & " spells: " & $tempSpells[$i][3])
			Assign("Add" & $tempSpells[$i][0] & "Spell", Eval("Dif" & $tempSpells[$i][0] & "Spell"))
			$bReVampFlag = True
		ElseIf Eval("Dif" & $tempSpells[$i][0] & "Spell") < 0 Then
			If $g_iSamM0dDebug = 1 Then SetLog("Some spells over train: " & $tempSpells[$i][0])
			If $g_iSamM0dDebug = 1 Then SetLog("Setting Qty Of " & $tempSpells[$i][0] & " spells: " & $tempSpells[$i][3])
			If $g_iSamM0dDebug = 1 Then SetLog("Current Qty Of " & $tempSpells[$i][0] & " spells: " & $tempSpells[$i][3]- Eval("Dif" & $tempSpells[$i][0] & "Spell"))
		EndIf
	Next

	If $bReVampFlag Then
		If gotoBrewSpells() = False Then Return

			If _sleep(100) Then Return
			; starttrain
			Local $iRemainSpellsCapacity = 0
			Local $iCreatedSpellsCapacity = 0
			Local $bFlagOutOfResource = False
			If $bDoPreTrain Then
				If Not IsArray($g_aiSpellsMaxCamp) Then $g_aiSpellsMaxCamp = getTrainArmyCapacity(True)
				$iRemainSpellsCapacity = $g_aiSpellsMaxCamp[1] - $g_aiSpellsMaxCamp[0]
				If $iRemainSpellsCapacity <= 0 Then
					SetLog("Spells full with pre-train.", $COLOR_INFO)
					Return
				EndIf
			Else
				$iRemainSpellsCapacity = $g_iTotalSpellValue - $g_aiSpellsMaxCamp[0]
				If $iRemainSpellsCapacity <= 0 Then
					SetLog("Spells full.", $COLOR_ERROR)
					Return
				EndIf
			EndIf

			For $i = 0 To UBound($tempSpells) - 1
				Local $iOnQQty = Eval("Add" & $tempSpells[$i][0] & "Spell")
				If $iOnQQty > 0 Then
					SetLog($CustomTrain_MSG_10 & " " & GetTroopName(Eval("enum" & $tempSpells[$i][0]) + $eLSpell, $iOnQQty) & " x" & $iOnQQty,$COLOR_ACTION)
				EndIf
			Next
			
			Local $iBuildCost = 0
			Local $iCost = 0
			Local $bGetCost = False
			
			GetResourcesTroopDiff()
			
			SetLog("Elixir: " & $g_iCurElixir & "   Dark Elixir: " & $g_iCurDarkElixir, $COLOR_INFO)

			For $i = 0 To UBound($tempSpells) - 1
				; Reset var
				$iCost = 0
				$bGetCost = False
				$iBuildCost = 0
				
				Local $tempSpell = Eval("Add" & $tempSpells[$i][0] & "Spell")
				If $tempSpell > 0 And $iRemainSpellsCapacity > 0 Then

					If LocateTroopButton($tempSpells[$i][0], True) Then
								If ($tempSpells[$i][2] * $tempSpell) <= $iRemainSpellsCapacity Then
										If MyTrainClick($g_iTroopButtonX, $g_iTroopButtonY, $tempSpell, $g_iTrainClickDelay, "#BS01", True) Then
										$iRemainSpellsCapacity -= ($tempSpells[$i][2] * $tempSpell)
								EndIf
							Else
								SetLog("Error: remaining space cannot fit to brew " & GetTroopName(Eval("enum" & $tempSpells[$i][0])+ $eLSpell,0), $COLOR_ERROR)
							EndIf
						$bGetCost = True
					Else
						$bGetCost = False
						SetLog("Cannot find button: " & $tempSpells[$i][0] & " for click", $COLOR_ERROR)
					EndIf
				EndIf
					If $bGetCost = True Then
						; reduce some speed
						If _Sleep(250) Then Return
	
						$iCost = Int(GetResourcesTroopDiff())
						
						; reduce some speed
						If _Sleep(750) Then Return

							$iCost = $iCost / $tempSpell
							; Boludoz cost Update.
							$iBuildCost = (Eval("enum" & $tempSpells[$i][0]) > $iDarkFixSpell ? $g_iCurDarkElixir : $g_iCurElixir)
							If ($tempSpell * $iCost) > $iBuildCost Then
								$bFlagOutOfResource = True
								; use eval and not $i to compare because of maybe after array sort $tempTroops
								Setlog("Not enough " & (Eval("enum" & $tempSpells[$i][0]) > $iDarkFixSpell ? "Dark" : "") & " Elixir to brew " & GetTroopName(Eval("enum" & $tempSpells[$i][0])+ $eLSpell,0), $COLOR_ERROR)
								SetLog("Current " & (Eval("enum" & $tempSpells[$i][0]) > $iDarkFixSpell ? "Dark" : "") & " Elixir: " & $iBuildCost, $COLOR_ERROR)
								SetLog("Total need: " & $tempSpell * $iCost, $COLOR_ERROR)
							EndIf
							If $bFlagOutOfResource Then
								$g_bOutOfElixir = 1
								Setlog("Switching to Halt Attack, Stay Online Mode...", $COLOR_ERROR)
								$g_bChkBotStop = True ; set halt attack variable
								$g_icmbBotCond = 18; set stay online
								If Not ($g_bfullarmy = True) Then $g_bRestart = True ;If the army camp is full, If yes then use it to refill storages
								Return ; We are out of Elixir stop training.
							EndIf
							SetLog($CustomTrain_MSG_14 & " " & GetTroopName(Eval("enum" & $tempSpells[$i][0])+ $eLSpell,$tempSpell) & " x" & $tempSpell & " with total " & (Eval("enum" & $tempSpells[$i][0]) > $iDarkFixSpell ? $CustomTrain_MSG_DarkElixir : $CustomTrain_MSG_Elixir) & ": " & ($tempSpell * $iCost),(Eval("enum" & $tempSpells[$i][0]) > $iDarkFixSpell ? $COLOR_DARKELIXIR : $COLOR_ELIXIR))
							Setlog(" - Spell Cost : " & $iCost ,$COLOR_INFO)
							Else 
						; reduce some speed
						If _Sleep(500) Then Return
					EndIf
			Next
	EndIf
	If $bDoPreTrain Then
		; all spells and pre-brew spells already made, temparary disable check the spells until the spell donate make.
		$tempDisableBrewSpell = True
	EndIf
EndFunc

