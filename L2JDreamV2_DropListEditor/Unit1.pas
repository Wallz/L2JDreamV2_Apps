unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess, Uni,
  UniProvider, MySQLUniProvider, Vcl.Grids, Vcl.DBGrids, MemDS, Vcl.ExtCtrls,
  Vcl.DBCGrids, Vcl.Imaging.jpeg, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TL2DropEditor = class(TForm)
    LabelHost: TLabel;
    EditHost: TEdit;
    LabelDB: TLabel;
    EditDB: TEdit;
    LabelUser: TLabel;
    EditUser: TEdit;
    Labelpws: TLabel;
    Editpws: TEdit;
    LabelPorta: TLabel;
    EditPorta: TEdit;
    MySQLUniProvider1: TMySQLUniProvider;
    Button1: TButton;
    QuerryLocaliza: TUniQuery;
    DataSourceLocaliza: TDataSource;
    QuerryInsert: TUniQuery;
    QuerryListaNpcs: TUniQuery;
    DataSourceListaNpcs: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    QuerryEliminarItens: TUniQuery;
    DBGrid3: TDBGrid;
    QuerryDropNpcItem: TUniQuery;
    DataSourcedropnpvitem: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    Image1: TImage;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    LabelLocNpcItem: TLabel;
    EditLocNpcItem: TEdit;
    RadioGroup3: TRadioGroup;
    ButtonLocNpcItem: TButton;
    GroupBox3: TGroupBox;
    LabelELNpcID: TLabel;
    LabelItemID: TLabel;
    EditELMNPCID: TEdit;
    EditELITEMID: TEdit;
    RadioGroup1: TRadioGroup;
    ButtonEliminarItemdoNpc: TButton;
    GroupBox4: TGroupBox;
    LabeldITEM: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    Label34: TLabel;
    EditDITEM1: TEdit;
    EditMIN1: TEdit;
    EditMAX1: TEdit;
    ComboBoxCT: TComboBox;
    EditCHC1: TEdit;
    EditNPCID: TEdit;
    ButtonInsertI: TButton;
    GroupBox5: TGroupBox;
    LabelLocalizar2: TLabel;
    RadioGroup2: TRadioGroup;
    ButtonLocNpc: TButton;
    EditLocalizarNpc: TEdit;
    LabelLocalizar: TLabel;
    GroupBox6: TGroupBox;
    LabelBuscarItem: TLabel;
    GroupBox1: TGroupBox;
    RadioArmor: TRadioButton;
    RadioCArmor: TRadioButton;
    RadioCEtcitem: TRadioButton;
    RadioCweapon: TRadioButton;
    RadioEtcitem: TRadioButton;
    RadioWeapon: TRadioButton;
    EditBuscarItem: TEdit;
    ButtonLocalizar: TButton;
    TabSheet4: TTabSheet;
    SQLMemo: TMemo;
    ExecSQL: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonLocalizarClick(Sender: TObject);
    procedure ButtonInsertIClick(Sender: TObject);
    procedure ButtonLocNpcClick(Sender: TObject);
    procedure ButtonLocNpcItemClick(Sender: TObject);
    procedure ButtonEliminarItemdoNpcClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure ExecSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  L2DropEditor: TL2DropEditor;
  hostE, dbE, userE, pwsE : string;
  portaE : Integer;
  ConnectLine : TUniConnection;
  locItens : string;
  locnpc : string;
  locdropitem : string;
  npcd : string;
  dlist : string;
  item1, min1, max1, ct1, chanc1 : string;
  eliminedrop : string;
  eliminenpc : string;
  SQL : string;
  eliminedropnpc, eliminedropitem : string;

implementation
{$R *.dfm}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

{ Conexão com a base de dados MYSQL }
procedure TL2DropEditor.Button1Click(Sender: TObject);
 begin
  hostE := EditHost.Text;
  dbE := EditDB.Text;
  userE := EditUser.Text;
  pwsE := Editpws.Text;
  portaE := StrToInt(EditPorta.Text);
  ConnectLine := TUniConnection.Create(nil);
 try
  ConnectLine.ProviderName := 'MySQL';
  ConnectLine.Server := hostE;
  ConnectLine.Port := portaE;
  ConnectLine.Database := dbE;
  ConnectLine.Username := userE;
  ConnectLine.Password := pwsE;
  try
   ConnectLine.Connect;
   ConnectLine.Open;
   QuerryLocaliza.Connection := ConnectLine;
   QuerryInsert.Connection := ConnectLine;
   QuerryListaNpcs.Connection := ConnectLine;
   QuerryDropNpcItem.Connection := ConnectLine;
   QuerryEliminarItens.Connection := ConnectLine;
   except
    on E: Exception do
     ShowMessage(E.Message);
  end;
 finally
  if ConnectLine.Connected = True then
 begin
  EditHost.Enabled := False;
  EditDB.Enabled := False;
  EditUser.Enabled := False;
  Editpws.Enabled := False;
  EditPorta.Enabled := False;
  Button1.Enabled := False;
  StatusBar1.Panels[1].Text := 'Connected';
  end;
 end;
