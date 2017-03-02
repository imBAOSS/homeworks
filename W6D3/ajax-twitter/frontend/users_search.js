const APIUtil = require("./api_util");
const FollowToggle = require("./follow_toggle");

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.children("input[type='text']");
    this.$ul = this.$el.children("ul");
    this.handleInput();
  }

  handleInput() {
    let $ul = this.$ul;

    let usersSearch = this;
    let callback = function(users) {
      usersSearch.renderResults(users, $ul);
    };

    this.$el.on("input", (e) => APIUtil.searchUsers(this.$input.val(), callback));
  }

  renderResults(users, $ul) {
    $ul.empty();
    for (let i = 0; i < users.length; i++) {
      let $li = $("<li>");
      let $a = $("<a>");
      let url = `/users/${users[i].id}`;

      $a.attr('href', url);

      let $button = $("<button>");
      $button.addClass("follow-toggle");

      let ft = new FollowToggle($button, {
        userId: users[i].id.toString(),
        followState: users[i].followed.toString()
      });

      $a.text(users[i].username);
      $li.append($a);
      $li.append($button);
      $ul.append($li);
    }
  }
}

module.exports = UsersSearch;
