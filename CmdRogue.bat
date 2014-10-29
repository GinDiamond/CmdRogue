::CmdRogue
::version 0.0.1.3b alpha
::Created by Patrick Jackson, a.k.a. TheWinnieston/GinDiamond
::started on 4/29/2012 at 9:08 AM
::Feel free to use any part of this game, as long as my credits are given.
cls
@echo off
set homedir=%cd%
set version=0.0.1.3b
:debugQuery
echo Debug mode?
choice /c yn /n /m ">> "
if %errorlevel% == 1 (
	set d_mode=y
	mode con cols=51 lines=1000000
	@echo on
)
if %errorlevel% == 2 (
	set d_mode=n
	mode con cols=51 lines=27
)

title CmdRogue v %version%
set monsters=
if exist messagelog.txt del messagelog.txt

set selected=1
set 1clr=07
set 2clr=07
set 3clr=07
color 0c

::sweet title screen!
:titlescreen
graphic.exe hidecursor
Graphic.exe locate 0 0
if %selected% == 1 (
	set ONEclr=0e
	set TWOclr=07
	set THREEclr=07
)
if %selected% == 2 (
	set ONEclr=07
	set TWOclr=0e
	set THREEclr=07
)
if %selected% == 3 (
	set ONEclr=07
	set TWOclr=07
	set THREEclr=0e
)
call :TitleDisplay
ctext.exe "{04}          Console Roguelike {0c}v.0.0.1.3{09}b"
echo.
ctext.exe "{04}           by {0c}Patrick Jackson"
echo.
ctext.exe "{04}           ASCII by {0c}Patrick Jackson"
echo.
echo.
echo  Add. coding  : ChristianXD, kolto101, Charlie Nash
echo                 Ethan Brooks
echo  Music tracks : Sonic Clang, Simon Volpert
echo.
echo.
ctext.exe "{04}             ----- {%ONEclr%}Start Game {04}------"
echo.
echo.
ctext.exe "{04}                ----- {%TWOclr%}Help {04}------"
echo.
echo.
ctext.exe "{04}                ----- {%THREEclr%}Exit {04}------"
echo.
Kbd.exe
set key=%errorlevel%
if %key% == 72 (
	if %selected% equ 1 set selected=3 && goto titlescreen
	if %selected% equ 2 set selected=1 && goto titlescreen
	if %selected% equ 3 set selected=2 && goto titlescreen
)
if %key% == 80 (
	if %selected% equ 1 set selected=2 && goto titlescreen
	if %selected% equ 2 set selected=3 && goto titlescreen
	if %selected% equ 3 set selected=1 && goto titlescreen
)
if %key% == 13 (
	if %selected% equ 1 cls && goto setdifficulty
	if %selected% equ 2 goto help
	if %selected% equ 3 exit
)
if %key% == 27 (
	if %selected% equ 3 (
		exit
	) else (
		set selected=3 && goto titlescreen
	)
)
goto titlescreen

