const View = require('./ttt-view');// require appropriate file
const Game = require('../ttt-node-sol/game');// require appropriate file

$( () => {
  // Your code here
  let game = new Game();
  let $ttt = $('.ttt');
  new View(game, $ttt);
});
