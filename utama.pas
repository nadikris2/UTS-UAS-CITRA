unit Utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  ComCtrls, StdCtrls, ExtDlgs;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    MenuBinerisasi: TMenuItem;
    MenuBinerBlack: TMenuItem;
    MenuInvers: TMenuItem;
    MenuItem2: TMenuItem;
    MenuKecerahan: TMenuItem;
    MenuItem3: TMenuItem;
    MenuBinerRed: TMenuItem;
    MenuBinerGreen: TMenuItem;
    MenuBinerBlue: TMenuItem;
    MenuKontras: TMenuItem;
    MenuExit: TMenuItem;
    MenuMonoGreen: TMenuItem;
    MenuMonoBlue: TMenuItem;
    About: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    MenuMonoRed: TMenuItem;
    MenuMonochrome: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    Smoothing: TMenuItem;
    MenuSketsa: TMenuItem;
    Sharpening: TMenuItem;
    MenuSave: TMenuItem;
    MenuLoad: TMenuItem;
    Pengaturan: TMenuItem;
    ScrollBox1: TScrollBox;
    TrackBar1: TTrackBar;
    MenuWarna: TMenuItem;
    MenuGray: TMenuItem;
    Mode: TMenuItem;
    TrackBar2: TTrackBar;
    procedure AboutClick(Sender: TObject);
    procedure MenuInversClick(Sender: TObject);
    procedure MenuMonoBlueClick(Sender: TObject);
    procedure MenuMonoGreenClick(Sender: TObject);
    procedure MenuKontrasClick(Sender: TObject);
    procedure MenuKecerahanClick(Sender: TObject);
    procedure MenuBinerBlackClick(Sender: TObject);
    procedure MenuBinerBlueClick(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuGrayClick(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuLoadClick(Sender: TObject);
    procedure MenuBinerRedClick(Sender: TObject);
    procedure MenuBinerGreenClick(Sender: TObject);
    procedure MenuSaveClick(Sender: TObject);
    procedure MenuMonoRedClick(Sender: TObject);
    procedure MenuSketsaClick(Sender: TObject);
    procedure SharpeningClick(Sender: TObject);
    procedure SmoothingClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure MenuWarnaClick(Sender: TObject);
    procedure binerblack1();
    procedure binerred1();
    procedure binergreen1();
    procedure binerblue1();
    Procedure kecerahan();
    procedure kontras();
    procedure fsmoothing();
    procedure fsharpening();
    procedure sketching();
    procedure updateHasil();
    procedure TrackBar2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
uses
  windows;
var
  bitmapR, bitmapG, bitmapB,bitmapGray: array [0..10000, 0..10000] of byte;
  bitmapHasilR, bitmapHasilG, bitmapHasilB: array [0..10000, 0..10000] of byte;
  bitmapBiner : array [0..10000, 0..10000] of Boolean;
  gray,modewarna : Byte;
  modeproses : String[5];
procedure TForm1.FormShow(Sender: TObject);
begin
   WindowState := wsFullScreen;
end;
procedure TForm1.MenuBinerBlackClick(Sender: TObject);
begin
 TrackBar1.Visible:=True;
 TrackBar1.Position:=127;
 TrackBar1.Min:=0;
 TrackBar1.Max:=255;
 Edit1.Visible:=True;
 Button.Visible:=True;
 Button.Caption:='Biner';
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=True;
 Label2.Visible:=false;
 Label1.Caption:='Threshold';
 modeproses:='BL';
 Label5.Caption:='Biner';
 Label5.Visible:=true;
end;

procedure TForm1.MenuKecerahanClick(Sender: TObject);
begin
 TrackBar1.Visible:=True;
 TrackBar1.Position:=80;
 TrackBar1.Min:=-255;
 TrackBar1.Max:=255;
 Edit1.Visible:=True;
 Button.Visible:=True;
 Button.Caption:='Kecerahan';
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=True;
 Label2.Visible:=false;
 Label1.Caption:='Brightness';
 modeproses:='KC';
 Label5.Caption:='Pengaturan Kecerahan';
 Label5.Visible:=true;
end;
Procedure Tform1.kecerahan();
var
 x, y : integer;
 BrightR,BrightG,BrightB,BrightGray : Integer;
begin
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
    begin
     if modewarna=0 then
      Begin
       BrightR :=bitmapR[x][y]+trackbar1.Position;
        if BrightR > 255 then BrightR := 255;
        if BrightR < 0 then BrightR := 0;
       BrightG :=bitmapG[x][y]+trackbar1.Position;
        if BrightG > 255 then BrightG := 255;
        if BrightG < 0 then BrightG := 0;
       BrightB :=bitmapB[x][y]+trackbar1.Position;
        if BrightB > 255 then BrightB := 255;
        if BrightB < 0 then BrightB := 0;
       image2.Canvas.Pixels[x,y]:=RGB(BrightR,BrightG,BrightB);
      End
     else
      Begin
       BrightGray :=bitmapGray[x][y]+trackbar1.Position;
        if BrightGray > 255 then  BrightGray := 255;
        if BrightGray < 0 then BrightGray := 0;
       image2.Canvas.Pixels[x,y]:=RGB(BrightGray,BrightGray,BrightGray);
      End
    end;
   end;

end;

procedure TForm1.MenuKontrasClick(Sender: TObject);
begin
 TrackBar1.Visible:=True;
 TrackBar1.Position:=128;
 TrackBar1.Min:=0;
 TrackBar1.Max:=255;
 Edit1.Visible:=True;
 TrackBar2.Min:=0;
 TrackBar2.Max:=10;
 TrackBar2.Position:=2;
 TrackBar2.Visible:=True;
 Edit2.Visible:=True;
 Label1.Visible:=True;
 Label2.Visible:=True;
 Label1.Caption:='P';
 Label2.Caption:='G';
 Button.Visible:=True;
 Button.Caption:='Kontras';
 modeproses:='KS';
 Label5.Caption:='Pengaturan Kontras';
 Label5.Visible:=true;
end;
procedure TForm1.kontras();
var
 x, y : integer;
 ContrastR,ContrastG,ContrastB,ContrastGray : Integer;
begin
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
    begin
     if Modewarna=0 then
      Begin
       ContrastR := TrackBar2.Position*(bitmapR[x][y]-TrackBar1.Position)
       +TrackBar1.Position;
         if ContrastR > 255 then ContrastR := 255;
         if ContrastR < 0 then ContrastR := 0;
       ContrastG :=TrackBar2.Position*(bitmapG[x][y]-TrackBar1.Position)
       +TrackBar1.Position;
         if ContrastG > 255 then ContrastG := 255;
         if ContrastG < 0 then ContrastG := 0;
       ContrastB :=TrackBar2.Position*(bitmapB[x][y]-TrackBar1.Position)
       +TrackBar1.Position;
         if ContrastB > 255 then ContrastB := 255;
         if ContrastB < 0 then ContrastB := 0;
       image2.Canvas.Pixels[x,y]:=RGB(ContrastR,ContrastG,ContrastB);
      End
     else
      Begin
       ContrastGray :=TrackBar2.Position*(bitmapGray[x][y]-TrackBar1.Position)
       +TrackBar1.Position;
         if ContrastGray > 255 then ContrastGray := 255;
         if ContrastGray < 0 then ContrastGray := 0;
       image2.Canvas.Pixels[x,y]:=RGB(ContrastGray,ContrastGray,ContrastGray);
      End;
    end;
   end;

end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  Edit2.Text:=InttoStr(TrackBar2.Position);
end;


procedure TForm1.MenuMonoGreenClick(Sender: TObject);
var
 x, y : integer;
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=False;
 Label2.Visible:=false;
 Label5.Caption:='Monochrome Green';
 Label5.Visible:=true;
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
    begin
     gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
     image2.Canvas.Pixels[x,y] := RGB(0, gray, 0);
    end;
   end;
end;

procedure TForm1.MenuMonoBlueClick(Sender: TObject);
var
 x, y : integer;
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=False;
 Label2.Visible:=false;
 Label5.Caption:='Monochrome Blue';
 Label5.Visible:=true;
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
    begin
     gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
     image2.Canvas.Pixels[x,y] := RGB(0, 0, gray);
    end;
   end;
end;

procedure TForm1.MenuInversClick(Sender: TObject);
var
 x, y : integer;
 InversR,InversG,InversB,InversGray : Byte  ;
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=False;
 Label2.Visible:=false;
 Label5.Caption:='Invers';
 Label5.Visible:=true;
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
    begin
     if Modewarna=0 then
      Begin
       inversR :=255-bitmapR[x][y];
       inversG :=255-bitmapG[x][y];
       inversB :=255-bitmapB[x][y];
       image2.Canvas.Pixels[x,y]:=RGB(inversR,inversG,inversB);
      End
     else
      Begin
       inversGray :=255-bitmapGray[x][y];
       image2.Canvas.Pixels[x,y]:=RGB(inversGray,inversGray,inversGray);
      End
    end;
   end;

end;

procedure TForm1.AboutClick(Sender: TObject);

begin
 ShowMessage('Nama Kelompok :  Julian Saputra (32180087)                      '+
 '                                               Ellen pratama (32180065)                       '+
 '                                               Ferdy Nicolas (32180018)                       '+
 '                                                Jet J krisnadi (32180014)                        '+
 '                                                 Michael Freddy (32180033)');

end;

procedure TForm1.MenuBinerBlueClick(Sender: TObject);
begin
 TrackBar1.Visible:=True;
 TrackBar1.Position:=127;
 TrackBar1.Min:=0;
 TrackBar1.Max:=255;
 Edit1.Visible:=True;
 Button.Visible:=True;
 Button.Caption:='Biner Blue';
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=True;
 Label2.Visible:=false;
 Label1.Caption:='Threshold';
 Label5.Caption:='Biner Blue';
 Label5.Visible:=true;
 modeproses:='B';
end;

procedure Tform1.binerblack1();
var
 x, y : integer;
begin
 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
    if gray > TrackBar1.Position then
      bitmapBiner[x,y] := True
    else
      bitmapBiner[x,y] := False;
   end;
  end;

 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    if bitmapBiner[x,y] = True then
       image2.canvas.Pixels[x,y] := RGB(255,255,255)
    else
       image2.canvas.Pixels[x,y] := RGB(0,0,0);
   end;
  end;

end;

procedure Tform1.binerred1();
var
 x, y : integer;
begin
 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
    if gray > TrackBar1.Position then
      bitmapBiner[x,y] := True
    else
      bitmapBiner[x,y] := False;
   end;
  end;

 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    if bitmapBiner[x,y] = True then
       image2.canvas.Pixels[x,y] := RGB(255,255,255)
    else
       image2.canvas.Pixels[x,y] := RGB(255,0,0);
   end;
  end;

end;

procedure Tform1.binergreen1();
var
 x, y : integer;
begin
 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
    if gray > TrackBar1.Position then
      bitmapBiner[x,y] := True
    else
      bitmapBiner[x,y] := False;
   end;
  end;

 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    if bitmapBiner[x,y] = True then
       image2.canvas.Pixels[x,y] := RGB(255,255,255)
    else
       image2.canvas.Pixels[x,y] := RGB(0,255,0);
   end;
  end;

end;

procedure Tform1.binerblue1();
var
 x, y : integer;
begin
 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
    if gray > TrackBar1.Position then
      bitmapBiner[x,y] := True
    else
      bitmapBiner[x,y] := False;
   end;
  end;

 for y:=0 to image1.Height-1 do
  Begin
  for x:=0 to image1.Width-1 do
   begin
    if bitmapBiner[x,y] = True then
       image2.canvas.Pixels[x,y] := RGB(255,255,255)
    else
       image2.canvas.Pixels[x,y] := RGB(0,0,255);
   end;
  end;

end;

procedure TForm1.ButtonClick(Sender: TObject);
begin
 if modeproses='BL' then
   binerblack1();
 if modeproses='R' then
   binerred1();
 if modeproses='G' then
   binergreen1();
 if modeproses='B' then
   binerblue1();
 if modeproses='KC' then
   kecerahan();
 if modeproses='KS' then
   kontras();
end;


procedure TForm1.MenuGrayClick(Sender: TObject);
var
 x, y : integer;
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=False;
 Label2.Visible:=false;
 Label5.Caption:='Gray';
 Label5.Visible:=true;
 modewarna:=1;
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
    begin
     gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
     image2.Canvas.Pixels[x,y] := RGB(gray, gray, gray);
     bitmapGray[x][y]:=gray;
    end;
   end;
end;

procedure TForm1.MenuExitClick(Sender: TObject);
begin
   close;
end;

procedure TForm1.MenuLoadClick(Sender: TObject);
var
  x,y : integer;
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=False;
 Label2.Visible:=false;
 Label5.Visible:=false;
  if OpenPictureDialog1.Execute then
   Begin
     Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
       for y:=0 to image1.Height-1 do
         begin
           for x:=0 to image1.Width-1 do
             begin
                bitmapR[x,y] := GetRValue(image1.Canvas.Pixels[x,y]);
                bitmapG[x,y] := GetGValue(image1.Canvas.Pixels[x,y]);
                bitmapB[x,y] := GetBValue(image1.Canvas.Pixels[x,y]);
             end;
         end;
   end;
  modewarna:=0;
end;

procedure TForm1.MenuBinerRedClick(Sender: TObject);
begin
 TrackBar1.Visible:=True;
 TrackBar1.Position:=127;
 TrackBar1.Min:=0;
 TrackBar1.Max:=255;
 Edit1.Visible:=True;
 Button.Visible:=True;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=True;
 Label2.Visible:=false;
 Label1.Caption:='Threshold';
 Button.Caption:='Biner Red';
 Label5.Caption:='Biner Red';
 Label5.Visible:=true;
 modeproses:='R';
end;

procedure TForm1.MenuBinerGreenClick(Sender: TObject);
begin
  TrackBar1.Visible:=True;
  TrackBar1.Position:=127;
  TrackBar1.Min:=0;
  TrackBar1.Max:=255;
  Edit1.Visible:=True;
  Button.Visible:=True;
  Button.Caption:='Biner Green';
  TrackBar2.Visible:=false;
  Edit2.Visible:=false;
  Label1.Visible:=True;
  Label2.Visible:=false;
  Label1.Caption:='Threshold';
  Label5.Caption:='Biner Green';
  Label5.Visible:=true;
  modeproses:='G';
end;

procedure TForm1.MenuSaveClick(Sender: TObject);
begin
   if SavePictureDialog1.Execute then
   begin
    image2.Picture.SaveToFile(SavePictureDialog1.FileName);
   end;
end;

procedure TForm1.MenuMonoRedClick(Sender: TObject);
var
 x, y : integer;
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=False;
 Label2.Visible:=false;
 Label5.Caption:='Monochrome Red';
 Label5.Visible:=true;
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
    begin
     gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
     image2.Canvas.Pixels[x,y] := RGB(gray, 0, 0);
    end;
   end;
end;

procedure TForm1.MenuSketsaClick(Sender: TObject);
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=false;
 Label2.Visible:=false;
 Label5.Caption:='Sketsa Foto';
 Label5.Visible:=true;
  sketching();
  updateHasil();
end;

procedure TForm1.SharpeningClick(Sender: TObject);
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=false;
 Label2.Visible:=false;
 Label5.Caption:='Sharpening';
 Label5.Visible:=true;
  fsharpening();
  updateHasil();
end;

procedure TForm1.SmoothingClick(Sender: TObject);
begin
 TrackBar1.Visible:=False;
 Edit1.Visible:=False;
 Button.Visible:=False;
 TrackBar2.Visible:=false;
 Edit2.Visible:=false;
 Label1.Visible:=false;
 Label2.Visible:=false;
 Label5.Caption:='Smoothing';
 Label5.Visible:=true;
  fsmoothing();
  updateHasil();
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Edit1.Text:=InttoStr(TrackBar1.Position);
end;

procedure TForm1.MenuWarnaClick(Sender: TObject);
var
 x, y : integer;
begin
  TrackBar1.Visible:=False;
  Edit1.Visible:=False;
  Button.Visible:=False;
  TrackBar2.Visible:=False;
  Edit2.Visible:=False;
  Label1.Visible:=False;
  Label2.Visible:=False;
  Label5.Caption:='Warna';
  Label5.Visible:=true;
  modewarna:=0;
 for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
   begin
    image2.Canvas.Pixels[x,y] := RGB(bitmapR[x,y], bitmapG[x,y], bitmapB[x,y]);
   end;
  end;
end;

procedure TForm1.fsmoothing();
var
  x, y, i, k, lokalX, lokalY: integer;
  totalR, totalG, totalB: real;
  filter:array[1..3,1..3] of real = (
    (1/9.0,1/9.0,1/9.0),
    (1/9.0,1/9.0,1/9.0),
    (1/9.0,1/9.0,1/9.0)
  );
begin
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      totalR := 0;
      totalG := 0;
      totalB := 0;

      for i:=1 to 3 do
      begin
        for k:=1 to 3 do
        begin
          lokalX := x + k - 2;
          lokalY := y + i - 2;

          if lokalX < 0 then
          begin
            lokalX := 0;
          end;
          if lokalX > image1.Width-1 then
          begin
            lokalX := image1.Width-1;
          end;

          if lokalY < 0 then
          begin
            lokalY := 0;
          end;
          if lokalY > image1.Height-1 then
          begin
            lokalY := image1.Height-1;
          end;

          totalR := totalR + bitmapR[lokalX, lokalY] * filter[k,i];
          totalG := totalG + bitmapG[lokalX, lokalY] * filter[k,i];
          totalB := totalB + bitmapB[lokalX, lokalY] * filter[k,i];
        end;
      end;

      if totalR < 0 then
      begin
        totalR := 0;
      end;
      if totalR > 255 then
      begin
        totalR := 255;
      end;

      if totalG < 0 then
      begin
        totalG := 0;
      end;
      if totalG > 255 then
      begin
        totalG := 255;
      end;

      if totalB < 0 then
      begin
        totalB := 0;
      end;
      if totalB > 255 then
      begin
        totalB := 255;
      end;

      bitmapHasilR[x,y] := Round(totalR);
      bitmapHasilG[x,y] := Round(totalG);
      bitmapHasilB[x,y] := Round(totalB);
    end;
  end;
end;

procedure TForm1.fsharpening();
var
  x, y, i, k, lokalX, lokalY: integer;
  totalR, totalG, totalB: integer;
  filter:array[1..3,1..3] of integer = (
    (-1,-1,-1),
    (-1, 9,-1),
    (-1,-1,-1)
  );
begin
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      totalR := 0;
      totalG := 0;
      totalB := 0;

      for i:=1 to 3 do
      begin
        for k:=1 to 3 do
        begin
          lokalX := x + k - 2;
          lokalY := y + i - 2;

          if lokalX < 0 then
          begin
            lokalX := 0;
          end;
          if lokalX > image1.Width-1 then
          begin
            lokalX := image1.Width-1;
          end;

          if lokalY < 0 then
          begin
            lokalY := 0;
          end;
          if lokalY > image1.Height-1 then
          begin
            lokalY := image1.Height-1;
          end;

          totalR := totalR + bitmapR[lokalX, lokalY] * filter[k,i];
          totalG := totalG + bitmapG[lokalX, lokalY] * filter[k,i];
          totalB := totalB + bitmapB[lokalX, lokalY] * filter[k,i];
        end;
      end;

      if totalR < 0 then
      begin
        totalR := 0;
      end;
      if totalR > 255 then
      begin
        totalR := 255;
      end;

      if totalG < 0 then
      begin
        totalG := 0;
      end;
      if totalG > 255 then
      begin
        totalG := 255;
      end;

      if totalB < 0 then
      begin
        totalB := 0;
      end;
      if totalB > 255 then
      begin
        totalB := 255;
      end;

      bitmapHasilR[x,y] := totalR;
      bitmapHasilG[x,y] := totalG;
      bitmapHasilB[x,y] := totalB;
    end;
  end;
end;

procedure TForm1.sketching();
var
  x, y, i, k, lokalX, lokalY: integer;
  grey: real;
  totalR, totalG, totalB: integer;
  filter:array[1..3,1..3] of integer = (
    (-1,-1,-1),
    (-1, 8,-1),
    (-1,-1,-1)
  );
begin
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      grey := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y])/3.0;

      bitmapR[x,y] := round(grey);
      bitmapG[x,y] := round(grey);
      bitmapB[x,y] := round(grey);
    end;
  end;

  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      totalR := 0;
      totalG := 0;
      totalB := 0;

      for i:=1 to 3 do
      begin
        for k:=1 to 3 do
        begin
          lokalX := x + k - 2;
          lokalY := y + i - 2;

          if lokalX < 0 then
          begin
            lokalX := 0;
          end;
          if lokalX > image1.Width-1 then
          begin
            lokalX := image1.Width-1;
          end;

          if lokalY < 0 then
          begin
            lokalY := 0;
          end;
          if lokalY > image1.Height-1 then
          begin
            lokalY := image1.Height-1;
          end;

          totalR := totalR + bitmapR[lokalX, lokalY] * filter[k,i];
          totalG := totalG + bitmapG[lokalX, lokalY] * filter[k,i];
          totalB := totalB + bitmapB[lokalX, lokalY] * filter[k,i];
        end;
      end;

      if totalR < 0 then
      begin
        totalR := 0;
      end;
      if totalR > 255 then
      begin
        totalR := 255;
      end;

      if totalG < 0 then
      begin
        totalG := 0;
      end;
      if totalG > 255 then
      begin
        totalG := 255;
      end;

      if totalB < 0 then
      begin
        totalB := 0;
      end;
      if totalB > 255 then
      begin
        totalB := 255;
      end;

      bitmapHasilR[x,y] := totalR;
      bitmapHasilG[x,y] := totalG;
      bitmapHasilB[x,y] := totalB;
    end;
  end;

  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      bitmapHasilR[x,y] := 255-bitmapHasilR[x,y];
      bitmapHasilG[x,y] := 255-bitmapHasilG[x,y];
      bitmapHasilB[x,y] := 255-bitmapHasilB[x,y];
    end;
  end;
end;

procedure TForm1.updateHasil();
var
  x, y: integer;
begin
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      Image2.Canvas.Pixels[x,y] := RGB(bitmapHasilR[x,y], bitmapHasilG[x,y], bitmapHasilB[x,y]);
      bitmapR[x,y] := GetRValue(image1.Canvas.Pixels[x,y]);
      bitmapG[x,y] := GetGValue(image1.Canvas.Pixels[x,y]);
      bitmapB[x,y] := GetBValue(image1.Canvas.Pixels[x,y]);
    end;
  end;
end;

end.

