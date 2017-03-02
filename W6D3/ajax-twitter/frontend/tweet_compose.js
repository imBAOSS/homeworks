const APIUtil = require('./api_util');

const MAX_CHARS = 140;
class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.handleSubmit();
    this.handleInput();
    this.handleAddMention();
    this.handleRemoveMention();
  }

  handleSubmit () {
    let $el = this.$el;

    $el.on("submit", (e) => {
      e.preventDefault();
      let data = $(e.currentTarget).serializeJSON();
      APIUtil.createTweet(data).then((response) => {
        this.handleSuccess(response);
      });
    });
  }

  handleSuccess (response) {
    this.clearInput();
    response.prepend = true;
    let $tweetsUl = $(this.$el.attr("data-tweets-ul"));
    $tweetsUl.trigger("insert-tweet", response);
    //
    // let $li = $("<li>");
    // $li.append(JSON.stringify(response));
    //
    // $tweetsUl.prepend($li);
  }

  clearInput () {
    this.$el.find("textarea").val("");
    this.$el.find("select").val("");
    this.$el.find(".mentioned-users").empty();
  }

  handleInput() {
    let $el = this.$el;
    let $textarea = $el.find('textarea');
    let $strong = $el.find('.chars-left');

    $textarea.on("input", (e) => {
      $strong.empty();
      let length = $textarea.val().length;
      let charsLeft = MAX_CHARS - length;
      $strong.text(charsLeft.toString());

      if (charsLeft <= 0) {
        $strong.addClass("no-chars-left");
      } else {
        $strong.removeClass("no-chars-left");
      }
    });
  }

  handleAddMention() {
    let $a = this.$el.find(".add-mentioned-user");
    $a.on("click", (e) => {
      return this.addMentionedUser();
    });
  }

  addMentionedUser() {
    let $scriptTag = this.$el.find("script[type='text/template']");
    this.$el.find(".mentioned-users").append($scriptTag.html());
    return false;
  }

  handleRemoveMention () {
    let $div = this.$el.find(".mentioned-users");
    // console.log($div);
    $div.on("click", ".remove-mentioned-user", (e) => {
      return this.removeMentionedUser(e);
    });
  }

  removeMentionedUser(e) {
    $(e.currentTarget).parent().remove();
    return false;
  }
}

module.exports = TweetCompose;