:setdifficulty
graphic.exe hidecursor
Graphic.exe locate 0 0
if %selected% == 1 (
	set ONEclr=0e
	set TWOclr=07
	set THREEclr=07
	set FOURclr=07
)
if %selected% == 2 (
	set ONEclr=07
	set TWOclr=0e
	set THREEclr=07
	set FOURclr=07
)
if %selected% == 3 (
	set ONEclr=07
	set TWOclr=07
	set THREEclr=0e
	set FOURclr=07
)
if %selected% == 4 (
	set ONEclr=07
	set TWOclr=07
	set THREEclr=07
	set FOURclr=0e
)
call :TitleDisplay
ctext.exe "{04}               Choose difficulty:"
echo.
echo.
ctext.exe "{04}                ----- {%ONEclr%}Easy {04}------"
echo.
echo.
ctext.exe "{04}               ----- {%TWOclr%}Medium {04}------"
echo.
echo.
ctext.exe "{04}                ----- {%THREEclr%}Hard {04}------"
echo.
echo.
ctext.exe "{04}                ----- {%FOURclr%}Back {04}------"
echo.
Kbd.exe
set key=%errorlevel%
if %key% == 72 (
	if %selected% equ 1 set selected=4 && goto setdifficulty
	if %selected% equ 2 set selected=1 && goto setdifficulty
	if %selected% equ 3 set selected=2 && goto setdifficulty
	if %selected% equ 4 set selected=3 && goto setdifficulty
)
if %key% == 80 (
	if %selected% equ 1 set selected=2 && goto setdifficulty
	if %selected% equ 2 set selected=3 && goto setdifficulty
	if %selected% equ 3 set selected=4 && goto setdifficulty
	if %selected% equ 4 set selected=1 && goto setdifficulty
)
if %key% == 13 (
	if %selected% equ 1 set difficulty=1
	if %selected% equ 2 set difficulty=2
	if %selected% equ 3 set difficulty=3
	if %selected% equ 4 set selected=1 && cls && goto titlescreen
)
if %key% == 27 (
	if %selected% equ 4 (
		exit
	) else (
		set selected=1
		cls
		goto titlescreen
	)
)

set /a monsters=%random%%%3+%difficulty%

:startgame
cls
color 07
echo.
echo Loading game...
echo.
setlocal enabledelayedexpansion
set message=Welcome to CmdRogue^!
echo Loading firstlvl_monster.bat...
call core\enemies\firstlvl_monster.bat
echo Load complete!
echo.
echo Loading castle.bat...
call floors\castle.bat
echo Load complete!
echo.
echo Loading weapons.bat...
call core\weapons.bat
echo Load complete!

::player's settings (default)
set player.armor=0^/0
set player.xp.level=1

set weapon=fists
set weapon.dmg=!%weapon%.dmg!
for /f "tokens=1-3 delims=d" %%a in ("!weapon.dmg!") do (
	set dice=%%a
	set sides=%%b
	set number=%%c
)

set message1=Welcome to CmdRogue^!
set message2=

set turns=1
set player.hp=50
set player.armor=0
set gametime=1.00
set xp.pccent=0

for /l %%n in (0,1,13) do (
	set v.line[%%n]=!line[%%n]!
)
set die_floorcount=0
goto generate_charpos

:roll
echo Generating map...
set /a die_floorcount+=1
%homedir%\core\generator\cave_generator.bat 39 13 60 floors\map%die_floorcount%
call floors\map%die_floorcount%.bat
for /l %%n in (0,1,13) do (
	set v.line[%%n]=!line[%%n]!
)

:generate_charpos
set /a pos.x=!random!%%36+1
set /a pos.y=!random!%%12+1
set /a chars=!pos.x!+1
set line=!line[%pos.y%]!
set chkline=!line:~0,%chars%!
set c.line=!chkline:~-1!
if !c.line! == # (
	goto generate_charpos
)


::generates each monster's position
set loops=0
:generate_monsterpos
set /a loops+=1
set /a monspos!loops!.x=!random!%%36+1
set /a monspos!loops!.y=!random!%%12+1
if !loops! lss !monsters! goto generate_monsterpos
)

for /l %%i in (1,1,!monsters!) do (
	set /a chars=!monspos%%i.x!+1
	set monspos=!monspos%%i.y!
	set line=!line[%monspos%]!
	set chkline=!line:~0,%chars%!
	set c.line=!chkline:~-1!
	if !c.line! == # (
		goto generate_monsterpos
	)
	if !monspos%%i.x! == !pos.x! (
		if !monspos%%i.y! == !pos.y! (
			goto generate_monsterpos
		)
	)
)


:game
call :display
call :Move
call :Monsters
goto game

:display
graphic.exe hidecursor
graphic.exe locate 0 0

set /a xAdd1=pos.x+1
for /l %%i in (1,1,!monsters!) do (
	set /a n%%iAdd1=monspos%%i.x+1
)

