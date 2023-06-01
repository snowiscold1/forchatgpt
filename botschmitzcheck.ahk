#SingleInstance Force
char:= "main"
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%\botschmitzcfg.ini

#Warn all, off
DetectHiddenWindows, On
SetTitleMatchMode, 3
SetControlDelay, -1
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
global oArrayText := []
WaitingTime=0
failjump=0
IniRead, kill , %A_ScriptDir%\pos.ini, Stats, kill:
IniRead, oldchannel , %A_ScriptDir%\pos.ini, Stats, currentchannel:
IniRead, tauntcoord1x , %A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
IniRead, tauntcoord1y , %A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
IniRead, spawnX , %A_ScriptDir%\pos.ini, Backup, spawnX:
IniRead, spawnY , %A_ScriptDir%\pos.ini, Backup, spawnY:

OnError("LogError")


LogError(exception) {
    reload
}

begin:
while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
				sleep 1000
}
loop{
if FileExist("logfound.txt") {
	try {
	CountNumb := TF_ReadLines("logfound.txt",1,1,1)
	}
	catch e {
		sleep 1000
		goto begin
	}



	try {
		if FileExist("logfound.txt") {
	if CountNumb=
		TF_RemoveBlankLines("!logfound.txt",1,1)
	if(CountNumb=oldchannel){
		log("Same channel detected, skip")
		TF_RemoveLines("!logfound.txt",1,1) ; removes
		CountNumb := TF_ReadLines("logfound.txt",1,1,1)
	}
		}
	}
		catch e {
		sleep 1000
		goto begin
	}

	if (!CountNumb){
		sleep 1000

	}
	else{
	IniRead, oldfarmstate , %A_ScriptDir%\pos.ini, Backup, farmstate:

	getfarmstate()


	if (oldfarmstate!=farmstate){
		IniWrite, %farmstate%,%A_ScriptDir%\pos.ini, Backup, FarmState:
		gosub spawnlocation
		sleep 10000
		}
	goto GHhallMain
}
}
}


FindText_BindWindow(TitleID)
GHhallMain:
IniRead, kill , %A_ScriptDir%\pos.ini, Stats, kill:
while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
				sleep 1000
}
	gosub openmap

FindText_BindWindow(TitleID)
while(!ok:=FindText(GHhallMain[1], GHhallMain[2], GHhallMain[3], GHhallMain[4], 0, 0, GHhallMain[5]))
{
				waitingtime++
				tooltip,
				sleep 1000

	if (WaitingTime>3) and (repairMAIN != 1) {
		repairMAIN = 1
		ControlClick, x306 y232, %Title%,, LEFT, 1, NA ; worldmap
		sleep 1000
		ControlClick, x155 y194, %Title%,, LEFT, 1, NA ; glastheim
		sleep 1000
		ControlClick, x92 y180, %Title%,, LEFT, 1, NA ; glastheim hall
		sleep 1000
		ControlClick, x271 y85, %Title%,, LEFT, 1, NA ; quest
		sleep 1000
		ControlClick, x271 y240, %Title%,, LEFT, 1, NA ; map pinpoint
		}

	if (WaitingTime>180) and (repairMAIN = 1) {
		repairMAIN = 0
		tooltip,
		waitingtime=0
	}


		goto GHhallMain

}



				repairMAIN = 0
				tooltip,
				waitingtime=0
				gosub spawnlocation

	ControlClick, x334 y77, %Title%,, LEFT, 1, NA ;chgechatmap
	;sleep 1000
EnterLine:
log(Title " is changing channel to " CountNumb)

