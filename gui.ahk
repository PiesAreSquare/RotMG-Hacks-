#SingleInstance


html=
(
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    html {overflow:hidden}
    body {background:#000000;}
    button {background: #1B1E23; color: #90ee90; border:2; margin: 5px; font-family:'Calibri'; width:200px; height: 60px; margin: 0 auto;}
    button:hover {background: #048821};
</style>
</head>
<body>
    
<button id='selectLeft'>Auto Nexus</button>
<button id='selectPot'>Auto Potion</button>

</body>
</html>
)

; Gui, +ToolWindow -Caption 
Gui,Margin,0,0
Gui, Add, ActiveX, W225 H150 x0 y0 vdoc, HTMLFile
doc.write(html)
Gui, Show, Center, Epic Hacks
; WinSet, Transcolor, FF00FF, Epic Hacks
add_ButtonHandler()
return

selectLeft_OnClick() {
	KeyWait, RButton, D
	MouseGetPos, posX, posY
	PixelGetColor, color, %posX%, %posY%
	IfEqual, color, 0x37C278 
	{
	MsgBox, nice, you picked the correct green. at [%posX% %posY%]
	Loop{	
  	if (BreakLoop = 1)
    		break 							
  	PixelGetColor, healthPixel, posX, posY, RGB	
  	if healthPixel = 0x545454					
    		Send R
    	sleep, 15
	}
	} 
	IfNotEqual, color, 0x37C278 
	{
	MsgBox, select the better green 
	} 	
}
return

selectPot_OnClick() {
	KeyWait, RButton, D
	MouseGetPos, posX2, posY2
	PixelGetColor, color, %posX2%, %posY2%
	IfEqual, color, 0x37C278 
	{
	MsgBox, nice, you picked the correct green. at [%posX2% %posY2%]
	Loop{	
  	if (BreakLoop = 1)
    		break 							
  	PixelGetColor, healthPixel, posX2, posY2, RGB	
  	if healthPixel = 0x545454					
    		Send F
    	sleep, 14
	}
	} 
	IfNotEqual, color, 0x37C278 
	{
	MsgBox, select the better green 
	} 	
}
return


Esc::
BreakLoop = 1
MsgBox, you broke the loop
BreakLoop = 0
return

add_ButtonHandler() {
    global
    Loop % doc.getElementsByTagName("Button").length
        ComObjConnect(b_%A_Index%:=doc.getElementsByTagName("Button")[A_Index-1], b_%A_Index%.GetAttribute("Id") "_")
}

GuiClose:		;close Gui to Exit

GuiEscape:		;press Esc to Exit

ExitApp	