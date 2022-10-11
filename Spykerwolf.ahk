#Persistent
SetTitleMatchMode, 2
Return

F5:: ; Move to VR
    SendInput ^{F1}         ; Pull up info dialog
    WinWaitActive, Playback/System Information,,2
    If ErrorLevel {
        Tooltip, Couldn't find dialog... exiting...
        Sleep 2000
        ToolTip
        Return
    }

    lastClipboard := ClipboardAll       ; Save existing clipboard contents

        SendInput {Tab 2}      ; Focus tab control at top
    Sleep 100
    SendInput {Right}       ; Focus FileInfo tab
    Sleep 100
    SendInput {Space}       ; Select FileInfo
    Sleep 100
    SendInput {Tab 2}      ; Select copy to clipboard
    Sleep 100
    SendInput {Down 2}      ; Select copy to clipboard
    Sleep 100
    SendInput ^c           ; Select copy to clipboard
    Sleep 200

        if Instr(Clipboard, "Unique") ; Unique ID workaround
    {
        SendInput {Down}      ; Go down to complete name
        Sleep 100
        SendInput ^c           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100
        SendInput {F6 2}           ; Select copy to clipboard
        Sleep 100
        SendInput {Delete}           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100
    }  else {
        SendInput {ESC}
        Sleep 100
    }
        SendInput {F6 2}           ; Select copy to clipboard
        Sleep 100
        SendInput {Delete}           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100


    ; Strip directory infront of filename

    FileName := ""
    Loop, Parse, % FileInfo:=Clipboard, `n
    {
        If InStr(A_LoopField, "Complete name") {
            FileName := Trim(Substr(A_LoopField, InStr(A_LoopField, ":")+1)) ; get path and file after colon and trim spaces
            Break
        }
    }

    Clipboard := lastClipboard ; restore previous clipboard

    If (FileName = "") {
        Tooltip, Couldn't find filename... exiting...
        Sleep 2000
        ToolTip
        Return
    }

    If FileExist("F:\_VR") {
    FileMove, % FileName, % "F:\_VR", % 1
    }
    Else {
        MsgBox, The folder does NOT exist. Creating folder
        FileCreateDir, F:\_VR
        Sleep 2000
        FileMove, % FileName, % "F:\_VR", % 1
    }

    Return

F8:: ; Move to Crap

    SendInput ^{F1}         ; Pull up info dialog
    WinWaitActive, Playback/System Information,,2
    If ErrorLevel {
        Tooltip, Couldn't find dialog... exiting...
        Sleep 2000
        ToolTip
        Return
    }

    lastClipboard := ClipboardAll       ; Save existing clipboard contents

    SendInput {Tab 2}      ; Focus tab control at top
    Sleep 100
    SendInput {Right}       ; Focus FileInfo tab
    Sleep 100
    SendInput {Space}       ; Select FileInfo
    Sleep 100
    SendInput {Tab 2}      ; Select copy to clipboard
    Sleep 100
    SendInput {Down 2}      ; Select copy to clipboard
    Sleep 100
    SendInput ^c           ; Select copy to clipboard
    Sleep 200

    if Instr(Clipboard, "Unique") ; Unique ID workaround
    {
        SendInput {Down}      ; Go down to complete name
        Sleep 100
        SendInput ^c           ; Select copy to clipboard
        Sleep 100
    }  else {
        SendInput {ESC}
        Sleep 100

    ; Strip directory infront of filename

    FileName := ""
    Loop, Parse, % FileInfo:=Clipboard, `n
    {
        If InStr(A_LoopField, "Complete name") {
            FileName := Trim(Substr(A_LoopField, InStr(A_LoopField, "F:\Completed\")+13)) ; get path and file after colon and trim spaces
            Break
        }
    }

    Clipboard := lastClipboard ; restore previous clipboard

    If (FileName = "") {
        Tooltip, Couldn't find filename... exiting...
        Sleep 2000
        ToolTip
        Return
    }

    ; Extract first & last name

    Clipboard := % FileName
    StringGetPos, pos, Clipboard, ., L4
    string := SubStr(Clipboard, pos+2)
    newString := % string

    firstLast := % SubStr(newString, 1, InStr(newString, ".", false, 1, 2) - 1)

    FileAppend, %firstLast% `n, F:\interest.txt ; Save name to txt
    SendInput {ShiftDown}{Delete}{ShiftUp}           ; Delete file
    Sleep 200
    SendInput {Enter}
    Sleep 100
    ToolTip, File deleted
    Sleep 500
    ToolTip
    Return
    }

F10:: ; Move to Best
    SendInput ^{F1}         ; Pull up info dialog
    WinWaitActive, Playback/System Information,,2
    If ErrorLevel {
        Tooltip, Couldn't find dialog... exiting...
        Sleep 2000
        ToolTip
        Return          ; couldn't find dialog
    }

    lastClipboard := ClipboardAll       ; Save existing clipboard contents

        SendInput {Tab 2}      ; Focus tab control at top
    Sleep 100
    SendInput {Right}       ; Focus FileInfo tab
    Sleep 100
    SendInput {Space}       ; Select FileInfo
    Sleep 100
    SendInput {Tab 2}      ; Select copy to clipboard
    Sleep 100
    SendInput {Down 2}      ; Select copy to clipboard
    Sleep 100
    SendInput ^c           ; Select copy to clipboard
    Sleep 200

        if Instr(Clipboard, "Unique") ; Unique ID workaround
    {
        SendInput {Down}      ; Go down to complete name
        Sleep 100
        SendInput ^c           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100
        SendInput {F6 2}           ; Select copy to clipboard
        Sleep 100
        SendInput {Delete}           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100
    }  else {
        SendInput {ESC}
        Sleep 100
    }
        SendInput {F6 2}           ; Select copy to clipboard
        Sleep 100
        SendInput {Delete}           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100

    ; Strip directory infront of filename


    FileName := ""
    Loop, Parse, % FileInfo:=Clipboard, `n
    {
        If InStr(A_LoopField, "Complete name") {
            FileName := Trim(Substr(A_LoopField, InStr(A_LoopField, ":")+1)) ; get path and file after colon and trim spaces
            Break
        }
    }

    Clipboard := lastClipboard ; restore previous clipboard

    If (FileName = "") {
        Tooltip, Couldn't find filename... exiting...
        Sleep 2000
        ToolTip
        Return
    }

    If FileExist("F:\_Best") {
    FileMove, % FileName, % "F:\_Best", % 1
    }
    Else {
        MsgBox, The folder does NOT exist. Creating folder
        FileCreateDir, F:\_Best
        Sleep 2000
        FileMove, % FileName, % "F:\_Best", % 1
    }

    Return

F11:: ; Move to #######
    SendInput ^{F1}         ; Pull up info dialog
    WinWaitActive, Playback/System Information,,2
    If ErrorLevel {
        Tooltip, Couldn't find dialog... exiting...
        Sleep 2000
        ToolTip
        Return          ; couldn't find dialog
    }

    lastClipboard := ClipboardAll       ; Save existing clipboard contents

    SendInput {Tab 2}      ; Focus tab control at top
    Sleep 100
    SendInput {Right}       ; Focus FileInfo tab
    Sleep 100
    SendInput {Space}       ; Select FileInfo
    Sleep 100
    SendInput {Tab 2}      ; Select copy to clipboard
    Sleep 100
    SendInput {Down 2}      ; Select copy to clipboard
    Sleep 100
    SendInput ^c           ; Select copy to clipboard
    Sleep 200

        if Instr(Clipboard, "Unique") ; Unique ID workaround
    {
        SendInput {Down}      ; Go down to complete name
        Sleep 100
        SendInput ^c           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100
        SendInput {F6 2}           ; Select copy to clipboard
        Sleep 100
        SendInput {Delete}           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100
    }  else {
        SendInput {ESC}
        Sleep 100
    }
        SendInput {F6 2}           ; Select copy to clipboard
        Sleep 100
        SendInput {Delete}           ; Select copy to clipboard
        Sleep 100
        SendInput {Enter}           ; Select copy to clipboard
        Sleep 100

    ; Strip directory infront of filename

    FileName := ""
    Loop, Parse, % FileInfo:=Clipboard, `n
    {
        If InStr(A_LoopField, "Complete name") {
            FileName := Trim(Substr(A_LoopField, InStr(A_LoopField, ":")+1)) ; get path and file after colon and trim spaces
            Break
        }
    }

    Clipboard := lastClipboard ; restore previous clipboard

    If (FileName = "") {
        Tooltip, Couldn't find filename... exiting...
        Sleep 2000
        ToolTip
        Return
    }

    If FileExist("F:\#######") {
    FileMove, % FileName, % "F:\#######", % 1
    }
    Else {
        MsgBox, The folder does NOT exist. Creating folder
        FileCreateDir, F:\#######
        Sleep 2000
        FileMove, % FileName, % "F:\#######", % 1
    }
    Return
