unit PBody;

interface
uses Math;
uses GraphABC;

type
  Body = record
    mass: real;
    position, velocity, acceleration: Vec2f;
    col: Color
  end;

const NBodies = 3;
var bodies: array[1..NBodies] of Body;

procedure Step();

implementation


function Solve(p, v: Vec2f; i: integer): (Vec2f, Vec2f);
begin
  var a := Vec2fFrom(0);
  for var j := 1 to NBodies do
  begin
    if i <> j then begin
      var dp := Sub(bodies[j].position, p);
      var r := Magnitude(dp);
      a := Add(a, Mul(dp, bodies[j].mass / Power(r, 3)));
    end;
  end;
  result := (v, a);
end;

function RK4(i: integer; dt: real): (Vec2f, Vec2f);
begin
  var p := bodies[i].position;
  var v := bodies[i].velocity;
  
  var (pk1, vk1) := Solve(bodies[i].position, bodies[i].velocity, i);
  pk1 := Mul(pk1, dt);
  vk1 := Mul(vk1, dt);
  
  var (pk2, vk2) := Solve(PartialStep(p, pk1, 0.5), PartialStep(v, vk1, 0.5), i);
  pk2 := Mul(pk2, dt);
  vk2 := Mul(vk2, dt);
  
  var (pk3, vk3) := Solve(PartialStep(p, pk2, 0.5), PartialStep(v, vk2, 0.5), i);
  pk3 := Mul(pk3, dt);
  vk3 := Mul(vk3, dt);

  var (pk4, vk4) := Solve(Add(p, pk3), Add(v, vk3), i);
  pk4 := Mul(pk4, dt);
  vk4 := Mul(vk4, dt);

  result := (
    Add(p, Mul(Add(pk1, Add(Mul(pk2, 2), Add(Mul(pk3, 2), pk4))), 1/6)),
    Add(v, Mul(Add(vk1, Add(Mul(vk2, 2), Add(Mul(vk3, 2), vk4))), 1/6))
  );
end;

procedure Step();
begin
  var vs: array[1..NBodies] of Vec2f;
  var ps: array[1..NBodies] of Vec2f;
  
  for var i := 1 to NBodies do
  begin
    var (p, v) := RK4(i, 0.5);
    ps[i] := p;
    vs[i] := v;
  end;
  
  for var i := 1 to NBodies do
  begin
    bodies[i].position := ps[i];
    bodies[i].velocity := vs[i];
  end;
end;

end.