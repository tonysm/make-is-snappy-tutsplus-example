require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "answer is invalid without body" do
      a = Answer.new
      assert_not a.valid?

      a = Answer.new(body: 'lorem ipsum')
      assert a.valid?
  end
end
