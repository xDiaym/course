program Course;
uses GraphABC;
uses PBody;

procedure DrawBody(var b: Body);
begin
  var r := Round(5 * Ln(b.mass)) + 5;
  SetBrushColor(clred);
  FillCircle(Round(b.position.x), Round(b.position.y), r);
end;

begin
  Window.Title := 'Newton Mechanics';
  SetWindowSize(800, 600);
  
  var b1, b2: Body;
  b1.mass := 100;
  b2.mass := 1;
  b1.position.x := 400;
  b1.position.y := 300;
  b2.position.x := 400;
  b2.position.y := 300 - 100;
  
  b1.velocity.x := -0.01;
  b2.velocity.x := 1;
  
  LockDrawing;
  while true do
  begin
    Window.Clear;
      DrawBody(b1);
      DrawBody(b2);
    Redraw;
    
    UpdateAcceleration(b1, b2, 0.5);
    UpdateAcceleration(b2, b1, 0.5);

//    for var i := 1 to 50 do
//    begin
      Step(b1, 0.5);
      Step(b2, 0.5);
//    end;
  end;
end.