class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $li = $('li');
    $li.on('click', (e) => {
      const $square = $(e.currentTarget);
      this.makeMove($square);
      $square.text(this.game.currentPlayer);

      setTimeout(() => {
        let winner = this.game.winner();
        if (winner) {
          // debugger;
          $li.off('click');

        }
      }, 100);
    })
  }

  makeMove($square) {
    this.game.playMove($square.data("pos"));
    $square.off("mouseout");
    $square.off("mouseover")
    $square.css("background-color", "white");
    if (this.game.currentPlayer === "x") {
      $square.addClass('x');
      // debugger
    } else {
      $square.addClass('o');
    }
  }

  setupBoard() {
    for(let i = 0; i < 3; i ++) {
      const $ul = $('<ul></ul>').addClass("rows");
      for (let j = 0; j < 3; j++) {
        const $li = $('<li></li>').addClass("square").data("pos", [i,j]);
        $li.on("mouseover", (e) => {
          const $li = $(e.currentTarget);
          $li.css("background-color", "yellow");
        })
        $li.on("mouseout", (e) => {
          const $li = $(e.currentTarget);
          $li.css("background-color", "gray");
        })
        $ul.append($li);
      }
      this.$el.append($ul);
    }
  }

}

module.exports = View;