FindText_BindWindow(TitleID)
 While (!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
 {
				waitingtime++
				tooltip, %waitingtime%
				sleep 1000

				if (WaitingTime>3) {
				 Tooltip,
				 WaitingTime=0
				 goto GHhallMain
				}

 }
 {
				Tooltip,
				WaitingTime=0
				sleep 500
				ControlClick, x440 y100, %Title%,, LEFT, 1, NA  ; enterline
 }

FindText_BindWindow(TitleID)
  While (!ok:=FindText(EnterLine2[1],EnterLine2[2],EnterLine2[3],EnterLine2[4], 0, 0, EnterLine2[5]))
 {
				waitingtime++
				tooltip, %waitingtime%
				sleep 1000

				if (WaitingTime>3) {
				 Tooltip,
				 WaitingTime=0
				 goto changechannelXbutton
				}
}

				Tooltip,
				WaitingTime=0

 {
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
 }

Country:= SubStr(CountNumb, 1, 2)
Number:= SubStr(CountNumb, 4, 4)
SetKeyDelay, 100
ControlSend, ,%Number%, %Title%

sleep 100
ControlClick, x496 y306, %Title%,, LEFT, 1, NA
sleep 100

countryL:
ControlClick, x239 y245, %Title%,, LEFT, 1, NA ; open country list
sleep 100
FindText_BindWindow(TitleID)
While (!ok:=FindText(CountryList[1], CountryList[2], CountryList[3], CountryList[4], 0, 0, CountryList[5]))
{
				waitingtime++
				tooltip, %waitingtime%
				sleep 1000

				if (WaitingTime>3) {
				 Tooltip,
				 WaitingTime=0
				 countryL++
				 if (CountryL > 2)
					{
					try {
					if (switchfarm=1){
						TF_RemoveLines("!logfoundbackup.txt",1,1) ; removes
						}
					else {
						if FileExist("logfound.txt") {
						TF_RemoveLines("!logfound.txt",1,1) ; removes
						}
						}
					}
					catch e {
					sleep 1000
					goto countryL
					}
						Reload
					}
				 goto countryL
				}


}

				Tooltip,
				WaitingTime=0

gosub %Country%

while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	c++
	ControlClick, x382 y303, %Title%,, LEFT, 1, NA
	sleep 1000
	if (c>4) {
		c=0
		runonce++
		goto changechannelXbutton
		}
}
runonce++
c=0


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


while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	sleep 1000
	ControlClick, x477 y52, %Title%,, LEFT, 1, NA
}

waitjump:

While (!ok:=FindText(skillbarjumpch[1],skillbarjumpch[2],skillbarjumpch[3],skillbarjumpch[4], 0, 0, skillbarjumpch[5]))
 {
				waitingtime++
				tooltip, %waitingtime%
				if (ok:=FindText(ghostcapavatar[1],ghostcapavatar[2],ghostcapavatar[3],ghostcapavatar[4], 0, 0, ghostcapavatar[5]))
				{
					try {
						if (switchfarm=1){
						TF_RemoveLines("!logfoundbackup.txt",1,1) ; removes
						}
					else {
						if FileExist("logfound.txt") {
						TF_RemoveLines("!logfound.txt",1,1) ; removes
						}
						}
					}
					catch e {
					sleep 1000
					goto waitjump
					}

					goto checkavatarexist
				}
				sleep 1000

				if (WaitingTime>7) {
				Tooltip,
				 WaitingTime=0
				 failjump++
				 ;~ if (failjump<3)
				;~ {
					;~ goto GHhallMain
				;~ }
				 if (failjump>0)
				{
					try {
						if (switchfarm==1){
						TF_RemoveLines("!logfoundbackup.txt",1,1) ; removes
						}
					else {
						if FileExist("logfound.txt") {
						TF_RemoveLines("!logfound.txt",1,1) ; removes
						}
						}
					}
					catch e {
					sleep 1000
					goto waitjump
					}
				;gosub resetguildch
				}
				 reload
				}
}
While (ok:=FindText(skillbarjumpch[1],skillbarjumpch[2],skillbarjumpch[3],skillbarjumpch[4], 0, 0, skillbarjumpch[5]))
 {
}

				Tooltip,
				WaitingTime=0
				log(Title " is now in " CountNumb)
				IniWrite, %CountNumb%,%A_ScriptDir%\pos.ini, Stats, currentchannel:
					if (switchfarm=1){
						TF_RemoveLines("!logfoundbackup.txt",1,1) ; removes
						}
					else {
						if FileExist("logfound.txt") {
						TF_RemoveLines("!logfound.txt",1,1) ; removes
						}
						}


