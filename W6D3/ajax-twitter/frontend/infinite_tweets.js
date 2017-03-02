const APIUtil = require('./api_util.js');

class InfiniteTweets {
  constructor(el) {
    this.$el = $(el);
    this.maxCreatedAt = null;
    this.fetchTweets(null);
    this.handleClick();
    this.handleInsertTweet();
  }

  handleClick() {
    this.$el.find(".fetch-more").on("click", (e) => {
      this.fetchTweets(e);
      return false;
    });
  }

  fetchTweets(e) {
    APIUtil.fetchTweets(this.maxCreatedAt).then((response) => {
      this.insertTweets(response);

      if (response.length < 20) {
        this.$el.find(".fetch-more").hide();
      }

      return false;
    });
  }

  insertTweets(response) {
    for (let i = 0; i < response.length; i++) {
      this.insertTweet(response[i]);
    }
    return false;
  }

  handleInsertTweet() {
    let $feed = this.$el.find("#feed");
    let infiniteTweets = this;
    $feed.on("insert-tweet", function (e, response) {
      infiniteTweets.insertTweet(response);
    });
  }

  insertTweet(tweet) {
    this.maxCreatedAt = tweet.created_at;

    let $li = $("<li>");
    $li.append(JSON.stringify(tweet));
    if(tweet.prepend) {
      this.$el.find("#feed").prepend($li);
    } else {
      this.$el.find("#feed").append($li);
    }
  }
}

module.exports = InfiniteTweets;
