unit Math;

interface
type
  Vec2f = record
    x, y: real;
  end;

function Add(var v, u: Vec2f): Vec2f;
function Sub(var v, u: Vec2f): Vec2f;
function Mul(var v: Vec2f; f: real): Vec2f;
function Norm(var v: Vec2f): Vec2f;

{ Квадрат длинны вектора }
function SquareMagnitude(var v: Vec2f): real;

implementation

function Add(var v, u: Vec2f): Vec2f;
begin
  result.x := v.x + u.x;
  result.y := v.y + u.y;
end;

function Sub(var v, u: Vec2f): Vec2f;
begin
  result.x := v.x - u.x;
  result.y := v.y - u.y;
end;

function Mul(var v: Vec2f; f: real): Vec2f;
begin
  result.x := v.x * f;
  result.y := v.y * f;
end;

function Norm(var v: Vec2f): Vec2f;
begin
  var d := Sqrt(SquareMagnitude(v));
  result.x := v.x / d;
  result.y := v.y / d;
end;

function SquareMagnitude(var v: Vec2f): real;
begin
  result := v.x * v.x + v.y * v.y;
end;

end.