#IfWinActive Roblox
SetWorkingDir %A_ScriptDir%
MaxLoops := 100 ; Make it current number of zscrooms left
Window := 1
MidWindow1W := 0
MidWindow1H := 0
MidWindow2W := 0
MidWindow2H := 0
~/::
    Suspend On
    Loop
        if (GetKeyState("Enter", "P") || GetKeyState("Escape", "P") || GetKeyState("LButton", "P"))
            break
    Suspend Off
return
+~/::
    Suspend On
    Loop
        if (GetKeyState("Enter", "P") || GetKeyState("Escape", "P") || GetKeyState("LButton", "P"))
            break
    Suspend Off
return
^~/::
    Suspend On
    Loop
        if (GetKeyState("Enter", "P") || GetKeyState("Escape", "P") || GetKeyState("LButton", "P"))
            break
    Suspend Off
return


$f4::
SetKeyDelay, -1
SetMouseDelay, -1
SetBatchLines, -1

send {=}
return


$f3::
SetKeyDelay, -1
SetMouseDelay, -1
SetBatchLines, -1

Loop, %MaxLoops%
{
if WinActive("ahk_id " . win1) then
{
	Loops := A_Index
	WinGetPos, X, Y, Width, Height, A
	MidWindow1W := Width / 2
	MidWindow1H := Height / 2
	MouseMove, MidWindow1W, MidWindow1H
	HyperSleep(25)
	send {click}
	HyperSleep(1750)
	if (Loops = MaxLoops) then
	{
		return
	}
    WinActivate, ahk_id %win2%
	if WinActive("ahk_id " . win2) then
	{
		Window := 2
		WinGetPos, X2, Y2, Width2, Height2, A
		MidWindow2W := Width2 / 2
		MidWindow2H := Height2 / 2
		HyperSleep(250)
		send 1
		HyperSleep(25)
		MouseMove, MidWindow2W, MidWindow2H
		HyperSleep(25)
		send {click}
		HyperSleep(1000)
		WinActivate, ahk_id %win1%
		Window := 1
	}
}
else
{
	Tooltip, Wrong Window Use Vamp Acc. (f2)
	SetTimer, RemoveTT, -3000
	break
}
}
return


$f2::
WinGet, win1, ID, A
Tooltip, Got First Window.(Vamp Acc)
SetTimer, RemoveTT, -2000
return


$f1::
WinGet, win2, ID, A
Tooltip, Got Second Window. (ZScroom Acc)
SetTimer, RemoveTT, -2000
return


$f7::
reload
return


RemoveTT:
tooltip
return


SystemTime()
{
	SetBatchLines, -1
    freq := 0, tick := 0
    If (!freq)
        DllCall("QueryPerformanceFrequency", "Int64*", freq)
    DllCall("QueryPerformanceCounter", "Int64*", tick)
    Return tick / freq * 1000
}


HyperSleep(value)
{
	SetBatchLines, -1
    s_begin_time := SystemTime()
    freq := 0, t_current := 0
    DllCall("QueryPerformanceFrequency", "Int64*", freq)
    s_end_time := (s_begin_time + value) * freq / 1000 
    While, (t_current < s_end_time)
    {
        If (s_end_time - t_current) > 20000
        {
            DllCall("Winmm.dll\timeBeginPeriod", UInt, 1)
            DllCall("Sleep", "UInt", 1)
            DllCall("Winmm.dll\timeEndPeriod", UInt, 1)
            DllCall("QueryPerformanceCounter", "Int64*", t_current)
        }
        Else
            DllCall("QueryPerformanceCounter", "Int64*", t_current)
    }
}
