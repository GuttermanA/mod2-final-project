require './test/test_helper'
# require 'rails_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  RSpec.describe Answer, :type => :model do

    let(:category) {
      Category.create(name: 'Famous Cats')
    }

    let(:choice1) {
      Choice.create(
        name:'Garfield',
        img_url:'1234',
        category: category
      )
    }

    let(:choice2) {
      Choice.create(
        name:'Sylvester',
        img_url:'1234',
        category: category
      )
    }

    let(:user) {
      User.create(
        username: 'Bob',
        password: '1234',
        email: 'bob@bob.com',
        zip_code: 11732,
        dob: '1/27/1991',
      )
    }

    let(:question) {
      q = Question.new
      q.description = "#{choice1} or #{choice2}"
      q.choices << choice1
      q.choices << choice2
      q.category = category
      q.save
      q
    }

    let(:answer) {
      Answer.create(
        user_id: user.id,
        question_id: question.id,
        choice_id: choice1.id
      )
    }

    it "is valid with a user_id, a question_id, and a choice_id" do
      expect(answer).to be_valid
    end

    it "belongs to one user" do
      expect(answer.user).to eq(user)
    end

    it "belongs to one question" do
      expect(answer.question).to eq(question)
    end

    it "belongs to one choice" do
      expect(answer.choice).to eq(choice)
    end


end
end
