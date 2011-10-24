program deadcold;

uses crt,dos,rpgmenus,dcplay;

{*** Main Program Variables Block ***}
var
	S: String;
	N: Integer;
	rpm: RPGMenuPtr;

begin
	{ Do startup stuff. Check to see if the SAVEGAME directory }
	{ exists yet. }
	S := FSearch( 'SAVEGAME' , '.' );
	if S = '' then begin
		MkDir( 'SAVEGAME' );
	end;

	RPM := CreateRPGMenu( LightBlue , Green , LightGreen , 20 , 8 , 60 , 23 );
	AddRPGMenuItem( RPM , 'Start New Game' , 1 );
	AddRPGMenuItem( RPM , 'Load Saved Game' , 2 );
	AddRPGMenuItem( RPM , 'Quit DeadCold' , -1 );

	repeat
		{ Set up the screen display. }
		ClrScr;

		{ Get a selection from the menu. }
		N := SelectMenu( RPM , RPMNoCancel );

		case N of
			1: StartGame;
			2: RestoreGame;
		end;
	until N = -1;

	DisposeRPGMenu( RPM );
end.
