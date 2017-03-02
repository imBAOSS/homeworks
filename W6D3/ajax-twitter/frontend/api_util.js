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
