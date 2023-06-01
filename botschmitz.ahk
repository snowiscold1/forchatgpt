#SingleInstance Force
char:= "slave"
#Include %A_ScriptDir%\botschmitzcfg.ini

SetControlDelay, -1

Menu, Tray, Icon, %A_ScriptDir%\icon.ico

WinMove, %Title%,,0,0, 533, 331
WinMove, %Title2%,,533,0, 533, 331

DetectHiddenWindows, On
SetTitleMatchMode, 3

WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
WaitingTime=0
prevkill:=0
IniRead, gui_position, %A_ScriptDir%\pos.ini, window position, gui_position, Center
IniRead, SpotText, %A_ScriptDir%\pos.ini, window position, currentspot:
IniRead, spawnX , %A_ScriptDir%\pos.ini, Backup, spawnX:
IniRead, spawnY , %A_ScriptDir%\pos.ini, Backup, spawnY:
IniWrite, 0,%A_ScriptDir%\pos.ini, Music, prevamt:
IniWrite, 0,%A_ScriptDir%\pos.ini, Stats, kill:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, FarmState:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, Stop:
IniWrite, 0,%A_ScriptDir%\pos.ini, score, totalvisit:
IniWrite, 0,%A_ScriptDir%\pos.ini, score, totalque:
WaitingTime = 0
runonce := 0
alreadyswap:= 0
global oArrayText := []

IniRead, gui_position, %A_ScriptDir%\pos.ini, window position, gui_position, Center
if gui_position = x y
	gui_position = x532 y490

GBTHeight:=10
Gui,1: +LastFound +AlwaysOnTop
Gui,1: New, -Resize -MaximizeBox , Automated Channel Finder by Fern
Gui,1: Add, Text, vLabel1, Country
Gui,1: Add, Text, x162 yMargin vLabel2, Number
Gui,1: Add, DropDownList, Section xMargin vCountry Choose1 ,EN|TH|PH|ID|CN|VN
Gui,1: Add, Edit,  ys x162 w100 vNumber number, 1
Gui,1: Add, CheckBox, Section vCheckNearby Checked xMargin, Auto Kill
Gui,1: Add, CheckBox, Section vAutoSwapSpot Checked xMargin, Auto Swap Spot
Gui,1: Add, CheckBox, vAutoMusic y51 x160, Auto Music
Gui,1: Add, CheckBox, vDNWmode Checked ys x160, DNW mode
GroupBox("GB1", "Auto Farm King Schmitz", GBTHeight, 10, "Label1|Label2|Country|Number|CheckNearby|AutoSwapSpot|AutoMusic|DNWMode")

Gui,1: Add, Edit, w258 h200 vConsole ReadOnly, Press Start
Gui,1: Add, Checkbox, Section x162 vAlt1 Checked xMargin, Include Alt1`
Gui,1: Add, Checkbox, x162 ys vAlt2 Checked, Include Alt2`
GroupBox("GB2", "Log", GBTHeight, 10, "Console|Alt1|Alt2")

Gui,1: Add, Button, Section x8 gTaunt1, Taunter 1
Gui,1: Add, Button, ys x+8 gTaunt2, Taunter 2
Gui,1: Add, Button, ys x+8 gTaunt3, Taunter 3
Gui,1: Add, Button, ys x+8 gWindow, Reposition
Gui,1: Add, Progress, Section h5 x8 w58 y+2  vTaunt1 cRed, 100
Gui,1: Add, Progress,  h5 x+8 w58 vTaunt2 cRed, 100
Gui,1: Add, Progress,  h5 x+8 w58 vTaunt3 cRed, 100
GroupBox("Taunter", "Taunter", GBTHeight, 10, "Taunter 1|Taunter 2|Taunter 3|Reposition|Taunt1|Taunt2|Taunt3")

Gui,1: Add, Button, Section x8 w58 gToggleSpot vSpotButton, %SpotText%
Gui,1: Add, Button, ys x+8 gChannel, Channels
Gui,1: Add, Button, ys x+8 gSwitchSpot, Farm State
Gui,1: Font, Bold
Gui,1: Add, Button, ys x+8 vSt gToggle, START
Gui,1: Font, Normal
GroupBox("GB5", "Controls", GBTHeight, 10, "SpotButton|Channels|Farm State|START")

Gui,1: Font, Bold
Gui, 1: Add, Button, Section x8 w58 gresetlogpos, RESET
Gui,1: Font, Normal
Gui, 1: Add, Button, ys x+8 w58 gtimeStart, AutoStart
Gui,1: Add, Button, ys x+8 w58 gGoMusic, Go Music
Gui,1: Font, Bold
Gui, 1: Add, Button, ys x+8 w58 gESC, RELOAD
Gui, 1: Font, Normal
GroupBox("GB6", "Extras", GBTHeight, 10, "RESET|AutoStart|Go Music|RELOAD")

Gui,1: Show, %gui_position%, Fern Bot
Gui,1: +Hwndgui_id
return



GuiClose:
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinClose, %autogetcard% ahk_class AutoHotkey
WinClose, %deletelog% ahk_class AutoHotkey
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptDir%\pos.ini, window position, gui_position

ExitApp