set loopP=0
:loopPrint
set /a loopP+=1
set monster=!loopP!
set monspos=!monspos%loopP%.x!
set monsxAdd1=!n%loopP%Add1!
set monsposy=!monspos%loopP%.y!
set monsstate=!monsstate%loopP%!

	for /l %%b in (0,1,13) do (
		set line=!v.line[%%b]!
		if %%b equ !monsposy! (
			set part1=!line:~0,%monspos%!
			set part2=!line:~%monsxAdd1%!
			set line=!part1!!monsstate!!part2!
			set v.line[%%b]=!line!
		)
	)
if not "!loopP!" == "!monsters!" goto loopPrint

echo.
for /l %%n in (0,1,13) do (
	set line=!v.line[%%n]!
	if %%n==%pos.y% (
		set line=!line:~0,%pos.x%!@!line:~%xAdd1%!
	)
	set checkline%%n=!line!
	echo.    !line!
	set v.line[%%n]=!line[%%n]!
)

echo.
echo.
ctext.exe "{09} Player{08} Health: {04}!player.hp!/50    {08} Armor : {0f}[!player.armor!]"
echo.
ctext.exe "{08} Exp: {0f}!xp.pccent!%%/!xp.lvl!  {08}Weapon: {0f}!weapon! (!dice!d!sides!)x!number!"
if /i %d_mode% == y (
	for /l %%i in (1,1,!monsters!) do (
		echo Monster %%i HP: !mons%%i.hp!    
		echo Monster %%i X.Y: !monspos%%i.x!.!monspos%%i.y!    
	)
)
echo.
echo.
ctext.exe {0f}- {0e}Messages{0f}  ---------------------
echo.
ctext {0f}
echo  !message1!
echo !message1!>>messagelog.txt
ctext {07}
echo. !message2!
echo.
goto :eof

:Move
Kbd.exe
set prev.x=!pos.x!
set prev.y=!pos.y!
set key=%errorlevel%
set errorlevel=

::I've found that IF statements are faster than gotos

::up arrow
if %key% == 72 (
	set /a pos.y-=1
	goto check4posts
)
::left arrow
if %key% == 75 (
	set /a pos.x-=1
	goto check4posts
)
::down arrow
if %key% == 80 (
	set /a pos.y+=1
	goto check4posts
)
::right arrow
if %key% == 77 (
	set /a pos.x+=1
	goto check4posts
)
::Home
if %key% == 71 (
	set /a pos.x-=1
	set /a pos.y-=1
	goto check4posts
)
::PgUp
if %key% == 73 (
	set /a pos.x+=1
	set /a pos.y-=1
	goto check4posts
)
::End
if %key% == 79 (
	set /a pos.x-=1
	set /a pos.y+=1
	goto check4posts
)
::PgDn
if %key% == 81 (
	set /a pos.x+=1
	set /a pos.y+=1
	goto check4posts
)
::(Period) Wait key
if %key% == 46 (
	goto display
)
::messages: m
if %key% == 109 (
	cls
	type messagelog.txt | more
	echo.
	echo Press any key to return to game...
	pause>nul
	cls
	goto game
)
::(Quit) q
if %key% == 113 (
	goto Quit
)
if %key% == 62 (
	if !pos.x!d!pos.y! == %stair% (
		set pos.x=
		set pos.y=
		set message2=!message!
		set message=You descend a floor^!
		cls
		goto roll
	) else (
		set message2=!message!
		set message=But there aren't any stairs here^!
	)
	exit /b
)


:check4posts
set /a chars=!pos.x!+1
set chkline=!checkline%pos.y%:~0,%chars%!
set c.line=!chkline:~-1!
if !c.line! == # (
	set pos.x=!prev.x!
	set pos.y=!prev.y!
	goto Move
)

