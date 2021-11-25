unit uVersionCompare;

interface
uses Math,
  System.SysUtils;

// Method to compare two versions.
// Returns 1 if v2 is smaller, -1
// if v1 is smaller, 0 if equal
function versionCompare(v1, v2:String; PadWithZero:Boolean=true):Integer;
function CompareToString(comp:Integer):String;

implementation

function CompareToString(comp:Integer):String;
begin
  case comp of
  -1:exit('<');
   0:exit('=');
   1:exit('>');
  end;
end;

function versionCompare(v1, v2:String; PadWithZero:Boolean=true): Integer;
var vv1, vv2:TArray<String>;
i, m1,m2, t1, t2:Integer;

begin
  vv1 := v1.trim.Split(['.']);
  vv2 := v2.trim.Split(['.']);
  m1 := Length(vv1)-1;
  m2 := Length(vv2)-1;

  for I := 0 to Max(m1, m2) do
  begin
    if I>m1 then
    begin
      if not PadWithZero then exit(-1);
      setlength(vv1, I+1);
      vv1[i]:='0';
    end;
    if I>m2 then
    begin
      if not PadWithZero then exit(1);
      setlength(vv2, I+1);
      vv2[i]:='0';
    end;

    if TryStrToInt(vv1[i],t1) and TryStrToInt(vv2[i],t2) then
    begin
      if t1<t2 then
        exit(-1);
      if t1>t2 then
        exit(1);
    end
    else
    begin
      if vv1[i]<vv2[i] then
        exit(-1);
      if vv1[i]>vv2[i] then
        exit(1);
    end;
  end;
  exit(0);
end;

end.