ID:
while(ok:=FindText(ID[1], ID[2], ID[3], ID[4], 0, 0, ID[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
	sleep 500
}

return

TH:
while(ok:=FindText(TH[1], TH[2], TH[3], TH[4], 0, 0, TH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
	sleep 500

}
return

CN:
while(ok:=FindText(CN[1], CN[2], CN[3], CN[4], 0, 0, CN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
	sleep 500
}
return

VN:
while(ok:=FindText(VN[1], VN[2], VN[3], VN[4], 0, 0, VN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
	sleep 500
}
return

EN:
while(ok:=FindText(EN[1], EN[2], EN[3], EN[4], 0, 0, EN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
	sleep 500
}
return

PH:
while(ok:=FindText(PH[	1], PH[2], PH[3], PH[4], 0, 0, PH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
	sleep 500
}
return

timeStart:
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
log("Bot will automatically start on next wave")
sleep % nextspawn


toggle:

Gui,1:Submit, NoHide
T := !T

if (T)
	{
		startT1 := 1
		startT2 := 1
		startT3 := 1
		DetectHiddenWindows, On
		IfWinNotExist, %backup%
			run %backup% ahk_class AutoHotkey
		IfWinNotExist, %backup2%
			run %backup2% ahk_class AutoHotkey
		IfWinNotExist, %backup3%
			run %backup3% ahk_class AutoHotkey
        Guicontrol,1:, St, STOP
		Guicontrol,1: Disable, Country
        Guicontrol,1: Disable, Number
		Guicontrol,1: Disable, CheckNearby
        Guicontrol,1: Disable, AutoMusic
        Guicontrol,1: Disable, AutoSwapSpot
		Guicontrol,1: Disable, DNWMode
		Guicontrol,1: +cGreen, Taunt1
		Guicontrol,1: +cGreen, Taunt2
		Guicontrol,1: +cGreen, Taunt3
        msgbox, 262208,Status ,STARTED , 1
		setTimer, Start, -1
	}

else
	{

        msgbox, 262208,Status ,STOPPED , 1
		AHKPanic(1, 0, 0, 0)
		Reload

	}
return


Start:

SetTitleMatchMode, 2
IfWinNotExist, %check% ahk_class AutoHotkey
{
run %check% ahk_class AutoHotkey
}
IfWinNotExist, %deletelog% ahk_class AutoHotkey
{
run %deletelog% ahk_class AutoHotkey
}

Gui,2: +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui,2: Color, CCCCCC
;~ Gui, Font, cFF0000 s15 , verdana ;red
;Gui, Font, c000000 s7 , verdana ;black
Gui,2: Font, cFFFFFF s7 , verdana  ;white
FormatTime, MyTime,, hh:mm:ss tt
Gui,2: Add, Text, y0 BackgroundTrans, Start Time = %mytime%
Gui,2: Add, Text, vCounter x8 y10 BackgroundTrans, Total Kill(s) = %Kill%00000
Gui,2: Add, Text, vCounter2 x8 y20 BackgroundTrans, Current Wave Kill(s) = %cKill%00000
Gui,2: Add, Text, vCounterCard x8 y30 BackgroundTrans, Total Card(s) = %Card%00000
Gui,2: Add, Text, vFarmState x8 y40 BackgroundTrans, Total Card(s) = %FarmState%00000
Gui,2: Add, Text, vCounterScore x8 y50 BackgroundTrans, Live Score = %score%00000
Gui,2: Show, NoActivate x5 y124,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime
#Persistent
SetTimer, RefreshD, 2000
SetTimer, autogetcard, 2000



Find:

IniRead, tauntcoord1x , %A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
IniRead, tauntcoord1y , %A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
IniRead, tauntcoord2x , %A_ScriptDir%\pos.ini, Backup, tauntcoord2x:
IniRead, tauntcoord2y , %A_ScriptDir%\pos.ini, Backup, tauntcoord2y:

FindText_BindWindow(Title2ID)

if (DNWMode == 1) {
	gosub DNWMode
	if (logfull == 1) {
		goto logfullgoalt
	}
}

if (superfarmstate==1) {
FileRead, content, logfoundbackup.txt ; Read the content of the file
content := Trim(content, "`n`r `t") ; Remove newline, return, tab, and space characters
If (content = "") ; If the content is empty
{
    goto altv2
}
}

if (superfarmstate==2) {
FileRead, content, logfoundbackup.txt ; Read the content of the file
content := Trim(content, "`n`r `t") ; Remove newline, return, tab, and space characters
If (content = "") ; If the content is empty
{
    goto backtonormal
}
}


while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	ControlClick, x477 y52, %Title2%,, LEFT, 1, NA
	sleep 1000
}
gosub openmapslave

;	lastch := CounNumb


queue:=TF_CountLines("logfound.txt")
if (queue > 5){
	sleep 3000
	goto Find
}

kenascroll = 0
gosub openmapslave



FindText_BindWindow(Title2ID)
while(!ok:=FindText(GHhallSlave[1], GHhallSlave[2], GHhallSlave[3], GHhallSlave[4], 0, 0, GHhallSlave[5]))
{
				waitingtime++
				sleep 1000

				if (WaitingTime>3) {
				 WaitingTime=0
				 goto Find
				}
}

				WaitingTime=0
	ControlClick, x334 y77, %Title2%,, LEFT, 1, NA ;chgechatmap
	sleep 1000
EnterLine:
log(Title2 " is looking for available channel...")
FindText_BindWindow(Title2ID)
 While (!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
 {
				waitingtime++
				sleep 1000

				if (WaitingTime>7) {
				 WaitingTime=0
				 goto Find
				}

 }
 {

				WaitingTime=0
				sleep 500
				ControlClick, x440 y100, %Title2%,, LEFT, 1, NA  ; enterline
 }

FindText_BindWindow(Title2ID)
  While (!ok:=FindText(EnterLine2[1],EnterLine2[2],EnterLine2[3],EnterLine2[4], 0, 0, EnterLine2[5]))
 {
				waitingtime++
				sleep 1000

				if (WaitingTime>7) {
				 WaitingTime=0
				 goto changechannelXbutton
				}
}

 {
				WaitingTime=0
				CoordMode, Mouse
				X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
 }
 SetKeyDelay, 200
 if (runonce==0)
{
	ControlSend, ,%Number%, %Title2%
	CountNumb := % Country " "Number
	FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt

}
else
{
	if (logfull==1) {
		goto logfullgoalt
		}


	if (superfarmstate!=0) {
		if FileExist("logfoundbackup.txt") {
		try {

		FileRead, fileContent, logfoundbackup.txt
		if (StrLen(fileContent) = 0 or RegExMatch(fileContent, "^\s*$"))
		{
			goto logfullgoalt
		}
		else
		{
		}

		CountNumb := TF_ReadLines("logfoundbackup.txt",1,1,1)
		Country:= SubStr(CountNumb, 1, 2)
		Number:= SubStr(CountNumb, 4, 4)
		SetKeyDelay, 100
		ControlSend, ,%Number%, %Title2%


		goto CL
		}
		catch e {
		sleep 1000
		goto Find
		}
	}

	}


	if (jumpa==1)
	{
		jumpa=0
		Number++
		gosub countrycycle
		CountNumb := % Country " "Number
		while(InFile(CountNumb))
			{
				Number++
				gosub countrycycle
				CountNumb := % Country " "Number
			}
		if (logfull==1) {
				goto logfullgoalt
			}
		ControlSend, ,%Number%, %Title2%
	}

	else
	{
		jumpa=0
		tooltip,
		gosub shufflechannel
		CountNumb := % Country " "Number
		while(InFile(CountNumb))
			{
				gosub shufflechannel
				CountNumb := % Country " "Number
			}
		if (logfull==1) {
				goto logfullgoalt
			}
		ControlSend, ,%Number%, %Title2%
	}
}
CL:
sleep 500
ControlClick, x496 y306, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x239 y245, %Title2%,, LEFT, 1, NA ; open country list
sleep 500
FindText_BindWindow(Title2ID)
While (!ok:=FindText(CountryList[1], CountryList[2], CountryList[3], CountryList[4], 0, 0, CountryList[5]))
{
				waitingtime++
				sleep 1000
				ControlClick, x239 y245, %Title2%,, LEFT, 1, NA ; open country list

				if (WaitingTime>7) {
				 WaitingTime=0
				 goto changechannelXbutton
				}
}
				WaitingTime=0
gosub %Country%

while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	c++
	ControlClick, x382 y303, %Title2%,, LEFT, 1, NA
	sleep 1000
	if (c>4) {
		c=0
		runonce++
		goto changechannelXbutton
		}
}
runonce++
jumpa = 0
c=0


changechannelXbutton:
FindText_BindWindow(Title2ID)

if(ok:=FindText(dontremind[1], dontremind[2], dontremind[3], dontremind[4], 0, 0, dontremind[5]))
{
				CoordMode, Mouse
				X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
				sleep 500
				ControlClick, x318 y259, %Title2%,, LEFT, 1, NA
}


while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	ControlClick, x477 y52, %Title2%,, LEFT, 1, NA
	sleep 1000
}

waitjump:

While (!ok:=FindText(skillbarjumpch[1],skillbarjumpch[2],skillbarjumpch[3],skillbarjumpch[4], 0, 0, skillbarjumpch[5]))
 {
				waitingtime++
				Sleep, 1000

				if (ok:=FindText(atkcd[1],atkcd[2],atkcd[3],atkcd[4], 0, 0, atkcd[5]))
				{
					if (superfarmstate != 0) {
					TF_RemoveLines("!logfoundbackup.txt",1,1) ; removes
					}
					goto avex
				}

				if (WaitingTime>9) {
				 WaitingTime=0
				 failjump++
				 if (failjump<2)
				{
					goto Find
				}
				 if (failjump>1)
				{
					if (superfarmstate != 0) {
						if CountNumb=
							TF_RemoveBlankLines("!logfoundbackup.txt",1,1)
						TF_RemoveLines("!logfoundbackup.txt",1,1) ; removes
					}
					failjump=0
					gosub scamghostcap
					gosub spawnlocation
					nomob++
					log(Title2 " is unable to find King Schmitz at " CountNumb "...")
					updateiniby1("totalvisit", "score")
					gosub openmapslave
					goto Find
				}
				}
}
				WaitingTime=0
				failjump=0
				While (ok:=FindText(skillbarjumpch[1],skillbarjumpch[2],skillbarjumpch[3],skillbarjumpch[4], 0, 0, skillbarjumpch[5]))
 {
 }
 				if (superfarmstate != 0) {
					TF_RemoveLines("!logfoundbackup.txt",1,1) ; removes
					}
				if (!ok:=FindText(atkon[1],atkon[2],atkon[3],atkon[4], 0, 0, atkon[5]))
				{
					goto KingSchmitzslave
				}



checkavatarexist:

While (!ok:=FindText(atkcd[1],atkcd[2],atkcd[3],atkcd[4], 0, 0, atkcd[5]))
 {
				if (WaitingTime<8) {
				waitingtime++
				tooltip,
				sleep 1000
				}

				if (WaitingTime>7) {
				 WaitingTime=0
				 gosub scamghostcap
				updateiniby1("totalvisit", "score")
				gosub spawnlocation
				nomob++
				log(Title2 " is unable to find King Schmitz at " CountNumb "...")

				gosub openmapslave
				goto Find
				}
}
avex:
{
				WaitingTime=0
				nomob = 0
				jumpa = 0
				totalkill++
				log(Title2 " has found King Schmitz at " CountNumb "...")
				DetectHiddenWindows, On
				SetTitleMatchMode, 2
				FileAppend, %CountNumb%`n, %A_ScriptDir%\logfound.txt
				updateiniby1("totalvisit", "score")
				updateiniby1("totalque", "score")
				sleep 5000 ; killtime
				gosub spawnlocation
				goto Find
}

KingSchmitzslave:

while(!ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				ControlClick, x511 y270, %Title2%,, LEFT, 1, NA
				sleep 2000
}
FindText_BindWindow(Title2ID)
 while(!ok:=FindText(KingSchmitzslave[1], KingSchmitzslave[2], KingSchmitzslave[3], KingSchmitzslave[4], 0.1, 0.1, KingSchmitzslave[5]))
{
				waitingtime++
				sleep 1000

				if (WaitingTime>6) {
				 WaitingTime=0
			 if(ok:=FindText(fullmob[1], fullmob[2], fullmob[3], fullmob[4], 0, 0, fullmob[5]))
				{
					if (kenascroll = 0){
						tooltip,
						sleep 1000
						gosub slideup
						kenascroll=1
						sleep 1000
						goto KingSchmitzslave
					}
				}

			 if(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
			 {
				CoordMode, Mouse
				X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
				sleep 1000
			 }

			gosub spawnlocation
			nomob++
			log(Title2 " is unable to find King Schmitz at " CountNumb "...")
			updateiniby1("totalvisit", "score")
			gosub openmapslave
			goto Find
			 }
}



{
			WaitingTime=0
			CoordMode, Mouse
			X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-3, x+3
			random, randY, y-1, y+1
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA
			nomob = 0
			jumpa = 0
			totalkill++
			log(Title2 " has found King Schmitz at " CountNumb "...")
			sleep 1000

			while(ok:=FindText(KingSchmitzslave[1], KingSchmitzslave[2], KingSchmitzslave[3], KingSchmitzslave[4], 0.1, 0.1, KingSchmitzslave[5]))
			{
				waitingtime++
				sleep 1000

				if (WaitingTime>14) {
					fail++
					WaitingTime=0
					goto Find
				}
			}
				WaitingTime=0
DetectHiddenWindows, On
SetTitleMatchMode, 2
FileAppend, %CountNumb%`n, %A_ScriptDir%\logfound.txt
updateiniby1("totalvisit", "score")
updateiniby1("totalque", "score")
if(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				CoordMode, Mouse
				X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
				sleep 1000
}
gosub spawnlocation
sleep 1500
goto Find
}




;~ if (nomob = 5)
;~ {
;~ gosub skip5channel
;~ }






return

countrycycle:

if (Country = "EN")
{

	if(Number>12)
	{
		gosub nextcountry
	}

}

if (Country = "TH")
{
	if(Number>42)
	{
		gosub nextcountry
	}

}

if (Country = "PH")
{
	if(Number>25)
	{
		gosub nextcountry
	}

}


if (Country = "ID")
{
	if(Number>18)
	{
		gosub nextcountry
	}

}

if (Country = "CN")
{
	if(Number>1)
	{
		gosub nextcountry
	}

}

if (Country = "VN")
{
	if(Number>1)
	{
		gosub nextcountry
	}

}

return

nextcountry:

Number = 1

NextCount := % ObjIndexOf(CountryAvailable, Country)
NextCount++
if (NextCount > 6) {
NextCount = 1
}
x := % CountryAvailable[NextCount]
Country = % x

return





skip5channel:
Number+=5
return

waitnextspawn:

nomob := 0
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


IniRead, prevamt , %A_ScriptDir%\pos.ini, Music, prevamt:

if (prevamt < 30) && (AutoMusic = 1) {
masa := 900000 ; 15 min
}
else
{
masa := 600000 ; 10 min
}

if (nextspawn < masa) {

tooltip, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond,0,0
FileDelete, %A_ScriptDir%\log.txt
;ControlClick, x509 y267, %Title2%,, LEFT, 1, NA
TrayTip , Ultimate Farm Bot, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond, 4 ;show for 4 seconds

if (prevamt < 30) && (nextspawn > 300000) && (AutoMusic = 1)
{
goto logfullgoalt
}


goto backtonormal
}

return




spawnlocation:

IniRead, superfarmstate , %A_ScriptDir%\pos.ini, Backup, superfarmstate:
IniRead, spawnX , %A_ScriptDir%\pos.ini, Backup, spawnX:
IniRead, spawnY , %A_ScriptDir%\pos.ini, Backup, spawnY:
if (superfarmstate= 0){
random,randX, %spawnX% , %spawnX%+1
random,randY, %spawnY%, %spawny%+1
ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA ;location spot btm right
sleep 500
return
}

if (superfarmstate == 1){
ControlClick, %tauntcoord1x% %tauntcoord1y%, %Title2%,, LEFT, 1, NA ;location far btm right
sleep 500
return
}

if (superfarmstate == 2){
ControlClick, %tauntcoord2x% %tauntcoord2y%, %Title2%,, LEFT, 1, NA ;location far btm right
sleep 500
return
}
return

shufflechannel:
random, NextCount, 1, 6
x := % CountryAvailable[NextCount]
Country = % x

if (Country = "EN")
{
	random, Number, 1, 12
}

if (Country = "TH")
{
	random, Number, 1, 42
}

if (Country = "PH")
{
	random, Number, 1, 25

}


if (Country = "ID")
{
	random, Number, 1, 18
}

if (Country = "CN")
{
	random, Number, 1, 1
}

if (Country = "VN")
{
	random, Number, 1, 1
}


return


;;;;;function dont kacau here
ObjIndexOf(obj, item, case_sensitive:=false)
{
	for i, val in obj {
		if (case_sensitive ? (val == item) : (val = item))
			return i
	}
}


InFile(CountNumb)
{
    global
    i := 1
    Loop, Read, %A_ScriptDir%\log.txt
    {
        if A_LoopReadLine <> ""  ; Check if the line is non-empty
            ++i
    }

    if (i > 98)
    {
        logfull := 1 ; No new values can be added if there are already 99 non-empty lines in the file
        return 0
    }

    Loop, Read, %A_ScriptDir%\log.txt
    {
        if (A_LoopReadLine = CountNumb)
            return 1
    }

    ; Will reach here only if CountNumb is not in the file
    ; Write CountNumb to file and return 0
    FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt
    return 0
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
  ;ToolTip, %s%, 0, 0
}


startLogging(x:=113,y:=331,w:=420,h:=300,title:="Fern Bot"){
	global
	If (logging!=1){
		logging:=1
		local innerW, innerH
		innerW:=w-20
		innerH:=h-50
		Gui,5: +AlwaysOnTop ;Keeps the log on top
		Gui,5: Add, Edit, x10 y10 w%innerW% h%innerH% vConsole ; Adds inner box
		Gui,5: Add, Button, x10 y260 h30 gChannel, Found Channel
		Gui,5: Add, Button, x100 y260 h30 gGoMusic, Go Music
		Gui,5: Add, Checkbox, x160 y270 vAlt1 Checked, Include Alt1`
		Gui,5: Add, Checkbox, x240 y270 vAlt2 Checked, Include Alt2`
		Gui,5: Show, x%x% y%y% w%w% h%h%, %title% ; Displays window
		log("Bot has started") ; This line can be removed if wanted
	}
}


;************************** GroupBox *******************************
;
;	Adds and wraps a GroupBox around a group of controls in
;	the default Gui. Use the Gui Default command if needed.
;	For instance:
;
;		Gui,1: 2:Default
;
;	sets the default Gui to Gui 2.
;
;	Add the controls you want in the GroupBox to the Gui using
;	the "v" option to assign a variable name to each control. *
;	Then immediately after the last control for the group
;	is added call this function. It will add a GroupBox and
;	wrap it around the controls.
;
;	Example:
;
;	Gui,1: Add, Text, vControl1, This is Control 1
;	Gui,1: Add, Text, vControl2 x+30, This is Control 2
;	GroupBox("GB1", "Testing", 20, 10, "Control1|Control2")
;	Gui,1: Add, Text, Section xMargin, This is Control 3
;	GroupBox("GB2", "Another Test", 20, 10, "This is Control 3")
;	Gui,1: Add, Text, yS, This is Control 4
;	GroupBox("GB3", "Third Test", 20, 10, "Static4")
;	Gui,1: Show, , GroupBox Test
;
;	* The "v" option to assign Control ID is not mandatory. You
;	may also use the ClassNN name or text of the control.
;
;	Author: dmatch @ AHK forum
;	Date: Sept. 5, 2011
;
;********************************************************************

GroupBox(GBvName			;Name for GroupBox control variable
		,Title				;Title for GroupBox
		,TitleHeight		;Height in pixels to allow for the Title
		,Margin				;Margin in pixels around the controls
		,Piped_CtrlvNames	;Pipe (|) delimited list of Controls
		,FixedWidth=""		;Optional fixed width
		,FixedHeight="")	;Optional fixed height
{
	Local maxX, maxY, minX, minY, xPos, yPos ;all else assumed Global
	minX:=99999
	minY:=99999
	maxX:=0
	maxY:=0
	Loop, Parse, Piped_CtrlvNames, |, %A_Space%
	{
		;Get position and size of each control in list.
		GuiControlGet, GB, Pos, %A_LoopField%
		;creates GBX, GBY, GBW, GBH
		if(GBX<minX) ;check for minimum X
			minX:=GBX
		if(GBY<minY) ;Check for minimum Y
			minY:=GBY
		if(GBX+GBW>maxX) ;Check for maximum X
			maxX:=GBX+GBW
		if(GBY+GBH>maxY) ;Check for maximum Y
			maxY:=GBY+GBH

		;Move the control to make room for the GroupBox
		xPos:=GBX+Margin
		yPos:=GBY+TitleHeight+Margin ;fixed margin
		GuiControl, Move, %A_LoopField%, x%xPos% y%yPos%
	}
	;re-purpose the GBW and GBH variables
	if(FixedWidth)
		GBW:=FixedWidth
	else
		GBW:=maxX-minX+2*Margin ;calculate width for GroupBox
	if(FixedHeight)
		GBH:=FixedHeight
	else
		GBH:=maxY-MinY+TitleHeight+2*Margin ;calculate height for GroupBox ;fixed 2*margin

	;Add the GroupBox
	Gui,1: Add, GroupBox, v%GBvName% x%minX% y%minY% w%GBW% h%GBH%, %Title%
	return
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



vlog(msg := "", vFullLog := 0)
{
    ; creates an array to log in all your data
    static oArrayText := []
    static oArrayFULLText := []

    ; for demonstration purposes, I left it at "10"
    static vMaxLineLength := 10

    FormatTime, TimeString, A_Now, yyyyMMdd HH:mm:ss  ; Generates a time stamp

    ; the text you want for your log line
    vMessage := TimeString " - " msg

    ; save it to the array
    oArrayText.push(vMessage)
    oArrayFULLText.push(vMessage)

    ; if there are more than 1000 lines in here
    While (oArrayText.count() > vMaxLineLength)
        ; remove the first one
        oArrayText.removeAt(1)

    str := ""

    if (vFullLog = 0)
    {
        ; displays the partial-limited log
        for each, line in oArrayText
        {
            ; reverse the order of the string
            str .= oArrayText[oArrayText.count() - a_Index + 1] "`r`n"
        }
    }
    else
    {
        ; displays the full log:
        for each, line in oArrayFULLText
        {
            ; reverse the order of the string
            str .= oArrayFULLText[oArrayFULLText.count() - a_Index + 1] "`r`n"
        }
    }

    ; displays it on the GUI
    GuiControl, , Console, % str
    return
}

endLogging(){
global
Gui,5: Destroy
logging:=""
Return
}

determinespot() {
    global cKill

    if (cKill < 40) {
        log("AutoSwapSpot is On")
		gosub AutoSwapSpot
    }

    return
}


score() {
    global cKill

    if (cKill == "")
        cKill := 0

    if (cKill == "")
        scKill := 0
    else
        scKill := cKill

	if (alreadyswap == 1)
		scKill := cKill - beforeswapKill

	IniRead, superfarmstate, %A_ScriptDir%\pos.ini, Backup, superfarmstate:
    IniRead, totalvisit, %A_ScriptDir%\pos.ini, score, totalvisit:
    IniRead, totalque, %A_ScriptDir%\pos.ini, score, totalque:

    if (superfarmstate == "")
        superfarmstate := 0

    if (totalvisit == "")
        totalvisit := 0

    if (totalque == "")
        totalque := 0

	cScore := ((totalque + scKill) / totalvisit) * 100

    if (cScore == "")
        return 0

    return cScore
}

updateiniby1(var, section) {
    IniRead, superfarmstate , %A_ScriptDir%\pos.ini, Backup, superfarmstate:
    if (superfarmstate == 0) {
    ; Read the current value from pos.ini
    IniRead, currentValue, pos.ini, %section%, %var%:
    ; Increment the value by 1
    newvalue := currentValue + 1
    ; Write the updated value back to pos.ini
    IniWrite, %newvalue%, pos.ini, %section%, %var%:
    }
    return
}


efficiency(){
global
Gui,5:Submit, NoHide
if (Alt2=0) {
	IniRead, currentkill , %A_ScriptDir%\pos.ini, Stats, kill:

}

totalfoundkill := currentkill-earlykill

efficiency := (totalfoundkill/totalfound)*100

;spot 1, bawah kiri kt tmpt smvp
;spot 2, atas tengah jam 12
;spot 3 atas kanan
;spot 4 bawah kanan jam 5
IniRead, SpotText, %A_ScriptDir%\pos.ini, window position, currentspot:

 if (SpotText == "Spot 1") {
		t1x:="x322"
		t1y:="y162"

		t2x:="x354"
		t2y:="y161"

		t3x:="x318"
		t3y:="y194"

		t4x:="x352"
		t4y:="y193"

		spawnX:="332"
		spawnY:="182"
 }

 if (SpotText == "Spot 2") {
		t1x:="x389"
		t1y:="y97"

		t2x:="x359"
		t2y:="y97"

		t3x:="x373"
		t3y:="y115"

		t4x:="x355"
		t4y:="y118"

		spawnX:="373"
		spawnY:="87"
 }

 if (SpotText == "Spot 3") {

		t1x:="x395"
		t1y:="y90"

		t2x:="x424"
		t2y:="y91"

		t3x:="x428"
		t3y:="y138"

		t4x:="x394"
		t4y:="y140"

		spawnX:="398"
		spawnY:="122"
 }

if (SpotText == "Spot 4") {

		t1x:="x428"
		t1y:="y170"

		t2x:="x394"
		t2y:="y169"

		t3x:="x409"
		t3y:="y158"

		t4x:="x427"
		t4y:="y204"

		spawnX:="396"
		spawnY:="194"
 }

if (efficiency < 70) {
	log("Current tauntspot " tauntcoord1x " " tauntcoord1y " is not efficient")
	IniRead, tauntcoord1x , %A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
	IniRead, tauntcoord1y , %A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
if (tauntcoord1x == t1x)
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=t2x
		newtauntcoord1y:=t2y
	}

	if (t=2) {
		newtauntcoord1x:=t3x
		newtauntcoord1y:=t3y
	}
}

if (tauntcoord1x == t2x)
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=t1x
		newtauntcoord1y:=t1y
	}

	if (t=2) {
		newtauntcoord1x:=t3x
		newtauntcoord1y:=t3y
	}
}

if (tauntcoord1x == t3x)
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=t1x
		newtauntcoord1y:=t1y
	}

	if (t=2) {
		newtauntcoord1x:=t2x
		newtauntcoord1y:=t2y
	}
}

IniWrite, %newtauntcoord1x%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
IniWrite, %newtauntcoord1y%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
IniWrite, %t4x%,%A_ScriptDir%\pos.ini, Backup, tauntcoord2x:
IniWrite, %t4y%,%A_ScriptDir%\pos.ini, Backup, tauntcoord2y:
log("Changed to " newtauntcoord1x " " newtauntcoord1y " on next wave")
log("current kill " currentkill)
}

totalfound := 0

return %efficiency%
}

