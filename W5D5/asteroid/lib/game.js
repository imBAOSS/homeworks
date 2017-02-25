const Asteroid = require('./asteroid');

Game.DIM_X = 1080;
Game.DIM_Y = 720;
Game.NUM_ASTEROIDS = 20;

const Game = function () {
  this.asteroids = [];
};

Game.prototype.addAsteroids = function () {
  let options = {
    pos: Game.randomPosition
  };

  this.asteroids.push(new Asteroid(options));
};

Game.prototype.randomPosition = function () {
  let x = Math.random() * Game.DIM_X;
  let y = Math.random() * Game.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect();
  this.asteroids.forEach( (asteroid) => { asteroid.draw(); });
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach( (asteroid) => { asteroid.move(); });
};

module.exports = Game;
