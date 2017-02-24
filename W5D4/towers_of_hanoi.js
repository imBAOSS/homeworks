class Game {
  constructor() {
    this.stacks = [[],[3,2,1],[]];
  }

  isValidMove(start, end) {
    let startArr = this.stacks[start];
    let endArr = this.stacks[end];

    if ((endArr.length === 0) ||
          (endArr[endArr.length - 1] > startArr[startArr.length - 1])) {
      return true;
    } else {
      return false;
    }
  }


  promptMove(callback) {

    console.log(this.stacks)

    const readline = require('readline');
    const reader = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    })

    let start, end;
    reader.question("Starting tower?", (startTower) => {
      reader.question("Ending tower?", (endTower) => {
        start = parseInt(startTower) - 1;
        end = parseInt(endTower) - 1;
        callback(start, end);
        reader.close();
        reader.close();
      })
    })
  }
}

let game = new Game;
//
// game.promptMove( (start, end) => {
//   console.log(`Starting tower is ${start}. Ending tower is ${end}.`);
// })

console.log(game.isValidMove(1,2));