5GuiClose:
Gui,5: Destroy
logging:=""
WinClose, %autogetcard% ahk_class AutoHotkey
WinClose, %deletelog% ahk_class AutoHotkey
ExitApp
return

GoMusic:

run %gotomusic% ahk_class AutoHotkey

return

ToggleSpot:

   ; disable the button and grey it out
    GuiControl, Disable, SpotButton
    GuiControl, +BackgroundGray, SpotButton

    GuiControlGet, ButtonText, , SpotButton
    If (ButtonText = "Spot 1")
    {
        GuiControl, 1:, SpotButton, Spot 2
		IniWrite, "Spot 2",%A_ScriptDir%\pos.ini, window position, currentspot:
		t1x:="x389"
		t1y:="y97"

		t2x:="x359"
		t2y:="y97"

		t3x:="x373"
		t3y:="y115"

		t4x:="x355"
		t4y:="y118"

		spawnX:="373"
		spawnY:="87"
	}
    Else If (ButtonText = "Spot 2")
    {
        GuiControl, 1:, SpotButton, Spot 3
		IniWrite, "Spot 3",%A_ScriptDir%\pos.ini, window position, currentspot:
		t1x:="x395"
		t1y:="y90"

		t2x:="x424"
		t2y:="y91"

		t3x:="x428"
		t3y:="y138"

		t4x:="x394"
		t4y:="y140"

		spawnX:="398"
		spawnY:="122"
    }
    Else If (ButtonText = "Spot 3")
    {
        GuiControl, 1:, SpotButton, Spot 4
		IniWrite, "Spot 4",%A_ScriptDir%\pos.ini, window position, currentspot:
		t1x:="x428"
		t1y:="y170"

		t2x:="x394"
		t2y:="y169"

		t3x:="x409"
		t3y:="y158"

		t4x:="x427"
		t4y:="y204"

		spawnX:="396"
		spawnY:="194"
    }
    Else
    {
        GuiControl, 1:, SpotButton, Spot 1
		IniWrite, "Spot 1",%A_ScriptDir%\pos.ini, window position, currentspot:
		t1x:="x322"
		t1y:="y162"

		t2x:="x354"
		t2y:="y161"

		t3x:="x318"
		t3y:="y194"

		t4x:="x352"
		t4y:="y193"

		spawnX:="332"
		spawnY:="182"
	}
	IniWrite, %t1x%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
	IniWrite, %t1y%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
	IniWrite, %t4x%,%A_ScriptDir%\pos.ini, Backup, tauntcoord2x:
	IniWrite, %t4y%,%A_ScriptDir%\pos.ini, Backup, tauntcoord2y:
	IniWrite, %spawnX%,%A_ScriptDir%\pos.ini, Backup, spawnX:
	IniWrite, %spawnY%,%A_ScriptDir%\pos.ini, Backup, spawnY:
	run %check% ahk_class AutoHotkey
