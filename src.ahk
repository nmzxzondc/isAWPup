#Include <JSON>

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

weaoAPI := "https://whatexpsare.online/api/status/exploits/AWP.GG"

getURL(url) {
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    whr.Open("GET",url)
    whr.Send()

    if whr.Status != 200 {
        MsgBox, bypass developer got raided! is AWP up is DETECTED! use at own use (failed to get)
        ExitApp
    }

    return whr.ResponseText()
}

weaoJSON := getURL(weaoAPI)

parsedJSON := JSON.Load(weaoJSON)

updateStatus := parsedJSON["updateStatus"]

if !(updateStatus) {
    MsgBox, awp still down gng wtf
} else {
    MsgBox, HOLY SHIT THE DAY AWP IS BACK UP (according to weao)
}


