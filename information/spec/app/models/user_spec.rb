require "rails_helper"
require "pry"

RSpec.describe User, type: :model do
  let!(:user) {User.create(email: "test10@gmail.com", password: "123", first_name: "Test", last_name: "Name")}
  let!(:admin) {User.create(role: "admin", email: "test@gmail.com", password: "123")}

  describe ".full_name" do
    context "should return user's first and last name" do
      it {expect(user.full_name).to eq(User.first.first_name + " " + User.first.last_name)}
    end
  end

  describe "#password" do
    context "should return valid" do
      it {expect(user.password_digest?).to eq(true)}
      it {expect(User.create(password: "").valid?).to eq(false)}
      it {expect(User.create(password_confirmation: "").valid?).to eq(false)}
    end
  end

  describe "#email" do
    context "should return valid" do
      it {expect(User.create(email: "").valid?).to eq(false)}
      it {expect(User.create(email: "test.com").valid?).to eq(false)}
      it {expect(User.create(email: "test10@gmail.com").valid?).to eq(false)}
    end
  end

  describe "#role" do
    context "should return user's type" do
      it {expect(user.role).to eq("standard")}
      it {expect(User.last.role).to eq("admin")}
    end
  end
end