loop, 5
{
    titles := [Title, Title2, Title3, Title4, Title5][A_Index]
    ControlClick, x%spawnX% y%spawnY%, %titles%,, LEFT, 1, NA
}


    ; sleep for 2 seconds (2000 milliseconds)
    Sleep, 1000

    ; enable the button and remove the grey out
    GuiControl, Enable, SpotButton
    GuiControl, -BackgroundGray, SpotButton

Return

resetlogpos:
FileDelete, %A_ScriptDir%\log.txt
FileDelete, %A_ScriptDir%\logfound.txt
FileDelete, %A_ScriptDir%\logfoundbackup.txt
FileDelete, %A_ScriptDir%\logfoundbackup2.txt
sleep 1000
FileAppend,, %A_ScriptDir%\log.txt
FileAppend,, %A_ScriptDir%\logfound.txt
FileAppend,, %A_ScriptDir%\logfoundbackup.txt
FileAppend,, %A_ScriptDir%\logfoundbackup2.txt

IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, Stop:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, FarmState:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:
IniWrite, 0,%A_ScriptDir%\pos.ini, score, totalvisit:
IniWrite, 0,%A_ScriptDir%\pos.ini, score, totalque:

log("All channels logs cleared, you may start fresh!")
log("pos.ini reset, return to default")
return
Channel:
FormatTime, TimeString, A_Now, yyyyMMdd HH:mm:ss