checkavatarexist:
				if (!ok:=FindText(atkon[1],atkon[2],atkon[3],atkon[4], 0, 0, atkon[5]))
				{
					goto GhostCap
				}

While (!ok:=FindText(ghostcapavatar[1],ghostcapavatar[2],ghostcapavatar[3],ghostcapavatar[4], 0, 0, ghostcapavatar[5]))
 {

				waitingtime++
				tooltip, %waitingtime%
				sleep 1000

				if (WaitingTime>7) {
				 Tooltip,
				 WaitingTime=0
				 log(Title " is unable to find Ghost Captain at " CountNumb "...")
				 updateiniminus1("totalque","score")
				gosub spawnlocation
				;sleep 1500

				Reload
				}
}
While (ok:=FindText(ghostcapavatar[1],ghostcapavatar[2],ghostcapavatar[3],ghostcapavatar[4], 0, 0, ghostcapavatar[5]))

{
				waitingtime++
				tooltip, %waitingtime%
				sleep 1000

				if (WaitingTime>15) {
				 Tooltip,
				 WaitingTime=0
				 log(Title " is unable to kill Ghost Captain at " CountNumb "...")
				gosub spawnlocation
				;sleep 1500

				Reload
				}
}
{
				Tooltip,
				WaitingTime=0
				kill++
				updateiniminus1("totalque","score")
				log(Title " is attacking Ghost Captain at " CountNumb "...")
				IniWrite, %kill%,%A_ScriptDir%\pos.ini, Stats, kill:

				goto looting
}



GhostCap:
FindText_BindWindow(TitleID)
while(!ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
ControlClick, x511 y270, %Title%,, LEFT, 1, NA
sleep 2000
}


 while(!ok:=FindText(GhostCap[1], GhostCap[2], GhostCap[3], GhostCap[4], 0.1, 0.1, GhostCap[5]))
{
				waitingtime++
				tooltip, %waitingtime%
				sleep 1000

			 if (WaitingTime>7) {
				 Tooltip,
				 WaitingTime=0

if(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
				sleep 1000
}
log(Title " is unable to find Ghost Captain at " CountNumb "...")
updateiniminus1("totalque","score")
gosub spawnlocation
sleep 1500

Reload
}
}


	{

				 Tooltip,
				 WaitingTime=0
				 kill++
				 updateiniminus1("totalque","score")
				 log(Title " is attacking Ghost Captain at " CountNumb "...")
				 IniWrite, %kill%,%A_ScriptDir%\pos.ini, Stats, kill:
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA
			sleep 1000
				 while(ok:=FindText(GhostCap[1], GhostCap[2], GhostCap[3], GhostCap[4], 0.1, 0.1, GhostCap[5]))
				{

				waitingtime++
				tooltip, %waitingtime%
				sleep 1000

				if (WaitingTime>30) {
					kill--
					IniWrite, %kill%,%A_ScriptDir%\pos.ini, Stats, kill:
					Tooltip,
					WaitingTime=0

					reload
				}

				}

				Tooltip,
				WaitingTime=0

if(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
				sleep 1000
}
}

looting:

