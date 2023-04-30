program Course;
uses GraphABC;
uses PBody;

procedure DrawBody(var b: Body);
begin
  var r := Round(5 * Ln(b.mass)) + 5;
  SetBrushColor(RGB(50, 50, 60));
  FillCircle(Round(b.position.x), Round(b.position.y), r);
end;

begin
  Window.Title := 'Newton Mechanics';
  SetWindowSize(800, 600);
  
  bodies[1].mass := 100;
  bodies[1].position.x := 400;
  bodies[1].position.y := 300;
  bodies[1].velocity.x := -0.01;
  
  bodies[2].mass := 1;
  bodies[2].position.x := 400;
  bodies[2].position.y := 300 - 100;
  bodies[2].velocity.x := 1;
  
  LockDrawing;
  while true do
  begin
    Window.Clear(RGB(250, 240, 228));
      DrawBody(bodies[1]);
      DrawBody(bodies[2]);
    Redraw;
    
    UpdateAcceleration(bodies[1], bodies[2], 0.5);
    UpdateAcceleration(bodies[2], bodies[1], 0.5);

    Step(bodies[1], 0.5);
    Step(bodies[2], 0.5);
  end;
end.