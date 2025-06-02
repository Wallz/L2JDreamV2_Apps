unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMySQL, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,ShellAPI, acPNG;

type
  TMain = class(TForm)
    PageControl1: TPageControl;
    Armor: TTabSheet;
    EtcItem: TTabSheet;
    Weapon: TTabSheet;
    EtcItemAdd: TButton;
    consume_type: TComboBox;
    crystal_count: TEdit;
    crystal_type: TComboBox;
    crystallizable: TComboBox;
    destroyable: TComboBox;
    dropable: TComboBox;
    duration: TEdit;
    item_type: TComboBox;
    ItemID: TEdit;
    ItemName: TEdit;
    material: TComboBox;
    price: TEdit;
    sellable: TComboBox;
    EtcItemSQL: TRichEdit;
    tradeable: TComboBox;
    weight: TEdit;
    lifetime: TEdit;
    skill: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    ArmorID: TEdit;
    Label20: TLabel;
    ArmorName: TEdit;
    Label21: TLabel;
    ArmorDrop: TComboBox;
    Label22: TLabel;
    ArmorBodyPart: TComboBox;
    Label23: TLabel;
    Label24: TLabel;
    ArmorDestroy: TComboBox;
    ArmorTrade: TComboBox;
    Label25: TLabel;
    ArmorCrystalyze: TComboBox;
    Label26: TLabel;
    ArmorGrade: TComboBox;
    Label27: TLabel;
    ArmorCrystalQnt: TEdit;
    ArmorSellable: TComboBox;
    ArmorPrice: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ArmorSkills: TEdit;
    Label31: TLabel;
    ArmorLifetime: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    ArmorDuration: TEdit;
    ArmorMaterial: TComboBox;
    Label35: TLabel;
    ArmorWeight: TEdit;
    ArmorSQL: TRichEdit;
    ArmorAdd: TButton;
    ArmorType: TComboBox;
    Label36: TLabel;
    Label32: TLabel;
    ArmorPDef: TEdit;
    ArmorMDef: TEdit;
    Label37: TLabel;
    ArmorMPBonus: TEdit;
    Label38: TLabel;
    WDrop: TComboBox;
    WBodyPart: TComboBox;
    WTrade: TComboBox;
    WAdd: TButton;
    Label39: TLabel;
    WLt: TEdit;
    WMat: TComboBox;
    WDuration: TEdit;
    Label40: TLabel;
    WSQL: TRichEdit;
    Label41: TLabel;
    Label42: TLabel;
    WDestroy: TComboBox;
    Label43: TLabel;
    Label44: TLabel;
    WN: TEdit;
    WWeight: TEdit;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    WType: TComboBox;
    WCrit: TEdit;
    Label49: TLabel;
    WGrade: TComboBox;
    Label50: TLabel;
    Label51: TLabel;
    WShDefRate: TEdit;
    WShDef: TEdit;
    Label52: TLabel;
    Label53: TLabel;
    WCrystalize: TComboBox;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    WSk: TEdit;
    Label57: TLabel;
    WSell: TComboBox;
    Label58: TLabel;
    WCQ: TEdit;
    WPrice: TEdit;
    WID: TEdit;
    WSkE4: TEdit;
    Label59: TLabel;
    WAtkSpd: TEdit;
    Label60: TLabel;
    Label61: TLabel;
    WMPConsume: TEdit;
    WMDam: TEdit;
    Label62: TLabel;
    WHitMod: TEdit;
    Label63: TLabel;
    WPDam: TEdit;
    Label67: TLabel;
    Label68: TLabel;
    WRndDam: TEdit;
    WSS: TEdit;
    Label69: TLabel;
    WSpS: TEdit;
    Label65: TLabel;
    WSkOnCast: TEdit;
    Label66: TLabel;
    Label64: TLabel;
    WSkOnCrit: TEdit;
    ArmorSets: TTabSheet;
    ArmorSetsSQL: TRichEdit;
    Button1: TButton;
    EtcSQLClear: TButton;
    ArmorSQLClear: TButton;
    WSQLClear: TButton;
    ArmorSetSQLClear: TButton;
    Label18: TLabel;
    ArmorSetID: TEdit;
    ArmorSetHelmet: TEdit;
    Label70: TLabel;
    ArmorSetChest: TEdit;
    Label71: TLabel;
    Label72: TLabel;
    ArmorSetLegs: TEdit;
    Label73: TLabel;
    ArmorSetGloves: TEdit;
    Label74: TLabel;
    ArmorSetFeet: TEdit;
    Label75: TLabel;
    ArmorSetSkill: TEdit;
    Label76: TLabel;
    ArmorSetSkillLvl: TEdit;
    SkillSetID: TEdit;
    Label77: TLabel;
    ArmorSetShield: TEdit;
    Label78: TLabel;
    ShieldSkill: TEdit;
    Label79: TLabel;
    ArmorSet6ESkill: TEdit;
    Label80: TLabel;
    Info: TTabSheet;
    GroupBox1: TGroupBox;
    Label81: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure EtcItemAddClick(Sender: TObject);
    procedure ArmorAddClick(Sender: TObject);
    procedure ArmorSQLClearClick(Sender: TObject);
    procedure EtcSQLClearClick(Sender: TObject);
    procedure WSQLClearClick(Sender: TObject);
    procedure ArmorSetSQLClearClick(Sender: TObject);
    procedure WAddClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$R *.dfm}

