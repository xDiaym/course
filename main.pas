program Course;
uses GraphABC;
uses PBody;

procedure DrawBody(var b: Body);
begin
  var r := Round(5 * Ln(b.mass)) + 5;
  SetBrushColor(b.col);
  FillCircle(Round(b.position.x), Round(b.position.y), r);
end;

procedure DrawAll();
begin
  Window.Clear(RGB(250, 240, 228));
  for var i := 1 to NBodies do
    DrawBody(bodies[i]);
  Redraw;
end;

begin
  Window.Title := 'Newton Mechanics';
  SetWindowSize(800, 600);
  
  bodies[1].mass := 100;
  bodies[1].position.x := 400;
  bodies[1].position.y := 300;
  bodies[1].velocity.x := 0.0;
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
  
  LockDrawing;
  while true do
  begin
    DrawAll;
    Step;
  end;
end.