log(Title " is looting at " CountNumb "...")
reload
;~ /* sleep 10000
  ;~ Loop {
      ;~ cou++
    ;~ pic1:=GetPicArr(3, 274, 70, 35)
    ;~ Sleep, 500
    ;~ pic2:=GetPicArr(3, 274, 70, 35)
    ;~ if ComparePicArr(pic1, pic2, n:=0.001)
    ;~ {

      ;~ CoordMode, tooltip
      ;~ tooltip, %cou%,0,0
     ;~ if (cou>1){
  	;~ ;gosub spawnlocation
  		;~ ;sleep 1500

  		;~ reload
        ;~ }

    ;~ }
    ;~ else
    ;~ {
        ;~ pic1:=GetPicArr(3, 274, 70, 35)
        ;~ Sleep, 500
        ;~ pic2:=GetPicArr(3, 274, 70, 35)
        ;~ if ComparePicArr(pic1, pic2, n:=0.001)
          ;~ {
            ;~ CoordMode, tooltip
            ;~ tooltip, %cou%,0,0
            ;~ if (cou>1){
  			;~ ;gosub spawnlocation

              ;~ ;reload
            ;~ }
          ;~ }
        ;~ else
          ;~ {
  				;~ ;gosub spawnlocation
  				;~ ;sleep 1500

            ;~ reload

          ;~ }



    ;~ }
    ;~ pic1:=pic2

  ;~ }
  ;~ reload
  return





resetfarmstate:
if (farmstate=1) or (farmstate=2)
{

if FileExist("logfound.txt") {
	CountNumb := TF_ReadLines("logfound.txt",1,1,1)
	if !ErrorLevel
	if (!CountNumb){
random,randX, %spawnX% , %spawnX%+1
random,randY, %spawnY%, %spawny%+1
	ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA ;location spot btm right
	IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, FarmState:
	}



}

}

if (switchfarm=1) {
	IniRead, oldfarmstate , %A_ScriptDir%\pos.ini, Backup, farmstate:

getfarmstate()
if (oldfarmstate!=farmstate){
	IniWrite, %farmstate%,%A_ScriptDir%\pos.ini, Backup, FarmState:
	gosub spawnlocation
	sleep 10000
}
}

return

spawnlocation:

IniRead, farmstate , %A_ScriptDir%\pos.ini, Backup, farmstate:

if (farmstate= 0){
random,randX, %spawnX% , %spawnX%+1
random,randY, %spawnY%, %spawny%+1
ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA ;location spot btm right
sleep 500
return
}

if (farmstate= 1){
ControlClick, %tauntcoord1x% %tauntcoord1y%, %Title%,, LEFT, 1, NA ;location far btm right
sleep 500
return
}

if (farmstate= 2){
ControlClick, %tauntcoord2x% %tauntcoord2y%, %Title%,, LEFT, 1, NA ;location far btm right
sleep 500
return
}
return

switchfarmstate:
if FileExist("logfoundbackup.txt") {
	CountNumb := TF_ReadLines("logfoundbackup.txt",1,1,1)
	if !ErrorLevel
	if (!CountNumb){
		return
	}
	else {
	switchfarm=1
	IniRead, oldfarmstate , %A_ScriptDir%\pos.ini, Backup, farmstate:

	getfarmstate()
	if (oldfarmstate!=farmstate){
		IniWrite, %farmstate%,%A_ScriptDir%\pos.ini, Backup, FarmState:
		gosub spawnlocation
		sleep 10000
		}
	goto GHhallMain
}

}

return

MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
			return

openmap:
FindText_BindWindow(TitleID)
while(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
ControlClick, x498 y75, %Title%,, LEFT, 1, NA
sleep 1000
}
return


resetguildch:
log(Title " is entering guildhall to reset gui")

if(ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
ControlClick, x498 y75, %Title%,, LEFT, 1, NA ;map
sleep 1000
}

while(!ok:=FindText(menuguild[1], menuguild[2], menuguild[3], menuguild[4], 0, 0, menuguild[5]))
{
	ControlClick, x446 y60, %Title%,, LEFT, 1, NA ;menu
	sleep 1000
}
while(ok:=FindText(menuguild[1], menuguild[2], menuguild[3], menuguild[4], 0, 0, menuguild[5]))
{
	ControlClick, x361 y165, %Title%,, LEFT, 1, NA ;guild
	sleep 1000
}

while(!ok:=FindText(enterhall[1], enterhall[2], enterhall[3], enterhall[4], 0, 0, enterhall[5]))
{
}
while(ok:=FindText(enterhall[1], enterhall[2], enterhall[3], enterhall[4], 0, 0, enterhall[5]))
{
	ControlClick, x352 y301, %Title%,, LEFT, 1, NA ; enterguild
	sleep 1000
}
sleep 20000
gosub openmap
while(!ok:=FindText(leaveguild[1], leaveguild[2], leaveguild[3], leaveguild[4], 0, 0, leaveguild[5]))
{
}
while(ok:=FindText(leaveguild[1], leaveguild[2], leaveguild[3], leaveguild[4], 0, 0, leaveguild[5]))
{
	ControlClick, x318 y238, %Title%,, LEFT, 1, NA ;leave
	sleep 1000
}
while(!ok:=FindText(confirmleave[1], confirmleave[2], confirmleave[3], confirmleave[4], 0, 0, confirmleave[5]))
{
}
while(ok:=FindText(confirmleave[1], confirmleave[2], confirmleave[3], confirmleave[4], 0, 0, confirmleave[5]))
{
	ControlClick, x315 y170, %Title%,, LEFT, 1, NA ; confirm leave
	sleep 1000
}

sleep 10000
return

ID:
while(ok:=FindText(ID[1], ID[2], ID[3], ID[4], 0, 0, ID[5]))
{
	sleep 100
	CoordMode, Mouse
	X:=ok.1.x-(50), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

TH:
while(ok:=FindText(TH[1], TH[2], TH[3], TH[4], 0, 0, TH[5]))
{
	sleep 100
	CoordMode, Mouse
	X:=ok.1.x-(50), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

CN:
while(ok:=FindText(CN[1], CN[2], CN[3], CN[4], 0, 0, CN[5]))
{
	sleep 100
	CoordMode, Mouse
	X:=ok.1.x-(50), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

VN:
while(ok:=FindText(VN[1], VN[2], VN[3], VN[4], 0, 0, VN[5]))
{
	sleep 100
	CoordMode, Mouse
	X:=ok.1.x-(50), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

EN:
while(ok:=FindText(EN[1], EN[2], EN[3], EN[4], 0, 0, EN[5]))
{
	sleep 100
	CoordMode, Mouse
	X:=ok.1.x-(50), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

PH:
while(ok:=FindText(PH[1], PH[2], PH[3], PH[4], 0, 0, PH[5]))
{
	sleep 100
	CoordMode, Mouse
	X:=ok.1.x-(50), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

F5:: ExitApp

updateiniminus1(var, section) {
    ; Read the current value from pos.ini
    IniRead, currentValue, pos.ini, %section%, %var%:
    ; Increment the value by 1
    newvalue := currentValue - 1
    ; Write the updated value back to pos.ini
    IniWrite, %newvalue%, pos.ini, %section%, %var%:
    return
}

; Get the RGB value of all the points of the picture to the array
FindText_ShowArea(x:="", y:="", Active_width:="", Active_height:="")
{
  local
  if (x="")
  {
    VarSetCapacity(pt,16,0), DllCall("GetCursorPos","ptr",&pt)
    x:=NumGet(pt,0,"uint"), y:=NumGet(pt,4,"uint")
  }
  x:=Round(x), y:=Round(y), w:=Round(Active_width)  h:=Round(Active_height)
  ;-------------------------
  Gui, _ShowArea_: +AlwaysOnTop -Caption +ToolWindow +Hwndmyid +E0x08000000
  Gui, _ShowArea_: Show, Hide w%w% h%h%
  ;-------------------------
  dhw:=A_DetectHiddenWindows
  DetectHiddenWindows, On
  d:=4, i:=w-d, j:=h-d
  s=0-0 %w%-0 %w%-%h% 0-%h% 0-0
  s=%s%  %d%-%d% %i%-%d% %i%-%j% %d%-%j% %d%-%d%
  WinSet, Region, %s%, ahk_id %myid%
  DetectHiddenWindows, %dhw%
  ;-------------------------
  Gui, _ShowArea_: Show, NA x%x% y%y%
  Loop, 4
  {
    Gui, _ShowArea_: Color, % A_Index & 1 ? "Red" : "Blue"
    Sleep, 500
  }
  Gui, _ShowArea_: Destroy
}

GetPicArr(x, y, w, h)
{
  ListLines, % (lls:=A_ListLines=0?"Off":"On") ? "Off":"Off"
  SetBatchLines, % (bch:=A_BatchLines) ? "-1":"-1"
  FindText_ScreenShot(x, y, x+w-1, y+h-1)
  arr:=[], i:=1
  Loop, % h {
    yy:=y+A_Index-1
    Loop, % w {
      xx:=x+A_Index-1
      , arr[i++]:=FindText_ScreenShot_GetColor(xx, yy)
    }
  }
  SetBatchLines, %bch%
  ListLines, %lls%
  return arr
}

; Check whether all change points in the picture exceed the percentage

ComparePicArr(arr1, arr2, n:=0.3)
{
  diff:=0, diffMax:=Round(arr1.MaxIndex()*n)
  For k,v in arr1
    if (diff+=(arr2[k]!=v))>diffMax
      return, 1
  return, 0
}

Tip(s:="") {
  SetTimer, %A_ThisFunc%, % s="" ? "Off" : -2000
  ToolTip, %s%, 0, 0
}

getfarmstate(){
	global
IniRead, SuperFarmState , %A_ScriptDir%\pos.ini, Backup, SuperFarmState:

if (SuperFarmState = 0) {
FileGetSize, logfoundsize, %A_ScriptDir%\logfound.txt
if (ErrorLevel=1)
	logfoundsize=0
FileGetSize, logfoundbsize, %A_ScriptDir%\logfoundbackup.txt
if (ErrorLevel=1)
	logfoundbsize=0
FileGetSize, logsize, %A_ScriptDir%\log.txt
if (ErrorLevel=1)
	logsize=0

if ((logfoundsize=0) and (logfoundbsize!=0))
	farmstate= 1
if ((logfoundsize!=0) and (logfoundbsize!=0))
	farmstate= 0
if ((logfoundsize!=0) and (logfoundbsize=0) and (logsize=0))
	farmstate= 1
if ((logfoundsize!=0) and (logfoundbsize=0) and (logsize!=0))
	farmstate= 0
if ((logfoundsize!=0) and (logfoundbsize!=0) and (logsize!=0))
	farmstate= 0
if ((logfoundsize=0) and (logfoundbsize=0))
	farmstate= 1
}
else
{
	FarmState = %SuperFarmState%
}

return %farmstate%
}

log(msg) {
    global oArrayText
    Critical, On
    try {
        sendError(msg)
        FormatTime, TimeString, A_Now, yyyyMMdd HH:mm:ss
        controlgettext, Console, Edit2, Fern Bot ahk_class AutoHotkeyGUI

        Loop, parse, Console, `n, `r
        {
            i++
            nc := TF_ReadLines(Console, A_Index, A_Index, 1)
            oArrayText.push(nc)
            if (i >= 100)
                break
        }

        str := ""
        for each, line in oArrayText
        {
            If (str <> "") ; str is not empty, so add a line feed
                str .= "`r`n"
            str .= line
        }

        logEntry := TimeString " - " msg
        str := logEntry "`r`n" str

        controlsettext, Edit2, %str%, Fern Bot ahk_class AutoHotkeyGUI

        if oArrayText.MinIndex() != ""  ; Not empty.
            oArrayText.Delete(oArrayText.MinIndex(), oArrayText.MaxIndex())

        Critical, Off
        return
    }
    catch e {
        return
    }
}



sendError(msg){
	global
ComObjError(false)
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