procedure TMain.ArmorAddClick(Sender: TObject);
begin
ArmorSQL.Lines.Add('INSERT INTO `custom_armor` VALUES ('+(QuotedStr(ArmorID.Text))+ ','+(QuotedStr(ArmorID.Text))+ ','+(QuotedStr(ArmorName.Text))+ ', '+(QuotedStr(ArmorBodyPart.Text))+', '+(QuotedStr(ArmorCrystalyze.Text))+', '+(QuotedStr(ArmorType.Text))+', '+(QuotedStr(ArmorWeight.Text))+', '+(QuotedStr(ArmorMaterial.Text))+', '+(QuotedStr(ArmorGrade.Text))+', ''0'', '+(QuotedStr(ArmorDuration.Text))+', '+(QuotedStr(ArmorLifetime.Text))+','+(QuotedStr(ArmorPDef.Text))+','+(QuotedStr(ArmorMDef.Text))+','+(QuotedStr(ArmorMPBonus.Text))+', '+(QuotedStr(ArmorPrice.Text))+', '+(QuotedStr(ArmorCrystalQnt.Text))+', '+(QuotedStr(ArmorSellable.Text))+', '+(QuotedStr(ArmorDrop.Text))+', '+(QuotedStr(ArmorDestroy.Text))+', '+(QuotedStr(ArmorTrade.Text))+', '+(QuotedStr(ArmorSkills.Text))+');');
end;

procedure TMain.ArmorSetSQLClearClick(Sender: TObject);
begin
ArmorSetsSQL.Clear;
end;

procedure TMain.ArmorSQLClearClick(Sender: TObject);
begin
ArmorSQL.Clear;
end;

procedure TMain.Button1Click(Sender: TObject);
begin
ArmorSetsSQL.Lines.Add('INSERT INTO `custom_armorsets` VALUES ('+(QuotedStr(ArmorSetID.Text))+ ', '+(QuotedStr(ArmorSetHelmet.Text))+ ', '+(QuotedStr(ArmorSetChest.Text))+ ', '+(QuotedStr(ArmorSetLegs.Text))+ ', '+(QuotedStr(ArmorSetGloves.Text))+ ', '+(QuotedStr(ArmorSetFeet.Text))+ ', '+(QuotedStr(ArmorSetShield.Text))+ ', '+(QuotedStr(ArmorSetSkill.Text))+ ', '+(QuotedStr(ArmorSetSkillLvl.Text))+ ', '+(QuotedStr(SkillSetID.Text))+ ', '+(QuotedStr(ShieldSkill.Text))+ ', '+(QuotedStr(ArmorSet6ESkill.Text))+ ');');
end;