end;
{ Fim da conexão com a base de dodos }

procedure TL2DropEditor.ExecSQLClick(Sender: TObject);
begin
 SQL := SQLMemo.Text;
 if (SQL.Length >= 1) then
 begin
 QuerryInsert.SQL.Clear;
 QuerryInsert.SQL.Add(''+SQL+'');
 QuerryInsert.Execute;
 ShowMessage('SQL Executada!');
 end
 else
 begin
  ShowMessage('A SQL está em branco !');
  EditELMNPCID.SetFocus;
 end;
end;

procedure TL2DropEditor.ButtonEliminarItemdoNpcClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
 begin
 eliminedropnpc :=  EditELMNPCID.Text;
 eliminedropitem := EditELITEMID.Text;
 if (eliminedropnpc.Length >= 1) AND (eliminedropitem.Length >= 1) then
 begin
 QuerryEliminarItens.SQL.Clear;
 QuerryEliminarItens.SQL.Add('DELETE FROM DROPLIST ');
 QuerryEliminarItens.SQL.Add('WHERE  mobID ='+eliminedropnpc+' AND itemId = '+eliminedropitem);
 QuerryEliminarItens.Execute;
 ShowMessage('Item Eliminado do NPC na DropList !');
 QuerryEliminarItens.SQL.Clear;
 QuerryEliminarItens.SQL.Add('DELETE FROM Custom_DROPLIST ');
 QuerryEliminarItens.SQL.Add('WHERE  mobID ='+eliminedropnpc+' AND itemId = '+eliminedropitem);
 QuerryEliminarItens.Execute;
 ShowMessage('Item Eliminado do NPC na Custom_DropList!');
 end
 else
 begin
  ShowMessage('O NPCID ou ITEMID estão em branco !');
  EditELMNPCID.SetFocus;
 end;
 end;
   if RadioGroup1.ItemIndex=1 then
 begin
 eliminedrop := EditELITEMID.Text;
 if eliminedrop.Length >= 1 then
 begin
 QuerryEliminarItens.SQL.Clear;
 QuerryEliminarItens.SQL.Add('DELETE FROM DROPLIST ');
 QuerryEliminarItens.SQL.Add('WHERE itemId = '+eliminedrop);
 QuerryEliminarItens.Execute;
 ShowMessage('Item Eliminado de Todos os Npcs da DropList !');
 QuerryEliminarItens.SQL.Clear;
 QuerryEliminarItens.SQL.Add('DELETE FROM Custom_DROPLIST ');
 QuerryEliminarItens.SQL.Add('WHERE itemId = '+eliminedrop);
 QuerryEliminarItens.Execute;
 ShowMessage('Item Eliminado de Todos os Npcs da Custom_DropList !');
 end
 else
 begin
  ShowMessage('ITEMID está em branco !');
  EditELITEMID.SetFocus;
 end;
 end;
   if RadioGroup1.ItemIndex=2 then
 begin
 eliminenpc := EditELMNPCID.Text;
 if eliminenpc.Length >= 1 then
 begin
 QuerryEliminarItens.SQL.Clear;
 QuerryEliminarItens.SQL.Add('DELETE FROM DROPLIST ');
 QuerryEliminarItens.SQL.Add('WHERE mobId = '+eliminenpc);
 QuerryEliminarItens.Execute;
 ShowMessage('Eliminado Todos os drops do Npc da DropList !');
 QuerryEliminarItens.SQL.Clear;
 QuerryEliminarItens.SQL.Add('DELETE FROM Custom_DROPLIST ');
 QuerryEliminarItens.SQL.Add('WHERE mobId = '+eliminenpc);
 QuerryEliminarItens.Execute;
 ShowMessage('Eliminado Todos os drops do Npc na Custom_DropList !');
 end
 else
 begin
  ShowMessage('NPCID está em branco!');
  EditELMNPCID.SetFocus;
 end;
 end;
 end;

