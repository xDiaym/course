program Course;
uses GraphABC;
uses PBody;

// RGB() is not a constant function
var
  BackgroundColor := RGB(250, 240, 228);

procedure DrawBody(var b: Body);
begin
  var r := Round(5 * Ln(b.mass)) + 5;
  SetBrushColor(b.col);
  FillCircle(Round(b.position.x), Round(b.position.y), r);
end;

procedure DrawMassCenter();
begin
  var R := MassCenter;
  SetBrushColor(RGB(40, 40, 60));
  FillCircle(Round(R.x), Round(R.y), 2);
end;

procedure DrawEnergy();
begin
  // Format() don't work
  var fmt: string := FloatToStr(Energy);
  var text := 'Energy: ' + fmt.Substring(0, Min(4, fmt.Length)) + 'J';
  SetBrushColor(BackgroundColor);
  TextOut(8, 8, text);
end;

procedure DrawAll();
begin
  Window.Clear(BackgroundColor);
  for var i := 1 to NBodies do
    DrawBody(bodies[i]);
  DrawMassCenter;
  Drawenergy;
  Redraw;
end;

begin
  Window.Title := 'Newton Mechanics';
  SetWindowSize(800, 600);
  
  bodies[1].mass := 100;
  bodies[1].position.x := 400;
  bodies[1].position.y := 300;
  bodies[1].velocity.x := 0.1;
  bodies[1].col := RGB(234, 235, 66);
  
  bodies[2].mass := 1;
  bodies[2].position.x := 400;
  bodies[2].position.y := 300 - 100;
  bodies[2].velocity.x := 1.2;
  bodies[2].col := RGB(200, 50, 66);
  
  bodies[3].mass := 1;
  bodies[3].position.x := 400;
  bodies[3].position.y := 300 + 100;
  bodies[3].velocity.x := -1.2;
  bodies[3].col := RGB(50, 200, 66);
  
  SetFontColor(RGB(0, 0, 0));
  SetFontsize(14);
  
  LockDrawing;
  while true do
  begin
    DrawAll;
    Step;
  end;
end.