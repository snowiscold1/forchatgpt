#SingleInstance Force
WaitingTime=0
nochange=0
char:= "main"
#Include %A_ScriptDir%\botschmitzcfg.ini
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
SetControlDelay, -1
IniRead, spawnX , %A_ScriptDir%\pos.ini, Backup, spawnX:
IniRead, spawnY , %A_ScriptDir%\pos.ini, Backup, spawnY:
;sleep %nextspawn%
gosub changeID1

gosub getbackGH

ExitApp
ID:
if(ok:=FindText(ID[1], ID[2], ID[3], ID[4], 0, 0, ID[5]))
{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

changeID1:
log(Title " is on his way to listen music")
while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	ControlClick, x477 y52, %Title%,, LEFT, 1, NA
	sleep 1000
}
gosub openmap
FindText_BindWindow(TitleID)
if(ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
	ControlClick, x334 y77, %Title%,, LEFT, 1, NA ;chgechatmap
	sleep 1000
}

EnterLine:
FindText_BindWindow(TitleID)
 While (!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
 {
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}
				if (WaitingTime=3) {
				 setTimer, MaxTime, off
				 Tooltip,
				 WaitingTime=0
				 goto changeID1
				}

 }
 {
				setTimer, MaxTime, off
				Tooltip,
				WaitingTime=0
				sleep 500
				ControlClick, x440 y100, %Title%,, LEFT, 1, NA  ; enterline
 }

FindText_BindWindow(TitleID)
  While (!ok:=FindText(EnterLine2[1],EnterLine2[2],EnterLine2[3],EnterLine2[4], 0, 0, EnterLine2[5]))
 {
 if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}

				if (WaitingTime=3) {
				 setTimer, MaxTime, off
				 Tooltip,
				 WaitingTime=0
				 goto changechannelXbutton
				}
}
				setTimer, MaxTime, off
				Tooltip,
				WaitingTime=0

 {
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
 }


SetKeyDelay, 200
ControlSend, ,1, %Title%

sleep 500
ControlClick, x496 y306, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x239 y245, %Title%,, LEFT, 1, NA ; open country list

FindText_BindWindow(TitleID)
While (!ok:=FindText(CountryList[1], CountryList[2], CountryList[3], CountryList[4], 0, 0, CountryList[5]))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}

				if (WaitingTime=3) {
				 setTimer, MaxTime, off
				 Tooltip,
				 WaitingTime=0
				 goto changechannelXbutton
				}
}
				setTimer, MaxTime, off
				Tooltip,
				WaitingTime=0

gosub ID
sleep 500
ControlClick, x382 y303, %Title%,, LEFT, 1, NA
IniWrite,ID 1,%A_ScriptDir%\pos.ini, Stats, currentchannel:
sleep 10000

changechannelXbutton:
FindText_BindWindow(TitleID)

if(ok:=FindText(dontremind[1], dontremind[2], dontremind[3], dontremind[4], 0, 0, dontremind[5]))
{
				CoordMode, Mouse
				X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
				sleep 500
				ControlClick, x318 y259, %Title%,, LEFT, 1, NA
}


if(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	sleep 500
	ControlClick, x477 y52, %Title%,, LEFT, 1, NA
}

gotoprontsouth:
FindText_BindWindow(TitleID)
gosub openmap
sleep 300
ControlClick, x334 y270, %Title%,, LEFT, 1, NA ;butterflywing slot
sleep 300
ControlClick, x334 y270, %Title%,, LEFT, 1, NA ;butterflywing slot
sleep 300
ControlClick, x334 y270, %Title%,, LEFT, 1, NA ;butterflywing slot
sleep 10000
While(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
}
ControlClick, x300 y232, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x300 y232, %Title%,, LEFT, 1, NA
sleep 300
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
;ControlClick, x550 y400, %Title%,, LEFT, 1, NA ; worldmap
sleep 2000
ControlClick, x307 y225, %Title%,, LEFT, 1, NA ; prontsouth
sleep 1000
While(!ok:=FindText(MusicboxLocWorld[1], MusicboxLocWorld[2], MusicboxLocWorld[3], MusicboxLocWorld[4], 0, 0, MusicboxLocWorld[5]))
{
	if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}
				if (WaitingTime=20) {
				 setTimer, MaxTime, off
				 Tooltip,
				ControlClick, x307 y225, %Title%,, LEFT, 1, NA ; prontsouth
				sleep 1000
				WaitingTime=0
				}

}
				setTimer, MaxTime, off
				Tooltip,
				WaitingTime=0
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 1000
While(ok:=FindText(MusicboxLocWorld[1], MusicboxLocWorld[2], MusicboxLocWorld[3], MusicboxLocWorld[4], 0, 0, MusicboxLocWorld[5]))
{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 2000
}

