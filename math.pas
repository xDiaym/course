unit Math;

interface
type
  Vec2f = record
    x, y: real;
  end;

function Vec2fFrom(r: real): Vec2f;

function Add(v, u: Vec2f): Vec2f;
function Sub(v, u: Vec2f): Vec2f;
function Mul(v: Vec2f; f: real): Vec2f;
function Norm(v: Vec2f): Vec2f;

function SquareMagnitude(v: Vec2f): real;
function Magnitude(v: Vec2f): real;

function PartialStep(v, u: Vec2f; f: real): Vec2f;

implementation

function Vec2fFrom(r: real): Vec2f;
begin
  result.x := r;
  result.y := r;
end;

function Add(v, u: Vec2f): Vec2f;
begin
  result.x := v.x + u.x;
  result.y := v.y + u.y;
end;

function Sub(v, u: Vec2f): Vec2f;
begin
  result.x := v.x - u.x;
  result.y := v.y - u.y;
end;

function Mul(v: Vec2f; f: real): Vec2f;
begin
  result.x := v.x * f;
  result.y := v.y * f;
end;

function Norm(v: Vec2f): Vec2f;
begin
  var d := Sqrt(SquareMagnitude(v));
  result.x := v.x / d;
  result.y := v.y / d;
end;

function SquareMagnitude(v: Vec2f): real;
begin
  result := v.x * v.x + v.y * v.y;
end;

function Magnitude(v: Vec2f): real := Sqrt(SquareMagnitude(v));

function PartialStep(v, u: Vec2f; f: real): Vec2f;
begin
  result.x := v.x + u.x * f;
  result.y := v.y + u.y * f;
end;

end.