procedure TL2DropEditor.ButtonInsertIClick(Sender: TObject);
begin
 npcd := EditNPCID.Text;
 item1 := EditDITEM1.Text;
 min1 := EditMIN1.Text;
 max1 := EditMAX1.Text;
 ct1 := ComboBoxCT.Text;
 chanc1 := EditCHC1.Text;
 if (npcd.Length >= 1) AND (item1.Length >= 1) AND (min1.Length >= 1) AND(max1.Length >= 1) AND(ct1.Length >= 1) AND(chanc1.Length >= 1) then
 begin
 QuerryInsert.SQL.Clear;
 QuerryInsert.SQL.Add('INSERT INTO droplist (mobId, ItemId, min, max, category, chance)');
 QuerryInsert.SQL.Add('values ( :npcd, :item1, :min1, :max1, :ct1, :chanc1 )');
 QuerryInsert.ParamByName('npcd').AsString := EditNPCID.Text;
 QuerryInsert.ParamByName('item1').AsString := EditDITEM1.Text;
 QuerryInsert.ParamByName('min1').AsString := EditMIN1.Text;
 QuerryInsert.ParamByName('max1').AsString := EditMAX1.Text;
 QuerryInsert.ParamByName('ct1').AsString := ComboBoxCT.Text;
 QuerryInsert.ParamByName('chanc1').AsString := EditCHC1.Text;
 QuerryInsert.Execute;

 ShowMessage('DADOS INSERIDOS COM SUCESSO !');
 EditDITEM1.Text := '';
 EditNPCID.Text := '';
 EditMIN1.Text := '';
 EditMAX1.Text := '';
 ComboBoxCT.Text := '0';
 EditCHC1.Text := '';
 end
 else
 begin
 ShowMessage('Preencha todas as Informações !');
 EditDITEM1.SetFocus;
 end;
end;

procedure TL2DropEditor.ButtonLocalizarClick(Sender: TObject);
begin
  locItens := EditBuscarItem.Text;
   if RadioArmor.Checked=True then
  begin
   QuerryLocaliza.SQL.Clear;
   QuerryLocaliza.SQL.Add('SELECT ITEM_ID, NAME, BODYPART, ARMOR_TYPE, CRYSTAL_TYPE ');
   QuerryLocaliza.SQL.Add('FROM ARMOR');
   QuerryLocaliza.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locItens+'%'));
   QuerryLocaliza.Execute;
  end;
   if RadioEtcitem.Checked=True then
  begin
   QuerryLocaliza.SQL.Clear;
   QuerryLocaliza.SQL.Add('SELECT ITEM_ID, NAME, ITEM_TYPE, CRYSTAL_TYPE ');
   QuerryLocaliza.SQL.Add('FROM etcitem');
   QuerryLocaliza.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locItens+'%'));
   QuerryLocaliza.Execute;
  end;
   if RadioWeapon.Checked=True then
  begin
   QuerryLocaliza.SQL.Clear;
   QuerryLocaliza.SQL.Add('SELECT ITEM_ID, NAME, BODYPART, CRYSTAL_TYPE ');
   QuerryLocaliza.SQL.Add('FROM weapon');
   QuerryLocaliza.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locItens+'%'));
   QuerryLocaliza.Execute;
  end;
  if RadioCArmor.Checked=True then
  begin
   QuerryLocaliza.SQL.Clear;
   QuerryLocaliza.SQL.Add('SELECT ITEM_ID, NAME, BODYPART, ARMOR_TYPE, CRYSTAL_TYPE ');
   QuerryLocaliza.SQL.Add('FROM CUSTOM_ARMOR');
   QuerryLocaliza.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locItens+'%'));
   QuerryLocaliza.Execute;
  end;
   if RadioCEtcitem.Checked=True then
  begin
   QuerryLocaliza.SQL.Clear;
   QuerryLocaliza.SQL.Add('SELECT ITEM_ID, NAME, ITEM_TYPE, CRYSTAL_TYPE ');
   QuerryLocaliza.SQL.Add('FROM custom_etcitem');
   QuerryLocaliza.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locItens+'%'));
   QuerryLocaliza.Execute;
  end;
   if RadioCweapon.Checked=True then
  begin
   QuerryLocaliza.SQL.Clear;
   QuerryLocaliza.SQL.Add('SELECT ITEM_ID, NAME, BODYPART, CRYSTAL_TYPE ');
   QuerryLocaliza.SQL.Add('FROM custom_weapon');
   QuerryLocaliza.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locItens+'%'));
   QuerryLocaliza.Execute;
  end;
