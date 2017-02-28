class HanoiView {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;

    this.startingToweridx = null;

    this.clickTower();

    this.setupTowers();
    this.render();
  }

  clickTower() {
    this.$el.on('click', 'ul', (e) => {
      const $tower = $(e.currentTarget);
      if (this.startingToweridx === null) {
        this.startingToweridx = $tower.data("towerIdx");
      } else {
        if (this.game.isValidMove(this.startingToweridx, $tower.data("towerIdx"))) {
          this.game.move(this.startingToweridx, $tower.data("towerIdx"));
          this.startingTowerIdx = null;
        } else {
          alert('Invalid move');
          this.startingTowerIdx = null;
        }
        this.render();
      }
    })

    if (this.game.isWon()) {
      alert("You have won");
    }

  }

  setupTowers() {
    this.$el.addClass("group")
    for(let i = 0; i < 3; i++) {
      const $ul = $('<ul>').addClass("towers").data("towerIdx", i);
      for(let j = 0; j < 3; j++) {
        const $li = $('<li>').addClass("disc");
          $ul.append($li);
      }
      this.$el.append($ul);
    }
  }

  render() {
    const $towers = $('ul');
    $towers.removeClass();

    if (this.startingTowerIdx !== null) {
      $towers.eq(this.startingTowerIdx).addClass("selected");
    }

    this.game.towers.forEach( (disks, towerIdx) => {
      const $disks = $towers.eq(towerIdx).children();
      $disks.removeClass();

      disks.forEach( (diskWidth, diskIdx) => {
        $disks.eq(-1 * diskIdx + 1).addClass(`disk-${diskWidth}`);
      })

    })

  }
}

module.exports = HanoiView;
