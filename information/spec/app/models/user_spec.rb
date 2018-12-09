require "rails_helper"
#require "pry"

RSpec.describe User, type: :model do
  let!(:user) {User.create(email: "test10@gmail.com", password: "123", first_name: "Test", last_name: "Name")}
  let!(:admin) {User.create(role: "admin", email: "test@gmail.com", password: "123")}
  let!(:task1) {Task.create(title: "test1", text: "Lorem ipsum...", user_id: "#{user[:id]}")}
  let!(:task2) {Task.create(title: "test2", text: "Lorem ipsum...", user_id: "#{user[:id]}")}

  describe "#has_many" do
    context "should return 2 tasks belongs to 1 user" do
      it {expect(user.tasks).to include(task1 && task2)}
    end
  end

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

  describe "#validation" do
    context "should return error message" do
      it {expect(User.create(password: "").errors.messages[:password]).to include("can't be blank")}
      it {expect(User.create(password: "123", password_confirmation: "").errors.messages[:password_confirmation]).to include("doesn't match Password")}
      it {expect(User.create(email: "test.com").errors.messages[:email]).to include("is invalid")}
      it {expect(User.create(email: "").errors.messages[:email]).to include("can't be blank")}
    end
  end
end