set monscombloops=0
:monscomb
set /a monscombloops+=1
if !monslive%monscombloops%! == true (
	if !pos.x! == !monspos%monscombloops%.x! (
		if !pos.y! == !monspos%monscombloops%.y! (
			set monster=!monscombloops!
			goto player.combat
		)
	)
)
if !monscombloops! lss !monsters! goto monscomb
goto :eof


:Monsters
set loops=0
:Monsters_1
set /a loops+=1
if !loops! gtr !monsters! (
	exit /b
)
if !monslive%loops%! == false (
	if exist !monslive%loops%! (
		set /a loops+=1
	)
)
set monster=!loops!
call :Monster_Move
goto Monsters_1



::+-------------------+
::|  Monsters and AI  |
::|                   |
::|This area might be |
::|a bit buggy and off|
::|, but what can you |
::|expect from batch? |
::+-------------------+
:Monster_Move
if !monslive%monster%! equ false goto Monsters_1
set monspos.x=!monspos%monster%.x!
set monspos.y=!monspos%monster%.y!
set m.prev.x=!monspos.x!
set m.prev.y=!monspos.y!
::Pythagorean theorem
set /a a=!monspos.x!-!pos.x!
set /a b=!monspos.y!-!pos.y!
set /a a.sq=!a!*!a!
set /a b.sq=!b!*!b!
set /a c.sq=!a.sq!+!b.sq!

set count=0
set num=%c.sq%
for /l %%a in (%c.sq%, -1, 1) do (
	set /a sqr=%%a*%%a
	if !sqr! leq %c.sq% (
		set digit=%%a
		set root=%%a
		goto out
	)
)

:out
call set /a count=%%count%%+1
if %count% GTR 0 goto next

:next
if %c.sq% neq 0 set digit=%digit%
set c=!digit!

if !c! leq 6 (
	if !c! gtr 3 (
		::goto fiffif
		set /a fiffifmove=!random!%%2
		if !fiffifmove! == 0 (
			if !monspos.x! gtr !pos.x! set /a monspos.x-=1
			if !monspos.x! lss !pos.x! set /a monspos.x+=1
			if !monspos.y! gtr !pos.y! set /a monspos.y-=1
			if !monspos.y! lss !pos.y! set /a monspos.y+=1
			goto setmonstcoords
		)
	)
	if !c! leq 3 (
		if !monspos.x! gtr !pos.x! set /a monspos.x-=1
		if !monspos.x! lss !pos.x! set /a monspos.x+=1
		if !monspos.y! gtr !pos.y! set /a monspos.y-=1
		if !monspos.y! lss !pos.y! set /a monspos.y+=1
		if !monspos.x!!monspos.y! equ !pos.x!!pos.y! goto monster.combat
		goto setmonstcoords
	)
)
goto m.randmove

:m.randmove
set /a m.movedie=!random!%%9
if !m.movedie! == 0 (
	set /a monspos.x+=1
	set /a monspos.y+=1
	goto setmonstcoords
)
if !m.movedie! == 1 (
	set /a monspos.x-=1
	set /a monspos.y-=1
	goto setmonstcoords
)
if !m.movedie! == 2 (
	set /a monspos.x+=1
	set /a monspos.y-=1
	goto setmonstcoords
)
if !m.movedie! == 3 (
	set /a monspos.x-=1
	set /a monspos.y+=1
	goto setmonstcoords
)
if !m.movedie! == 4 (
	set /a monspos.x+=1
	goto setmonstcoords
)
if !m.movedie! == 5 (
	set /a monspos.x-=1
	goto setmonstcoords
)
if !m.movedie! == 6 (
	set /a monspos.y+=1
	goto setmonstcoords
)
if !m.movedie! == 7 (
	set /a monspos.y-=1
	goto setmonstcoords
)
if !m.movedie! == 8 (
	goto setmonstcoords
)


:setmonstcoords
set /a chars=!monspos.x!+1
set line=!line[%monspos.y%]!
set chkline=!line:~0,%chars%!
set c.line=!chkline:~-1!
if !c.line! == # (
	set monspos.x=!m.prev.x!
	set monspos.y=!m.prev.y!
)