GuiControlGet, Console, 1: ; Gets current GUI text

; Read and process logfound.txt
FileRead, content, %A_WorkingDir%\logfound.txt
lines := 0
msg := ""
Loop, Parse, content, `n, `r
{
    line := Trim(A_LoopField) ; Trim leading/trailing whitespace
    if (line != "")
    {
        lines++
        msg .= line . "," . A_Space
    }
}
Console := TimeString . " - Current (" . lines . " channels) " . msg . "TOTAL " . lines "`r`n" . Console
msg := ""

; Read and process logfoundbackup.txt
FileRead, content, %A_WorkingDir%\logfoundbackup.txt
lines := 0
Loop, Parse, content, `n, `r
{
    line := Trim(A_LoopField) ; Trim leading/trailing whitespace
    if (line != "")
    {
        lines++
        msg .= line . "," . A_Space
    }
}
Console := TimeString . " - Backup (" . lines . " channels) " . msg . "TOTAL " . lines "`r`n" . Console
msg := ""

; Read and process logfoundbackup2.txt
FileRead, content, %A_WorkingDir%\logfoundbackup2.txt
lines := 0
Loop, Parse, content, `n, `r
{
    line := Trim(A_LoopField) ; Trim leading/trailing whitespace
    if (line != "")
    {
        lines++
        msg .= line . "," . A_Space
    }
}
Console := TimeString . " - Backup2 (" . lines . " channels) " . msg . "TOTAL " . lines "`r`n" . Console

