#Persistent  ; Keeps the script running
SetTitleMatchMode, 2  ; Allow partial matching for window titles

presentationModeEnabled := false  ; Variable to track if the presentation mode is enabled

; Manually trigger mouse control mode by pressing Ctrl+Alt+P
^!p::  ; Ctrl + Alt + P
{
    presentationModeEnabled := !presentationModeEnabled  ; Toggle the presentation mode flag
    return
}

; Only activate mouse controls when the mode is enabled
#If (presentationModeEnabled)
{
    ; Left mouse button (LButton) for custom action (simulating right arrow key)
    LButton::
    {
        Send, {Right}  ; Simulate pressing the Right Arrow key (next slide or action)
        return
    }

    ; Right mouse button (RButton) for custom action (simulating left arrow key)
    RButton::
    {
        Send, {Left}  ; Simulate pressing the Left Arrow key (previous slide or action)
        return
    }
}
#IfWinActive  ; Ends the conditional block for any window
