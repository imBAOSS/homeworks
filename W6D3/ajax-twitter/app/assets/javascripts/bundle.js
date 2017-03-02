/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);
const TweetCompose = __webpack_require__(4);
const InfiniteTweets = __webpack_require__(5);

$( function() {
  $('.follow-toggle').each((idx, el) => new FollowToggle(el));
  $('.users-search').each((idx, el) => new UsersSearch(el));
  $('.tweet-compose').each((idx, el) => new TweetCompose(el));
  $('.infinite-tweets').each((idx, el) => new InfiniteTweets(el));
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.attr("data-user-id") || options.userId;
    this.followState = this.$el.attr("data-initial-follow-state") || options.followState;
    this.handleClick();
    this.render();
  }
  render() {
    if (this.followState === "false") {
      this.$el.prop("disabled", false);
      this.$el.text("Follow!");
    } else if (this.followState === "true") {
      this.$el.prop("disabled", false);
      this.$el.text("Unfollow!");
    } else if (this.followState === "following") {
      this.$el.prop("disabled", true);
      this.$el.text("Following...");
    } else if (this.followState === "unfollowing") {
      this.$el.prop("disabled", true);
      this.$el.text("Unfollowing...");
    }
  }
  handleClick() {
    let followToggle = this;
    this.$el.on("click", function(e) {
      e.preventDefault();

      let callback = function () {
        followToggle.toggleFollowState();
        followToggle.render();
      };

      if (followToggle.followState === "false") {
        followToggle.followState = "following";
        APIUtil.followUser(followToggle.userId).then(callback);
      } else {
        followToggle.followState = "unfollowing";
        APIUtil.unfollowUser(followToggle.userId).then(callback);
      }
      followToggle.render();
    });
  }

  toggleFollowState() {
    if (this.followState === "following") {
      this.followState = "true";
    } else if (this.followState === "unfollowing") {
      this.followState = "false";
    }
  }
}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: (id) => {
    return callAJAX(id, "POST");
  },

  unfollowUser: (id) => {
    return callAJAX(id, "DELETE");
  },

  searchUsers: (queryVal, success) => {
    $.ajax({
      url: "/users/search",
      data: {
        query: queryVal
      },
      dataType: "json",
      success: function(response) {
        success(response);
      },
      error: function(response) {
        console.log(response);
      }
    });
  },

  createTweet: (data) => {
    // let content = data.tweet.content;
    // let mentionedUserIds = data.tweet.mentioned_user_ids;

    return $.ajax({
      type: "POST",
      url: "/tweets",
      dataType: "json",
      data: data,
      error: function(response) {
        console.log(response);
      }
    });
  },

  fetchTweets: (maxCreatedAt) => {
    let data = {};
    if (maxCreatedAt !== null) {
      data.max_created_at = maxCreatedAt;
    }
    return $.ajax({
      type: "GET",
      url: "/feed",
      dataType: "json",
      data: data,
      error: function(response) {
        console.log(response.responseText);
      }
    });
  }
};

function callAJAX (id, type) {
  return $.ajax({
    type: type,
    url: `/users/${id}/follow`,
    dataType: "json",
    error: function(response) {
      console.log(response);
    }
  });

}

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

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


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map