{$apptype gui}
uses iup;

function btn(arg:PIhandle):longint;
begin
	IupMessage('title','hello, world');
	exit(0);
end;

var
	label1, button,dialog:PIhandle;
begin
	IupOpen(nil,nil);
	iupsetFunction('btn_click',@btn);
	label1 := IupLabel('hi');
	button := iupbutton('ok','btn_click');
	dialog :=IupDialog(IupVbox([label1, button]));
	IupSetAttribute(dialog,'SIZE','320x240');
	IupSetAttribute(dialog,'TITLE','Title of dialog');
	IupShow(dialog);
	IupMainloop();
	IupClose();
end.