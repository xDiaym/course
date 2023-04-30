unit PBody;

interface
uses Math;
uses GraphABC;

type
  Body = record
    mass: real;
    position, velocity, acceleration: Vec2f;
  end;

const NBodies = 2;
var bodies: array[1..NBodies] of Body;

procedure UpdateAcceleration(var this, other: Body; dt: real);
procedure Step(var this: Body; dt: real);

implementation

procedure UpdateAcceleration(var this, other: Body; dt: real);
begin
  var r := Sub(other.position, this.position);
  var a := other.mass / Power(Magnitude(r), 3);
  this.acceleration := Mul(r, a);  
end;

procedure Step(var this: Body; dt: real);
begin
  this.velocity := Add(this.velocity, Mul(this.acceleration, dt));
  this.position := Add(this.position, Mul(this.velocity,     dt));
end;

end.