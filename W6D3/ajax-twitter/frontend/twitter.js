const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');
const TweetCompose = require('./tweet_compose');
const InfiniteTweets = require('./infinite_tweets');

$( function() {
  $('.follow-toggle').each((idx, el) => new FollowToggle(el));
  $('.users-search').each((idx, el) => new UsersSearch(el));
  $('.tweet-compose').each((idx, el) => new TweetCompose(el));
  $('.infinite-tweets').each((idx, el) => new InfiniteTweets(el));
});
