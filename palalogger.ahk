#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ask for login info if doesn't exist
IfNotExist logins.json
    MsgBox

; load login info

; check that game is not open (must not be in-game)

; open paladins launcher if not open

; insert username and password and enter
IfWinExist, Paladins
{
    WinActivate
    SendInput player1{Tab}hunter2{Enter}
}