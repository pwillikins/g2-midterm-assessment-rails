require 'rails_helper'

describe "Validations" do
  it "returns an error if comment is blank" do
    user = User.create(name: "Paul", email: "user@example.com", password: "password")
    comment = Comment.create(id: 1, post_id: 1, user_id: user.id, comment: "")
    expect(comment).to_not be_valid
  end

  it "creates a valid comment" do
    user = User.create!(name: "Paul", email: "user@example.com", password: "password")
    comment = Comment.create!(id: 1, post_id: 1, user_id: user.id, comment: "hello")
    expect(comment).to be_valid
  end
end