const Game = require('./game');

const GameView = function (game, ctx) {
  this.game = game;
  this.ctx = ctx;
};

GameView.prototype.start = function () {
  setInterval(() => {
    this.game.moveObjects;
    this.game.draw;
  }, 20);
};

module.exports = GameView;
