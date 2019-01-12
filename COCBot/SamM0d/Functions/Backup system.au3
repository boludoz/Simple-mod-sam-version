#include <WinAPIFiles.au3>

Func BackupSystem()
Sleep(50)
SetupProfileFolder()
Local $bInfoState = $g_bRunState
; Principio:
	  If $g_bBackup = True Then
		 Setlog("Backups system : Files OK", $COLOR_INFO)
			$g_bRunState = False
			$g_bBackup = True
			DirCopy($g_sProfileBackupToBackup, $g_sProfileBackup, $FC_OVERWRITE)
			TempDelete($g_sProfileBackup)
			$g_bRunState = True
			Return
	  EndIf

	  If $g_bBackup = False and Not FileExists($g_sProfileBackup) then
		 Setlog("Backups system : First Backup", $COLOR_INFO)
			DirCreate($g_sProfileBackup)
			$g_bBackup = True
			If Not FileExists($g_sProfileBackupPath) Then DirCreate($g_sProfileBackupPath)
			; COPYPROFILE TO BACKUP FIRST
			$g_bRunState = False
			Saveconfig()
			DirCopy($g_sProfileBackupToBackup, $g_sProfileBackup, $FC_OVERWRITE)
			TempDelete($g_sProfileBackup)
			$g_bRunState = True
			Return
		 EndIf

	  If $g_bBackup = False and FileExists($g_sProfileBackup) then
		 Setlog("Backups system : Files damaged, backup system ON", $COLOR_INFO)
		 $g_bRunState = False ;stop bot
		 $g_bBackup = True
		 Readconfig()
		 Applyconfig()
		 Saveconfig()
		 DirCopy($g_sProfileBackup, $g_sProfileBackupToBackup, $FC_OVERWRITE + $FC_CREATEPATH)
		 TempDelete($g_sProfileBackup)
		 $g_bRunState = True ;start bot
		 Return
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