const Util = require('./util');
const MovingObject = require('./moving_object');
const Game = require('./game');

const DEFAULTS = {
  COLOR: "#42f4ce",
  RADIUS: 4,
  VEL: 3
};

const Asteroid = function (options = {}) {
  options.color = DEFAULTS.COLOR;
  options.radius = DEFAULTS.RADIUS;
  options.pos = options.pos || Game.randomPosition;
  // options.game.randomPosition?
  options.vel = options.vel || Util.randomVec(DEFAULTS.VEL);

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