GuiControl, 1:, Console, %Console% ; Update the GUI with the modified console content

return


AHKPanic(Kill=0, Pause=0, Suspend=0, SelfToo=0) {
DetectHiddenWindows, On
WinGet, IDList ,List, ahk_class AutoHotkey
Loop %IDList%
  {
  ID:=IDList%A_Index%
  WinGetTitle, ATitle, ahk_id %ID%
  IfNotInString, ATitle, %A_ScriptFullPath%
    {
    If Suspend
      PostMessage, 0x111, 65305,,, ahk_id %ID%  ; Suspend.
    If Pause
      PostMessage, 0x111, 65306,,, ahk_id %ID%  ; Pause.
    If Kill
      WinClose, ahk_id %ID% ;kill
    }
  }
If SelfToo
  {
  If Suspend
    Suspend, Toggle  ; Suspend.
  If Pause
    Pause, Toggle, 1  ; Pause.
  If Kill
    ExitApp
  }
}

openmap:
FindText_BindWindow(TitleID)
while(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
ControlClick, x498 y75, %Title%,, LEFT, 1, NA
sleep 1000
}
return


resetguildch:
log(Title2 " is entering guildhall to reset gui")

if(ok:=FindText(worldmapslave[1], worldmapslave[2], worldmapslave[3], worldmapslave[4], 0, 0, worldmapslave[5]))
{
ControlClick, x498 y75, %Title2%,, LEFT, 1, NA ;map
sleep 1000
}

while(!ok:=FindText(menuguild[1], menuguild[2], menuguild[3], menuguild[4], 0, 0, menuguild[5]))
{
	ControlClick, x446 y60, %Title2%,, LEFT, 1, NA ;menu
	sleep 1000
}
while(ok:=FindText(menuguild[1], menuguild[2], menuguild[3], menuguild[4], 0, 0, menuguild[5]))
{
	ControlClick, x361 y165, %Title2%,, LEFT, 1, NA ;guild
	sleep 1000
}

