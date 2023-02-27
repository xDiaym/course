program Course;
uses GraphABC;
uses PBody;

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
  
  b2.velocity.x := 1;
  
  while true do
  begin
    Circle(round(b1.position.x), round(b1.position.y), 1);
    Circle(round(b2.position.x), round(b2.position.y), 1);
    UpdateAcceleration(b1, b2);
    UpdateAcceleration(b2, b1);
    Step(b1, 0.05);
    Step(b2, 0.05);
  end;
end.