require 'rails_helper'

RSpec.describe User, type: :model do
  it "is a thing" do
    expect {User.new}.to_not raise_error
  end
  it "has a user name and email" do
    u1 = User.new
    u1.name = "Johnny Smith"
    u1.email = "jsmith@gmailsforreal.com"
    expect(u1.save).to be true
  end
end
