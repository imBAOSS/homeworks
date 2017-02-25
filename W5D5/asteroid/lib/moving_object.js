const MovingObject = function(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
};

MovingObject.prototype.draw = function(ctx) {
  // Draw a circle of appropriate radius
  // Center of circule at pos
  // Fill with appropriate color
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    true
  );

  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos += this.vel;
};

module.exports = MovingObject;
