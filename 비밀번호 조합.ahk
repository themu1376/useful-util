#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x0 y0 w250 h30 0x201 vPW
Gui, Add, Button, x250 y0 w80 h30, 만들기
Gui, Show, w330 h30
return

Button만들기:
str_alpha = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
len_alpha := StrLen(str_alpha)
Random, pos_alpha, 1, %len_alpha%
str_special = ~!^*(-_+{}[]<>
len_spec := StrLen(str_special)
Random, pos_spec, 1, %len_spec%
str = 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!^*(-_+{}[]<> ;:@./
q =
Loop, Parse, str
{
	q .= A_LoopField "`n"
}
q := Trim(q, "`n")
sort, q, Random
StringReplace, q, q, `n, , All
GuiControl, , PW, % Clipboard := SubStr(str_alpha, pos_alpha, 1) SubStr(q, 1, 14) SubStr(str_special, pos_spec, 1)
return