FindText_BindWindow(TitleID)
While(!ok:=FindText(MusicboxRequest[1], MusicboxRequest[2], MusicboxRequest[3], MusicboxRequest[4], 0, 0, MusicboxRequest[5]))
{
}
		ControlClick, x476 y50, %Title%,, LEFT, 1, NA
		sleep 1000
While(ok:=FindText(MusicboxRequest[1], MusicboxRequest[2], MusicboxRequest[3], MusicboxRequest[4], 0, 0, MusicboxRequest[5]))
{
			ControlClick, x476 y50, %Title%,, LEFT, 1, NA
			sleep 1000
}

gosub waitnextspawn

musiccounter:
		IniRead, prevamt , %A_ScriptDir%\pos.ini, Music, prevamt:
		startmusic := A_TickCount
		sleep % 58min
		endmusic := floor(((A_TickCount - startmusic)/1000)/60)
		prevamt += %endmusic%
		IniWrite, %prevamt%,%A_ScriptDir%\pos.ini, Music, prevamt:

		if(ok:=FindText(MusicboxRequest[1], MusicboxRequest[2], MusicboxRequest[3], MusicboxRequest[4], 0, 0, MusicboxRequest[5]))
	{
		ControlClick, x476 y50, %Title%,, LEFT, 1, NA
		sleep 1000
	}

return

getbackgh:
FindText_BindWindow(TitleID)
log(Title " gathered " prevamt " mins of music and on its way to GHall")
gosub openmap
sleep 1000
ControlClick, x303 y234, %Title%,, LEFT, 1, NA ; worldmap
sleep 2000
ControlClick, x152 y192, %Title%,, LEFT, 1, NA ; GlastHeim Area
sleep 2000
ControlClick, x97 y176, %Title%,, LEFT, 1, NA ; GlastHeim Hall
sleep 2000
ControlClick, x312 y282, %Title%,, LEFT, 1, NA ; GlastHeim Hall
sleep 10000
gosub openmap
sleep 300
while(!ok:=FindText(GHhallMain[1], GHhallMain[2], GHhallMain[3], GHhallMain[4], 0, 0, GHhallMain[5]))
{
}
{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
	sleep 1000
}
random,randX, %spawnX% , %spawnX%+1
random,randY, %spawnY%, %spawny%+1
ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA ;location spot btm right


ExitApp
return









waitnextspawn:
current_hour = %A_hour%
target_hour = % (current_hour+1)
target_time = %target_hour%00
if (target_time = 2400)
{
	target_time = 0000
}

converted := SubStr("000" . target_time, -3)
target = %A_YYYY%%A_MM%%A_DD%%converted%00
if (converted = 0000)
{
EnvAdd, target, 1, d
}

EnvSub, target, %A_Now%, Seconds.

nextspawn := target * 1000
nextspawninmin := (nextspawn/1000)/60

58min := nextspawn - 120000
return

MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
			return

SlideUp:
CoordMode,Mouse, Screen
Click, 298,427, Down
sleep 500
MouseMove, 300, 185,20
sleep 500
Click, 300, 185, Up
sleep 500
return


openmap:
FindText_BindWindow(TitleID)
while(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
ControlClick, x498 y75, %Title%,, LEFT, 1, NA
sleep 1000
}
return

log(msg){

	global
	Critical, On
	sendError(msg)
	FormatTime, TimeString, A_Now, yyyyMMdd HH:mm:ss  ;
	controlgettext, Console, Edit2, Fern Bot ahk_class AutoHotkeyGUI

	static oArrayText := []
	Loop, parse, Console, `n, `r  ; Specifying `n prior to `r allows both Windows and Unix files to be parsed.
{
	i++
	nc:= TF_ReadLines(Console,A_Index,A_Index,1)
	oArrayText.push(nc)

	if (i>=100)
		break
}

	str := ""
	for each, line in oArrayText
	{
		If (str <> "") ; str is not empty, so add a line feed
		str .= "`r`n"
		str .= line
	}

	controlsettext, Edit2, %TimeString% - %msg%`r`n%str%, Fern Bot ahk_class AutoHotkeyGUI

	if oArrayText.MinIndex() != ""  ; Not empty.
    oArrayText.Delete(oArrayText.MinIndex(), oArrayText.MaxIndex())
	Critical, Off
	return
}



sendError(msg){
	try{
	url:="https://discord.com/api/webhooks/950759671063515136/xVk8HNfLk3RTrXgTKHcO5AXilpOWitLIuQy6xXuzL7RfeXn2dW6R-ImtLStZKcMqt-Za"
	postdata=
	(
	{
	  "content": "%msg%"
	}
	) ;Use https://leovoel.github.io/embed-visualizer/ to generate above webhook code

	WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WebRequest.Open("POST", url, false)
	WebRequest.SetRequestHeader("Content-Type", "application/json")
	WebRequest.Send(postdata)
}
catch e {
	return e.message
	}


}

