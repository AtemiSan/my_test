unit Unit1;

// Version 2

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TClass2 = class
    val: String;
    constructor Create(val: String);
  end;

  TArr = array of TClass2;

  TClass = class
      arr: TArr;
    public
      constructor Create(arr: TArr);
  end;

var
  Form1: TForm1;
  obj: TClass;

implementation

{$R *.dfm}

constructor TClass2.Create(val: String);
begin
  inherited Create;
  self.val := val;
end;

constructor TClass.Create(arr: TArr);
begin
  inherited Create;
  self.arr := nil;
  self.arr := arr;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  ShowMessage(obj.arr[2].val);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  arr: TArr;
  i: Integer;
begin
  SetLength(arr, 3);
  for i := 0 to 2 do
    begin
      arr[i] := TClass2.Create(IntToStr(i));
    end;
  obj := TClass.Create(arr);
//  for i := 0 to 2 do arr[i].Free;
  arr := nil;
  ShowMessage(obj.arr[1].val);
end;

end.
