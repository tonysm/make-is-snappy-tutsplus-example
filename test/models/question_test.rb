require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

    test "validations fails" do
        q = Question.new
        assert q.valid? == false

        q = Question.new(body: 'aaaaaa')
        assert q.valid? == false
    end

    test "creates questions as expected" do
        q = Question.new(body: 'aaaaaaaaaaa', user_id: 1)
        assert q.valid? == true
    end

end
