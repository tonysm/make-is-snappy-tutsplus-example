require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

    test "validations fails" do
        q = Question.new
        assert_not q.valid?

        q = Question.new(body: 'aaaaaa')
        assert_not q.valid?
    end

    test "creates questions as expected" do
        q = Question.new(body: 'aaaaaaaaaaa', user_id: 1)
        assert q.valid?
    end

end