while(!ok:=FindText(enterhall[1], enterhall[2], enterhall[3], enterhall[4], 0, 0, enterhall[5]))
{
}
while(ok:=FindText(enterhall[1], enterhall[2], enterhall[3], enterhall[4], 0, 0, enterhall[5]))
{
	ControlClick, x352 y301, %Title2%,, LEFT, 1, NA ; enterguild
	sleep 1000
}
sleep 20000
gosub openmapslave
while(!ok:=FindText(leaveguild[1], leaveguild[2], leaveguild[3], leaveguild[4], 0, 0, leaveguild[5]))
{
}
while(ok:=FindText(leaveguild[1], leaveguild[2], leaveguild[3], leaveguild[4], 0, 0, leaveguild[5]))
{
	ControlClick, x318 y238, %Title2%,, LEFT, 1, NA ;leave
	sleep 1000
}
while(!ok:=FindText(confirmleave[1], confirmleave[2], confirmleave[3], confirmleave[4], 0, 0, confirmleave[5]))
{
}
while(ok:=FindText(confirmleave[1], confirmleave[2], confirmleave[3], confirmleave[4], 0, 0, confirmleave[5]))
{
	ControlClick, x315 y170, %Title2%,, LEFT, 1, NA ; confirm leave
	sleep 1000
}

sleep 10000
return

openmapslave:
while(!ok:=FindText(worldmapslave[1], worldmapslave[2], worldmapslave[3], worldmapslave[4], 0, 0, worldmapslave[5]))
{
ControlClick, x498 y75, %Title2%,, LEFT, 1, NA
sleep 1000
}
return


AutoSwapSpot:
GuiControlGet, ButtonText, , SpotButton
If (ButtonText = "Spot 1") {
	GuiControl, 1:, SpotButton, Spot 2
}

gosub togglespot
GuiControlGet, ButtonText, , SpotButton
log("Swap position to " ButtonText)
alreadyswap :=1
beforeswapkill := cKill
return

DNWMode:
currentMinute := A_Min
actualscore := score()

if (currentMinute = 3) && (actualscore < 65) {
	log("Do Not Wait mode is On, ready to clear and change spot")
    logfull := 1 ; ready to swap spot
}
return

logfullgoalt:
IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, Stop:
	if FileExist("log.txt") {
		FileDelete, %A_ScriptDir%\log.txt
	}

logfull:= 0
totalfound:=TF_CountLines("logfoundbackup.txt")-1
IniRead, earlykill , %A_ScriptDir%\pos.ini, Stats, kill:

while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	ControlClick, x477 y52, %Title2%,, LEFT, 1, NA
	sleep 1000
}
gosub openmapslave

loop{

if FileExist("logfound.txt") {
	CountNumb := TF_ReadLines("logfound.txt",1,1,1)
	if !ErrorLevel
	if (!CountNumb){
		break
	}
	else sleep 5000
}
}
	sleep 10000
	Gui,5:Submit, NoHide
	FileRead, content, logfoundbackup.txt ; Read the content of the file
	content := Trim(content, "`n`r `t") ; Remove newline, return, tab, and space characters
	If (content = "") ; If the content is empty
		logfoundbsize:=0
	else
		logfoundbsize:=1

	if (Alt1==1)and(logfoundbsize!=0) {
	log("Farming at alternate location")
	gosub openmap
	IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, FarmState:
	IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:
	gosub spawnlocation
	sleep 1000
	ControlClick, %tauntcoord1x% %tauntcoord1y%, %Title%,, LEFT, 1, NA ;location far btm right
	sleep 10000
	goto Find
	}
	IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, FarmState:
	IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:
	goto Find


altv2:
FileRead, content, logfound.txt ; Read the content of the file
	content := Trim(content, "`n`r `t") ; Remove newline, return, tab, and space characters
	If (content = "") ; If the content is empty
	{
        FileDelete,  %A_ScriptDir%\logfound.txt
        FileAppend,, %A_ScriptDir%\logfound.txt
	}

loop{

if FileExist("logfound.txt") {

     CountNumb := TF_ReadLines("logfound.txt",1,1,1)
	if !ErrorLevel
		if (!CountNumb){
			break
		}
		else sleep 5000
}
}
	sleep 10000

	Gui,5:Submit, NoHide
	FileRead, content, logfoundbackup2.txt ; Read the content of the file
	content := Trim(content, "`n`r `t") ; Remove newline, return, tab, and space characters
	If (content = "") ; If the content is empty
		logfoundbsize:=0
	else
		logfoundbsize:=1

	if (Alt2=1)and(logfoundbsize!=0) {
	IniRead, currentkill , %A_ScriptDir%\pos.ini, Stats, kill:
	log("Farming at second alternate location")
	gosub openmap

	IniWrite, 2,%A_ScriptDir%\pos.ini, Backup, FarmState:
	IniWrite, 2,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:

	gosub spawnlocation
	sleep 1000
	ControlClick, %tauntcoord2x% %tauntcoord2y%, %Title%,, LEFT, 1, NA ;location far btm right
	FileMove, %A_ScriptDir%\logfoundbackup2.txt,%A_ScriptDir%\logfoundbackup.txt,1
	sleep 10000
	goto Find
}
goto backtonormal

taunt1:
SetTitleMatchMode, 2
    if (startT1 = 0)
        {
		startT1 := 1
		Guicontrol,1: +cGreen, Taunt1
		DetectHiddenWindows, On
		IfWinNotExist, %backup%
			run %backup% ahk_class AutoHotkeylog
        }
    else
        {
		startT1 := 0
		Guicontrol,1: +cRed, Taunt1
		DetectHiddenWindows, On
		WinClose, %backup% ahk_class AutoHotkey
        }
return

taunt2:
SetTitleMatchMode, 2
    if (startT2 = 0)
        {
		startT2 := 1
		Guicontrol,1: +cGreen, Taunt2
		DetectHiddenWindows, On
		IfWinNotExist, %backup2%
			run %backup2% ahk_class AutoHotkeylog
        }
    else
        {
		startT2 := 0
		Guicontrol,1: +cRed, Taunt2
		DetectHiddenWindows, On
		WinClose, %backup2% ahk_class AutoHotkey
        }
return

taunt3:
SetTitleMatchMode, 2
    if (startT3 = 0)
        {
		startT3 := 1
		Guicontrol,1: +cGreen, Taunt3
		DetectHiddenWindows, On
		IfWinNotExist, %backup3%
			run %backup3% ahk_class AutoHotkeylog
        }
    else
        {
		startT3 := 0
		Guicontrol,1: +cRed, Taunt3
		DetectHiddenWindows, On
		WinClose, %backup3% ahk_class AutoHotkey
        }
return


SwitchSpot:
IniRead, superfarmstate , %A_ScriptDir%\pos.ini, Backup, superfarmstate:

if (superfarmstate == 0) {
IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, FarmState:
IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:
IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, Stop:
return
}

