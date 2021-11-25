program VersionComparer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  math,
  uVersionCompare in 'src\uVersionCompare.pas';


begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
writeln(CompareToString(VersionCompare('2         ','1         '))); //>
writeln(CompareToString(VersionCompare('1.0.0     ','1         '))); //=
writeln(CompareToString(VersionCompare('1.0       ','1.0.0     '))); //=
writeln(CompareToString(VersionCompare('1.2.42    ','1.2.41    '))); //>
writeln(CompareToString(VersionCompare('1.1.56789 ','1.2.0     '))); //<
writeln(CompareToString(VersionCompare('1.10      ','1.2       '))); //>
writeln(CompareToString(VersionCompare('1.20      ','1.150     '))); //<
writeln(CompareToString(VersionCompare('18.04     ','18.4      '))); //=
writeln(CompareToString(VersionCompare('7.010     ','7.8       '))); //>
writeln(CompareToString(VersionCompare('1.0.0.1.0 ','1.00.00.2 '))); //<
writeln(CompareToString(VersionCompare('00.00.01  ','0.0.0.1   '))); //>
writeln(CompareToString(VersionCompare('0.0.1     ','0.1       '))); //<
writeln(CompareToString(VersionCompare('42.0      ','4.2.0     '))); //>
writeln(CompareToString(VersionCompare('999.999   ','999.999.1 '))); //<
writeln(CompareToString(VersionCompare('2018.08.1 ','2018.08   '))); //>
writeln(CompareToString(VersionCompare('2018.08.1C ','2018.08.1   '))); //>
writeln(CompareToString(VersionCompare('2018.08.1C ','2018.08.1A   '))); //>
Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
