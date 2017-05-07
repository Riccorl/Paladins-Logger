#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include FindClick.ahk

; ask for login info if doesn't exist
IfNotExist logins.txt
{
    MsgBox, Add usernames and passwords to logins.txt
    FileAppend, user=`n, logins.txt, UTF-8
    FileAppend, pass=`n, logins.txt, UTF-8
}

; load login info
Loop, read, logins.txt
{
    IfInString, A_LoopReadLine, user=
        username := SubStr(A_LoopReadLine, 6)
    IfInString, A_LoopReadLine, pass=
        password := SubStr(A_LoopReadLine, 6)
}


; check that game is not open (must not be in-game)
; TODO

; open paladins launcher if not open
IfWinNotExist, Paladins ahk_exe SteamLauncherUI.exe
{
    Run steam://rungameid/444090
    WinWait, Paladins ahk_exe SteamLauncherUI.exe, , 60*3
}

; exit if game not loaded
IfWinNotExist, Paladins ahk_exe SteamLauncherUI.exe
{
    MsgBox, Game not loaded now exiting
    ExitApp
}

; insert username and password and enter
IfWinExist, Paladins ahk_exe SteamLauncherUI.exe
{
    WinActivate
    SendInput %username%{Tab}%password%{Enter}
    FindClick("play.png", "r w, 10*1000")
}

WinWait, Chaos ahk_exe Paladins.exe
WinActivate
; TODO: click OK.png n times until claim.png or nothing appears
FindClick("claim.png", "w, 5*60*1000")

; exit if game no longer open
; TODO

ExitApp