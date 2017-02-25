const GameView = require('./game_view');

document.addEventListener("DOMContentLoaded", /*callback*/function () {
  const element = document.getElementById("game-canvas");
  const ctx = element.getContext("2d");

  const gameView = new GameView(ctx);
  gameView.start();
});