if (superfarmstate == 1) {
IniWrite, 2,%A_ScriptDir%\pos.ini, Backup, FarmState:
IniWrite, 2,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:
IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, Stop:
FileGetSize, logfoundbsize, %A_ScriptDir%\logfoundbackup.txt
if (ErrorLevel=1)
	logfoundbsize=0
if (logfoundbsize=0)
	FileMove, %A_ScriptDir%\logfoundbackup2.txt,%A_ScriptDir%\logfoundbackup.txt,1
return
}

if (superfarmstate == 2) {
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, FarmState:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, SuperFarmState
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, Stop:
return
}
return





backtonormal:
IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, Stop:
loop{

if FileExist("logfound.txt") {
	CountNumb := TF_ReadLines("logfound.txt",1,1,1)
	if !ErrorLevel
		if (!CountNumb) {
			break
		}
	else sleep 5000
}
}
	sleep 10000

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
log("Wave cleared. Waiting for next spawn in " nextspawninmin "min..")
IniRead, prevamt , %A_ScriptDir%\pos.ini, Music, prevamt:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, FarmState:
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, SuperFarmState:

loop, 5
{
    titles := [Title, Title2, Title3, Title4, Title5][A_Index]
    ControlClick, x%spawnX% y%spawnY%, %titles%,, LEFT, 1, NA
}

	effic := % efficiency()
	log("current score " score)
	sleep 500
	log("Taunt spot efficiency is "effic "`% ")
	sleep 500

	log("Farming at normal location")

if (prevamt < 30) && (nextspawn > 600000) &&  (nextspawn < 2400000) && (AutoMusic = 1)
{
run %gotomusic% ahk_class AutoHotkey
sleep % nextspawn
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, Stop:
prevkill:= kill
TrayTip , Deleting log.txt, Country log has been reset, 4 ;show for 4 seconds
	if FileExist("log.txt") {
		FileDelete, %A_ScriptDir%\log.txt
	}
IniWrite, 0, %A_ScriptDir%\pos.ini, score, totalvisit:
IniWrite, 0, %A_ScriptDir%\pos.ini, score, totalque:
goto checkavatarexist
}


if (nextspawn < 2400000) {
	if (AutoSwapSpot == 1 && alreadyswap==0) {
		determinespot()
		gosub resetlogpos
		IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, Stop:
		WinClose, %backup% ahk_class AutoHotkey
		WinClose, %backup2% ahk_class AutoHotkey
		WinClose, %backup3% ahk_class AutoHotkey
		run %backup% ahk_class AutoHotkeylog
		run %backup2% ahk_class AutoHotkeylog
		run %backup3% ahk_class AutoHotkeylog
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
		}
		alreadyswap := 0
		sleep % nextspawn
}
else
{
	if (AutoSwapSpot == 1 && alreadyswap==0) {
		determinespot()
		sleep 60000
		gosub resetlogpos
		WinClose, %backup% ahk_class AutoHotkey
		WinClose, %backup2% ahk_class AutoHotkey
		WinClose, %backup3% ahk_class AutoHotkey
		run %backup% ahk_class AutoHotkeylog
		run %backup2% ahk_class AutoHotkeylog
		run %backup3% ahk_class AutoHotkeylog
		IniWrite, 0, %A_ScriptDir%\pos.ini, score, totalvisit:
		IniWrite, 0, %A_ScriptDir%\pos.ini, score, totalque:
		goto checkavatarexist
		}
	if (AutoSwapSpot == 1 && alreadyswap==1) {
		gosub resetlogpos
		IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, Stop:
		WinClose, %backup% ahk_class AutoHotkey
		WinClose, %backup2% ahk_class AutoHotkey
		WinClose, %backup3% ahk_class AutoHotkey
		run %backup% ahk_class AutoHotkeylog
		run %backup2% ahk_class AutoHotkeylog
		run %backup3% ahk_class AutoHotkeylog
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
			alreadyswap := 0
			sleep % nextspawn
	}
}
	IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, Stop:
	if (alreadyswap==0)
		prevkill:= kill
	IniWrite, 0, %A_ScriptDir%\pos.ini, score, totalvisit:
	IniWrite, 0, %A_ScriptDir%\pos.ini, score, totalque:
	TrayTip , Deleting log.txt, Country log has been reset, 4 ;show for 4 seconds
		if FileExist("log.txt") {
		FileDelete, %A_ScriptDir%\log.txt
	}
	goto checkavatarexist
return

scamghostcap:
While (!ok:=FindText(ghostcapavatar[1],ghostcapavatar[2],ghostcapavatar[3],ghostcapavatar[4], 0, 0, ghostcapavatar[5]))
				{
					c++
					ControlClick, x510 y243, %Title2%,, LEFT, 1, NA
					sleep 300
					if (c>6) {
						c=0
						return
					}
				}
c=0
FileAppend, %CountNumb%`n, %A_ScriptDir%\logfound.txt
updateiniby1("totalvisit", "score")
updateiniby1("totalque", "score")
log(Title2 " has found Ghost Cap at " CountNumb "...")
return



MaxTime:

			WaitingTime++
			tooltip,

			return




SlideUp:
CoordMode,Mouse, Screen
MouseGetPos, hereX, hereY
Click, 948,233, Down
sleep 300
MouseMove, 948,132 ,10
sleep 300
Click, 948, 132, Up
MouseMove, %hereX%, %hereY%
return



RefreshD:
IniRead, kill , %A_ScriptDir%\pos.ini, Stats, kill:
cKill := kill-prevkill
score := score()
IniRead, FarmState , %A_ScriptDir%\pos.ini, Backup, FarmState:
GuiControl,2:, Counter, Total Kill(s) = %kill%
GuiControl,2:, Counter2, Current Wave Kill(s) = %cKill%
GuiControl,2:, CounterCard, Total Card(s) = %Card%
GuiControl,2:, FarmState, FarmState = %FarmState%
GuiControl,2:, CounterScore, Score = %score%


return



autogetcard:
 if(ok:=FindText(Getcard[1],Getcard[2], Getcard[3], Getcard[4], 0, 0, Getcard[5]))
 {
 Card++
   CoordMode, Mouse
   X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
   sleep 1000
  }

  if(ok:=FindText(599, 39, 989, 335, 0, 0, Getcard[5]))
 {
 Card++
   CoordMode, Mouse
   X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
   sleep 1000
  }

  return

Window:
WinMove, %Title%,,0,0, 533, 331
WinMove, %Title2%,,533,0, 533, 331
WinMove, %Title3%,,1066,0, 533, 331
WinMove, %Title4%,,1066,331, 533, 331
WinMove, %Title5%,,533,331, 533, 331
WinMove, %Title6%,,0,331, 533, 331

return

ESC::
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptDir%\pos.ini, window position, gui_position
IniWrite, 1,%A_ScriptDir%\pos.ini, Backup, Stop:
Reload