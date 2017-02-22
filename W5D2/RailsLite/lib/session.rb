require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies['_rails_lite_app']

    @ivar = (cookie.nil? ? {} : JSON.parse(cookie))
  end

  def [](key)
    @ivar[key]
  end

  def []=(key, val = {})
    @ivar[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie(:_rails_lite_app, JSON.generate(@ivar))
  end
end
