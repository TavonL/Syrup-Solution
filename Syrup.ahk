#SingleInstance Force
#InstallKeybdHook
SendMode Input
DetectHiddenWindows, On
SetKeyDelay , 50, 30,    ; 50ms is the default delay between presses, 30ms is the press length

if !A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

Exit

Delete::
	ID := WinExist("A")
	ToolTip % ID, 0, 0 ; Displays a windowID in top left, put a semicolon in front of this line to disable
	
	Loop
	{
		ControlSend, , {=}, ahk_id %ID%
		Sleep 500
		ControlSend, , {=}, ahk_id %ID%
		Sleep 500
		ControlSend, , {=}, ahk_id %ID%
		Sleep 2000
		ControlSend, , {-}, ahk_id %ID%
		Sleep 25000

	}	
	
return

Home::Pause,Toggle

F1::ExitApp