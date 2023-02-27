unit PBody;

interface
uses Math;

type
  Body = record
    mass: real;
    position, velocity, acceleration: Vec2f;
  end;

procedure UpdateAcceleration(var this, other: Body);
procedure Step(var this: Body; dt: real);

implementation


procedure UpdateAcceleration(var this, other: Body);
begin
  { F = G * m_2 / r^2 }
  var r := Sub(other.position, this.position); 
  var distSquared := SquareMagnitude(r);
  r := Norm(r);
  
  var v := Mul(r, other.mass / distSquared);
  this.acceleration := v;
end;

procedure Step(var this: Body; dt: real);
begin
  var v := Mul(this.velocity, dt);
  this.position := Add(this.position, v);
  v := Mul(this.acceleration, dt);
  this.velocity := Add(this.velocity, v);
end;

end.