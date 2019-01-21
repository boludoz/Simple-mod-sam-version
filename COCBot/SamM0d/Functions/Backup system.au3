#include <WinAPIFiles.au3>

Func BackupSystem()
Sleep(50)
;SetupProfileFolder()
;Local $bInfoState = ;$g_bRunState
;$g_bRunState = False
; Principio:
	If not $g_bBackup = False and not $g_bFirstRun = False Then
		 Setlog("Backups system : Files OK", $COLOR_INFO)
			;$g_bRunState = False
			$g_bBackup = True
			DirCopy($g_sProfileBackupToBackup, $g_sProfileBackup, $FC_OVERWRITE + $FC_CREATEPATH)
			TempDelete($g_sProfileBackup)
			;$g_bRunState = True
			Return
	Else;If not $g_bBackup = True and not $g_bFirstRun = True Then
			;$g_bRunState = False ;stop bot
					If Not FileExists($g_sProfileBackupPath) Then 
						Setlog("Backups system : First Backup", $COLOR_GREEN)
						DirCreate($g_sProfileBackupPath)
						DirCreate($g_sProfileBackup)
						$g_bBackup = True
						If Not FileExists($g_sProfileBackupPath) Then DirCreate($g_sProfileBackupPath)
						; COPYPROFILE TO BACKUP FIRST
						;$g_bRunState = False
						Saveconfig()
						DirCopy($g_sProfileBackupToBackup, $g_sProfileBackup, $FC_OVERWRITE + $FC_CREATEPATH)
						TempDelete($g_sProfileBackup)
						;$g_bRunState = True
						Return
					EndIf
			Setlog("Backups system : Files damaged, backup system ON", $COLOR_ERROR)
			$g_bBackup = True
			DirCopy($g_sProfileBackup, $g_sProfileBackupToBackup, $FC_OVERWRITE + $FC_CREATEPATH)
			Readconfig()
			Applyconfig()
			Saveconfig()
			TempDelete($g_sProfileBackup)
			;$g_bRunState = True ;start bot
			Return

		#cs	
	Else
		 Setlog("Backups system : First Backup", $COLOR_GREEN)
			DirCreate($g_sProfileBackup)
			$g_bBackup = True
			If Not FileExists($g_sProfileBackupPath) Then DirCreate($g_sProfileBackupPath)
			; COPYPROFILE TO BACKUP FIRST
			;$g_bRunState = False
			Saveconfig()
			DirCopy($g_sProfileBackupToBackup, $g_sProfileBackup, $FC_OVERWRITE)
			TempDelete($g_sProfileBackup)
			;$g_bRunState = True
		#ce
	  Endif
   Return
EndFunc

Func TempDelete($g_sProfileClean)
Sleep(50)
	SetupProfileFolder()
	DirRemove($g_sProfileClean & "\Donate\", 1)
	DirRemove($g_sProfileClean & "\Logs\", 1)
	DirRemove($g_sProfileClean & "\Loots\", 1)
	DirRemove($g_sProfileClean & "\SamM0d Debug\", 1)
	DirRemove($g_sProfileClean & "\Temp\", 1)
	Return
EndFunc