//    Licence of IUP follows:

{
Copyright (c) 1994-2018 Tecgraf/PUC-Rio.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
}

{
   
}

unit iup;

interface

{$ifdef windows}
  const dllname = 'iup.dll';
{$else}
     const dllname = 'libiup.so';
{$endif}

const
  IUP_NAME = 'IUP - Portable User Interface';
  IUP_COPYRIGHT = 'Copyright (C) 1994-2009 Tecgraf, PUC-Rio.';
  IUP_DESCRIPTION = 'Portable toolkit for building graphical user interfaces.';
  constIUP_VERSION = '3.0';
  constIUP_VERSION_NUMBER = 300000;
  constIUP_VERSION_DATE = '2009/07/18';

type
  Ihandle = pointer;
  PIhandle = ^Ihandle;
  PPIhandle = ^PIhandle;

  Icallback= function (arg: PIhandle): longint;

{                      pre-defined dialogs}
function IupFileDlg:  PIhandle ;cdecl;external DLLNAME name 'IupFileDlg';
function IupMessageDlg:  PIhandle ;cdecl;external DLLNAME name 'IupMessageDlg';
function IupColorDlg:  PIhandle ;cdecl;external DLLNAME name 'IupColorDlg';
function IupFontDlg:  PIhandle ;cdecl;external DLLNAME name 'IupFontDlg';

function IupGetFile(arq: pchar): longint ;cdecl;external DLLNAME name 'IupGetFile';
procedure IupMessage(title, msg: pchar) ;cdecl;external DLLNAME name 'IupMessage';
procedure IupMessagef(title, format: array of pchar) ;cdecl;external DLLNAME name 'IupMessagef';
function IupAlarm(title, msg, b1, b2, b3: pchar): longint ;cdecl;external DLLNAME name 'IupAlarm';
function IupScanf(format: array of pchar): longint; cdecl;external DLLNAME name 'IupScanf';
function IupListDialog(_type:longint; title:Pchar; size:longint; list:PPchar; op:longint; 
             max_col:longint; max_lin:longint; marks:Plongint):longint; cdecl;external DLLNAME name 'IupListDialog';

function IupGetText(title, text: pchar): longint ;cdecl;external DLLNAME name 'IupGetText';
function IupGetColor(x:longint; y:longint; r:Pbyte; g:Pbyte; b:Pbyte):longint;cdecl;external DLLNAME name 'IupGetColor';

type
  Iparamcb = function (dialog:PIhandle; param_index:longint; user_data:pointer):longint;cdecl;

function IupGetParam(title:Pchar; action:Iparamcb; user_data:pointer; format:array of pchar):longint;
    cdecl;external DLLNAME name 'IupGetParam';

function IupGetParamv(title:Pchar; action:Iparamcb; user_data:pointer; format:Pchar; param_count:longint; 
             param_extra:longint; param_data:Ppointer):longint; cdecl;external DLLNAME name 'IupGetParamv';


{                      Functions}

function IupOpen(argc:Plongint; argv:PPPchar): longint;cdecl;external DLLNAME name 'IupOpen';
procedure IupClose(); cdecl;external DLLNAME name 'IupClose';
procedure IupImageLibOpen(); cdecl;external DLLNAME name 'IupImageLibOpen';

function IupMainLoop(): longint; cdecl;external DLLNAME name 'IupMainLoop';
function IupLoopStep(): longint; cdecl;external DLLNAME name 'IupLoopStep';
function IupMainLoopLevel(): longint ;cdecl;external DLLNAME name 'IupMainLoopLevel';
procedure IupFlush(); cdecl;external DLLNAME name 'IupFlush';
procedure IupExitLoop(); cdecl;external DLLNAME name 'IupExitLoop';

procedure IupUpdate(ih: PIhandle); cdecl;external DLLNAME name 'IupUpdate';
procedure IupUpdateChildren(ih: PIhandle); cdecl;external DLLNAME name 'IupUpdateChildren';
procedure IupRedraw(ih: PIhandle; children: longint); cdecl;external DLLNAME name 'IupRedraw';
procedure IupRefresh(ih: PIhandle); cdecl;external DLLNAME name 'IupRefresh';

function IupMapFont(iupfont: pchar): pchar; cdecl;external DLLNAME name 'IupMapFont';
function IupUnMapFont(driverfont: pchar): pchar; cdecl;external DLLNAME name 'IupUnMapFont';
function IupHelp(url: pchar): longint; cdecl;external DLLNAME name 'IupHelp';
function IupLoad(filename: pchar): pchar; cdecl;external DLLNAME name 'IupLoad';

function iupVersion(): pchar; cdecl;external DLLNAME name 'IupVersion';
function iupVersionDate(): pchar; cdecl;external DLLNAME name 'IupVersionDate';
function iupVersionNumber(): longint; cdecl;external DLLNAME name 'IupVersionNumber';
procedure IupSetLanguage(lng: pchar); cdecl;external DLLNAME name 'IupSetLanguage';
function IupGetLanguage(): pchar; cdecl;external DLLNAME name 'IupGetLanguage';

