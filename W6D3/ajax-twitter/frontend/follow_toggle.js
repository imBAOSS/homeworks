const APIUtil = require("./api_util");

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