procedure TMain.Button2Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'http://l2jdream.org/forum/index.php?/user/1-wallz/',nil,nil, SW_SHOWNORMAL) ;
end;

procedure TMain.Button3Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'http://l2jdream.org/forum/index.php?/topic/93-l2jdream-sql-creator/',nil,nil, SW_SHOWNORMAL) ;
end;

procedure TMain.EtcItemAddClick(Sender: TObject);
begin
EtcItemSQL.Lines.Add('INSERT INTO `custom_etcitem` VALUES ('+(QuotedStr(ItemID.Text))+','+(QuotedStr(ItemID.Text))+','+(QuotedStr(ItemName.Text))+ ', '+(QuotedStr(crystallizable.Text))+', '+(QuotedStr(item_type.Text))+', '+(QuotedStr(weight.Text))+', '+(QuotedStr(consume_type.Text))+', '+(QuotedStr(material.Text))+', '+(QuotedStr(crystal_type.Text))+', '+(QuotedStr(duration.Text))+','+(QuotedStr(lifetime.Text))+', '+(QuotedStr(price.Text))+', '+(QuotedStr(crystal_count.Text))+', '+(QuotedStr(sellable.Text))+', '+(QuotedStr(dropable.Text))+', '+(QuotedStr(destroyable.Text))+', '+(QuotedStr(tradeable.Text))+', '+(QuotedStr(skill.Text))+', ''false'');');
end;


procedure TMain.EtcSQLClearClick(Sender: TObject);
begin
EtcItemSQL.Clear;
end;

procedure TMain.WAddClick(Sender: TObject);
begin
WSQL.Lines.Add('INSERT INTO `custom_weapon` VALUES ('+(QuotedStr(WID.Text))+ ', '+(QuotedStr(WID.Text))+ ', '+(QuotedStr(WN.Text))+ ', '+(QuotedStr(WBodyPart.Text))+ ', '+(QuotedStr(WCrystalize.Text))+ ', '+(QuotedStr(WWeight.Text))+ ', '+(QuotedStr(WSS.Text))+ ', '+(QuotedStr(WSpS.Text))+ ', '+(QuotedStr(WMat.Text))+ ', '+(QuotedStr(WGrade.Text))+ ', '+(QuotedStr(WPDam.Text))+ ', '+(QuotedStr(WRndDam.Text))+ ', '+(QuotedStr(WType.Text))+ ', '+(QuotedStr(WCrit.Text))+ ', '+(QuotedStr(WHitMod.Text))+ ', ''0'', '+(QuotedStr(WShDef.Text))+ ', '+(QuotedStr(WShDefRate.Text))+ ', '+(QuotedStr(WAtkSpd.Text))+ ', '+(QuotedStr(WMPConsume.Text))+ ', '+(QuotedStr(WMDam.Text))+ ', '+(QuotedStr(WDuration.Text))+ ', '+(QuotedStr(WLt.Text))+ ', '+(QuotedStr(WPrice.Text))+ ', '+(QuotedStr(WCQ.Text))+ ', '+(QuotedStr(WSell.Text))+ ', '+(QuotedStr(WDrop.Text))+ ', '+(QuotedStr(WTrade.Text))+ ', '+(QuotedStr(WSk.Text))+ ', '+(QuotedStr(WSkE4.Text))+ ', '+(QuotedStr(WSkOnCast.Text))+ ', '+(QuotedStr(WSkOnCrit.Text))+ ');');
end;

procedure TMain.WSQLClearClick(Sender: TObject);
begin
WSQL.Clear;
end;

end.
