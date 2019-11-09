{$apptype gui}
uses iup;

begin
  IupOpen(nil, nil);
  IupMessage('hi', 'Hello, world!');
  IupClose();
end.