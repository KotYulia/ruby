require "rails_helper"
#require "pry"

RSpec.describe Task, type: :model do
  let!(:user) {User.create(email: "test10@gmail.com", password: "123", first_name: "Test", last_name: "Name")}
  let!(:task) {Task.create(title: "test", text: "Lorem ipsum...", user_id: "#{user[:id]}")}

  describe "#tasks" do
    context "should have a users method" do
      it {expect(task).to respond_to(:user)}
    end
  end
end