end;

procedure TL2DropEditor.ButtonLocNpcClick(Sender: TObject);
begin
 locnpc := EditLocalizarNpc.Text;
  if RadioGroup2.ItemIndex=0 then
 begin
 QuerryListaNpcs.SQL.Clear;
 QuerryListaNpcs.SQL.Add('SELECT ID, LEVEL, NAME, TYPE ');
 QuerryListaNpcs.SQL.Add('FROM npc');
 QuerryListaNpcs.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locnpc+'%'));
 QuerryListaNpcs.SQL.Add(' OR ID LIKE '+QuotedStr('%'+locnpc+'%'));
 QuerryListaNpcs.Execute;
 end;
  if RadioGroup2.ItemIndex=1 then
 begin
 QuerryListaNpcs.SQL.Clear;
 QuerryListaNpcs.SQL.Add('SELECT ID, LEVEL, NAME, TYPE ');
 QuerryListaNpcs.SQL.Add('FROM custom_npc');
 QuerryListaNpcs.SQL.Add('WHERE NAME LIKE '+QuotedStr('%'+locnpc+'%'));
 QuerryListaNpcs.SQL.Add(' OR ID LIKE '+QuotedStr('%'+locnpc+'%'));
 QuerryListaNpcs.Execute;
 end;
end;

procedure TL2DropEditor.ButtonLocNpcItemClick(Sender: TObject);
begin
 locdropitem := EditLocNpcItem.Text;
  if locdropitem.Length >= 4 then
 begin
  if RadioGroup3.ItemIndex=0 then
 begin
 QuerryDropNpcItem.SQL.Clear;
 QuerryDropNpcItem.SQL.Add('SELECT droplist.mobID, droplist.itemid, droplist.min, droplist.max, droplist.category, droplist.chance, npc.name');
 QuerryDropNpcItem.SQL.Add('FROM droplist, npc, custom_npc');
 QuerryDropNpcItem.SQL.Add('WHERE npc.name LIKE '+QuotedStr('%'+locdropitem+'%'));
 QuerryDropNpcItem.SQL.Add(' OR npc.ID LIKE '+QuotedStr('%'+locdropitem+'%'));
 QuerryDropNpcItem.SQL.Add(' AND droplist.mobId = npc.id ');
 QuerryDropNpcItem.Execute;
 end;
  if RadioGroup3.ItemIndex=1 then
 begin
 QuerryDropNpcItem.SQL.Clear;
 QuerryDropNpcItem.SQL.Add('SELECT custom_droplist.mobID, custom_droplist.itemid, custom_droplist.min, custom_droplist.max, custom_droplist.category, custom_droplist.chance, custom_npc.name');
 QuerryDropNpcItem.SQL.Add('FROM custom_droplist, custom_npc');
 QuerryDropNpcItem.SQL.Add('WHERE custom_npc.name LIKE '+QuotedStr('%'+locdropitem+'%'));
 QuerryDropNpcItem.SQL.Add(' OR custom_npc.ID LIKE '+QuotedStr('%'+locdropitem+'%'));
 QuerryDropNpcItem.SQL.Add(' AND custom_droplist.mobId = npc.id ');
 QuerryDropNpcItem.Execute;
 end;
 end
 else
 begin
  ShowMessage('Insira no mínimo 4 digitos para iniciar a busca!');
  EditLocNpcItem.SetFocus;
 end;
end;

procedure TL2DropEditor.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
If StatusBar1.Panels[1].Text= 'Disconnected' then
StatusBar1.Canvas.Font.Style := [fsBold];
Statusbar1.Canvas.Font.Color := clred;
StatusBar1.Canvas.TextOut(Rect.Left + 2, Rect.Top, Panel.Text);
If StatusBar1.Panels[1].Text= 'Connected' then begin
StatusBar1.Canvas.Font.Style := [fsBold];
Statusbar1.Canvas.Font.Color := clgreen;
StatusBar1.Canvas.TextOut(Rect.Left + 2, Rect.Top, Panel.Text);
end;
end;

end.
