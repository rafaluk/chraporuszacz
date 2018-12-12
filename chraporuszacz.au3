#include <GUIConstantsEx.au3>

;zmienna odpowiedzialna za stan
Global $moving = False

;ustawienie hotkeysów
HotKeySet("{HOME}", "changeState")
HotKeySet("{END}", "finish")

letsRun()

Func letsRun()

   Local $ourGUI = GUICreate("Chraporuszacz", 250, 150)
   Local $manualLabel1 = GUICtrlCreateLabel("Click HOME" & @CRLF & "to start / stop" & @CRLF & "moving mouse.", 10, 20)
   Local $manualLabel2 = GUICtrlCreateLabel("Click END" & @CRLF & "to exit.", 10, 80)
   Local $creditsLabel = GUICtrlCreateLabel("No copyrights " & Chr(169) & " 2018", 60, 130)
   Local $exitButton = GUICtrlCreateButton("Exit", 130, 25, 100, 65)
   GUISetState(@SW_SHOW, $ourGUI)

   While 1
	  letsMove()

	  Switch GUIGetMsg()
		 Case $GUI_EVENT_CLOSE, $exitButton
			ExitLoop
	  EndSwitch
   WEnd
EndFunc

Func changeState()
   $moving = Not $moving
   ConsoleWrite("Moving: " & $moving & @CRLF)
EndFunc

Func letsMove()
   If $moving Then
	  MouseMove(MouseGetPos(0)+50, MouseGetPos(1)+50)
	  Sleep(500)
	  MouseMove(MouseGetPos(0)-50, MouseGetPos(1)-50)
	  Sleep(500)
   EndIf
EndFunc

Func finish()
   Exit
EndFunc