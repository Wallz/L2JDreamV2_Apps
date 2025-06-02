unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, ShellAPI, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    ItemQnt: TEdit;
    Label3: TLabel;
    Image1: TImage;
    StatusBar1: TStatusBar;
    NewItem: TBitBtn;
    FinishMultisell: TBitBtn;
    SaveMultisell: TBitBtn;
    Clear: TBitBtn;
    TakeItem: TBitBtn;
    GiveItem: TBitBtn;
    Label2: TLabel;
    ID1: TEdit;
    EnchantLvl: TEdit;
    SetEnchant: TCheckBox;
    SaveDialog1: TSaveDialog;
    Multisell: TMemo;
    procedure ComboBox1Change(Sender: TObject);
    procedure NewItemClick(Sender: TObject);
    procedure FinishMultisellClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetEnchantClick(Sender: TObject);
    procedure TakeItemClick(Sender: TObject);
    procedure GiveItemClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure SaveMultisellClick(Sender: TObject);
  private
    { Private declarations }
    icount : integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if Combobox1.ItemIndex = 0 then
ID1.Text := '57'
else if Combobox1.ItemIndex = 1 then
ID1.Text := '3470'
else if Combobox1.ItemIndex = 2 then
ID1.Text := '6392'
else if Combobox1.ItemIndex = 3 then
ID1.Text := '6393'
else if Combobox1.ItemIndex = 4 then
ID1.Text := '6673'
else if Combobox1.ItemIndex = 5 then
ID1.Text := '9143'
end;

procedure TForm1.ClearClick(Sender: TObject);
begin
MultiSell.Lines.Clear;
icount := 0;
icount := icount + 1;
StatusBar1.Panels[1].Text :=  IntToStr(icount);
if MultiSell.Lines.Count = 0 then begin
MultiSell.Lines.Add('<?xml version='+QuotedStr('1.0')+' encoding='+QuotedStr('utf-8')+'?>');
MultiSell.Lines.Add('<list>');
MultiSell.Lines.Add('<config showall="true" notax="true" keepenchanted="true" />');
MultiSell.Lines.Add('<item id="'+(StatusBar1.Panels[1].Text)+'">');
end;
end;

procedure TForm1.FinishMultisellClick(Sender: TObject);
begin
MultiSell.Lines.Add('</item>');
MultiSell.Lines.Add('</list>');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
icount := icount + 1;
StatusBar1.Panels[1].Text :=  IntToStr(icount);
if MultiSell.Lines.Count = 0 then begin
MultiSell.Lines.Add('<?xml version='+QuotedStr('1.0')+' encoding='+QuotedStr('utf-8')+'?>');
MultiSell.Lines.Add('<list>');
MultiSell.Lines.Add('<config showall="true" notax="true" keepenchanted="true" />');
MultiSell.Lines.Add('<item id="'+(StatusBar1.Panels[1].Text)+'">');
end;
end;

procedure TForm1.GiveItemClick(Sender: TObject);
begin
If SetEnchant.Checked = true then
MultiSell.Lines.Add('<production id="'+(ID1.Text)+'" count="'+(ItemQnt.Text)+'" enchant="'+(EnchantLvl.Text)+'" >')
else if SetEnchant.Checked = False then
begin
MultiSell.Lines.Add('<production id="'+(ID1.Text)+'" count="'+(ItemQnt.Text)+'">')
end;
end;


procedure TForm1.Image1Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'http://l2jdream.club/forum/index.php?/user/1-wallz/',nil,nil, SW_SHOWNORMAL) ;
end;

procedure TForm1.NewItemClick(Sender: TObject);
begin
icount := icount + 1;
StatusBar1.Panels[1].Text :=  IntToStr(icount);
MultiSell.Lines.Add('</item>');
MultiSell.Lines.Add('<item id="'+(StatusBar1.Panels[1].Text)+'">');
end;

procedure TForm1.SaveMultisellClick(Sender: TObject);
begin
 if SaveDialog1.Execute then        //Se a caixa de dialogo abrir faça
  begin
  //começa
    SaveDialog1.InitialDir := GetCurrentDir;
    Multisell.Lines.SaveToFile(SaveDialog1.FileName);  {atribui todo conteúdo do TMemo para o local onde você irá salvar}
  end;
  //fim;
end;

procedure TForm1.SetEnchantClick(Sender: TObject);
begin
If SetEnchant.Checked = true then
EnchantLvl.Visible := True
else if SetEnchant.Checked = False then
begin
EnchantLvl.Visible := False
end;
end;

procedure TForm1.TakeItemClick(Sender: TObject);
begin
If SetEnchant.Checked = true then
MultiSell.Lines.Add('<ingredient id="'+(ID1.Text)+'" count="'+(ItemQnt.Text)+'" enchant="'+(EnchantLvl.Text)+'" >')
else if SetEnchant.Checked = False then
begin
MultiSell.Lines.Add('<ingredient id="'+(ID1.Text)+'" count="'+(ItemQnt.Text)+'">')
end;
end;

end.
