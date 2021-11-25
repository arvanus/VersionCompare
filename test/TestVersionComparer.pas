unit TestVersionComparer;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TestVC = class
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('Test1','-1,<')]
    [TestCase('Test1','0,=')]
    [TestCase('Test1','1,>')]
    procedure TestConverter(const compResult:integer;const verbose:String);
    [Test]
    [TestCase('Test1','2         ,1         ,1')]
    [TestCase('Test2','1.0.0     ,1         ,0')]
    [TestCase('Test3','1.0       ,1.0.0     ,0')]
    [TestCase('Test4','1.2.42    ,1.2.41    ,1')]
    [TestCase('Test5','1.1.56789 ,1.2.0     ,-1')]
    [TestCase('Test6','1.10      ,1.2       ,1')]
    [TestCase('Test7','1.20      ,1.150     ,-1')]
    [TestCase('Test8','18.04     ,18.4      ,0')]
    [TestCase('Test9','7.010     ,7.8       ,1')]
    [TestCase('Test0','1.0.0.1.0 ,1.00.00.2 ,-1')]
    [TestCase('TestA','00.00.01  ,0.0.0.1   ,1')]
    [TestCase('TestB','0.0.1     ,0.1       ,-1')]
    [TestCase('TestC','42.0      ,4.2.0     ,1')]
    [TestCase('TestD','999.999   ,999.999.1 ,-1')]
    [TestCase('TestE','2018.08.1 ,2018.08   ,1')]
    procedure TestComparer(const AValue1 : String;const AValue2 : String; _result:Integer);
    [Test]
    [TestCase('Test1.1','2         ,1         ,>')]
    [TestCase('Test2.1','1.0.0     ,1         ,=')]
    [TestCase('Test3.1','1.0       ,1.0.0     ,=')]
    [TestCase('Test4.1','1.2.42    ,1.2.41    ,>')]
    [TestCase('Test5.1','1.1.56789 ,1.2.0     ,<')]
    [TestCase('Test6.1','1.10      ,1.2       ,>')]
    [TestCase('Test7.1','1.20      ,1.150     ,<')]
    [TestCase('Test8.1','18.04     ,18.4      ,=')]
    [TestCase('Test9.1','7.010     ,7.8       ,>')]
    [TestCase('Test0.1','1.0.0.1.0 ,1.00.00.2 ,<')]
    [TestCase('TestA.1','00.00.01  ,0.0.0.1   ,>')]
    [TestCase('TestB.1','0.0.1     ,0.1       ,<')]
    [TestCase('TestC.1','42.0      ,4.2.0     ,>')]
    [TestCase('TestD.1','999.999   ,999.999.1 ,<')]
    [TestCase('TestE.1','2018.08.1 ,2018.08   ,>')]
    [TestCase('TestF','2018.08.1C ,2018.08.1,>')]
    [TestCase('TestG','2018.08.1C ,2018.08.1A,>')]
    [TestCase('TestH','2018.08.C ,2018.08.1 ,>')]
    procedure TestComparerToString(const AValue1, AValue2: String;
  _result: String);
    [TestCase('Test1.2','2.0  ,2   ,>')]
    [TestCase('Test2.2','2.A.0,2.A ,>')]
    [TestCase('Test3.2','2.1.2,2.1 ,>')]
    [TestCase('Test4.2','2.1,2.1.0 ,<')]
    procedure TestComparerToStringNoPadWithZero(const AValue1, AValue2: String;
  _result: String);
  end;

implementation

uses uVersionCompare;

procedure TestVC.Setup;
begin
end;

procedure TestVC.TearDown;
begin
end;

procedure TestVC.TestComparer(const AValue1, AValue2: String; _result: Integer);
begin
  Assert.AreEqual(versionCompare(AValue1, AValue2), _result);
end;

procedure TestVC.TestComparerToString(const AValue1, AValue2: String;
  _result: String);
begin
  Assert.AreEqual(CompareToString(versionCompare(AValue1, AValue2)), _result);
end;

procedure TestVC.TestComparerToStringNoPadWithZero(const AValue1,
  AValue2: String; _result: String);
begin
  Assert.AreEqual(CompareToString(versionCompare(AValue1, AValue2, false)), _result);

end;

procedure TestVC.TestConverter(const compResult:integer;const verbose:String);
begin
  Assert.AreEqual(CompareToString(compResult), verbose);
end;

initialization
  TDUnitX.RegisterTestFixture(TestVC);

end.