procedure IupDestroy(ih: PIhandle); cdecl;external DLLNAME name 'IupDestroy';
procedure IupDetach(child: PIhandle); cdecl;external DLLNAME name 'IupDetach';
function IupAppend(ih, child: PIhandle): PIhandle ;cdecl;external DLLNAME name 'IupAppend';
function IupInsert(ih, refChild, child: PIhandle): PIhandle;cdecl;external DLLNAME name 'IupInsert';
function IupGetChild(ih: PIhandle; pos: longint): PIhandle; cdecl;external DLLNAME name 'IupGetChild';
function IupGetChildPos(ih, child: PIhandle): longint; cdecl;external DLLNAME name 'IupGetChildPos';
function IupGetChildCount(ih: PIhandle): longint; cdecl;external DLLNAME name 'IupGetChildCount';
function IupGetNextChild(ih, child: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupGetNextChild';
function IupGetBrother(ih: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupGetBrother';
function IupGetParent(ih: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupGetParent';
function IupGetDialog(ih: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupGetDialog';
function IupGetDialogChild(ih: PIhandle; _name: pchar): PIhandle; cdecl;external DLLNAME name 'IupGetDialogChild';
function IupReparent(ih, newParent: PIhandle): longint; cdecl;external DLLNAME name 'IupReparent';

function IupPopup(ih: PIhandle; x, y: longint): longint;cdecl;external DLLNAME name 'IupPopup';
function IupShow(ih: PIhandle): longint;cdecl;external DLLNAME name 'IupShow';
function IupShowXY(ih: PIhandle; x, y: longint): longint;cdecl;external DLLNAME name 'IupShowXY';
function IupHide(ih: PIhandle): longint;cdecl;external DLLNAME name 'IupHide';
function IupMap(ih: PIhandle): longint;cdecl;external DLLNAME name 'IupMap';
procedure IupUnmap(ih: PIhandle);cdecl;external DLLNAME name 'IupUnmap';

procedure IupSetAttribute(ih: PIhandle; _name, value: pchar); cdecl;external DLLNAME name 'IupSetAttribute';
procedure IupStoreAttribute(ih: PIhandle; _name, value: pchar); cdecl;external DLLNAME name 'IupStoreAttribute';
function IupSetAttributes(ih: PIhandle; _str: pchar): PIhandle; cdecl;external DLLNAME name 'IupSetAttributes';
function IupGetAttribute(ih: PIhandle; _name: pchar): pchar; cdecl;external DLLNAME name 'IupGetAttribute';
function IupGetAttributes(ih: PIhandle): pchar; cdecl;external DLLNAME name 'IupGetAttributes';
function IupGetInt(ih: PIhandle; _name: pchar): longint; cdecl;external DLLNAME name 'IupGetInt';
function IupGetInt2(ih: PIhandle; _name: pchar): longint; cdecl;external DLLNAME name 'IupGetInt2';
function IupGetIntInt(ih: PIhandle; _name: pchar; i1, i2: Plongint): longint; cdecl;external DLLNAME name 'IupGetIntInt';
function IupGetFloat(ih: PIhandle; _name: pchar): single; cdecl;external DLLNAME name 'IupGetFloat';
procedure IupSetfAttribute(ih: PIhandle; _name, format: array of pchar); cdecl;external DLLNAME name 'IupSetfAttribute';
function IupGetAllAttributes(ih:PIhandle; names:PPchar; n:longint):longint; cdecl;external DLLNAME name 'IupGetAllAttributes';
function IupSetAtt(handleName: pchar; ih: PIhandle; _name: array of pchar): PIhandle;cdecl;external DLLNAME name 'IupSetAtt';

procedure IupSetGlobal(_name, value: pchar); cdecl;external DLLNAME name 'IupSetGlobal';
procedure IupStoreGlobal(_name, value: pchar); cdecl;external DLLNAME name 'IupStoreGlobal';
function IupGetGlobal(_name: pchar): pchar; cdecl;external DLLNAME name 'IupGetGlobal';

function IupSetFocus(ih: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupSetFocus';
function IupGetFocus(): PIhandle; cdecl;external DLLNAME name 'IupGetFocus';
function IupPreviousField(ih: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupPreviousField';
function IupNextField(ih: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupNextField';

function IupGetCallback(ih: PIhandle; _name: pchar): Icallback; cdecl;external DLLNAME name 'IupGetCallback';
function IupSetCallback(ih: PIhandle; _name: pchar; fn: Icallback): Icallback; cdecl;external DLLNAME name 'IupSetCallback';

function IupSetCallbacks(ih: PIhandle; _name: pchar; fn: array of Icallback): PIhandle;external DLLNAME name 'IupSetCallbacks';

function IupGetFunction(name: pchar): Icallback; cdecl;external DLLNAME name 'IupGetFunction';
function IupSetFunction(name: pchar; fn: Icallback): Icallback;cdecl;external DLLNAME name 'IupSetFunction';
function IupGetActionName(): pchar; cdecl;external DLLNAME name 'IupGetActionName';

function IupGetHandle(name: pchar): PIhandle; cdecl;external DLLNAME name 'IupGetHandle';
function IupSetHandle(name: pchar; ih: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupSetHandle';
function IupGetAllNames(names:PPchar; n:longint):longint; cdecl;external DLLNAME name 'IupGetAllNames';
function IupGetAllDialogs(names: ppchar; n: longint): longint; cdecl;external DLLNAME name 'IupGetAllDialogs';
function IupGetName(ih: PIhandle): pchar; cdecl;external DLLNAME name 'IupGetName';

procedure IupSetAttributeHandle(ih: PIhandle; _name: pchar; ihNamed: PIhandle); cdecl;external DLLNAME name 'IupSetAttributeHandle';
function IupGetAttributeHandle(ih: PIhandle; _name: pchar): PIhandle; cdecl;external DLLNAME name 'IupGetAttributeHandle';

function IupGetClassName(ih: PIhandle): pchar; cdecl;external DLLNAME name 'IupGetClassName';
function IupGetClassType(ih: PIhandle): pchar; cdecl;external DLLNAME name 'IupGetClassType';
function IupGetClassAttributes(classname: pchar; names: ppchar;
                         n: longint): longint; cdecl;external DLLNAME name 'IupGetClassAttributes';
procedure IupSaveClassAttributes(ih: PIhandle); cdecl;external DLLNAME name 'IupSaveClassAttributes';
procedure IupSetClassDefaultAttribute(classname, name, value: pchar); cdecl;external DLLNAME name 'IupSetClassDefaultAttribute';

function IupCreate(classname: pchar): PIhandle; cdecl;external DLLNAME name 'IupCreate';
function IupCreatev(classname: pchar; params: pointer): PIhandle; cdecl;external DLLNAME name 'IupCreatev';
function IupCreatep(classname: pchar; first: array of pointer): PIhandle; cdecl;external DLLNAME name 'IupCreatep';

function IupFill(): PIhandle; cdecl;external DLLNAME name 'IupFill';
function IupRadio(child: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupRadio';
function IupVbox(child:array of PIhandle): PIhandle; cdecl;external DLLNAME name 'IupVbox';
function IupVboxv(children: PPIhandle): PIhandle; cdecl;external DLLNAME name 'IupVboxv';
function IupZbox(child: array of PIhandle): PIhandle; cdecl;external DLLNAME name 'IupZbox';
function IupZboxv(children: PPIhandle): PIhandle; cdecl;external DLLNAME name 'IupZboxv';
function IupHbox(child: array of PIhandle): PIhandle; cdecl;external DLLNAME name 'IupHbox';
function IupHboxv(children: PPIhandle): PIhandle; cdecl;external DLLNAME name 'IupHboxv';

function IupNormalizer(ihFirst:array of PIhandle): PIhandle; cdecl;external DLLNAME name 'IupNormalizer';
function IupNormalizerv(ihList: PPIhandle): PIhandle; cdecl;external DLLNAME name 'IupNormalizerv';

function IupCbox(child: array of PIhandle): PIhandle; cdecl;external DLLNAME name 'IupCbox';
function IupCboxv(children: PPIhandle): PIhandle; cdecl;external DLLNAME name 'IupCboxv';
function IupSbox(child: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupSbox';

function IupFrame(child: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupFrame';

function IupImage(width, height: longint; pixmap: Pbyte): PIhandle; cdecl;external DLLNAME name 'IupImage';
function IupImageRGB(width, height: longint; pixmap: Pbyte): PIhandle; cdecl;external DLLNAME name 'IupImageRGB';
function IupImageRGBA(width, height: longint; pixmap: Pbyte): PIhandle; cdecl;external DLLNAME name 'IupImageRGBA';

function IupItem(title, action: pchar): PIhandle; cdecl;external DLLNAME name 'IupItem';
function IupSubmenu(title: pchar; child: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupSubmenu';
function IupSeparator(): PIhandle; cdecl;external DLLNAME name 'IupSeparator';
function IupMenu(child: array of PIhandle): PIhandle; cdecl;external DLLNAME name 'IupMenu';
function IupMenuv(children: PPIhandle): PIhandle; cdecl;external DLLNAME name 'IupMenuv';

function IupButton(title, action: pchar): PIhandle; cdecl;external DLLNAME name 'IupButton';
function IupLink(url, title: pchar): PIhandle; cdecl;external DLLNAME name 'IupLink';
function IupCanvas(action: pchar): PIhandle; cdecl;external DLLNAME name 'IupCanvas';
function IupDialog(child: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupDialog';
function IupUser(): PIhandle; cdecl;external DLLNAME name 'IupUser';
function IupLabel(title: pchar): PIhandle; cdecl;external DLLNAME name 'IupLabel';
function IupList(action: pchar): PIhandle; cdecl;external DLLNAME name 'IupList';
function IupText(action: pchar): PIhandle; cdecl;external DLLNAME name 'IupText';
function IupMultiLine(action: pchar): PIhandle; cdecl;external DLLNAME name 'IupMultiLine';
function IupToggle(title, action: pchar): PIhandle; cdecl;external DLLNAME name 'IupToggle';
function IupTimer(): PIhandle; cdecl;external DLLNAME name 'IupTimer';
function IupProgressBar(): PIhandle; cdecl;external DLLNAME name 'IupProgressBar';
function IupVal(theType: pchar): PIhandle; cdecl;external DLLNAME name 'IupVal';
function IupTabs(child: array of PIhandle): PIhandle; cdecl;external DLLNAME name 'IupTabs';
function IupTabsv(children: PPIhandle): PIhandle; cdecl;external DLLNAME name 'IupTabsv';
function IupTree(): PIhandle; cdecl;external DLLNAME name 'IupTree';

function IupSpin(): PIhandle; cdecl;external DLLNAME name 'IupSpin';
function IupSpinbox(child: PIhandle): PIhandle; cdecl;external DLLNAME name 'IupSpinbox';

{# IupText utilities}
procedure IupTextConvertLinColToPos(ih: PIhandle; lin, col: longint; pos: pLongint); cdecl;external DLLNAME name 'IupTextConvertLinColToPos';
procedure IupTextConvertPosToLinCol(ih: PIhandle; pos: longint; lin, col: pLongint); cdecl;external DLLNAME name 'IupTextConvertPosToLinCol';

function IupConvertXYToPos(ih: PIhandle; x, y: longint): longint; cdecl;external DLLNAME name 'IupConvertXYToPos';

{# IupTree utilities}
function IupTreeSetUserId(ih: PIhandle; id: longint; userid: pointer): longint;cdecl;external DLLNAME name 'IupTreeSetUserId';
function IupTreeGetUserId(ih: PIhandle; id: longint): pointer; cdecl;external DLLNAME name 'IupTreeGetUserId';
function IupTreeGetId(ih: PIhandle; userid: pointer): longint; cdecl;external DLLNAME name 'IupTreeGetId';

procedure IupTreeSetAttribute(ih: PIhandle; _name: pchar; id: longint; value: pchar); cdecl;external DLLNAME name 'IupTreeSetAttribute';
procedure IupTreeStoreAttribute(ih: PIhandle; _name: pchar; id: longint; value: pchar); cdecl;external DLLNAME name 'IupTreeStoreAttribute';
function IupTreeGetAttribute(ih: PIhandle; _name: pchar; id: longint): pchar; cdecl;external DLLNAME name 'IupTreeGetAttribute';
function IupTreeGetInt(ih: PIhandle; _name: pchar; id: longint): longint; cdecl;external DLLNAME name 'IupTreeGetInt';
function IupTreeGetFloat(ih: PIhandle; _name: pchar; id: longint): single; cdecl;external DLLNAME name 'IupTreeGetFloat';
procedure IupTreeSetfAttribute(ih: PIhandle; _name: pchar; id: longint; format: array of pchar); cdecl;external DLLNAME name 'IupTreeSetfAttribute';


{#                   Common Return Values}
const
  IUP_ERROR = longint(1);
  IUP_NOERROR = longint(0);
  IUP_OPENED = longint(-1);
  IUP_INVALID = longint(-1);

{  # Callback Return Values}
  IUP_IGNORE = longint(-1);
  IUP_DEFAULT = longint(-2);
  IUP_CLOSE = longint(-3);
  IUP_CONTINUE = longint(-4);

{  # IupPopup and IupShowXY Parameter Values}
  IUP_CENTER = longint($FFFF);
  IUP_LEFT = longint($FFFE);
  IUP_RIGHT = longint($FFFD);
  IUP_MOUSEPOS = longint($FFFC);
  IUP_CURRENT = longint($FFFB);
  IUP_CENTERPARENT = longint($FFFA);
  IUP_TOP = IUP_LEFT;
  IUP_BOTTOM = IUP_RIGHT;

  {# SHOW_CB Callback Values}
  IUP_SHOW = longint(0);
  IUP_RESTORE = longint(1);
  IUP_MINIMIZE = longint(2);
  IUP_MAXIMIZE = longint(3);
  IUP_HIDE = longint(4);

  {# SCROLL_CB Callback Values}
  IUP_SBUP = longint(0);
  IUP_SBDN = longint(1);
  IUP_SBPGUP = longint(2);
  IUP_SBPGDN = longint(3);
  IUP_SBPOSV = longint(4);
  IUP_SBDRAGV = longint(5);
  IUP_SBLEFT = longint(6);
  IUP_SBRIGHT = longint(7);
  IUP_SBPGLEFT = longint(8);
  IUP_SBPGRIGHT = longint(9);
  IUP_SBPOSH = longint(10);
  IUP_SBDRAGH = longint(11);

 { # Mouse Button Values and Macros}
  IUP_BUTTON1 = longint(ord('1'));
  IUP_BUTTON2 = longint(ord('2'));
  IUP_BUTTON3 = longint(ord('3'));
  IUP_BUTTON4 = longint(ord('4'));
  IUP_BUTTON5 = longint(ord('5'));

function IupIsShift(s: pchar): boolean; 
function IupIsControl(s: pchar): boolean;
function IupIsButton1(s: pchar): boolean;
function IupIsButton2(s: pchar): boolean;
function IupIsbutton3(s: pchar): boolean;
function IupIsDouble(s: pchar): boolean;
function IupIsAlt(s: pchar): boolean;
function IupIsSys(s: pchar): boolean;
function IupIsButton4(s: pchar): boolean;
function IupIsButton5(s: pchar): boolean;

{# Pre-Defined Masks}
const
  IUP_MASK_FLOAT = '[+/-]?(/d+/.?/d*|/./d+)';
  IUP_MASK_UFLOAT = '(/d+/.?/d*|/./d+)';
  IUP_MASK_EFLOAT = '[+/-]?(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?';
  IUP_MASK_INT = '[+/-]?/d+';
  IUP_MASK_UINT = '/d+';

{# from 32 to 126, all character sets are equal,
# the key code i the same as the character code.}
const
  K_SP = longint(ord(' '));
  K_exclam = longint(ord('!'));
  K_quotedbl = longint(ord('"'));
  K_numbersign = longint(ord('#'));
  K_dollar = longint(ord('$'));
  K_percent = longint(ord('%'));
  K_ampersand = longint(ord('&'));
  K_apostrophe = longint(ord(''''));
  K_parentleft = longint(ord('('));
  K_parentright = longint(ord(')'));
  K_asterisk = longint(ord('*'));
  K_plus = longint(ord('+'));
  K_comma = longint(ord(','));
  K_minus = longint(ord('-'));
  K_period = longint(ord('.'));
  K_slash = longint(ord('/'));
  K_0 = longint(ord('0'));
  K_1 = longint(ord('1'));
  K_2 = longint(ord('2'));
  K_3 = longint(ord('3'));
  K_4 = longint(ord('4'));
  K_5 = longint(ord('5'));
  K_6 = longint(ord('6'));
  K_7 = longint(ord('7'));
  K_8 = longint(ord('8'));
  K_9 = longint(ord('9'));
  K_colon = longint(ord(':'));
  K_semicolon = longint(ord(';'));
  K_less = longint(ord('<'));
  K_equal = longint(ord('='));
  K_greater = longint(ord('>'));
  K_question = longint(ord('?'));
  K_at = longint(ord('@'));
  K_upperA = longint(ord('A'));
  K_upperB = longint(ord('B'));
  K_upperC = longint(ord('C'));
  K_upperD = longint(ord('D'));
  K_upperE = longint(ord('E'));
  K_upperF = longint(ord('F'));
  K_upperG = longint(ord('G'));
  K_upperH = longint(ord('H'));
  K_upperI = longint(ord('I'));
  K_upperJ = longint(ord('J'));
  K_upperK = longint(ord('K'));
  K_upperL = longint(ord('L'));
  K_upperM = longint(ord('M'));
  K_upperN = longint(ord('N'));
  K_upperO = longint(ord('O'));
  K_upperP = longint(ord('P'));
  K_upperQ = longint(ord('Q'));
  K_upperR = longint(ord('R'));
  K_upperS = longint(ord('S'));
  K_upperT = longint(ord('T'));
  K_upperU = longint(ord('U'));
  K_upperV = longint(ord('V'));
  K_upperW = longint(ord('W'));
  K_upperX = longint(ord('X'));
  K_upperY = longint(ord('Y'));
  K_upperZ = longint(ord('Z'));
  K_bracketleft = longint(ord('['));
  K_backslash = longint(ord('\'));
  K_bracketright = longint(ord(']'));
  K_circum = longint(ord('^'));
  K_underscore = longint(ord('_'));
  K_grave = longint(ord('`'));
  K_lowera = longint(ord('a'));
  K_lowerb = longint(ord('b'));
  K_lowerc = longint(ord('c'));
  K_lowerd = longint(ord('d'));
  K_lowere = longint(ord('e'));
  K_lowerf = longint(ord('f'));
  K_lowerg = longint(ord('g'));
  K_lowerh = longint(ord('h'));
  K_loweri = longint(ord('i'));
  K_lowerj = longint(ord('j'));
  K_lowerk = longint(ord('k'));
  K_lowerl = longint(ord('l'));
  K_lowerm = longint(ord('m'));
  K_lowern = longint(ord('n'));
  K_lowero = longint(ord('o'));
  K_lowerp = longint(ord('p'));
  K_lowerq = longint(ord('q'));
  K_lowerr = longint(ord('r'));
  K_lowers = longint(ord('s'));
  K_lowert = longint(ord('t'));
  K_loweru = longint(ord('u'));
  K_lowerv = longint(ord('v'));
  K_lowerw = longint(ord('w'));
  K_lowerx = longint(ord('x'));
  K_lowery = longint(ord('y'));
  K_lowerz = longint(ord('z'));
  K_braceleft = longint(ord('{'));
  K_bar = longint(ord('|'));
  K_braceright = longint(ord('}'));
  K_tilde = longint(ord('~'));

function IupIsPrint(c: longint): boolean;

{# also define the escape sequences that have keys associated}
const
  K_BS = longint(8);  {BS}
  K_TAB = longint(9); {TAB}
  K_LF = longint(10);  
  K_CR = longint(13);

{# IUP Extended Key Codes, range start at 128
# Modifiers use 256 interval
# These key code definitions are specific to IUP}

function IupIsXkey(c: longint): boolean;
function IupIsShiftXkey(c: longint): boolean;
function IupIsCtrlXkey(c: longint): boolean;
function IupIsAltXkey(c: longint): boolean;
function IupIsSysXkey(c: longint): boolean;

function IUPxCODE(c: longint): longint;{# Normal (must be above 128)}
function IUPsxCODE(c: longint): longint;
 { # Shift (must have range to include the standard keys and the normal
  # extended keys, so must be above 256}

function iupcxCODE(c: longint): longint; {# Ctrl}
function iupmxCODE(c: longint): longint ;{# Alt}
function iupyxCODE(c: longint): longint; {# Sys (Win or Apple)}

const
  IUP_NUMMAXCODES = 1280; {## 5*256=1280  Normal+Shift+Ctrl+Alt+Sys}

  K_HOME = 1 + 128;
  K_UP = 2 + 128;
  K_PGUP = 3 + 128;
  K_LEFT = 4 + 128;
  K_MIDDLE = 5 + 128;
  K_RIGHT = 6 + 128;
  K_END = 7 + 128;
  K_DOWN = 8 + 128;
  K_PGDN = 9 + 128;
  K_INS = 10 + 128;
  K_DEL = 11 + 128;
  K_PAUSE = 12 + 128;
  K_ESC = 13 + 128;
  K_ccedilla = 14 + 128;
  K_F1 = 15 + 128;
  K_F2 = 16 + 128;
  K_F3 = 17 + 128;
  K_F4 = 18 + 128;
  K_F5 = 19 + 128;
  K_F6 = 20 + 128;
  K_F7 = 21 + 128;
  K_F8 = 22 + 128;
  K_F9 = 23 + 128;
  K_F10 = 24 + 128;
  K_F11 = 25 + 128;
  K_F12 = 26 + 128;
  K_Print = 27 + 128;
  K_Menu = 28 + 128;

  K_acute = 29 + 128; {# no Shift/Ctrl/Alt}

  K_sHOME = K_HOME + 256;
  K_sUP = K_UP + 256;
  K_sPGUP = K_PGUP + 256;
  K_sLEFT = K_LEFT + 256;
  K_sMIDDLE = K_MIDDLE + 256;
  K_sRIGHT = K_RIGHT + 256;
  K_sEND = K_END + 256;
  K_sDOWN = K_DOWN + 256;
  K_sPGDN = K_PGDN + 256;
  K_sINS = K_INS + 256;
  K_sDEL = K_DEL + 256;
  K_sSP = K_SP + 256;
  K_sTAB = K_TAB + 256;
  K_sCR = K_CR + 256;
  K_sBS = K_BS + 256;
  K_sPAUSE = K_PAUSE + 256;
  K_sESC = K_ESC + 256;
  K_sCcedilla = K_ccedilla + 256;
  K_sF1 = K_F1 + 256;
  K_sF2 = K_F2 + 256;
  K_sF3 = K_F3 + 256;
  K_sF4 = K_F4 + 256;
  K_sF5 = K_F5 + 256;
  K_sF6 = K_F6 + 256;
  K_sF7 = K_F7 + 256;
  K_sF8 = K_F8 + 256;
  K_sF9 = K_F9 + 256;
  K_sF10 = K_F10 + 256;
  K_sF11 = K_F11 + 256;
  K_sF12 = K_F12 + 256;
  K_sPrint = K_Print + 256;
  K_sMenu = K_Menu + 256;

  K_cHOME = K_HOME + 512;
  K_cUP = K_UP + 512;
  K_cPGUP = K_PGUP + 512;
  K_cLEFT = K_LEFT + 512;
  K_cMIDDLE = K_MIDDLE + 512;
  K_cRIGHT = K_RIGHT + 512;
  K_cEND = K_END + 512;
  K_cDOWN = K_DOWN + 512;
  K_cPGDN = K_PGDN + 512;
  K_cINS = K_INS + 512;
  K_cDEL = K_DEL + 512;
  K_cSP = K_SP + 512;
  K_cTAB = K_TAB + 512;
  K_cCR = K_CR + 512;
  K_cBS = K_BS + 512;
  K_cPAUSE = K_PAUSE + 512;
  K_cESC = K_ESC + 512;
  K_cCcedilla = K_ccedilla + 512;
  K_cF1 = K_F1 + 512;
  K_cF2 = K_F2 + 512;
  K_cF3 = K_F3 + 512;
  K_cF4 = K_F4 + 512;
  K_cF5 = K_F5 + 512;
  K_cF6 = K_F6 + 512;
  K_cF7 = K_F7 + 512;
  K_cF8 = K_F8 + 512;
  K_cF9 = K_F9 + 512;
  K_cF10 = K_F10 + 512;
  K_cF11 = K_F11 + 512;
  K_cF12 = K_F12 + 512;
  K_cPrint = K_Print + 512;
  K_cMenu = K_Menu + 512;

  K_mHOME = K_HOME + 768;
  K_mUP = K_UP + 768;
  K_mPGUP = K_PGUP + 768;
  K_mLEFT = K_LEFT + 768;
  K_mMIDDLE = K_MIDDLE + 768;
  K_mRIGHT = K_RIGHT + 768;
  K_mEND = K_END + 768;
  K_mDOWN = K_DOWN + 768;
  K_mPGDN = K_PGDN + 768;
  K_mINS = K_INS + 768;
  K_mDEL = K_DEL + 768;
  K_mSP = K_SP + 768;
  K_mTAB = K_TAB + 768;
  K_mCR = K_CR + 768;
  K_mBS = K_BS + 768;
  K_mPAUSE = K_PAUSE + 768;
  K_mESC = K_ESC + 768;
  K_mCcedilla = K_ccedilla + 768;
  K_mF1 = K_F1 + 768;
  K_mF2 = K_F2 + 768;
  K_mF3 = K_F3 + 768;
  K_mF4 = K_F4 + 768;
  K_mF5 = K_F5 + 768;
  K_mF6 = K_F6 + 768;
  K_mF7 = K_F7 + 768;
  K_mF8 = K_F8 + 768;
  K_mF9 = K_F9 + 768;
  K_mF10 = K_F10 + 768;
  K_mF11 = K_F11 + 768;
  K_mF12 = K_F12 + 768;
  K_mPrint = K_Print + 768;
  K_mMenu = K_Menu + 768;

  K_yHOME = K_HOME + 1024;
  K_yUP = K_UP + 1024;
  K_yPGUP = K_PGUP + 1024;
  K_yLEFT = K_LEFT + 1024;
  K_yMIDDLE = K_MIDDLE + 1024;
  K_yRIGHT = K_RIGHT + 1024;
  K_yEND = K_END + 1024;
  K_yDOWN = K_DOWN + 1024;
  K_yPGDN = K_PGDN + 1024;
  K_yINS = K_INS + 1024;
  K_yDEL = K_DEL + 1024;
  K_ySP = K_SP + 1024;
  K_yTAB = K_TAB + 1024;
  K_yCR = K_CR + 1024;
  K_yBS = K_BS + 1024;
  K_yPAUSE = K_PAUSE + 1024;
  K_yESC = K_ESC + 1024;
  K_yCcedilla = K_ccedilla + 1024;
  K_yF1 = K_F1 + 1024;
  K_yF2 = K_F2 + 1024;
  K_yF3 = K_F3 + 1024;
  K_yF4 = K_F4 + 1024;
  K_yF5 = K_F5 + 1024;
  K_yF6 = K_F6 + 1024;
  K_yF7 = K_F7 + 1024;
  K_yF8 = K_F8 + 1024;
  K_yF9 = K_F9 + 1024;
  K_yF10 = K_F10 + 1024;
  K_yF11 = K_F11 + 1024;
  K_yF12 = K_F12 + 1024;
  K_yPrint = K_Print + 1024;
  K_yMenu = K_Menu + 1024;

  K_sPlus = K_plus + 256;
  K_sComma = K_comma + 256;
  K_sMinus = K_minus + 256;
  K_sPeriod = K_period + 256;
  K_sSlash = K_slash + 256;
  K_sAsterisk = K_asterisk + 256;

  K_cupperA = K_upperA + 512;
  K_cupperB = K_upperB + 512;
  K_cupperC = K_upperC + 512;
  K_cupperD = K_upperD + 512;
  K_cupperE = K_upperE + 512;
  K_cupperF = K_upperF + 512;
  K_cupperG = K_upperG + 512;
  K_cupperH = K_upperH + 512;
  K_cupperI = K_upperI + 512;
  K_cupperJ = K_upperJ + 512;
  K_cupperK = K_upperK + 512;
  K_cupperL = K_upperL + 512;
  K_cupperM = K_upperM + 512;
  K_cupperN = K_upperN + 512;
  K_cupperO = K_upperO + 512;
  K_cupperP = K_upperP + 512;
  K_cupperQ = K_upperQ + 512;
  K_cupperR = K_upperR + 512;
  K_cupperS = K_upperS + 512;
  K_cupperT = K_upperT + 512;
  K_cupperU = K_upperU + 512;
  K_cupperV = K_upperV + 512;
  K_cupperW = K_upperW + 512;
  K_cupperX = K_upperX + 512;
  K_cupperY = K_upperY + 512;
  K_cupperZ = K_upperZ + 512;
  K_c1 = K_1 + 512;
  K_c2 = K_2 + 512;
  K_c3 = K_3 + 512;
  K_c4 = K_4 + 512;
  K_c5 = K_5 + 512;
  K_c6 = K_6 + 512;
  K_c7 = K_7 + 512;
  K_c8 = K_8 + 512;
  K_c9 = K_9 + 512;
  K_c0 = K_0 + 512;
  K_cPlus = K_plus + 512;
  K_cComma = K_comma + 512;
  K_cMinus = K_minus + 512;
  K_cPeriod = K_period + 512;
  K_cSlash = K_slash + 512;
  K_cSemicolon = K_semicolon + 512;
  K_cEqual = K_equal + 512;
  K_cBracketleft = K_bracketleft + 512;
  K_cBracketright = K_bracketright + 512;
  K_cBackslash = K_backslash + 512;
  K_cAsterisk = K_asterisk + 512;

  K_mupperA = K_upperA + 768;
  K_mupperB = K_upperB + 768;
  K_mupperC = K_upperC + 768;
  K_mupperD = K_upperD + 768;
  K_mupperE = K_upperE + 768;
  K_mupperF = K_upperF + 768;
  K_mupperG = K_upperG + 768;
  K_mupperH = K_upperH + 768;
  K_mupperI = K_upperI + 768;
  K_mupperJ = K_upperJ + 768;
  K_mupperK = K_upperK + 768;
  K_mupperL = K_upperL + 768;
  K_mupperM = K_upperM + 768;
  K_mupperN = K_upperN + 768;
  K_mupperO = K_upperO + 768;
  K_mupperP = K_upperP + 768;
  K_mupperQ = K_upperQ + 768;
  K_mupperR = K_upperR + 768;
  K_mupperS = K_upperS + 768;
  K_mupperT = K_upperT + 768;
  K_mupperU = K_upperU + 768;
  K_mupperV = K_upperV + 768;
  K_mupperW = K_upperW + 768;
  K_mupperX = K_upperX + 768;
  K_mupperY = K_upperY + 768;
  K_mupperZ = K_upperZ + 768;
  K_m1 = K_1 + 768;
  K_m2 = K_2 + 768;
  K_m3 = K_3 + 768;
  K_m4 = K_4 + 768;
  K_m5 = K_5 + 768;
  K_m6 = K_6 + 768;
  K_m7 = K_7 + 768;
  K_m8 = K_8 + 768;
  K_m9 = K_9 + 768;
  K_m0 = K_0 + 768;
  K_mPlus = K_plus + 768;
  K_mComma = K_comma + 768;
  K_mMinus = K_minus + 768;
  K_mPeriod = K_period + 768;
  K_mSlash = K_slash + 768;
  K_mSemicolon = K_semicolon + 768;
  K_mEqual = K_equal + 768;
  K_mBracketleft = K_bracketleft + 768;
  K_mBracketright = K_bracketright + 768;
  K_mBackslash = K_backslash + 768;
  K_mAsterisk = K_asterisk + 768;

  K_yA = K_upperA + 1024;
  K_yB = K_upperB + 1024;
  K_yC = K_upperC + 1024;
  K_yD = K_upperD + 1024;
  K_yE = K_upperE + 1024;
  K_yF = K_upperF + 1024;
  K_yG = K_upperG + 1024;
  K_yH = K_upperH + 1024;
  K_yI = K_upperI + 1024;
  K_yJ = K_upperJ + 1024;
  K_yK = K_upperK + 1024;
  K_yL = K_upperL + 1024;
  K_yM = K_upperM + 1024;
  K_yN = K_upperN + 1024;
  K_yO = K_upperO + 1024;
  K_yP = K_upperP + 1024;
  K_yQ = K_upperQ + 1024;
  K_yR = K_upperR + 1024;
  K_yS = K_upperS + 1024;
  K_yT = K_upperT + 1024;
  K_yU = K_upperU + 1024;
  K_yV = K_upperV + 1024;
  K_yW = K_upperW + 1024;
  K_yX = K_upperX + 1024;
  K_yY = K_upperY + 1024;
  K_yZ = K_upperZ + 1024;
  K_y1 = K_1 + 1024;
  K_y2 = K_2 + 1024;
  K_y3 = K_3 + 1024;
  K_y4 = K_4 + 1024;
  K_y5 = K_5 + 1024;
  K_y6 = K_6 + 1024;
  K_y7 = K_7 + 1024;
  K_y8 = K_8 + 1024;
  K_y9 = K_9 + 1024;
  K_y0 = K_0 + 1024;
  K_yPlus = K_plus + 1024;
  K_yComma = K_comma + 1024;
  K_yMinus = K_minus + 1024;
  K_yPeriod = K_period + 1024;
  K_ySlash = K_slash + 1024;
  K_ySemicolon = K_semicolon + 1024;
  K_yEqual = K_equal + 1024;
  K_yBracketleft = K_bracketleft + 1024;
  K_yBracketright = K_bracketright + 1024;
  K_yBackslash = K_backslash + 1024;
  K_yAsterisk = K_asterisk + 1024;

function IupControlsOpen(): longint; cdecl;external DLLNAME name 'IupControlsOpen';
procedure IupControlsClose(); cdecl;external DLLNAME name 'IupControlsClose';

procedure IupOldValOpen(); cdecl;external DLLNAME name 'IupOldValOpen';
procedure IupOldTabsOpen(); cdecl;external DLLNAME name 'IupOldTabsOpen';

function IupColorbar(): PIhandle; cdecl;external DLLNAME name 'IupColorbar';
function IupCells(): PIhandle; cdecl;external DLLNAME name 'IupCells';
function IupColorBrowser(): PIhandle; cdecl;external DLLNAME name 'IupColorBrowser';
function IupGauge(): PIhandle; cdecl;external DLLNAME name 'IupGauge';
function IupDial(theType: pchar): PIhandle; cdecl;external DLLNAME name 'IupDial';
function IupMatrix(action: pchar): PIhandle; cdecl;external DLLNAME name 'IupMatrix';

{# IupMatrix utilities}
procedure IupMatSetAttribute(ih: PIhandle; _name: pchar; lin, col: longint;
                      value: pchar);cdecl;external DLLNAME name 'IupMatSetAttribute';
procedure IupMatStoreAttribute(ih: PIhandle; _name: pchar; lin, col: longint;
                        value: pchar); cdecl;external DLLNAME name 'IupMatStoreAttribute';
function IupMatGetAttribute(ih: PIhandle; _name: pchar; lin, col: longint): pchar;
      cdecl;external DLLNAME name 'IupMatGetAttribute';
function IupMatGetInt(ih: PIhandle; _name: pchar; lin, col: longint): longint;
     cdecl;external DLLNAME name 'IupMatGetInt';
function IupMatGetFloat(ih: PIhandle; _name: pchar; lin, col: longint): single;
     cdecl;external DLLNAME name 'IupMatGetFloat';
procedure IupMatSetfAttribute(ih: PIhandle; _name: pchar; lin, col: longint;
                       format: array of pchar);
     cdecl;external DLLNAME name 'IupMatSetfAttribute';

{# Used by IupColorbar}
const
  IUP_PRIMARY = -1;
  IUP_SECONDARY = -2;

{# Initialize PPlot widget class}
procedure IupPPlotOpen(); cdecl;external DLLNAME name 'IupPPlotOpen';

{# Create an PPlot widget instance}
function IupPPlot():  PIhandle; cdecl;external DLLNAME name 'IupPPlot';

{# Add dataset to plot}
procedure IupPPlotBegin(ih: PIhandle; strXdata: longint); cdecl;external DLLNAME name 'IupPPlotBegin';
procedure IupPPlotAdd(ih: PIhandle; x, y: single);cdecl;external DLLNAME name 'IupPPlotAdd';
procedure IupPPlotAddStr(ih: PIhandle; x: pchar; y: single);cdecl;external DLLNAME name 'IupPPlotAddStr';
function IupPPlotEnd(ih: PIhandle): longint;cdecl;external DLLNAME name 'IupPPlotEnd';

procedure IupPPlotInsertStr(ih: PIhandle; index, sampleIndex: longint; x: pchar;
                     y: single);cdecl;external DLLNAME name 'IupPPlotInsertStr';
procedure IupPPlotInsert(ih: PIhandle; index, sampleIndex: longint;
                  x, y: single);cdecl;external DLLNAME name 'IupPPlotInsert';

{# convert from plot coordinates to pixels}
procedure IupPPlotTransform(ih: PIhandle; x, y: single; ix, iy: pLongint);cdecl;external DLLNAME name 'IupPPlotTransform';

{# Plot on the given device. Uses a "cdCanvas*".}
procedure IupPPlotPaintTo(ih: PIhandle; cnv: pointer);cdecl;external DLLNAME name 'IupPPlotPaintTo';


implementation

  function IupIsShift(s: pchar): boolean; begin	exit( s[0] = 'S' ); end;
  function IupIsControl(s: pchar): boolean; begin exit( s[1] = 'C'); end;
  function IupIsButton1(s: pchar): boolean; begin exit( s[2] = '1'); end;
  function IupIsButton2(s: pchar): boolean; begin exit( s[3] = '2'); end;
  function IupIsbutton3(s: pchar): boolean; begin exit( s[4] = '3'); end;
  function IupIsDouble(s: pchar): boolean; begin exit( s[5] = 'D'); end;
  function IupIsAlt(s: pchar): boolean; begin exit( s[6] = 'A'); end;
  function IupIsSys(s: pchar): boolean; begin exit( s[7] = 'Y'); end;
  function IupIsButton4(s: pchar): boolean; begin exit( s[8] = '4'); end;
  function IupIsButton5(s: pchar): boolean; begin exit( s[9] = '5'); end;

  function IupIsPrint(c: longint): boolean; begin exit( (c > 31) and (c < 127) ) end;

  function IupIsXkey(c: longint): boolean; begin exit( c > 128 ) end;
  function IupIsShiftXkey(c: longint): boolean; begin exit( (c > 256) and (c < 512) ) end;
  function IupIsCtrlXkey(c: longint): boolean; begin exit( (c > 512) and (c < 768)) end;
  function IupIsAltXkey(c: longint): boolean; begin exit( (c > 768) and (c < 1024)) end;
  function IupIsSysXkey(c: longint): boolean; begin exit( (c > 1024) and (c < 1280)) end;

  function IUPxCODE(c: longint): longint; begin exit( c + longint(128)) end;
  function IUPsxCODE(c: longint): longint; begin exit (c + longint(256)) end;

  
  function IUPcxCODE(c: longint): longint; begin exit (c + longint(512)) end; {# Ctrl}
  function IUPmxCODE(c: longint): longint; begin exit (c + longint(768) ) end;{# Alt}
  function IUPyxCODE(c: longint): longint; begin exit (c + longint(1024) ) end;{# Sys (Win or Apple)}
end.


