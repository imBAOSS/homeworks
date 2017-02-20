require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  describe "#is_password?" do
    it "should return true if password is valid" do
      password_digest = BCrypt::Password.create(password)
      expect(password_digest.is_password?(password)).to eq(true)
    end
  end

  describe "#reset_session_token" do
    it "should reset session token" do
      user = User.new(session_token: SecureRandom.urlsafe_base64(16))
      reset = user.reset_session_token
      expect(user.session_token).not_to eq(reset)
    end
  end

  describe "#find_by_credentials" do
    it "should return true if user was found"
    it "should return error if invalid credentials"
  end
end