if !monspos.x! equ !pos.x! (
	if !monspos.y! equ !pos.y! (
		call :monster.combat
	)
)
set monspos!monster!.x=!monspos.x!
set monspos!monster!.y=!monspos.y!
exit /b
::+----------------+
::| PLAYER COMBAT  |
::|                |
::|This might also |
::|might be a bit  |
::|buggy. But its  |
::|still cool!     |
::+----------------+
:player.combat
::start sndrec32.exe /play /close /embedding "SOUND\punch.wav"
set weapon.dmg=!%weapon%.dmg!
set damage=0
for /f "tokens=1-3 delims=d" %%a in ("!weapon.dmg!") do (
	set dice=%%a
	set sides=%%b
	set number=%%c
)

set attacks=0
set loop=0
set rolls=0
:rolls
set /a rolls+=1
:dmg.loop
set /a loop+=1
set /a dmge!loop!=!random!%%!sides!+1
set /a damage+=!dmge%loop%!
if !loop! lss !dice! goto dmg.loop
set MonsterDamage=!mons%monster%!

if !rolls! lss !number! set loop=0 && goto rolls
set /a mons!monster!.dmg=!damage!-!mons%monster%.armor!
set /a mons!monster!.hp=!mons%monster%.hp!-!mons%monster%.dmg!

if !mons%monster%.dmg! leq 0 (
	set message2=You hit the monster but there's no effect^^!
) else (
	set message2=You hit the monster for !mons%monster%.dmg! damage^^!
)
set pos.x=!prev.x!
set pos.y=!prev.y!
if !mons%monster%.hp! leq 0 (
	set message1=!message2!
	set message2=You kill the monster^^!              
	set /a xp.pccent=!xp.pccent!+!mons%monster%.xp!
	set monslive!monster!=false
	set monsstate!monster!=%%
)
goto :eof
::+----------------+
::| MONSTER COMBAT |
::|                |
::|This might also |
::|might be a bit  |
::|buggy. But its  |
::|still cool!     |
::+----------------+
:monster.combat
::start sndrec32.exe /play /close /embedding "SOUND\punch.wav"
set m.damage=0
for /f "tokens=1-3 delims=d" %%a in ("!mons.weapon.dmg!") do (
	set m.dice=%%a
	set m.sides=%%b
	set m.number=%%c
)
set loop=0
set rolls=0
:m.rolls
set /a rolls+=1
:m.dmg.loop
set /a loop+=1
set /a m.dmge!loop!=!random!%%!m.sides!+1
set /a m.damage+=!m.dmge%loop%!
if !loop! lss !m.dice! goto m.dmg.loop

if !rolls! lss !m.number! set loop=0 && goto m.rolls

set /a player.dmg=%m.damage%-%player.armor%
set /a player.hp=%player.hp%-%player.dmg%

if !player.dmg! leq 0 (
	set message=The monster hits you but there's no effect^^!       
) else (
	set message=The monster hits you for !player.dmg! damage^^!       
)
set monspos%monster%.x=!m.prev.x!
set monspos%monster%.y=!m.prev.y!
if !player.hp! leq 0 goto player_death
exit /b

:player_death
set "message1=You die^!...Press Enter              "
call :display
kbd.exe
if %d_mode% == y (
	if %errorlevel% == 13 cls && goto titlescreen
) else (
	if %errorlevel% == 13 (
		cls
		goto titlescreen
	) else goto player_death
)

:TitleDisplay
ctext.exe {0c}
echo.
echo.
echo.    мллл          л   ллллм
echo.    л             л   л   л
echo.    л    млмлм мллл   ллллп мллм мллм      млм
echo.    л    л л л л  л   л  л  л  л л  л л  л л л
echo.    л    л   л пллп   л   л пллп пллл л  л ллп
echo     л    л                          л пллп л
echo.    пллл                         пллп      плл
echo.
echo.
