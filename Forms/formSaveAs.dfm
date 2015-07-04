object frmSaveAs: TfrmSaveAs
  Left = 283
  Top = 561
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'frmSaveAs'
  ClientHeight = 213
  ClientWidth = 329
  Color = clBtnFace
  Constraints.MinHeight = 247
  Constraints.MinWidth = 337
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lblDblClick: TLabel
    Left = 8
    Top = 8
    Width = 164
    Height = 13
    Caption = 'Double-click on the output format:'
  end
  object chkAllFormats: TCheckBox
    Left = 8
    Top = 152
    Width = 313
    Height = 17
    Caption = 'All formats'
    TabOrder = 1
    OnClick = chkAllFormatsClick
  end
  object lstFormats: TListView
    Left = 8
    Top = 24
    Width = 313
    Height = 121
    Columns = <>
    HideSelection = False
    LargeImages = ImageList
    ReadOnly = True
    SortType = stText
    TabOrder = 0
    OnDblClick = lstFormatsDblClick
    OnKeyDown = lstFormatsKeyDown
  end
  object btnCustomFormat: TButton
    Left = 8
    Top = 180
    Width = 225
    Height = 25
    Caption = 'Custom format'
    TabOrder = 2
    OnClick = btnCustomFormatClick
  end
  object btnCancel: TButton
    Left = 240
    Top = 180
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object dlgSave: TSaveDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 128
    Top = 64
  end
  object ImageList: TImageList
    Left = 96
    Top = 64
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000008C5A52008C5A52008452
      4A0084524A0084524A0084524A0084524A0084524A0084524A0084524A008452
      4A0084524A00844A4200735A520000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000FFE7CE00FFDEC600FFDE
      C600FFDEC600FFDEC600FFDEBD00FFD6BD00FFD6B500FFD6B500FFD6B500FFD6
      AD00FFD6AD00FFCEAD00735A520000000000FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000FFE7CE00FFE7CE00FFDE
      C600FFDEC600FFDEC600FFDEC600FFDEBD00FFDEBD00FFD6B500FFD6B500FFD6
      B500FFD6B500FFD6AD00735A520000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFE7D600FFE7CE00FFE7
      CE00FFE7CE00FFE7CE00FFDEC600FFDEC600FFDEBD00FFDEBD00FFD6BD00FFD6
      B500FFD6B500FFD6B500735A520000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFEFD600FFE7D600FFE7
      D600FFE7D600FFE7CE00FFE7CE00FFDEC600FFDEC600FFDEC600FFDEBD00FFD6
      BD00FFD6BD00FFD6B500735A520000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFEFDE00FFEFD600FFE7
      D600FFE7D600FFE7D600FFE7CE00FFE7CE00FFDEC600FFDEC600FFDEC600FFDE
      BD00FFDEBD00FFDEBD00735A52000000000084524A00844A4200735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFEFDE00FFEFDE00FFEF
      DE00FFEFDE00FFE7D600FFE7D600FFE7CE00FFE7CE00FFE7CE00FFDEC600FFDE
      C600FFDEC600FFDEBD00735A520000000000FFD6B500FFD6AD00735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FFE7CE00FFDEC600FFDEC600FFDEC600FFDEC600FFDEBD00FFD6
      BD00FFD6B500FFD6B500FFD6B500FFD6AD00FFD6AD00FFCEAD00735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFF7E700FFEFE700FFEF
      E700FFEFE700FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7D600FFE7CE00FFE7
      CE00FFE7CE00FFDEC600735A520000000000FFD6BD00FFD6B500735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FFE7D600FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFDEC600FFDE
      C600FFDEBD00FFDEBD00FFD6BD00FFD6B500FFD6B500FFD6B500735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFF7EF00FFF7E700FFF7
      E700FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7
      CE00FFE7CE00FFE7CE00735A520000000000FFDEC600FFDEBD00735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FFEFDE00FFEFD600FFE7D600FFE7D600FFE7D600FFE7CE00FFE7
      CE00FFDEC600FFDEC600FFDEC600FFDEBD00FFDEBD00FFDEBD00735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7
      D600FFE7D600FFE7CE00735A520000000000FFE7CE00FFE7CE00735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FFF7E700FFEFE700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEF
      D600FFE7D600FFE7D600FFE7CE00FFE7CE00FFE7CE00FFDEC600735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFF700FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFF7E700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEF
      D600FFEFD600FFE7D600735A520000000000FFEFD600FFE7D600735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7E700FFEFE700FFEF
      DE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7D600FFE7CE00735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFF700FFFFF700FFF7
      F700FFF7F700FFF7EF00FFF7EF00FFF7EF00FFF7E700FFEFE700BD948C00B58C
      8400B58C8400B5848400735A520000000000FFB54A00735A5200FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00D6D6D600D6D6D600D6D6D600D6D6
      D600BDBDBD00BDBDBD00BDBDBD00BDBDBD00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FFFFF700FFFFF700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7
      EF00FFF7E700FFEFE700BD948C00B58C8400B58C8400B5848400735A5200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      F700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7EF00FFF7E700AD7B6300FFB5
      4A00FFB54A00735A52000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7
      F700FFF7EF00FFF7EF00B5846B00735A5200735A5200FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700FFF7F700FFF7EF00FFF7EF00B5846B00735A
      5200735A5200000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF9FF79FEF9FEF8001FFFFFFFFFFF7
      8001FFFFFFFFFFFF80019FEF166CEE528001FFF7FFF79FF78001FFFFFFFFFFFF
      8001FFFFFFFFFFFF8001FFFFFFFFFFFF8001FFFFFFFFFFFF8001FFFFFFFFFFFF
      8001000000000000800100001000101080010000444933538003000000000000
      8007000000000000FFFF56200000000000000000000000000000000000000000
      000000000000}
  end
end
