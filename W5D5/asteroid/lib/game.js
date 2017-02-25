const Asteroid = require('./asteroid');

const Game = function () {
  this.asteroids = [];
};

Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 20;

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({ game: this }));
  }
};

Game.prototype.randomPosition = function () {
  let x = Math.random() * Game.DIM_X;
  let y = Math.random() * Game.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach( (asteroid) => { asteroid.draw(ctx); });
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach( (asteroid) => { asteroid.move(); });
};

module.exports = Game;
